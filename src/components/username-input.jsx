import PropTypes from "prop-types";
import "./input.css";

UsernameInput.propTypes = {
  onChange: PropTypes.func.isRequired,
  updateState: PropTypes.func.isRequired,
  title: PropTypes.string,
};

export default function UsernameInput({ onChange, title, ...props }) {
  return (
    <div className="outer">
      {title && <h6>{title}</h6>}
      <div className="inner">
        <img src={`/profile-icon.svg`} alt="profile icon" />
        <input
          {...props}
          type={"username"}
          onChange={(e) => {
            const value = e.target.value;
            onChange(value);
          }}
        ></input>
      </div>
    </div>
  );
}
