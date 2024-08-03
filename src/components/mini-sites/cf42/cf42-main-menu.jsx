import { useState } from "react";
import CF42Nav from "./cf42-nav";
import CF42Card from "./cf42-card";
import "./cf42-main-menu.css";

export default function CF42MainMenu({
  setSubPage,
  handleNavClick,
  activeMenu,
  children,
}) {
  const homeMenu = (
    <>
      <CF42Card
        notifications={0}
        title={"FEATURED ITEM"}
        subtitle={"Available NOW!"}
        img={"/knit-arg-jersey-item-card.svg"}
      ></CF42Card>
      <CF42Card
        notifications={0}
        title={"INSTRUCTIONS"}
        subtitle={"Learn how to use CF42."}
        img={"/info-icon.svg"}
      ></CF42Card>
    </>
  );

  const storeMenu = (
    <>
      <CF42Card
        notifications={1}
        title={"BROWSE PACKS"}
        subtitle={"Available NOW!"}
        img={"/gold-pack.svg"}
        onClick={() => {
          setSubPage("pack-store");
        }}
      ></CF42Card>
      <CF42Card
        notifications={0}
        title={"ORDER HISTORY"}
        subtitle={"View previously purchased packs and owned items."}
        img={"/info-icon.svg"}
      ></CF42Card>
    </>
  );

  return (
    <div className="cf42-main-menu">
      <CF42Nav handleClick={handleNavClick} />
      {activeMenu === "home" && homeMenu}
      {activeMenu === "store" && storeMenu}
    </div>
  );
}
