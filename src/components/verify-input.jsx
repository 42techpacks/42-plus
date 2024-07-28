import PropTypes from "prop-types";
import InlineInput from "./inline-input";
import "./input.css";

VerifyInput.propTypes = {
  onChange: PropTypes.func.isRequired,
  updateState: PropTypes.func.isRequired,
  title: PropTypes.string,
};

export default function VerifyInput({ onChange, updateState, title }) {
  return (
    <div id="phone-container">
      {/* Number inputs and Title */}
      <div className="outer outer-otp">
        {/* Title */}
        {title && <h6>Enter Code</h6>}

        {/* Number Inputs */}
        <div
          className="outer-phone outer-phone-otp"
          onChange={() => {
            const allInputs = Array.from(
              document.querySelectorAll(`input[id^='register-verify-number-']`),
            );
            const allFilled = allInputs.every((input) =>
              /^\d{1}$/.test(input.value),
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
