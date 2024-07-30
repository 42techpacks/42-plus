-- Add created_at and phone_number columns to user_profiles so we can
-- create the leaderboard in beta-mini-site
ALTER TABLE "public"."user_profiles" ADD COLUMN "created_at" timestamp with time zone;

-- ALTER TABLE "public"."user_profiles" ADD COLUMN "phone_number" text;

-- Updating existing rows with data from auth.users
UPDATE "public"."user_profiles" up
SET
    -- phone_number = au.phone,
    created_at = au.created_at
FROM "auth"."users" au
WHERE up.user_id = au.id;

-- Alter tables to be not null after migrating existing users
ALTER TABLE "public"."user_profiles" ALTER COLUMN "created_at" SET NOT NULL;
-- ALTER TABLE "public"."user_profiles" ALTER COLUMN "phone_number" SET NOT NULL;

-- same for the default
ALTER TABLE "public"."user_profiles" ALTER COLUMN "created_at" SET DEFAULT now();
