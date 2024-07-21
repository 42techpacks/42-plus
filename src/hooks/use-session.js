import { useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";
import { supaClient } from "../supa-client";

// function to set the return path in local storage
// so we can redirect the user back to the page they were on
// when they were redirected to the register page
export const setReturnPath = () => {
  localStorage.setItem("returnPath", window.location.pathname);
};

export function useSession() {
  const navigate = useNavigate();

  // State that exposes the session details to the rest of the app
  const [userInfo, setUserInfo] = useState({
    profile: null,
    session: null,
  });
  // State that we use to internally track the state of a users profile
  //  so we can update above
  const [channel, setChannel] = useState(null);

  // Effect that updates the externally exposed session
  useEffect(() => {
    supaClient.auth.getSession().then(({ data: { session } }) => {
      setUserInfo((prevInfo) => ({ ...prevInfo, session }));
      supaClient.auth.onAuthStateChange((_event, session) => {
        setUserInfo(() => ({ session, profile: null }));
      });
    });
  }, []); // Add empty dependency array to run only once

  // Effect that we use to update above state internally so we can know in realtime
  //  if a user deletes their profile for example
  useEffect(() => {
    // This function listens to changes in the user_profiles table for a specific user
    //  and updates the above state
    const listenToUserProfileChanges = async (userId) => {
      const { data } = await supaClient
        .from("user_profiles")
        .select("*")
        .filter("user_id", "eq", userId);
      if (data?.[0]) {
        // profile found, update the state rest of app uses with it
        setUserInfo((prevInfo) => ({ ...prevInfo, profile: data?.[0] }));
      } else {
        // profile not found, navigate the user to the welcome page
        navigate("/welcome");
      }

      // set up a real-time subscription to listen for  changes in the user_profiles table
      // we return this so we can unsubscribe when we're done
      return supaClient
        .channel(`public:user_profiles`)
        .on(
          "postgres_changes",
          {
            event: "*",
            schema: "public",
            table: "user_profiles",
            filter: `user_id=eq.${userId}`,
          },
          (payload) => {
            setUserInfo((prevInfo) => ({ ...prevInfo, profile: payload.new }));
          }
        )
        .subscribe();
    };

    if (userInfo.session?.user && !userInfo.profile) {
      listenToUserProfileChanges(userInfo.session.user.id).then(
        (newChannel) => {
          if (channel) {
            channel.unsubscribe();
          }
          setChannel(newChannel);
        }
      );
    } else if (!userInfo.session?.user) {
      channel?.unsubscribe();
      setChannel(null);
    }
  }, [userInfo.session, userInfo.profile, channel]);

  return userInfo;
}
