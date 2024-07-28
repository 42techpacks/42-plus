import PropTypes from "prop-types";
import { useEffect, useState } from "react";

import { useNavigate } from "react-router-dom";
import { supaClient } from "../supa-client";
import Button from "./button";
import Input from "./input";
import "./login-form.css";
import { loginFormConfig } from "../utils/form-config";
import PhoneInput from "./phone-input";
import VerifyInput from "./verify-input";
import UsernameInput from "./username-input";

LoginForm.propTypes = {
  index: PropTypes.number.isRequired,
  onStep: PropTypes.func.isRequired,
  setActiveForm: PropTypes.func.isRequired,
  setPageIndex: PropTypes.func.isRequired,
};
export default function LoginForm({
  index,
  onStep,
  setActiveForm,
  setPageIndex,
}) {
  const [isFormCompleted, setIsFormCompleted] = useState(false);
  const [userCountry, setUserCountry] = useState("1");
  const [userPhoneNumber, setUserPhoneNumber] = useState("407-747-0791");
  const [userOTP, setUserOTP] = useState("123456");
  const [formError, setFormError] = useState("");
  const [showRegistrationPrompt, setShowRegistrationPrompt] = useState(false);

  const handleRegisterChoice = (choice) => {
    if (choice === "yes") {
      supaClient.auth
        .signInWithOtp({
          phone: `${userCountry}${userPhoneNumber}`,
        })
        .then(({ data, error }) => {
          if (error) {
            console.error(error);
            setFormError("😖 Looks like things might be down on our end");
          } else {
            console.log(`signed user up got ${data}`);
            setActiveForm("register", userPhoneNumber);
            setIsFormCompleted(false);
          }
        });
    } else {
      setFormError(
        "🙁 Don't know what to tell ya mate... no sign up... no plus",
      );
    }
  };

  const updateUserPhoneNumber = (value) => {
    setUserPhoneNumber(value);
  };

  const updateUserOTP = (value) => {
    setUserOTP(value);
  };

  const flowStep = [
    {
      ...loginFormConfig.phoneNumber,
      onChange: (e) => {
        updateUserPhoneNumber(e.target.value);
      },
      buttonHandler: () => {
        setFormError("");
        console.log("checking user phone number...");

        supaClient.auth
          .signInWithOtp({
            phone: `${userCountry}${userPhoneNumber}`,
            options: {
              shouldCreateUser: false,
            },
          })
          .then(({ data, error }) => {
            if (error) {
              console.error(error);
              if (error.message === "Signups not allowed for otp") {
                setPageIndex(2); //change to account not found view
              } else {
                setFormError(error.message);
              }
            } else {
              onStep();
              console.log(`got ${data}`);
            }
          });
      },
    },
    {
      ...loginFormConfig.otpVerify,
      onChange: (value) => {
        updateUserOTP(value);
      },
      buttonHandler: () => {
        setFormError("");
        console.log("checking user provided OTP...");

        supaClient.auth
          .verifyOtp({
            phone: `${userCountry}${userPhoneNumber}`,
            token: userOTP,
            type: "sms",
          })
          .then(({ data, error }) => {
            if (error) {
              setFormError(error.message);
              throw error;
            }
            console.log(`User OTP check received.. Try again`);
            console.log(data);
          });
      },
    },
    {
      ...loginFormConfig.registerPrompt,
      buttonHandler: () => {
        handleRegisterChoice("yes");
      },
    },
  ];

  useEffect(() => {
    const currentInputLength = flowStep[index].inputLength;
    const currentInputValue = index === 0 ? userPhoneNumber : userOTP;
    setIsFormCompleted(currentInputValue.length === currentInputLength);
  }, [userPhoneNumber, userOTP, index]);

  // let input = (
  //   <Input
  //     onChange={flowStep[index].onChange}
  //     updateState={setIsFormCompleted}
  //     title={flowStep[index].inputTitle}
  //     type={flowStep[index].inputType}
  //     placeholder={flowStep[index].inputPlaceholder}
  //     numbers={flowStep[index].inputLength}
  //     country={flowStep[index].country}
  //   ></Input>
  // );
  let input = <></>;
  if (flowStep[index].inputType == "phone") {
    input = (
      <PhoneInput
        onChange={flowStep[index].onChange}
        updateState={setIsFormCompleted}
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
        <div className="inputs">{input}</div>
        <p>{flowStep[index].footer}</p>
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
          {
            flowStep[index].buttonHandler
              ? flowStep[index].buttonHandler()
              : onStep();
          }
        }}
      ></Button>
    </form>
  );
}
