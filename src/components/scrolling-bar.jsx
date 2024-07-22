import "./scrolling-bar.css";

import PropTypes from "prop-types";

ScrollingBar.propTypes = {
  message: PropTypes.string.isRequired,
};

export default function ScrollingBar({ message = "[Insert Message]" }) {
  return (
    <div className="scrolling-bar">
      <div className="scrolling-text">
        <h5>{message}</h5>
      </div>
    </div>
  );
}
