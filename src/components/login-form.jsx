import PropTypes from "prop-types";
import { useEffect, useState } from "react";

import { useNavigate } from "react-router-dom";
import { supaClient } from "../supa-client";
import Button from "./button";
import Input from "./input";
import "./login-form.css";

LoginForm.propTypes = {
  index: PropTypes.number.isRequired,
  onStep: PropTypes.func.isRequired,
};
export default function LoginForm({ index, onStep }) {
  const navigate = useNavigate();
  const [isFormCompleted, setIsFormCompleted] = useState(false);
  const [userCountry, setUserCountry] = useState("1");
  const [userPhoneNumber, setUserPhoneNumber] = useState("407-747-0791");
  const [userOTP, setUserOTP] = useState("123456");
  const [formError, setFormError] = useState("");
  const [showRegistrationPrompt, setShowRegistrationPrompt] = useState(false);

  const handleRegisterChoice = (choice) => {
    if (choice === 'yes') {
      navigate('/register'); // Redirect to registration page
    } else {
      setShowRegistrationPrompt(false);
      setFormError('Signups not allowed for otp');
    }
  };

  const updateUserPhoneNumber = (value) => {
    setUserPhoneNumber(value);
  };

  const updateUserOTP = (value) => {
    setUserOTP(value);
  };

  const phoneNumber = {
    header: "Login with Phone Number.",
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
    //TODO: this can be removed I believe
    error: "ERROR: Invalid Phone Number",
    buttonHandler: () => {
      setFormError("");
      console.log(userPhoneNumber);
      console.log("checking user phone number...");

      supaClient.auth
        .signInWithOtp({
          phone: `1${userPhoneNumber}`,
          options: {
            shouldCreateUser: false,
          },
        })
        .then(({ data, error }) => {
          if (error) {
            console.log(error);
            if (error.message === "Signups not allowed for otp") {
              setShowRegistrationPrompt(true);
            } else {
              setFormError(error.message);
            }
          } else {
            onStep();
            console.log(`got ${data}`);
          }
        });
    },
  };

  const otpVerify = {
    header: "OTP Verification",
    description: "Enter the 6-digit code sent to +1 407-747-0791.",
    onChange: (value) => {
      updateUserOTP(value);
    },
    inputTitle: "OTP Verification",
    inputType: "verify",
    inputPlaceholder: "4077470791",
    inputLength: 6,
    country: true,
    footer: ``,
    buttonLabel: "LOGIN",
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
          console.log(`User OTP check received.. Try again`);
          console.log(data);
        });
    },
  };

  const flowStep = [phoneNumber, otpVerify];

  useEffect(() => {
    const currentInputLength = flowStep[index].inputLength;
    const currentInputValue = index === 0 ? userPhoneNumber : userOTP;
    setIsFormCompleted(currentInputValue.length === currentInputLength);
  }, [userPhoneNumber, userOTP, index]);

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
        <p>{flowStep[index].footer}</p>
      </div>
      {showRegistrationPrompt && (
        <div className="registration-prompt">
          <p>Signups are not allowed for OTP. Would you like to register instead?</p>
          <button onClick={() => handleRegisterChoice('yes')}>Yes</button>
          <button onClick={() => handleRegisterChoice('no')}>No</button>
        </div>
      )}
      {formError && !showRegistrationPrompt && (
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
