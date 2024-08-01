import { useContext, useEffect, useState } from "react";
import { UserContext } from "../App";
import { supaClient } from "../supa-client";
import Button from "./button";
import PhoneInput from "./phone-input";
import VerifyInput from "./verify-input";
import UsernameInput from "./username-input";
import { registerFormConfig } from "../utils/form-config";

import PropTypes from "prop-types";

RegisterForm.propTypes = {
  index: PropTypes.number.isRequired,
  onStep: PropTypes.func.isRequired,
  _userPhoneNumber: PropTypes.string,
};

export default function RegisterForm({
  index,
  onStep,
  _userPhoneNumber = "4077470791",
}) {
  const userContext = useContext(UserContext);
  const [isFormCompleted, setIsFormCompleted] = useState(false);
  const [userCountry, setUserCountry] = useState("1");
  const [userPhoneNumber, setUserPhoneNumber] = useState(_userPhoneNumber);
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
    setUserUsername(value);
  };

  const flowStep = [
    {
      ...registerFormConfig.phoneNumber,
      onChange: (e) => {
        updateUserPhoneNumber(e.target.value);
      },
      buttonHandler: () => {
        setFormError("");
        console.log("checking user phone number...");
        supaClient.auth
          .signInWithOtp({
            phone: `1${userPhoneNumber}`,
          })
          .then(({ data, error }) => {
            if (error) {
              setFormError(error.message);
            } else {
              onStep();
            }
          });
      },
    },
    {
      ...registerFormConfig.otpVerify,
      onChange: (value) => {
        updateUserOTP(value);
      },
      buttonHandler: () => {
        setFormError("");
        console.log("checking user provided OTP...");
        console.log(userPhoneNumber);
        console.log(userOTP);

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
            console.log(userContext.session);
            console.log(`User OTP checked received.. Try again`);
            console.log(data);
            onStep();
          });
      },
    },
    {
      ...registerFormConfig.personalInfo,
      onChange: (value) => {
        updateUserUsername(value);
      },
      buttonHandler: () => {
        console.log("redirecting...");
        setFormError("");
        supaClient
          .from("user_profiles")
          .insert([
            {
              //TODO: handle userContext not existing for whatever reason better
              user_id: userContext.session?.user.id || "",
              username: userUsername,
              created_at: userContext.session?.user.created_at || "",
            },
          ])
          .then(async ({ error }) => {
            if (error) {
              if (error.code === "23505") {
                setFormError("ERROR: Username is already taken");
              } else {
                setFormError(error.message);
              }
              return;
            } else {
              await userContext.refreshProfile(userContext.session?.user.id);
            }
          });
      },
    },
  ];

  useEffect(() => {
    const currentInputLength = flowStep[index].inputLength;
    const currentInputValue = flowValues[index];
    if (flowStep[index].inputLength === -1) {
      setIsFormCompleted(currentInputValue.length >= 1);
    } else {
      setIsFormCompleted(currentInputValue.length === currentInputLength);
    }
  }, [userPhoneNumber, userOTP, userUsername, index]);

  const flowValues = [userPhoneNumber, userOTP, userUsername];

  let input = <></>;
  if (flowStep[index].inputType == "phone") {
    input = (
      <PhoneInput
        onChange={flowStep[index].onChange}
        updateState={setIsFormCompleted}
        updateCountryState={setUserCountry}
        title={flowStep[index].inputTitle}
        country={flowStep[index].country}
      />
    );
  } else if (flowStep[index].inputType == "verify") {
    input = (
      <VerifyInput
        onChange={flowStep[index].onChange}
        updateState={setIsFormCompleted}
        title={flowStep[index].inputTitle}
        country={flowStep[index].country}
      />
    );
  } else if (flowStep[index].inputType == "username") {
    input = (
      <UsernameInput
        onChange={flowStep[index].onChange}
        updateState={setIsFormCompleted}
        title={flowStep[index].inputTitle}
        country={flowStep[index].country}
      />
    );
  }
  return (
    <form className="login-form">
      <div className="header">
        <h4>{flowStep[index].header}</h4>
        {flowStep[index].description && (
          <p>
            {flowStep[index].description}
            {index === 1 && `${userCountry} ${userPhoneNumber}`}
          </p>
        )}
      </div>
      <div className="input-container">
        {/* Input Fields */}
        <div className="inputs"> {input} </div>
        <p>
          {flowStep[index].footer}
          {flowStep[index].link}
        </p>
      </div>
      {formError && (
        <p id="register-form-error" className="error-text">
          {formError}
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
