import "./card-preorder.css";

import Button from "./button";
import Card from "./card";

import PropTypes from "prop-types";

CardPreOrder.propTypes = {
  productName: PropTypes.string.isRequired,
  retailPrice: PropTypes.string.isRequired,
  preorderPrice: PropTypes.string.isRequired,
};

export default function CardPreOrder({
  productName = "[Insert Product Name]",
  retailPrice = "[$RP]",
  preorderPrice = "[$POP]",
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
        <span id="preorder-product-shipping-disclaimer">
          Ships in 8-10 weeks
        </span>
      </div>
    </Card>
  );
}
