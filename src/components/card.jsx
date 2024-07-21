import React from "react";
import "./card.css";

Card.defaultProps = {
  title: "[Insert Title]",
};

export default function Card({ title, img, children }) {
  return (
    <div className="window-card">
      <div className="window-card-header">
        <h3>{title}</h3>
        <div className="window-card-controls">
          <div className="circle card-exit"></div>
          <div className="circle card-minimize"></div>
          {/* Testing window card interactivity */}
          <div
            className="circle card-maximize"
            onClick={(e) => {
              e.target.closest(".window-card").style.height = "1000px";
            }}
          ></div>
        </div>
      </div>
      <div className="window-card-body">
        {children}
        {img && <img className="window-card-img" src={img}></img>}
      </div>
    </div>
  );
}
