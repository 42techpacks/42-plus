import { redirect } from "react-router-dom";
import { supaClient } from "../supa-client";

// Loader to prevent user from accessing the register page directly
// when they have no business doing that
export async function registerFormLoader() {
  const {
    data: { user },
  } = await supaClient.auth.getUser();

  // user doesn't exist, send them back home
  if (!user) {
    return redirect("/");
  }

  // user exists, check if they have a profile
  const { data } = await supaClient
    .from("user_profiles")
    .select("*")
    .eq("user_id", user?.id)
    .single();

  // user has a profile, send them back home
  if (data?.username) {
    return redirect("/");
  }
}

export default function RegisterForm() {
  return <div>RegisterForm</div>;
}
