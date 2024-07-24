import React from "react";
import Card from "./card";

import Button from "./button";
import "./footytwoMiniSite.css";

export default function FootytwoMiniSite() {
  return (
    <div className="footytwo-ms">
      <Card
        onTabClick={() => {
          console.log("tab clicked");
        }}
        title=""
      >
        <div className="header">
          <img
            id="footytwo-type-logo-white"
            src="/footytwo-type-logo-white.svg"
          ></img>
        </div>

        <div className="hero">
          <img src="/colombiaFlatFront.png" alt="Colombia Flat Front"></img>
        </div>

        <Button style="window-white" label="BUY NOW"></Button>
      </Card>
    </div>
  );
}
