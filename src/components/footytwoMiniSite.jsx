import React, { useState } from "react";
import Card from "./card";

import "./footytwoMiniSite.css";
import ShopifyBuyButton from "./mini-site-components/shopify-buy-button/shopify-buy-button";

export default function FootytwoMiniSite() {
  const [activeTab, setActiveTab] = useState("main");
  const [pageIndex, setPageIndex] = useState(0);

  const handleTabClick = (tab) => {
    setActiveTab(tab);
    setPageIndex(0);
  };

  const main = (
    <>
      <div className="header">
        <img
          id="footytwo-type-logo-white"
          src="/footytwo-type-logo-white.svg"
        ></img>
      </div>

      <div className="hero">
        <img src="/colombiaFlatFront.png" alt="Colombia Flat Front"></img>
      </div>

      <ShopifyBuyButton productID={"42"} />
    </>
  );

  const info = (
    <>
      <>
        <a>INFO</a>
      </>
    </>
  );

  const sizing = (
    <>
      <>
        <a>SIZING</a>
      </>
    </>
  );

  const gallery = (
    <>
      <>
        <a>GALLERY</a>
      </>
    </>
  );

  return (
    <div className="footytwo-ms">
      <Card
        tabs={["main", "info", "sizing", "gallery"]}
        onTabClick={handleTabClick}
        url={`copa-restock/${activeTab}`}
        onArrowClick={() => console.log("arrow click")}
        title=""
        pageIndex={pageIndex}
      >
        {activeTab === "main" && main}
        {activeTab === "info" && info}
        {activeTab === "sizing" && sizing}
        {activeTab === "gallery" && gallery}
      </Card>
    </div>
  );
}
