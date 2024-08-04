alter table "public"."user_profiles" add column "last_cart_id" text;

alter table "public"."user_profiles" add column "last_cart_key" text;

CREATE UNIQUE INDEX user_profiles_last_cart_id_key ON public.user_profiles USING btree (last_cart_id);

alter table "public"."user_profiles" add constraint "user_profiles_check" CHECK ((((last_cart_id IS NOT NULL) AND (last_cart_key IS NOT NULL)) OR ((last_cart_id IS NULL) AND (last_cart_key IS NULL)))) not valid;

alter table "public"."user_profiles" validate constraint "user_profiles_check";

alter table "public"."user_profiles" add constraint "user_profiles_last_cart_id_key" UNIQUE using index "user_profiles_last_cart_id_key";


