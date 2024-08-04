create table user_orders (
    user_id uuid primary key references auth.users (id) not null,
    shopify_order_id_and_key text unique not null
);

alter table user_orders enable row level security;

CREATE POLICY "all can insert" ON "public"."user_orders"
AS PERMISSIVE FOR INSERT
TO public
WITH CHECK (true);
