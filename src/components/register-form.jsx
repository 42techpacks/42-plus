import { useContext, useEffect, useState } from "react";
import { redirect, useNavigate } from "react-router-dom";
import { UserContext } from "../App";
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

export default function RegisterForm({ index, onStep }) {
  const navigate = useNavigate();

  const user = useContext(UserContext);
  const { refreshProfile } = useContext(UserContext);
  const [isFormCompleted, setIsFormCompleted] = useState(false);
  const [userCountry, setUserCountry] = useState("1");
  const [userPhoneNumber, setUserPhoneNumber] = useState("407-747-0791");
  const [userOTP, setUserOTP] = useState("123456");
  const [userUsername, setUserUsername] = useState("");
  const [formError, setFormError] = useState(false);

  const updateUserPhoneNumber = (value) => {
    setUserPhoneNumber(value);
  };

  const updateUserOTP = (value) => {
    setUserOTP(value);
  };

  const updateUserUsername = (value) => {
    console.log(value);
    setUserUsername(value);
  };

  const phoneNumber = {
    header: "Register with Phone Number.",
    onChange: (e) => {
      updateUserPhoneNumber(e.target.value);
    },
    inputTitle: "Phone Number",
    inputType: "phone",
    inputPlaceholder: "4077470791",
    inputLength: 10,
    country: true,
    footer: `Standard messaging rates will apply. View our terms and conditions for more details`,
    buttonLabel: "SEND CODE",
    error: "ERROR: Invalid Phone Number",
    buttonHandler: () => {
      setFormError("");
      console.log(userPhoneNumber);
      console.log("checking user phone number...");
      supaClient.auth
        .signInWithOtp({
          phone: `1${userPhoneNumber}`,
        })
        .then(({ data, error }) => {
          if (error) {
            setFormError(error.message);
          }
          else {
            console.log(data);
            onStep();
          }
        });
    },
  };

  const otpVerify = {
    header: "OTP Verification",
    onChange: (value) => {
      updateUserOTP(value);
    },
    inputTitle: "OTP Verification",
    inputType: "verify",
    inputPlaceholder: "4077470791",
    inputLength: 6,
    country: true,
    footer: ``,
    buttonLabel: "VERIFY",
    error: "ERROR: Invalid Verification Code",
    buttonHandler: () => {
      setFormError("");
      console.log("checking user provided OTP...");

      supaClient.auth
        .verifyOtp({
          phone: `1${userPhoneNumber}`,
          token: userOTP,
          type: "sms",
        })
        .then(({ data, error }) => {
          if (error) {
            setFormError(error.message);
            throw error;
          }
          console.log(`User OTP checked received.. Try again`);
          console.log(data);
          onStep();
        });
    },
  };

  const personalInfo = {
    header: "Registration Complete",
    onChange: (value) => {
      updateUserUsername(value);
    },
    description: "Welcome to 42+. Set your account username below.",
    inputTitle: "Username",
    inputType: "username",
    inputPlaceholder: "npcmilo",
    inputLength: -1,
    country: true,
    footer: ``,
    buttonLabel: "ENTER 42+",
    error: "ERROR: Username is already taken",
    buttonHandler: () => {
      console.log("redirecting...");
      setFormError("");
      supaClient
        .from("user_profiles")
        .insert([
          {
            user_id: user.session?.user.id || "",
            username: userUsername,
          },
        ])
        .then(async ({ error }) => {
          if (error) {
            setFormError(`Username "${userUsername}" is already taken`);
            return;
          } else {
            await refreshProfile(user.session?.user.id);
            navigate("");
          }
        });
    },
  };

  useEffect(() => {
    const currentInputLength = flowStep[index].inputLength;
    const currentInputValue = flowValues[index];
    if (flowStep[index].inputLength === -1) {
      setIsFormCompleted(currentInputValue.length >= 1);
    } else {
      setIsFormCompleted(currentInputValue.length === currentInputLength);
    }
  }, [userPhoneNumber, userOTP, userUsername, index]);

  const flowStep = [phoneNumber, otpVerify, personalInfo];
  const flowValues = [userPhoneNumber, userOTP, userUsername];

  return (
    <form className="login-form">
      <div className="header">
        <h4>{flowStep[index].header}</h4>
        {flowStep[index].description && <p>{flowStep[index].description}</p>}
      </div>
      <div className="input-container">
        {/* Input Fields */}
        <div className="inputs">
          <Input
            onChange={flowStep[index].onChange}
            updateState={setIsFormCompleted}
            title={flowStep[index].inputTitle}
            type={flowStep[index].inputType}
            placeholder={flowStep[index].inputPlaceholder}
            numbers={flowStep[index].inputLength}
            country={flowStep[index].country}
          ></Input>
        </div>
        <p>
          {flowStep[index].footer}
          {flowStep[index].link}
        </p>
      </div>
      {formError && (
        <p id="register-form-error" className="error-text">
          {flowStep[index].error}
        </p>
      )}
      <Button
        label={flowStep[index].buttonLabel}
        style={"window-black"}
        disabled={!isFormCompleted}
        onClick={() => {
          setIsFormCompleted(false);
          flowStep[index].buttonHandler
            ? flowStep[index].buttonHandler()
            : onStep();
        }}
      ></Button>
    </form>
  );
}
