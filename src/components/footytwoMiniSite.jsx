import { useState } from "react";
import Card from "./card";

import "./footytwoMiniSite.css";
import ItemSelectionOption from "./shopify-buy-button/item-selection-option";
import ShopifyBuyButton from "./shopify-buy-button/shopify-buy-button";

export default function FootytwoMiniSite() {
  const [activeTab, setActiveTab] = useState("main");
  const [pageIndex, setPageIndex] = useState(0);

  const handleTabClick = (tab) => {
    setActiveTab(tab);
    setPageIndex(0);
  };

  const main = (
    <>
      <div className="hero">
        <div className="hero-left">
          <img src={"/chileM-full.png"}></img>
        </div>
        <div className="hero-right">
          <div className="cta-header">
            <h4>Knit Argentina Jersey</h4>
            <h4>
              <span className="price">$86</span>
            </h4>
          </div>
          <ShopifyBuyButton
            variantId={"gid://shopify/ProductVariant/45633232601302"}
          />
        </div>
      </div>
      <div className="item-selection">
        <ItemSelectionOption
          img={"/chileM.png"}
          flag={"argentina"}
          label={"ARG"}
        ></ItemSelectionOption>
        <ItemSelectionOption
          img={"/chileM.png"}
          flag={"brazil"}
          label={"BRA"}
        ></ItemSelectionOption>
        <ItemSelectionOption
          img={"/chileM.png"}
          flag={"colombia"}
          label={"COL"}
        ></ItemSelectionOption>
        <ItemSelectionOption
          img={"/chileM.png"}
          flag={"mexico"}
          label={"MEX"}
        ></ItemSelectionOption>
        <ItemSelectionOption
          img={"/chileM.png"}
          flag={"chile"}
          label={"CHI"}
        ></ItemSelectionOption>
      </div>
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
