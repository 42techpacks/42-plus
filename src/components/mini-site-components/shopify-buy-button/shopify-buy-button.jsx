import React from "react";
import Button from "../../button";

import "./shopify-buy-button.css";

export default function ShopifyBuyButton({ productID }) {
  /* TO-DO: Link to Shopify StorefrontAPI */
  const handleShopifyClick = (productID) => {
    console.log(productID);
  };

  return (
    <div className="shopify-buy-button-container">
      <Button
        label="BUY NOW"
        style="shopify-buy"
        onClick={() => handleShopifyClick(productID)}
      ></Button>
    </div>
  );
}
