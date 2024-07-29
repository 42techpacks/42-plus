import Button from "../button";
import useShopify from "../../hooks/use-shopify";

import "./shopify-buy-button.css";

import PropTypes from 'prop-types';

ShopifyBuyButton.propTypes = {
  variantId: PropTypes.string.isRequired
};


export default function ShopifyBuyButton({ variantId }) {
  const { mutations, isLoading, error } = useShopify();
  /* TO-DO: Link to Shopify StorefrontAPI */
  const handleShopifyClick = (productID) => {
    console.log(productID);
  };

  const handleBuyNow = async () => {
    try {
      if (!variantId) {
        console.error('No variant ID found for selected pack');
        return;
      }

      const redirectUrl = `${window.location.origin}/store/packs/animation`;

      const checkoutUrl = await mutations.createCheckoutURL(variantId, 1, redirectUrl);
      if (checkoutUrl) {
        window.location.href = checkoutUrl;
      } else {
        console.error('Failed to create checkout URL');
      }
    } catch (error) {
      console.error('Error creating checkout:', error);
    }
  };

  return (
    <div className="shopify-buy-button-container">
      <Button
        label="BUY NOW"
        style="shopify-buy"
        onClick={() => handleBuyNow()}
      ></Button>
    </div>
  );
}
