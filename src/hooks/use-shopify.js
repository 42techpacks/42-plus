import { useState } from "react";
import { shopifyClient } from "../utils/shopify-client";
import {
  PRODUCTS_QUERY,
  REMOVE_FROM_CART_MUTATION,
  CREATE_CART_MUTATION,
  ADD_TO_CART_MUTATION,
} from "../utils/shopify-queries";

function useShopify() {
  const [isLoading, setIsLoading] = useState(false);
  const [error, setError] = useState(null);

  const executeQuery = async (query, variables = {}) => {
    setIsLoading(true);
    setError(null);
    try {
      const { data, errors } = await shopifyClient.request(query, {
        variables,
      });
      if (errors) {
        throw new Error(errors[0].message);
      }
      return data;
    } catch (err) {
      setError(err.message);
      console.error(err);
      return null;
    } finally {
      setIsLoading(false);
    }
  };

  const fetchProducts = () => executeQuery(PRODUCTS_QUERY);

  /**
   * Fetches the URL for a checkout session in Shopify.
   *
   * @param {string} variantId - The ID of the product variant to add to the checkout.
   * @param {number} quantity - The quantity of the product variant to add to the checkout.
   * @param {string} redirectUrl - The URL to redirect to after the checkout is created.
   * @returns {Promise<Object>} - A promise that resolves to the checkout object containing the checkout ID and web URL.
   * @throws {Error} - Throws an error if the checkout creation fails.
   */
  const createCart = async (variantId, quantity, redirectUrl) => {
    const result = await executeQuery(CREATE_CART_MUTATION, {
      input: {
        lines: [{ merchandiseId: variantId, quantity }],
        attributes: [{ key: "cart_redirect_url", value: redirectUrl }],
      },
    });
    return result?.cartCreate?.cart;
  };

  const addToCart = (cartId, variantId, quantity) =>
    executeQuery(ADD_TO_CART_MUTATION, {
      cartId,
      lines: [{ merchandiseId: variantId, quantity }],
    });

  const removeFromCart = (cartId, lineId) =>
    executeQuery(REMOVE_FROM_CART_MUTATION, {
      cartId,
      lineIds: [lineId],
    });

  return {
    queries: {
      fetchProducts,
    },
    mutations: {
      createCart,
      addToCart,
      removeFromCart,
    },
    isLoading,
    error,
  };
}

export default useShopify;
