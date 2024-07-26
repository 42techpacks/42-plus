import React, { useContext } from "react";
import { UserContext } from "../App";
import Button from "./button";
import "./topbar.css";

export default function TopBar({}) {
  const userContext = useContext(UserContext);

  return (
    <div className="topbar">
      <img
        className="topbar-logo"
        src="/42-plus-logo.svg"
        alt="42 Plus Logo"
        width="42"
        height="42"
      />
      {userContext.profile && (
        <Button
          label="LOG OUT"
          style="window-white"
          onClick={() => console.log("Logging out...")}
        ></Button>
      )}{" "}
    </div>
  );
}
