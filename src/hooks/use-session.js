import { useEffect, useState } from "react";
import { supaClient } from "../supa-client";

export function useSession() {
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
        setUserInfo((prevInfo) => ({ ...prevInfo, profile: data?.[0] }));
      }
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