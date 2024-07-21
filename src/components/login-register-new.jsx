import React from "react";
import "./login-register-new.css";

import { useState } from "react";

import Card from "./card";
import LoginForm from "./login-form";
import RegisterForm from "./register-form";

export default function LoginReigsterNew() {
  const [activeForm, setActiveForm] = useState("login");
  const [pageIndex, setPageIndex] = useState(0);

  const handleTabClick = (form) => {
    setActiveForm(form);
  };

  const handleArrowClick = (step) => {
    setPageIndex(pageIndex + step);
  };

  return (
    <div className="login-register-new">
      <Card
        url={activeForm}
        onTabClick={handleTabClick}
        onArrowClick={handleArrowClick}
        title=""
      >
        {activeForm === "login" ? <LoginForm /> : <RegisterForm />}
      </Card>
    </div>
  );
}
