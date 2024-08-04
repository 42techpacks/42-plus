import Button from "../button";
import useShopify from "../../hooks/use-shopify";

import "./shopify-buy-button.css";

import PropTypes from "prop-types";
import { supaClient } from "../../supa-client";
import { useContext } from "react";
import { UserContext } from "../../App";

ShopifyBuyButton.propTypes = {
  variantId: PropTypes.string.isRequired,
};

export default function ShopifyBuyButton({ variantId }) {
  const user = useContext(UserContext);
  const { mutations, isLoading, error } = useShopify();
  /* TO-DO: Link to Shopify StorefrontAPI */
  const handleShopifyClick = (productID) => {
    console.log(productID);
  };

  const handleBuyNow = async () => {
    try {
      if (!variantId) {
        console.error("No variant ID found for selected pack");
        return;
      }

      const redirectUrl = `${window.location.origin}/store/packs/animation`;

      const cart = await mutations.createCart(variantId, 1, redirectUrl);
      const id_key_pair = cart.id?.split('?key=');
      console.log(id_key_pair)
      supaClient
        .from("user_profiles")
        .update({ last_cart_id: id_key_pair[0], last_cart_key: id_key_pair[1]})
        .eq("user_id", user.session.user.id)
        .then(({ error }) => {
          if (error) {
            console.error(error);
          }
        });
      const checkoutUrl = cart?.checkoutUrl;
      if (checkoutUrl) {
        window.location.href = checkoutUrl;
      } else {
        console.error("Failed to create checkout URL");
      }
    } catch (error) {
      console.error("Error creating checkout:", error);
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
