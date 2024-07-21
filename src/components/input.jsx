import React from "react";
import "./input.css";
import InlineInput from "./inline-input";

const Input = ({
  onChange,
  updateState,
  title,
  numbers,
  country,
  type,
  ...props
}) => {
  if (type === "phone") {
    return (
      <div id="phone-container">
        {/* Include country code input field to left of numbers */}
        {country && (
          <div className="inner-phone" id="country-code">
            <input
              className="phone-input"
              id="country-input"
              maxLength="4"
              defaultValue="+1"
            />
          </div>
        )}

        {/* Number inputs and Title */}
        <div className="outer">
          {/* Title */}
          {title && <h7>{title}</h7>}

          {/* Number Inputs */}
          <div className="outer-phone">
            <>
              <div className="inner-phone">
                <img src={`/phone-icon.svg`} alt="email icon" />
                {/* Individual Number Input */}
                <input
                  className="phone-input"
                  id="register-phone-number"
                  maxLength={10}
                  type="text"
                  pattern="\d{10}"
                  /* Verify if the input is exactly 10 numbers and enable the register button */

                  onChange={(e) => {
                    const value = e.target.value.replace(/\D/g, "");
                    if (value.length > 10) {
                      e.target.value = value.slice(0, 10);
                    } else {
                      e.target.value = value;
                    }
                    const isValid = (val) => /^\d{10}$/.test(val);
                    if (isValid(e.target.value)) {
                      updateState(e.target.value);
                    } else {
                      updateState(false);
                    }
                    onChange(e);
                  }}
                ></input>
              </div>
            </>
          </div>
        </div>
      </div>
    );
  }

  if (type === "verify") {
    return (
      <div id="phone-container">
        {/* Number inputs and Title */}
        <div className="outer outer-otp">
          {/* Title */}
          {title && <h7>Enter Code</h7>}

          {/* Number Inputs */}
          <div
            className="outer-phone outer-phone-otp"
            onChange={() => {
              const allInputs = Array.from(
                document.querySelectorAll(
                  `input[id^='register-verify-number-']`
                )
              );
              const allFilled = allInputs.every((input) =>
                /^\d{1}$/.test(input.value)
              );
              if (allFilled) {
                const code = allInputs.map((input) => input.value).join("");
                onChange(code);
                updateState(true);
              } else {
                updateState(false);
              }
            }}
          >
            {/* Individual Number Input */}
            <InlineInput type={"verify"} form={"register"} index={1} />
            <InlineInput type={"verify"} form={"register"} index={2} />
            <InlineInput type={"verify"} form={"register"} index={3} />

            <span className="hyphen"></span>

            <InlineInput type={"verify"} form={"register"} index={4} />
            <InlineInput type={"verify"} form={"register"} index={5} />
            <InlineInput type={"verify"} form={"register"} index={6} />
          </div>
        </div>
      </div>
    );
  }

  return (
    <div className="outer">
      {title && <h4>{title}</h4>}
      <div className="inner">
        {type === "email" && (
          <img
            src={`${process.env.PUBLIC_URL}/mail_icon.svg`}
            alt="email icon"
          />
        )}
        {type === "password" && (
          <img
            src={`${process.env.PUBLIC_URL}/lock_icon.svg`}
            alt="password icon"
          />
        )}
        <input {...props} type={type}></input>
      </div>
    </div>
  );
};

export default Input;
