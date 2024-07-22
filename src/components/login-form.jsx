import React, { useState } from "react";

import Button from "./button";
import Input from "./input";
import "./login-form.css";

export default function LoginForm({ index, onStep }) {
  const [isFormCompleted, setIsFormCompleted] = useState(false);
  const [userCountry, setUserCountry] = useState("1");
  const [userPhoneNumber, setUserPhoneNumber] = useState("407-747-0791");
  const [userOTP, setUserOTP] = useState("123456");

  const toggleFormCompletion = (completed) => {
    setIsFormCompleted(completed);
  };

  const updateUserCountry = (value) => {
    setUserCountry(value);
  };

  const updateUserPhoneNumber = (value) => {
    setUserPhoneNumber(value);
  };

  const updateUserOTP = (value) => {
    setUserOTP(value);
  };

  const flowStep1 = (
    <>
      <div className="header">
        <h4>Login with Phone Number.</h4>
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
      <Button onClick={onStep} label={"SUBMIT"} style={"window-black"}></Button>
    </>
  );

  const flowStep2 = (
    <>
      <div className="header">
        <h4>OTP Verification</h4>
        <p>
          Enter the 6-digit code sent to + {userCountry} {userPhoneNumber}
        </p>
      </div>

      {/* Input Fields */}
      <div className="inputs">
        <Input
          onChange={(code) => {
            setUserOTP(code);
          }}
          updateState={toggleFormCompletion}
          title="Phone Number"
          type="verify"
          placeholder="4077470791"
          numbers={10}
          country={true}
        ></Input>
      </div>
      <Button label={"VERIFY"} style={"window-black"}></Button>
    </>
  );

  const flowSteps = [flowStep1, flowStep2];

  return <form className="login-form">{flowSteps[index]}</form>;
}
