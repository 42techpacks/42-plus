import React from "react";
import "./item-selection-option.css";

export default function ItemSelectionOption({ img, flag, label, selected }) {
  return (
    <div className="item-selection-option item-unselected">
      <div className="main">
        <img src={img}></img>
      </div>
      <div className="label">
        <img className="label-flag" src={`${flag}-flag.png`}></img>
        <span className="label-text">{label}</span>
      </div>
    </div>
  );
}
