import PropTypes from "prop-types";
import "./input.css";

PhoneInput.propTypes = {
  onChange: PropTypes.func.isRequired,
  updateState: PropTypes.func.isRequired,
  updateCountryState: PropTypes.func.isRequired,
  title: PropTypes.string,
  country: PropTypes.bool,
};

export default function PhoneInput({
  onChange,
  updateState,
  title,
  country,
  updateCountryState,
}) {
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
            // onChange={(e) => {}}
          />
        </div>
      )}

      {/* Number inputs and Title */}
      <div className="outer">
        {/* Title */}
        {title && <h6>{title}</h6>}

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
