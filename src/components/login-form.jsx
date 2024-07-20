import React from "react";
import Card from "./card";
import { useState } from "react";

import "./login-form.css";
import Input from "./input";

export default function LoginForm() {
  const [isFormCompleted, setIsFormCompleted] = useState(false);
  const [registerFlowStep, setRegisterFlowStep] = useState("phone");
  const [userCountry, setUserCountry] = useState("1");
  const [userPhoneNumber, setUserPhoneNumber] = useState("407-747-0791");
  const [userOTP, setUserOTP] = useState("123456");

  const toggleFormCompletion = (completed) => {
    setIsFormCompleted(completed);
  };

  const switchFlowStep = (completed) => {
    console.log("next step: " + completed);
    setIsFormCompleted(false);
    setRegisterFlowStep(completed);
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
        <h4>Sign Up with Phone Number.</h4>
        <p>
          Standard messaging rates will apply. View our terms and conditions for
          more details
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
    </>
  );

  return (
    <form className="login-form">
      <Card title={"Login"}>{flowStep1}</Card>
    </form>
  );
}
