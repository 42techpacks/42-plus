import { useState } from "react";
import "./cf42-mini-site.css";
import Card from "../../card";
import ShopifyBuyButton from "../../mini-site-components/shopify-buy-button/shopify-buy-button";
import CF42Card from "./cf42-card";
import Enter from "./enter/enter";
import Button from "../../button";

export default function CF42MiniSite() {
  const [activePage, setActivePage] = useState("enter");

  const handleNavClick = (page) => {
    console.log("CF42 Nav item clicked..." + page);
    setActivePage(page);
  };

  const home = (
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

  const store = (
    <>
      <CF42Card
        notifications={1}
        title={"BROWSE PACKS"}
        subtitle={"Available NOW!"}
        img={"/gold-pack.svg"}
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
    <div className="cf42-mini-site">
      {" "}
      <Card title="CF42" url={"CF42.exe"}>
        {activePage !== "enter" && (
          <div className="cf42-nav">
            <a className="selected" onClick={() => handleNavClick("home")}>
              Home
            </a>
            <a className="" onClick={() => handleNavClick("store")}>
              Store
            </a>
          </div>
        )}
        {activePage === "enter" && (
          <Enter>
            <Button label="START GAME" onClick={() => handleNavClick("home")} />
          </Enter>
        )}
        {activePage === "home" && home}
        {activePage === "store" && store}
      </Card>
    </div>
  );
}
