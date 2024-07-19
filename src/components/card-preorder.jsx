import React from "react";

import "./card-preorder.css";

import Card from "./card";
import Button from "./button";

CardPreOrder.defaultProps = {
  productName: "[Insert Product Name]",
  retailPrice: "[$RP]",
  preorderPrice: "[$POP]",
};

export default function CardPreOrder({
  productName,
  retailPrice,
  preorderPrice,
}) {
  return (
    <Card title={"Pre-Order"}>
      <div className="card-preorder">
        <div className="card-preorder-header">
          <h5 id="preorder-product-name">{productName}</h5>
          <div className="card-preorder-prices">
            <h6 id="preorder-product-retail-price">{retailPrice}</h6>
            <h6 id="preorder-product-price">{preorderPrice}</h6>
          </div>
        </div>
        <Button label={"BUY NOW"} style={"window"}></Button>
      </div>
    </Card>
  );
}
