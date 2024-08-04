-- Using individual roles per order versus a postgres array
-- so that we can have a RLS that allows ANON to insert
create table user_orders (
    user_id uuid primary key references auth.users (id) not null,
    shopify_order_id_and_key text unique not null
);

alter table user_orders enable row level security;

CREATE POLICY "all can insert" ON "public"."user_orders"
AS PERMISSIVE FOR INSERT
TO public
WITH CHECK (true);

CREATE POLICY "users can see" ON "public"."user_orders"
AS PERMISSIVE FOR SELECT
To public
USING (auth.uid() = user_id);'
