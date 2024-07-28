import "./login-register-new.css";

import { useState } from "react";

import Card from "./card";
import LoginForm from "./login-form";
import RegisterForm from "./register-form";
import PropTypes from "prop-types";

LoginRegisterNew.propTypes = {
  _activeForm: PropTypes.string,
};

export default function LoginRegisterNew({ _activeForm = "login" }) {
  const [activeForm, setActiveForm] = useState(_activeForm);
  const [pageIndex, setPageIndex] = useState(0);
  const [completedSteps, setCompletedSteps] = useState(0);
  const [phoneNumber, setPhoneNumber] = useState("");

  const handleTabClick = (form) => {
    setActiveForm(form);
    setPageIndex(0);
    setCompletedSteps(0);
  };

  const handleArrowClick = (step) => {
    console.log("Page Index: " + pageIndex);
    console.log("Completed Steps: " + completedSteps);
    console.log("Step: " + step);

    /* Edge Case: Account Not Found */
    if (pageIndex === 2 && completedSteps === 0) {
      setPageIndex(0);
      setCompletedSteps(0);
      return;
    }

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

  const handleSetActiveForm = (form, phone = "") => {
    console.log(`updated page index ${pageIndex}`);
    setPageIndex(0);
    setActiveForm(form);
    setCompletedSteps(0);
    setPhoneNumber(phone);
    console.log(`updated page index ${pageIndex}`);
  };

  return (
    <div className="login-register-new">
      <Card
        url={activeForm + "/" + (pageIndex + 1)}
        tabs={["login", "register"]}
        onTabClick={handleTabClick}
        onArrowClick={handleArrowClick}
        title=""
        pageIndex={pageIndex}
        activeForm={activeForm}
      >
        {activeForm === "login" ? (
          <LoginForm
            index={pageIndex}
            onStep={handleStepComplete}
            setActiveForm={handleSetActiveForm}
            setPageIndex={setPageIndex}
          />
        ) : (
          <RegisterForm
            index={pageIndex}
            onStep={handleStepComplete}
            _userPhoneNumber={phoneNumber}
          />
        )}
      </Card>
    </div>
  );
}
