import React from "react";
import "./login-register-new.css";

import { useState } from "react";

import Card from "./card";
import LoginForm from "./login-form";
import RegisterForm from "./register-form";

export default function LoginReigsterNew() {
  const [activeForm, setActiveForm] = useState("login");
  const [pageIndex, setPageIndex] = useState(0);
  const [completedSteps, setCompletedSteps] = useState(0);

  const handleTabClick = (form) => {
    setActiveForm(form);
    setPageIndex(0);
    setCompletedSteps(0);
  };

  const handleArrowClick = (step) => {
    console.log(pageIndex);
    console.log(completedSteps);

    if (pageIndex + step > completedSteps - 1 || pageIndex + step < 0) return;
    setPageIndex(pageIndex + step);
    setCompletedSteps(pageIndex + step);
  };

  const handleStepComplete = (step) => {
    if (step === 0) {
      console.log("ERROR: Step not complete");
    }

    setCompletedSteps(completedSteps + 1);
    setPageIndex(pageIndex + 1);
  };

  return (
    <div className="login-register-new">
      <Card
        url={activeForm + "/" + (pageIndex + 1)}
        onTabClick={handleTabClick}
        onArrowClick={handleArrowClick}
        title=""
        pageIndex={pageIndex}
      >
        {activeForm === "login" ? (
          <LoginForm index={pageIndex} onStep={handleStepComplete} />
        ) : (
          <RegisterForm index={pageIndex} />
        )}
      </Card>
    </div>
  );
}
