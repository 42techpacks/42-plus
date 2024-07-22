import PropTypes from "prop-types";
import "./button.css";

Button.propTypes = {
  label: PropTypes.string,
  style: PropTypes.string,
  span: PropTypes.string,
};

export default function Button({
  label = "Click Me",
  style = "window",
  span = "",
  onClick = null,
}) {
  return (
    <button
      onClick={(e) => {
        e.preventDefault();
        if (onClick) onClick(e);
      }}
      className={`button ${style}`}
    >
      <span className="button-subtitle">{span}</span>
      {label}
    </button>
  );
}
