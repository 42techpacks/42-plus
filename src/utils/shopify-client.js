import { createStorefrontApiClient } from '@shopify/storefront-api-client';

const client = createStorefrontApiClient({
  storeDomain: import.meta.env.VITE_SHOPIFY_STORE_DOMAIN,
  apiVersion: '2024-07',
  publicAccessToken: import.meta.env.VITE_SHOPIFY_ACCESS_TOKEN,
});

export const shopifyClient = client;
