import { useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";
import { supaClient } from "../supa-client";

// function to set the return path in local storage
// so we can redirect the user back to the page they were on
// when they were redirected to the register page
export const setReturnPath = () => {
  localStorage.setItem("returnPath", window.location.pathname);
};

/**
 * Custom hook that manages user session and profile state.
 * It fetches the current session, listens for authentication state changes,
 * and subscribes to real-time updates on the user's profile.
 *
 * @export
 * @return {*}
 */
export function useSession() {
  const navigate = useNavigate();

  // State for session rest of app uses
  const [userInfo, setUserInfo] = useState({
    profile: null,
    session: null,
  });
  // State for internal tracking of profile
  const [channel, setChannel] = useState(null);

  // Effect that updates the externally exposed session
  useEffect(() => {
    supaClient.auth.getSession().then(({ data: { session } }) => {
      // Use lambda function so eslint doesn't complain about missing dependencies
      setUserInfo((prevInfo) => ({ ...prevInfo, session }));
      supaClient.auth.onAuthStateChange((_event, session) => {
        setUserInfo(() => ({ session, profile: null }));
      });
    });
  }, []); // Empty dependency array to run only once

  // Effect to update state in real-time for profile changes
  useEffect(() => {
    const listenToUserProfileChanges = async (userId) => {
      const { data } = await supaClient
        .from("user_profiles")
        .select("*")
        .filter("user_id", "eq", userId);

      //set state if profile found, otherwise navigate to welcome page
      if (data?.[0]) {
        setUserInfo((prevInfo) => ({ ...prevInfo, profile: data?.[0] }));
      } else {
        navigate("/welcome");
      }

      // Set up real-time subscription to user_profiles table
      return supaClient // returned so we can unsubscribe
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

    // Listen for profile changes if logged in and unregistered
    // unsubscribe from profile changes if logged out
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
