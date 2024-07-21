import React from "react";
import "./form-toggle.css";

export default function FormToggle({ text, label, onToggle }) {
  return (
    <div className="form-toggle">
      <p>
        {text}{" "}
        <a onClick={onToggle} style={{ cursor: "pointer" }}>
          {label}
        </a>
      </p>
    </div>
  );
}
