import React from "react";

import "./button.css";

Button.defaultProps = {
  label: "Click Me",
  style: "window",
  span: "",
};

export default function Button({ label, style, span }) {
  return (
    <button className={`button ${style}`}>
      <span className="button-subtitle">{span}</span>
      {label}
    </button>
  );
}
