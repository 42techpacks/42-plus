import React from "react";

import "./button.css";

Button.defaultProps = {
  label: "Click Me",
  style: "window",
};

export default function Button({ label, style }) {
  return <button className={`button ${style}`}>{label}</button>;
}
