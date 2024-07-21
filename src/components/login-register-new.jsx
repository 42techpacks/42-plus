import React from "react";
import "./login-register-new.css";

import { useState } from "react";

import Card from "./card";
import LoginForm from "./login-form";
import RegisterForm from "./register-form";

const loginForm = (
  <div>
    <h4>loginForm</h4>
    <p>[Insert Des]</p>
  </div>
);

const registerForm = (
  <div>
    <h4>registerForm</h4>
    <p>[Insert Des]</p>
  </div>
);

export default function LoginReigsterNew() {
  const [activeForm, setActiveForm] = useState("login");

  const handleTabClick = (form) => {
    setActiveForm(form);
  };

  return (
    <div className="login-register-new">
      <Card url={activeForm} onTabClick={handleTabClick} title="">
        {activeForm === "login" ? <LoginForm /> : <RegisterForm />}
      </Card>
    </div>
  );
}
