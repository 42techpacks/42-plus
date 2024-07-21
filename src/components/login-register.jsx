import React, { useState } from "react";
import "./login-register.css";

import FormToggle from "./form-toggle";
import LoginForm from "./login-form";
import RegisterForm from "./register-form";

export default function LoginRegister() {
  const [toggle, setToggle] = useState("login");

  const handleToggle = () => {
    setToggle((prevToggle) => (prevToggle === "login" ? "register" : "login"));
  };

  return (
    <div className="login-register">
      {toggle === "login" ? <LoginForm /> : <RegisterForm />}
      <FormToggle
        text={
          toggle === "login"
            ? "Don't have an account?"
            : "Already have an account?"
        }
        label={toggle === "login" ? "Register" : "Login"}
        onToggle={handleToggle}
      />
    </div>
  );
}
