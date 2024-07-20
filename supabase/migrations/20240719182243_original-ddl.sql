create table user_profiles (
  user_id uuid primary key references auth.users (id) not null,
  username text unique not null
  CONSTRAINT proper_username CHECK (username ~* '^[a-zA-Z0-9_]+$')
  CONSTRAINT username_length CHECK (char_length(username) > 3 and char_length(username) < 15)
);

alter table user_profiles enable row level security;

-- NOTE: permissives will allow as long as one is true
-- Permissive for select is just true so anyone can see it
CREATE POLICY "all can see" ON "public"."user_profiles"
AS PERMISSIVE FOR SELECT
TO public
USING (true);

-- checks (using the supabase provided auth.uid function) that the user
--  trying to create or change a user profile is the right one
-- NOTE: we never allow users to delete a username
CREATE POLICY "users can insert" ON "public"."user_profiles"
AS PERMISSIVE FOR INSERT
TO public
WITH CHECK (auth.uid() = user_id);

-- there's an extra USING in this one cause it first filters all the rows
-- that the user can even see first let alone update
CREATE POLICY "owners can update" ON "public"."user_profiles"
AS PERMISSIVE FOR UPDATE
TO public
USING (auth.uid()=user_id)
WITH CHECK (auth.uid()=user_id);
