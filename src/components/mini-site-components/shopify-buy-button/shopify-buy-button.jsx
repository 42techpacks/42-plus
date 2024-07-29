import Button from "../../button";

import "./shopify-buy-button.css";

import PropTypes from 'prop-types';

ShopifyBuyButton.propTypes = {
  productID: PropTypes.string.isRequired
};

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
