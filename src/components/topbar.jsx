import React from "react";
import "./topbar.css";
import ProfileSnippet from "./profile-snippet";

export default function TopBar({}) {
  return (
    <div className="topbar">
      <img
        className="topbar-logo"
        src="/42-plus-logo.svg"
        alt="42 Plus Logo"
        width="42"
        height="42"
      />
      <ProfileSnippet />
    </div>
  );
}
