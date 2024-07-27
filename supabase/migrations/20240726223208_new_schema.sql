alter table "public"."user_profiles" add column "created_at" timestamp with time zone not null default now();

alter table "public"."user_profiles" add column "phone_number" text not null;

CREATE UNIQUE INDEX user_profiles_phone_number_key ON public.user_profiles USING btree (phone_number);

alter table "public"."user_profiles" add constraint "user_profiles_phone_number_key" UNIQUE using index "user_profiles_phone_number_key";