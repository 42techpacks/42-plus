import { useContext, useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";
import { UserContext } from "../App";
import { supaClient } from "../supa-client";
import Button from "./button";
import Input from "./input";
import { registerFormConfig } from "../utils/formConfigs";

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
  const navigate = useNavigate();

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
              phone_number: userContext.session?.user.phone || "",
              created_at: userContext.session?.user.created_at || "",
            },
          ])
          .then(async ({ error }) => {
            if (error) {
              setFormError(error.message);
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

  console.log(flowStep);
  console.log(flowStep[index].description);
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
