import "./cf42-store.css";
import CF42Card from "./cf42-card";
import { useState } from "react";

export default function CF42Store({ subPage }) {
  const browsePacks = (
    <div className="browse-packs">
      <CF42Card title={""} addClass={"browse-packs-card"}>
        <a>STORE</a>
      </CF42Card>
    </div>
  );

  return <>{subPage === "browse-packs" && browsePacks} </>;
}
