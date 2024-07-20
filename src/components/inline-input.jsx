import React from "react";
import "./inline-input.css";

export default function InlineInput({ type, form, index, updateState }) {
  return (
    <div className={`inner-${type}`}>
      {/* Individual Number Input */}
      <input
        className={`${type}-input`}
        id={`${form}-${type}-number-${index}`}
        maxLength={1}
        type="number"
        pattern="\d{0,3}"
        /* Verify if the input is a single digit and enable the register button */

        onChange={(e) => {
          const isValid = (val) => /^\d{1}$/.test(val);
          if (isValid(e.target.value)) {
            if (type === "verify") {
              const nextInputId = `${form}-${type}-number-${index + 1}`;
              const nextSibling = document.getElementById(nextInputId);

              if (nextSibling) {
                nextSibling.focus();
              }
            }
          } else if (e.target.value === "") {
            let previousIndex = index - 1;
            while (previousIndex > 0) {
              const previousInputId = `${form}-${type}-number-${previousIndex}`;
              const previousSibling = document.getElementById(previousInputId);
              if (previousSibling && previousSibling.value !== "") {
                previousSibling.focus();
                break;
              }
              previousIndex--;
            }
          }
        }}
      />
    </div>
  );
}
