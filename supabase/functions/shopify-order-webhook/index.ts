// Follow this setup guide to integrate the Deno language server with your editor:
// https://deno.land/manual/getting_started/setup_your_environment
// This enables autocomplete, go to definition, etc.

// Setup type definitions for built-in Supabase Runtime APIs
import "jsr:@supabase/functions-js/edge-runtime.d.ts";

import { createClient } from "jsr:@supabase/supabase-js@2";
import { Database } from "./database.types.ts";

console.log(Deno.env.get("SUPABASE_URL"), Deno.env.get("SUPABASE_ANON_KEY")!);
const supaClient = createClient<Database>(
  Deno.env.get("SUPABASE_URL")!,
  Deno.env.get("SUPABASE_ANON_KEY")!,
);
console.log("Hello from Functions!");

Deno.serve(async (req) => {
  try {
    //get cart token from payload
    const { cart_token } = await req.json();
    console.log(`got token: ${cart_token}`);
    // check DB for user that has this as their last token
    const { data, error } = await supaClient
      .from("user_profiles")
      .select("user_id, last_cart_key")
      .eq("last_cart_id", `gid://shopify/Cart/${cart_token}`)
      .single();

    if (error) {
      console.error(error);
      throw error;
    }
    console.log("Got Row", data);

    // update orders table, attaching user to the order
    if (data) {
      const user_id = data.user_id;
      const last_cart_key = data.last_cart_key;
      console.log(`Found associated user: ${user_id}`);
      const order_id_and_key = `${cart_token}?key=${last_cart_key}`;
      // we don't await this, if it fails, it fails

      const resp = await supaClient.from("user_orders").insert([
        {
          user_id: user_id,
          shopify_order_id_and_key: order_id_and_key,
        },
      ]);
      console.log(resp);
    } else {
      return new Response(
        JSON.stringify({
          error: `Error processing order: no user with that last cart id`,
        }),
        {
          status: 404,
          headers: { "Content-Type": "application/json" },
        },
      );
    }
    return new Response(
      JSON.stringify({
        message: `${data.user_id} order ✨potentially✨ processed successfully`,
      }),
      {
        headers: { "Content-Type": "application/json" },
      },
    );
  } catch (error) {
    console.error(`Error processing order: ${error}`);
    return new Response(JSON.stringify({ error: `Error processing order` }), {
      status: 500,
      headers: { "Content-Type": "application/json" },
    });
  }
});

/* To invoke locally:

  1. Run `supabase start` (see: https://supabase.com/docs/reference/cli/supabase-start)
  2. Make an HTTP request:

  curl -i --location --request POST 'http://127.0.0.1:54321/functions/v1/shopify-order-webhook' \
    --header 'Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZS1kZW1vIiwicm9sZSI6ImFub24iLCJleHAiOjE5ODM4MTI5OTZ9.CRXP1A7WOeoJeXxjNni43kdQwgnWNReilDMblYTn_I0' \
    --header 'Content-Type: application/json' \
    --data '{"name":"Functions"}'

*/
