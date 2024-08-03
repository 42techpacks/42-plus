import { useState } from "react";
import "./cf42-card.css";
import Card from "../../card";

export default function CF42Card({
  notifications,
  title,
  subtitle,
  img,
  onClick,
  children,
  addClass,
}) {
  return (
    <div className={`cf42-card ${addClass}`} onClick={onClick}>
      {notifications > 0 && (
        <div className="cf42-card-notification">
          <h4>{notifications}</h4>
        </div>
      )}
      <div className="header">
        <h4>{title}</h4>
        <p>{subtitle}</p>
      </div>
      <div className="img-container">
        <img src={img}></img>
      </div>
      {children}
    </div>
  );
}
