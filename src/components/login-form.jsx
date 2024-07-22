import { useEffect, useState } from "react";

import { useNavigate } from "react-router-dom";
import Button from "./button";
import Input from "./input";
import "./login-form.css";

export default function LoginForm({ index, onStep }) {
  const navigate = useNavigate();
  const [isFormCompleted, setIsFormCompleted] = useState(false);
  const [userCountry, setUserCountry] = useState("1");
  const [userPhoneNumber, setUserPhoneNumber] = useState("407-747-0791");
  const [userOTP, setUserOTP] = useState("123456");
  const [formError, setFormError] = useState(false);

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
    error: "ERROR: Invalid Phone Number",
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
      console.log("redirecting...");
      navigate("/home");
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
