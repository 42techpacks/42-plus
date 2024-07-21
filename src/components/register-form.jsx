import { redirect } from "react-router-dom";
import { supaClient } from "../supa-client";

import Button from "./button";
import Input from "./input";

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

const toggleFormCompletion = (completed) => {
  setIsFormCompleted(completed);
};

const flowStep1 = (
  <>
    <div className="header">
      <h4>Register with Phone Number.</h4>
      <p>
        Standard messaging rates will apply. <br />
        View our terms and conditions for more details.
      </p>
    </div>

    {/* Input Fields */}
    <div className="inputs">
      <Input
        onChange={(e) => {
          updateUserPhoneNumber(e.target.value);
        }}
        updateState={toggleFormCompletion}
        title="Phone Number"
        type="phone"
        placeholder="4077470791"
        numbers={10}
        country={true}
      ></Input>
    </div>
    <Button label={"SUBMIT"} style={"window-black"}></Button>
  </>
);

export default function RegisterForm() {
  return <form className="login-form">{flowStep1}</form>;
}
