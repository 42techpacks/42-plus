import React from "react";
import "./scrolling-bar.css";

ScrollingBar.defaultProps = {
  message: "[Insert Message]",
};

export default function ScrollingBar({ message }) {
  return (
    <div className="scrolling-bar">
      <div className="scrolling-text">
        <h5>
          {message} {message} {message} {message}
        </h5>
      </div>
    </div>
  );
}
