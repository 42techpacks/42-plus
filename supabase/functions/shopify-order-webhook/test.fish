#!/usr/bin/env fish

curl -X 'POST' 'http://127.0.0.1:54321/functions/v1/shopify-order-webhook' \
    --header 'Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZS1kZW1vIiwicm9sZSI6ImFub24iLCJleHAiOjE5ODM4MTI5OTZ9.CRXP1A7WOeoJeXxjNni43kdQwgnWNReilDMblYTn_I0' \
    --header 'Content-Type: application/json' \
  -H 'x-shopify-webhook-id: b7504392-2461-4993-848c-1b59c87c8a87' \
  -H 'x-shopify-triggered-at: 2024-08-03T18:28:37.234647458Z' \
  -H 'x-shopify-topic: orders/create' \
  -H 'x-shopify-test: false' \
  -H 'x-shopify-shop-domain: flimsytwo.myshopify.com' \
  -H 'x-shopify-order-id: 5590760685782' \
  -H 'x-shopify-hmac-sha256: yQ9KgVqWAHZjtG54ok1L6eFFk+f0EvUQ7WPAJP276K4=' \
  -H 'x-shopify-event-id: 218e46c3-e7ef-4b50-a615-56b67ba789b7' \
  -H 'x-shopify-api-version: 2024-07' \
  -H 'content-type: application/json' \
  -H 'accept: */*' \
  -H 'user-agent: Shopify-Captain-Hook' \
  -H 'host: webhook.site' \
  -d @"$PWD/../../../src/typing/shopify-order-webhook.json"
