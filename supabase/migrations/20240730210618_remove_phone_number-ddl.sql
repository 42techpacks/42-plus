alter table "public"."user_profiles" drop constraint "user_profiles_phone_number_key";

drop index if exists "public"."user_profiles_phone_number_key";

alter table "public"."user_profiles" drop column "phone_number";


