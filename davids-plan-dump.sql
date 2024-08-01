--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1 (Ubuntu 15.1-1.pgdg20.04+1)
-- Dumped by pg_dump version 16.3 (Homebrew)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: auth; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA auth;


ALTER SCHEMA auth OWNER TO supabase_admin;

--
-- Name: extensions; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA extensions;


ALTER SCHEMA extensions OWNER TO postgres;

--
-- Name: graphql; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA graphql;


ALTER SCHEMA graphql OWNER TO supabase_admin;

--
-- Name: graphql_public; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA graphql_public;


ALTER SCHEMA graphql_public OWNER TO supabase_admin;

--
-- Name: pgbouncer; Type: SCHEMA; Schema: -; Owner: pgbouncer
--

CREATE SCHEMA pgbouncer;


ALTER SCHEMA pgbouncer OWNER TO pgbouncer;

--
-- Name: pgsodium; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA pgsodium;


ALTER SCHEMA pgsodium OWNER TO supabase_admin;

--
-- Name: pgsodium; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgsodium WITH SCHEMA pgsodium;


--
-- Name: EXTENSION pgsodium; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgsodium IS 'Pgsodium is a modern cryptography library for Postgres.';


--
-- Name: realtime; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA realtime;


ALTER SCHEMA realtime OWNER TO supabase_admin;

--
-- Name: storage; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA storage;


ALTER SCHEMA storage OWNER TO supabase_admin;

--
-- Name: supabase_migrations; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA supabase_migrations;


ALTER SCHEMA supabase_migrations OWNER TO postgres;

--
-- Name: vault; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA vault;


ALTER SCHEMA vault OWNER TO supabase_admin;

--
-- Name: pg_graphql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_graphql WITH SCHEMA graphql;


--
-- Name: EXTENSION pg_graphql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_graphql IS 'pg_graphql: GraphQL support';


--
-- Name: pg_stat_statements; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_stat_statements WITH SCHEMA extensions;


--
-- Name: EXTENSION pg_stat_statements; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_stat_statements IS 'track planning and execution statistics of all SQL statements executed';


--
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA extensions;


--
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


--
-- Name: pgjwt; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgjwt WITH SCHEMA extensions;


--
-- Name: EXTENSION pgjwt; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgjwt IS 'JSON Web Token API for Postgresql';


--
-- Name: supabase_vault; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS supabase_vault WITH SCHEMA vault;


--
-- Name: EXTENSION supabase_vault; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION supabase_vault IS 'Supabase Vault Extension';


--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA extensions;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


--
-- Name: aal_level; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.aal_level AS ENUM (
    'aal1',
    'aal2',
    'aal3'
);


ALTER TYPE auth.aal_level OWNER TO supabase_auth_admin;

--
-- Name: code_challenge_method; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.code_challenge_method AS ENUM (
    's256',
    'plain'
);


ALTER TYPE auth.code_challenge_method OWNER TO supabase_auth_admin;

--
-- Name: factor_status; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.factor_status AS ENUM (
    'unverified',
    'verified'
);


ALTER TYPE auth.factor_status OWNER TO supabase_auth_admin;

--
-- Name: factor_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.factor_type AS ENUM (
    'totp',
    'webauthn'
);


ALTER TYPE auth.factor_type OWNER TO supabase_auth_admin;

--
-- Name: one_time_token_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.one_time_token_type AS ENUM (
    'confirmation_token',
    'reauthentication_token',
    'recovery_token',
    'email_change_token_new',
    'email_change_token_current',
    'phone_change_token'
);


ALTER TYPE auth.one_time_token_type OWNER TO supabase_auth_admin;

--
-- Name: action; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.action AS ENUM (
    'INSERT',
    'UPDATE',
    'DELETE',
    'TRUNCATE',
    'ERROR'
);


ALTER TYPE realtime.action OWNER TO supabase_admin;

--
-- Name: equality_op; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.equality_op AS ENUM (
    'eq',
    'neq',
    'lt',
    'lte',
    'gt',
    'gte',
    'in'
);


ALTER TYPE realtime.equality_op OWNER TO supabase_admin;

--
-- Name: user_defined_filter; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.user_defined_filter AS (
	column_name text,
	op realtime.equality_op,
	value text
);


ALTER TYPE realtime.user_defined_filter OWNER TO supabase_admin;

--
-- Name: wal_column; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.wal_column AS (
	name text,
	type_name text,
	type_oid oid,
	value jsonb,
	is_pkey boolean,
	is_selectable boolean
);


ALTER TYPE realtime.wal_column OWNER TO supabase_admin;

--
-- Name: wal_rls; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.wal_rls AS (
	wal jsonb,
	is_rls_enabled boolean,
	subscription_ids uuid[],
	errors text[]
);


ALTER TYPE realtime.wal_rls OWNER TO supabase_admin;

--
-- Name: email(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.email() RETURNS text
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.email', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'email')
  )::text
$$;


ALTER FUNCTION auth.email() OWNER TO supabase_auth_admin;

--
-- Name: FUNCTION email(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.email() IS 'Deprecated. Use auth.jwt() -> ''email'' instead.';


--
-- Name: jwt(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.jwt() RETURNS jsonb
    LANGUAGE sql STABLE
    AS $$
  select 
    coalesce(
        nullif(current_setting('request.jwt.claim', true), ''),
        nullif(current_setting('request.jwt.claims', true), '')
    )::jsonb
$$;


ALTER FUNCTION auth.jwt() OWNER TO supabase_auth_admin;

--
-- Name: role(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.role() RETURNS text
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.role', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'role')
  )::text
$$;


ALTER FUNCTION auth.role() OWNER TO supabase_auth_admin;

--
-- Name: FUNCTION role(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.role() IS 'Deprecated. Use auth.jwt() -> ''role'' instead.';


--
-- Name: uid(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.uid() RETURNS uuid
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.sub', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'sub')
  )::uuid
$$;


ALTER FUNCTION auth.uid() OWNER TO supabase_auth_admin;

--
-- Name: FUNCTION uid(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.uid() IS 'Deprecated. Use auth.jwt() -> ''sub'' instead.';


--
-- Name: grant_pg_cron_access(); Type: FUNCTION; Schema: extensions; Owner: postgres
--

CREATE FUNCTION extensions.grant_pg_cron_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF EXISTS (
    SELECT
    FROM pg_event_trigger_ddl_commands() AS ev
    JOIN pg_extension AS ext
    ON ev.objid = ext.oid
    WHERE ext.extname = 'pg_cron'
  )
  THEN
    grant usage on schema cron to postgres with grant option;

    alter default privileges in schema cron grant all on tables to postgres with grant option;
    alter default privileges in schema cron grant all on functions to postgres with grant option;
    alter default privileges in schema cron grant all on sequences to postgres with grant option;

    alter default privileges for user supabase_admin in schema cron grant all
        on sequences to postgres with grant option;
    alter default privileges for user supabase_admin in schema cron grant all
        on tables to postgres with grant option;
    alter default privileges for user supabase_admin in schema cron grant all
        on functions to postgres with grant option;

    grant all privileges on all tables in schema cron to postgres with grant option;
    revoke all on table cron.job from postgres;
    grant select on table cron.job to postgres with grant option;
  END IF;
END;
$$;


ALTER FUNCTION extensions.grant_pg_cron_access() OWNER TO postgres;

--
-- Name: FUNCTION grant_pg_cron_access(); Type: COMMENT; Schema: extensions; Owner: postgres
--

COMMENT ON FUNCTION extensions.grant_pg_cron_access() IS 'Grants access to pg_cron';


--
-- Name: grant_pg_graphql_access(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.grant_pg_graphql_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $_$
DECLARE
    func_is_graphql_resolve bool;
BEGIN
    func_is_graphql_resolve = (
        SELECT n.proname = 'resolve'
        FROM pg_event_trigger_ddl_commands() AS ev
        LEFT JOIN pg_catalog.pg_proc AS n
        ON ev.objid = n.oid
    );

    IF func_is_graphql_resolve
    THEN
        -- Update public wrapper to pass all arguments through to the pg_graphql resolve func
        DROP FUNCTION IF EXISTS graphql_public.graphql;
        create or replace function graphql_public.graphql(
            "operationName" text default null,
            query text default null,
            variables jsonb default null,
            extensions jsonb default null
        )
            returns jsonb
            language sql
        as $$
            select graphql.resolve(
                query := query,
                variables := coalesce(variables, '{}'),
                "operationName" := "operationName",
                extensions := extensions
            );
        $$;

        -- This hook executes when `graphql.resolve` is created. That is not necessarily the last
        -- function in the extension so we need to grant permissions on existing entities AND
        -- update default permissions to any others that are created after `graphql.resolve`
        grant usage on schema graphql to postgres, anon, authenticated, service_role;
        grant select on all tables in schema graphql to postgres, anon, authenticated, service_role;
        grant execute on all functions in schema graphql to postgres, anon, authenticated, service_role;
        grant all on all sequences in schema graphql to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on tables to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on functions to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on sequences to postgres, anon, authenticated, service_role;

        -- Allow postgres role to allow granting usage on graphql and graphql_public schemas to custom roles
        grant usage on schema graphql_public to postgres with grant option;
        grant usage on schema graphql to postgres with grant option;
    END IF;

END;
$_$;


ALTER FUNCTION extensions.grant_pg_graphql_access() OWNER TO supabase_admin;

--
-- Name: FUNCTION grant_pg_graphql_access(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.grant_pg_graphql_access() IS 'Grants access to pg_graphql';


--
-- Name: grant_pg_net_access(); Type: FUNCTION; Schema: extensions; Owner: postgres
--

CREATE FUNCTION extensions.grant_pg_net_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF EXISTS (
    SELECT 1
    FROM pg_event_trigger_ddl_commands() AS ev
    JOIN pg_extension AS ext
    ON ev.objid = ext.oid
    WHERE ext.extname = 'pg_net'
  )
  THEN
    IF NOT EXISTS (
      SELECT 1
      FROM pg_roles
      WHERE rolname = 'supabase_functions_admin'
    )
    THEN
      CREATE USER supabase_functions_admin NOINHERIT CREATEROLE LOGIN NOREPLICATION;
    END IF;

    GRANT USAGE ON SCHEMA net TO supabase_functions_admin, postgres, anon, authenticated, service_role;

    ALTER function net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) SECURITY DEFINER;
    ALTER function net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) SECURITY DEFINER;

    ALTER function net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) SET search_path = net;
    ALTER function net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) SET search_path = net;

    REVOKE ALL ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;
    REVOKE ALL ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;

    GRANT EXECUTE ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin, postgres, anon, authenticated, service_role;
    GRANT EXECUTE ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin, postgres, anon, authenticated, service_role;
  END IF;
END;
$$;


ALTER FUNCTION extensions.grant_pg_net_access() OWNER TO postgres;

--
-- Name: FUNCTION grant_pg_net_access(); Type: COMMENT; Schema: extensions; Owner: postgres
--

COMMENT ON FUNCTION extensions.grant_pg_net_access() IS 'Grants access to pg_net';


--
-- Name: pgrst_ddl_watch(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.pgrst_ddl_watch() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  cmd record;
BEGIN
  FOR cmd IN SELECT * FROM pg_event_trigger_ddl_commands()
  LOOP
    IF cmd.command_tag IN (
      'CREATE SCHEMA', 'ALTER SCHEMA'
    , 'CREATE TABLE', 'CREATE TABLE AS', 'SELECT INTO', 'ALTER TABLE'
    , 'CREATE FOREIGN TABLE', 'ALTER FOREIGN TABLE'
    , 'CREATE VIEW', 'ALTER VIEW'
    , 'CREATE MATERIALIZED VIEW', 'ALTER MATERIALIZED VIEW'
    , 'CREATE FUNCTION', 'ALTER FUNCTION'
    , 'CREATE TRIGGER'
    , 'CREATE TYPE', 'ALTER TYPE'
    , 'CREATE RULE'
    , 'COMMENT'
    )
    -- don't notify in case of CREATE TEMP table or other objects created on pg_temp
    AND cmd.schema_name is distinct from 'pg_temp'
    THEN
      NOTIFY pgrst, 'reload schema';
    END IF;
  END LOOP;
END; $$;


ALTER FUNCTION extensions.pgrst_ddl_watch() OWNER TO supabase_admin;

--
-- Name: pgrst_drop_watch(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.pgrst_drop_watch() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  obj record;
BEGIN
  FOR obj IN SELECT * FROM pg_event_trigger_dropped_objects()
  LOOP
    IF obj.object_type IN (
      'schema'
    , 'table'
    , 'foreign table'
    , 'view'
    , 'materialized view'
    , 'function'
    , 'trigger'
    , 'type'
    , 'rule'
    )
    AND obj.is_temporary IS false -- no pg_temp objects
    THEN
      NOTIFY pgrst, 'reload schema';
    END IF;
  END LOOP;
END; $$;


ALTER FUNCTION extensions.pgrst_drop_watch() OWNER TO supabase_admin;

--
-- Name: set_graphql_placeholder(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.set_graphql_placeholder() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $_$
    DECLARE
    graphql_is_dropped bool;
    BEGIN
    graphql_is_dropped = (
        SELECT ev.schema_name = 'graphql_public'
        FROM pg_event_trigger_dropped_objects() AS ev
        WHERE ev.schema_name = 'graphql_public'
    );

    IF graphql_is_dropped
    THEN
        create or replace function graphql_public.graphql(
            "operationName" text default null,
            query text default null,
            variables jsonb default null,
            extensions jsonb default null
        )
            returns jsonb
            language plpgsql
        as $$
            DECLARE
                server_version float;
            BEGIN
                server_version = (SELECT (SPLIT_PART((select version()), ' ', 2))::float);

                IF server_version >= 14 THEN
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql extension is not enabled.'
                            )
                        )
                    );
                ELSE
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql is only available on projects running Postgres 14 onwards.'
                            )
                        )
                    );
                END IF;
            END;
        $$;
    END IF;

    END;
$_$;


ALTER FUNCTION extensions.set_graphql_placeholder() OWNER TO supabase_admin;

--
-- Name: FUNCTION set_graphql_placeholder(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.set_graphql_placeholder() IS 'Reintroduces placeholder function for graphql_public.graphql';


--
-- Name: get_auth(text); Type: FUNCTION; Schema: pgbouncer; Owner: postgres
--

CREATE FUNCTION pgbouncer.get_auth(p_usename text) RETURNS TABLE(username text, password text)
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
BEGIN
    RAISE WARNING 'PgBouncer auth request: %', p_usename;

    RETURN QUERY
    SELECT usename::TEXT, passwd::TEXT FROM pg_catalog.pg_shadow
    WHERE usename = p_usename;
END;
$$;


ALTER FUNCTION pgbouncer.get_auth(p_usename text) OWNER TO postgres;

--
-- Name: apply_rls(jsonb, integer); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer DEFAULT (1024 * 1024)) RETURNS SETOF realtime.wal_rls
    LANGUAGE plpgsql
    AS $$
declare
-- Regclass of the table e.g. public.notes
entity_ regclass = (quote_ident(wal ->> 'schema') || '.' || quote_ident(wal ->> 'table'))::regclass;

-- I, U, D, T: insert, update ...
action realtime.action = (
    case wal ->> 'action'
        when 'I' then 'INSERT'
        when 'U' then 'UPDATE'
        when 'D' then 'DELETE'
        else 'ERROR'
    end
);

-- Is row level security enabled for the table
is_rls_enabled bool = relrowsecurity from pg_class where oid = entity_;

subscriptions realtime.subscription[] = array_agg(subs)
    from
        realtime.subscription subs
    where
        subs.entity = entity_;

-- Subscription vars
roles regrole[] = array_agg(distinct us.claims_role::text)
    from
        unnest(subscriptions) us;

working_role regrole;
claimed_role regrole;
claims jsonb;

subscription_id uuid;
subscription_has_access bool;
visible_to_subscription_ids uuid[] = '{}';

-- structured info for wal's columns
columns realtime.wal_column[];
-- previous identity values for update/delete
old_columns realtime.wal_column[];

error_record_exceeds_max_size boolean = octet_length(wal::text) > max_record_bytes;

-- Primary jsonb output for record
output jsonb;

begin
perform set_config('role', null, true);

columns =
    array_agg(
        (
            x->>'name',
            x->>'type',
            x->>'typeoid',
            realtime.cast(
                (x->'value') #>> '{}',
                coalesce(
                    (x->>'typeoid')::regtype, -- null when wal2json version <= 2.4
                    (x->>'type')::regtype
                )
            ),
            (pks ->> 'name') is not null,
            true
        )::realtime.wal_column
    )
    from
        jsonb_array_elements(wal -> 'columns') x
        left join jsonb_array_elements(wal -> 'pk') pks
            on (x ->> 'name') = (pks ->> 'name');

old_columns =
    array_agg(
        (
            x->>'name',
            x->>'type',
            x->>'typeoid',
            realtime.cast(
                (x->'value') #>> '{}',
                coalesce(
                    (x->>'typeoid')::regtype, -- null when wal2json version <= 2.4
                    (x->>'type')::regtype
                )
            ),
            (pks ->> 'name') is not null,
            true
        )::realtime.wal_column
    )
    from
        jsonb_array_elements(wal -> 'identity') x
        left join jsonb_array_elements(wal -> 'pk') pks
            on (x ->> 'name') = (pks ->> 'name');

for working_role in select * from unnest(roles) loop

    -- Update `is_selectable` for columns and old_columns
    columns =
        array_agg(
            (
                c.name,
                c.type_name,
                c.type_oid,
                c.value,
                c.is_pkey,
                pg_catalog.has_column_privilege(working_role, entity_, c.name, 'SELECT')
            )::realtime.wal_column
        )
        from
            unnest(columns) c;

    old_columns =
            array_agg(
                (
                    c.name,
                    c.type_name,
                    c.type_oid,
                    c.value,
                    c.is_pkey,
                    pg_catalog.has_column_privilege(working_role, entity_, c.name, 'SELECT')
                )::realtime.wal_column
            )
            from
                unnest(old_columns) c;

    if action <> 'DELETE' and count(1) = 0 from unnest(columns) c where c.is_pkey then
        return next (
            jsonb_build_object(
                'schema', wal ->> 'schema',
                'table', wal ->> 'table',
                'type', action
            ),
            is_rls_enabled,
            -- subscriptions is already filtered by entity
            (select array_agg(s.subscription_id) from unnest(subscriptions) as s where claims_role = working_role),
            array['Error 400: Bad Request, no primary key']
        )::realtime.wal_rls;

    -- The claims role does not have SELECT permission to the primary key of entity
    elsif action <> 'DELETE' and sum(c.is_selectable::int) <> count(1) from unnest(columns) c where c.is_pkey then
        return next (
            jsonb_build_object(
                'schema', wal ->> 'schema',
                'table', wal ->> 'table',
                'type', action
            ),
            is_rls_enabled,
            (select array_agg(s.subscription_id) from unnest(subscriptions) as s where claims_role = working_role),
            array['Error 401: Unauthorized']
        )::realtime.wal_rls;

    else
        output = jsonb_build_object(
            'schema', wal ->> 'schema',
            'table', wal ->> 'table',
            'type', action,
            'commit_timestamp', to_char(
                ((wal ->> 'timestamp')::timestamptz at time zone 'utc'),
                'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"'
            ),
            'columns', (
                select
                    jsonb_agg(
                        jsonb_build_object(
                            'name', pa.attname,
                            'type', pt.typname
                        )
                        order by pa.attnum asc
                    )
                from
                    pg_attribute pa
                    join pg_type pt
                        on pa.atttypid = pt.oid
                where
                    attrelid = entity_
                    and attnum > 0
                    and pg_catalog.has_column_privilege(working_role, entity_, pa.attname, 'SELECT')
            )
        )
        -- Add "record" key for insert and update
        || case
            when action in ('INSERT', 'UPDATE') then
                jsonb_build_object(
                    'record',
                    (
                        select
                            jsonb_object_agg(
                                -- if unchanged toast, get column name and value from old record
                                coalesce((c).name, (oc).name),
                                case
                                    when (c).name is null then (oc).value
                                    else (c).value
                                end
                            )
                        from
                            unnest(columns) c
                            full outer join unnest(old_columns) oc
                                on (c).name = (oc).name
                        where
                            coalesce((c).is_selectable, (oc).is_selectable)
                            and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                    )
                )
            else '{}'::jsonb
        end
        -- Add "old_record" key for update and delete
        || case
            when action = 'UPDATE' then
                jsonb_build_object(
                        'old_record',
                        (
                            select jsonb_object_agg((c).name, (c).value)
                            from unnest(old_columns) c
                            where
                                (c).is_selectable
                                and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                        )
                    )
            when action = 'DELETE' then
                jsonb_build_object(
                    'old_record',
                    (
                        select jsonb_object_agg((c).name, (c).value)
                        from unnest(old_columns) c
                        where
                            (c).is_selectable
                            and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                            and ( not is_rls_enabled or (c).is_pkey ) -- if RLS enabled, we can't secure deletes so filter to pkey
                    )
                )
            else '{}'::jsonb
        end;

        -- Create the prepared statement
        if is_rls_enabled and action <> 'DELETE' then
            if (select 1 from pg_prepared_statements where name = 'walrus_rls_stmt' limit 1) > 0 then
                deallocate walrus_rls_stmt;
            end if;
            execute realtime.build_prepared_statement_sql('walrus_rls_stmt', entity_, columns);
        end if;

        visible_to_subscription_ids = '{}';

        for subscription_id, claims in (
                select
                    subs.subscription_id,
                    subs.claims
                from
                    unnest(subscriptions) subs
                where
                    subs.entity = entity_
                    and subs.claims_role = working_role
                    and (
                        realtime.is_visible_through_filters(columns, subs.filters)
                        or action = 'DELETE'
                    )
        ) loop

            if not is_rls_enabled or action = 'DELETE' then
                visible_to_subscription_ids = visible_to_subscription_ids || subscription_id;
            else
                -- Check if RLS allows the role to see the record
                perform
                    -- Trim leading and trailing quotes from working_role because set_config
                    -- doesn't recognize the role as valid if they are included
                    set_config('role', trim(both '"' from working_role::text), true),
                    set_config('request.jwt.claims', claims::text, true);

                execute 'execute walrus_rls_stmt' into subscription_has_access;

                if subscription_has_access then
                    visible_to_subscription_ids = visible_to_subscription_ids || subscription_id;
                end if;
            end if;
        end loop;

        perform set_config('role', null, true);

        return next (
            output,
            is_rls_enabled,
            visible_to_subscription_ids,
            case
                when error_record_exceeds_max_size then array['Error 413: Payload Too Large']
                else '{}'
            end
        )::realtime.wal_rls;

    end if;
end loop;

perform set_config('role', null, true);
end;
$$;


ALTER FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) OWNER TO supabase_admin;

--
-- Name: build_prepared_statement_sql(text, regclass, realtime.wal_column[]); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) RETURNS text
    LANGUAGE sql
    AS $$
      /*
      Builds a sql string that, if executed, creates a prepared statement to
      tests retrive a row from *entity* by its primary key columns.
      Example
          select realtime.build_prepared_statement_sql('public.notes', '{"id"}'::text[], '{"bigint"}'::text[])
      */
          select
      'prepare ' || prepared_statement_name || ' as
          select
              exists(
                  select
                      1
                  from
                      ' || entity || '
                  where
                      ' || string_agg(quote_ident(pkc.name) || '=' || quote_nullable(pkc.value #>> '{}') , ' and ') || '
              )'
          from
              unnest(columns) pkc
          where
              pkc.is_pkey
          group by
              entity
      $$;


ALTER FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) OWNER TO supabase_admin;

--
-- Name: cast(text, regtype); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime."cast"(val text, type_ regtype) RETURNS jsonb
    LANGUAGE plpgsql IMMUTABLE
    AS $$
    declare
      res jsonb;
    begin
      execute format('select to_jsonb(%L::'|| type_::text || ')', val)  into res;
      return res;
    end
    $$;


ALTER FUNCTION realtime."cast"(val text, type_ regtype) OWNER TO supabase_admin;

--
-- Name: check_equality_op(realtime.equality_op, regtype, text, text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) RETURNS boolean
    LANGUAGE plpgsql IMMUTABLE
    AS $$
      /*
      Casts *val_1* and *val_2* as type *type_* and check the *op* condition for truthiness
      */
      declare
          op_symbol text = (
              case
                  when op = 'eq' then '='
                  when op = 'neq' then '!='
                  when op = 'lt' then '<'
                  when op = 'lte' then '<='
                  when op = 'gt' then '>'
                  when op = 'gte' then '>='
                  when op = 'in' then '= any'
                  else 'UNKNOWN OP'
              end
          );
          res boolean;
      begin
          execute format(
              'select %L::'|| type_::text || ' ' || op_symbol
              || ' ( %L::'
              || (
                  case
                      when op = 'in' then type_::text || '[]'
                      else type_::text end
              )
              || ')', val_1, val_2) into res;
          return res;
      end;
      $$;


ALTER FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) OWNER TO supabase_admin;

--
-- Name: is_visible_through_filters(realtime.wal_column[], realtime.user_defined_filter[]); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$
    /*
    Should the record be visible (true) or filtered out (false) after *filters* are applied
    */
        select
            -- Default to allowed when no filters present
            $2 is null -- no filters. this should not happen because subscriptions has a default
            or array_length($2, 1) is null -- array length of an empty array is null
            or bool_and(
                coalesce(
                    realtime.check_equality_op(
                        op:=f.op,
                        type_:=coalesce(
                            col.type_oid::regtype, -- null when wal2json version <= 2.4
                            col.type_name::regtype
                        ),
                        -- cast jsonb to text
                        val_1:=col.value #>> '{}',
                        val_2:=f.value
                    ),
                    false -- if null, filter does not match
                )
            )
        from
            unnest(filters) f
            join unnest(columns) col
                on f.column_name = col.name;
    $_$;


ALTER FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) OWNER TO supabase_admin;

--
-- Name: list_changes(name, name, integer, integer); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) RETURNS SETOF realtime.wal_rls
    LANGUAGE sql
    SET log_min_messages TO 'fatal'
    AS $$
      with pub as (
        select
          concat_ws(
            ',',
            case when bool_or(pubinsert) then 'insert' else null end,
            case when bool_or(pubupdate) then 'update' else null end,
            case when bool_or(pubdelete) then 'delete' else null end
          ) as w2j_actions,
          coalesce(
            string_agg(
              realtime.quote_wal2json(format('%I.%I', schemaname, tablename)::regclass),
              ','
            ) filter (where ppt.tablename is not null and ppt.tablename not like '% %'),
            ''
          ) w2j_add_tables
        from
          pg_publication pp
          left join pg_publication_tables ppt
            on pp.pubname = ppt.pubname
        where
          pp.pubname = publication
        group by
          pp.pubname
        limit 1
      ),
      w2j as (
        select
          x.*, pub.w2j_add_tables
        from
          pub,
          pg_logical_slot_get_changes(
            slot_name, null, max_changes,
            'include-pk', 'true',
            'include-transaction', 'false',
            'include-timestamp', 'true',
            'include-type-oids', 'true',
            'format-version', '2',
            'actions', pub.w2j_actions,
            'add-tables', pub.w2j_add_tables
          ) x
      )
      select
        xyz.wal,
        xyz.is_rls_enabled,
        xyz.subscription_ids,
        xyz.errors
      from
        w2j,
        realtime.apply_rls(
          wal := w2j.data::jsonb,
          max_record_bytes := max_record_bytes
        ) xyz(wal, is_rls_enabled, subscription_ids, errors)
      where
        w2j.w2j_add_tables <> ''
        and xyz.subscription_ids[1] is not null
    $$;


ALTER FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) OWNER TO supabase_admin;

--
-- Name: quote_wal2json(regclass); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.quote_wal2json(entity regclass) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $$
      select
        (
          select string_agg('' || ch,'')
          from unnest(string_to_array(nsp.nspname::text, null)) with ordinality x(ch, idx)
          where
            not (x.idx = 1 and x.ch = '"')
            and not (
              x.idx = array_length(string_to_array(nsp.nspname::text, null), 1)
              and x.ch = '"'
            )
        )
        || '.'
        || (
          select string_agg('' || ch,'')
          from unnest(string_to_array(pc.relname::text, null)) with ordinality x(ch, idx)
          where
            not (x.idx = 1 and x.ch = '"')
            and not (
              x.idx = array_length(string_to_array(nsp.nspname::text, null), 1)
              and x.ch = '"'
            )
          )
      from
        pg_class pc
        join pg_namespace nsp
          on pc.relnamespace = nsp.oid
      where
        pc.oid = entity
    $$;


ALTER FUNCTION realtime.quote_wal2json(entity regclass) OWNER TO supabase_admin;

--
-- Name: subscription_check_filters(); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.subscription_check_filters() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
    /*
    Validates that the user defined filters for a subscription:
    - refer to valid columns that the claimed role may access
    - values are coercable to the correct column type
    */
    declare
        col_names text[] = coalesce(
                array_agg(c.column_name order by c.ordinal_position),
                '{}'::text[]
            )
            from
                information_schema.columns c
            where
                format('%I.%I', c.table_schema, c.table_name)::regclass = new.entity
                and pg_catalog.has_column_privilege(
                    (new.claims ->> 'role'),
                    format('%I.%I', c.table_schema, c.table_name)::regclass,
                    c.column_name,
                    'SELECT'
                );
        filter realtime.user_defined_filter;
        col_type regtype;

        in_val jsonb;
    begin
        for filter in select * from unnest(new.filters) loop
            -- Filtered column is valid
            if not filter.column_name = any(col_names) then
                raise exception 'invalid column for filter %', filter.column_name;
            end if;

            -- Type is sanitized and safe for string interpolation
            col_type = (
                select atttypid::regtype
                from pg_catalog.pg_attribute
                where attrelid = new.entity
                      and attname = filter.column_name
            );
            if col_type is null then
                raise exception 'failed to lookup type for column %', filter.column_name;
            end if;

            -- Set maximum number of entries for in filter
            if filter.op = 'in'::realtime.equality_op then
                in_val = realtime.cast(filter.value, (col_type::text || '[]')::regtype);
                if coalesce(jsonb_array_length(in_val), 0) > 100 then
                    raise exception 'too many values for `in` filter. Maximum 100';
                end if;
            else
                -- raises an exception if value is not coercable to type
                perform realtime.cast(filter.value, col_type);
            end if;

        end loop;

        -- Apply consistent order to filters so the unique constraint on
        -- (subscription_id, entity, filters) can't be tricked by a different filter order
        new.filters = coalesce(
            array_agg(f order by f.column_name, f.op, f.value),
            '{}'
        ) from unnest(new.filters) f;

        return new;
    end;
    $$;


ALTER FUNCTION realtime.subscription_check_filters() OWNER TO supabase_admin;

--
-- Name: to_regrole(text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.to_regrole(role_name text) RETURNS regrole
    LANGUAGE sql IMMUTABLE
    AS $$ select role_name::regrole $$;


ALTER FUNCTION realtime.to_regrole(role_name text) OWNER TO supabase_admin;

--
-- Name: topic(); Type: FUNCTION; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE FUNCTION realtime.topic() RETURNS text
    LANGUAGE sql STABLE
    AS $$
select nullif(current_setting('realtime.topic', true), '')::text;
$$;


ALTER FUNCTION realtime.topic() OWNER TO supabase_realtime_admin;

--
-- Name: can_insert_object(text, text, uuid, jsonb); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.can_insert_object(bucketid text, name text, owner uuid, metadata jsonb) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO "storage"."objects" ("bucket_id", "name", "owner", "metadata") VALUES (bucketid, name, owner, metadata);
  -- hack to rollback the successful insert
  RAISE sqlstate 'PT200' using
  message = 'ROLLBACK',
  detail = 'rollback successful insert';
END
$$;


ALTER FUNCTION storage.can_insert_object(bucketid text, name text, owner uuid, metadata jsonb) OWNER TO supabase_storage_admin;

--
-- Name: extension(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.extension(name text) RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
_parts text[];
_filename text;
BEGIN
	select string_to_array(name, '/') into _parts;
	select _parts[array_length(_parts,1)] into _filename;
	-- @todo return the last part instead of 2
	return reverse(split_part(reverse(_filename), '.', 1));
END
$$;


ALTER FUNCTION storage.extension(name text) OWNER TO supabase_storage_admin;

--
-- Name: filename(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.filename(name text) RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
_parts text[];
BEGIN
	select string_to_array(name, '/') into _parts;
	return _parts[array_length(_parts,1)];
END
$$;


ALTER FUNCTION storage.filename(name text) OWNER TO supabase_storage_admin;

--
-- Name: foldername(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.foldername(name text) RETURNS text[]
    LANGUAGE plpgsql
    AS $$
DECLARE
_parts text[];
BEGIN
	select string_to_array(name, '/') into _parts;
	return _parts[1:array_length(_parts,1)-1];
END
$$;


ALTER FUNCTION storage.foldername(name text) OWNER TO supabase_storage_admin;

--
-- Name: get_size_by_bucket(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.get_size_by_bucket() RETURNS TABLE(size bigint, bucket_id text)
    LANGUAGE plpgsql
    AS $$
BEGIN
    return query
        select sum((metadata->>'size')::int) as size, obj.bucket_id
        from "storage".objects as obj
        group by obj.bucket_id;
END
$$;


ALTER FUNCTION storage.get_size_by_bucket() OWNER TO supabase_storage_admin;

--
-- Name: list_multipart_uploads_with_delimiter(text, text, text, integer, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.list_multipart_uploads_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer DEFAULT 100, next_key_token text DEFAULT ''::text, next_upload_token text DEFAULT ''::text) RETURNS TABLE(key text, id text, created_at timestamp with time zone)
    LANGUAGE plpgsql
    AS $_$
BEGIN
    RETURN QUERY EXECUTE
        'SELECT DISTINCT ON(key COLLATE "C") * from (
            SELECT
                CASE
                    WHEN position($2 IN substring(key from length($1) + 1)) > 0 THEN
                        substring(key from 1 for length($1) + position($2 IN substring(key from length($1) + 1)))
                    ELSE
                        key
                END AS key, id, created_at
            FROM
                storage.s3_multipart_uploads
            WHERE
                bucket_id = $5 AND
                key ILIKE $1 || ''%'' AND
                CASE
                    WHEN $4 != '''' AND $6 = '''' THEN
                        CASE
                            WHEN position($2 IN substring(key from length($1) + 1)) > 0 THEN
                                substring(key from 1 for length($1) + position($2 IN substring(key from length($1) + 1))) COLLATE "C" > $4
                            ELSE
                                key COLLATE "C" > $4
                            END
                    ELSE
                        true
                END AND
                CASE
                    WHEN $6 != '''' THEN
                        id COLLATE "C" > $6
                    ELSE
                        true
                    END
            ORDER BY
                key COLLATE "C" ASC, created_at ASC) as e order by key COLLATE "C" LIMIT $3'
        USING prefix_param, delimiter_param, max_keys, next_key_token, bucket_id, next_upload_token;
END;
$_$;


ALTER FUNCTION storage.list_multipart_uploads_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, next_key_token text, next_upload_token text) OWNER TO supabase_storage_admin;

--
-- Name: list_objects_with_delimiter(text, text, text, integer, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.list_objects_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer DEFAULT 100, start_after text DEFAULT ''::text, next_token text DEFAULT ''::text) RETURNS TABLE(name text, id uuid, metadata jsonb, updated_at timestamp with time zone)
    LANGUAGE plpgsql
    AS $_$
BEGIN
    RETURN QUERY EXECUTE
        'SELECT DISTINCT ON(name COLLATE "C") * from (
            SELECT
                CASE
                    WHEN position($2 IN substring(name from length($1) + 1)) > 0 THEN
                        substring(name from 1 for length($1) + position($2 IN substring(name from length($1) + 1)))
                    ELSE
                        name
                END AS name, id, metadata, updated_at
            FROM
                storage.objects
            WHERE
                bucket_id = $5 AND
                name ILIKE $1 || ''%'' AND
                CASE
                    WHEN $6 != '''' THEN
                    name COLLATE "C" > $6
                ELSE true END
                AND CASE
                    WHEN $4 != '''' THEN
                        CASE
                            WHEN position($2 IN substring(name from length($1) + 1)) > 0 THEN
                                substring(name from 1 for length($1) + position($2 IN substring(name from length($1) + 1))) COLLATE "C" > $4
                            ELSE
                                name COLLATE "C" > $4
                            END
                    ELSE
                        true
                END
            ORDER BY
                name COLLATE "C" ASC) as e order by name COLLATE "C" LIMIT $3'
        USING prefix_param, delimiter_param, max_keys, next_token, bucket_id, start_after;
END;
$_$;


ALTER FUNCTION storage.list_objects_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, start_after text, next_token text) OWNER TO supabase_storage_admin;

--
-- Name: operation(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.operation() RETURNS text
    LANGUAGE plpgsql STABLE
    AS $$
BEGIN
    RETURN current_setting('storage.operation', true);
END;
$$;


ALTER FUNCTION storage.operation() OWNER TO supabase_storage_admin;

--
-- Name: search(text, text, integer, integer, integer, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.search(prefix text, bucketname text, limits integer DEFAULT 100, levels integer DEFAULT 1, offsets integer DEFAULT 0, search text DEFAULT ''::text, sortcolumn text DEFAULT 'name'::text, sortorder text DEFAULT 'asc'::text) RETURNS TABLE(name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $_$
declare
  v_order_by text;
  v_sort_order text;
begin
  case
    when sortcolumn = 'name' then
      v_order_by = 'name';
    when sortcolumn = 'updated_at' then
      v_order_by = 'updated_at';
    when sortcolumn = 'created_at' then
      v_order_by = 'created_at';
    when sortcolumn = 'last_accessed_at' then
      v_order_by = 'last_accessed_at';
    else
      v_order_by = 'name';
  end case;

  case
    when sortorder = 'asc' then
      v_sort_order = 'asc';
    when sortorder = 'desc' then
      v_sort_order = 'desc';
    else
      v_sort_order = 'asc';
  end case;

  v_order_by = v_order_by || ' ' || v_sort_order;

  return query execute
    'with folders as (
       select path_tokens[$1] as folder
       from storage.objects
         where objects.name ilike $2 || $3 || ''%''
           and bucket_id = $4
           and array_length(objects.path_tokens, 1) <> $1
       group by folder
       order by folder ' || v_sort_order || '
     )
     (select folder as "name",
            null as id,
            null as updated_at,
            null as created_at,
            null as last_accessed_at,
            null as metadata from folders)
     union all
     (select path_tokens[$1] as "name",
            id,
            updated_at,
            created_at,
            last_accessed_at,
            metadata
     from storage.objects
     where objects.name ilike $2 || $3 || ''%''
       and bucket_id = $4
       and array_length(objects.path_tokens, 1) = $1
     order by ' || v_order_by || ')
     limit $5
     offset $6' using levels, prefix, search, bucketname, limits, offsets;
end;
$_$;


ALTER FUNCTION storage.search(prefix text, bucketname text, limits integer, levels integer, offsets integer, search text, sortcolumn text, sortorder text) OWNER TO supabase_storage_admin;

--
-- Name: update_updated_at_column(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.update_updated_at_column() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW; 
END;
$$;


ALTER FUNCTION storage.update_updated_at_column() OWNER TO supabase_storage_admin;

--
-- Name: secrets_encrypt_secret_secret(); Type: FUNCTION; Schema: vault; Owner: supabase_admin
--

CREATE FUNCTION vault.secrets_encrypt_secret_secret() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
		BEGIN
		        new.secret = CASE WHEN new.secret IS NULL THEN NULL ELSE
			CASE WHEN new.key_id IS NULL THEN NULL ELSE pg_catalog.encode(
			  pgsodium.crypto_aead_det_encrypt(
				pg_catalog.convert_to(new.secret, 'utf8'),
				pg_catalog.convert_to((new.id::text || new.description::text || new.created_at::text || new.updated_at::text)::text, 'utf8'),
				new.key_id::uuid,
				new.nonce
			  ),
				'base64') END END;
		RETURN new;
		END;
		$$;


ALTER FUNCTION vault.secrets_encrypt_secret_secret() OWNER TO supabase_admin;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: audit_log_entries; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.audit_log_entries (
    instance_id uuid,
    id uuid NOT NULL,
    payload json,
    created_at timestamp with time zone,
    ip_address character varying(64) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE auth.audit_log_entries OWNER TO supabase_auth_admin;

--
-- Name: TABLE audit_log_entries; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.audit_log_entries IS 'Auth: Audit trail for user actions.';


--
-- Name: flow_state; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.flow_state (
    id uuid NOT NULL,
    user_id uuid,
    auth_code text NOT NULL,
    code_challenge_method auth.code_challenge_method NOT NULL,
    code_challenge text NOT NULL,
    provider_type text NOT NULL,
    provider_access_token text,
    provider_refresh_token text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    authentication_method text NOT NULL,
    auth_code_issued_at timestamp with time zone
);


ALTER TABLE auth.flow_state OWNER TO supabase_auth_admin;

--
-- Name: TABLE flow_state; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.flow_state IS 'stores metadata for pkce logins';


--
-- Name: identities; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.identities (
    provider_id text NOT NULL,
    user_id uuid NOT NULL,
    identity_data jsonb NOT NULL,
    provider text NOT NULL,
    last_sign_in_at timestamp with time zone,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    email text GENERATED ALWAYS AS (lower((identity_data ->> 'email'::text))) STORED,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE auth.identities OWNER TO supabase_auth_admin;

--
-- Name: TABLE identities; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.identities IS 'Auth: Stores identities associated to a user.';


--
-- Name: COLUMN identities.email; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.identities.email IS 'Auth: Email is a generated column that references the optional email property in the identity_data';


--
-- Name: instances; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.instances (
    id uuid NOT NULL,
    uuid uuid,
    raw_base_config text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE auth.instances OWNER TO supabase_auth_admin;

--
-- Name: TABLE instances; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.instances IS 'Auth: Manages users across multiple sites.';


--
-- Name: mfa_amr_claims; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_amr_claims (
    session_id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    authentication_method text NOT NULL,
    id uuid NOT NULL
);


ALTER TABLE auth.mfa_amr_claims OWNER TO supabase_auth_admin;

--
-- Name: TABLE mfa_amr_claims; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_amr_claims IS 'auth: stores authenticator method reference claims for multi factor authentication';


--
-- Name: mfa_challenges; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_challenges (
    id uuid NOT NULL,
    factor_id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    verified_at timestamp with time zone,
    ip_address inet NOT NULL
);


ALTER TABLE auth.mfa_challenges OWNER TO supabase_auth_admin;

--
-- Name: TABLE mfa_challenges; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_challenges IS 'auth: stores metadata about challenge requests made';


--
-- Name: mfa_factors; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_factors (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    friendly_name text,
    factor_type auth.factor_type NOT NULL,
    status auth.factor_status NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    secret text
);


ALTER TABLE auth.mfa_factors OWNER TO supabase_auth_admin;

--
-- Name: TABLE mfa_factors; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_factors IS 'auth: stores metadata about factors';


--
-- Name: one_time_tokens; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.one_time_tokens (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    token_type auth.one_time_token_type NOT NULL,
    token_hash text NOT NULL,
    relates_to text NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    CONSTRAINT one_time_tokens_token_hash_check CHECK ((char_length(token_hash) > 0))
);


ALTER TABLE auth.one_time_tokens OWNER TO supabase_auth_admin;

--
-- Name: refresh_tokens; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.refresh_tokens (
    instance_id uuid,
    id bigint NOT NULL,
    token character varying(255),
    user_id character varying(255),
    revoked boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    parent character varying(255),
    session_id uuid
);


ALTER TABLE auth.refresh_tokens OWNER TO supabase_auth_admin;

--
-- Name: TABLE refresh_tokens; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.refresh_tokens IS 'Auth: Store of tokens used to refresh JWT tokens once they expire.';


--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE; Schema: auth; Owner: supabase_auth_admin
--

CREATE SEQUENCE auth.refresh_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE auth.refresh_tokens_id_seq OWNER TO supabase_auth_admin;

--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: auth; Owner: supabase_auth_admin
--

ALTER SEQUENCE auth.refresh_tokens_id_seq OWNED BY auth.refresh_tokens.id;


--
-- Name: saml_providers; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.saml_providers (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    entity_id text NOT NULL,
    metadata_xml text NOT NULL,
    metadata_url text,
    attribute_mapping jsonb,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    name_id_format text,
    CONSTRAINT "entity_id not empty" CHECK ((char_length(entity_id) > 0)),
    CONSTRAINT "metadata_url not empty" CHECK (((metadata_url = NULL::text) OR (char_length(metadata_url) > 0))),
    CONSTRAINT "metadata_xml not empty" CHECK ((char_length(metadata_xml) > 0))
);


ALTER TABLE auth.saml_providers OWNER TO supabase_auth_admin;

--
-- Name: TABLE saml_providers; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.saml_providers IS 'Auth: Manages SAML Identity Provider connections.';


--
-- Name: saml_relay_states; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.saml_relay_states (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    request_id text NOT NULL,
    for_email text,
    redirect_to text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    flow_state_id uuid,
    CONSTRAINT "request_id not empty" CHECK ((char_length(request_id) > 0))
);


ALTER TABLE auth.saml_relay_states OWNER TO supabase_auth_admin;

--
-- Name: TABLE saml_relay_states; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.saml_relay_states IS 'Auth: Contains SAML Relay State information for each Service Provider initiated login.';


--
-- Name: schema_migrations; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE auth.schema_migrations OWNER TO supabase_auth_admin;

--
-- Name: TABLE schema_migrations; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.schema_migrations IS 'Auth: Manages updates to the auth system.';


--
-- Name: sessions; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sessions (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    factor_id uuid,
    aal auth.aal_level,
    not_after timestamp with time zone,
    refreshed_at timestamp without time zone,
    user_agent text,
    ip inet,
    tag text
);


ALTER TABLE auth.sessions OWNER TO supabase_auth_admin;

--
-- Name: TABLE sessions; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sessions IS 'Auth: Stores session data associated to a user.';


--
-- Name: COLUMN sessions.not_after; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sessions.not_after IS 'Auth: Not after is a nullable column that contains a timestamp after which the session should be regarded as expired.';


--
-- Name: sso_domains; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sso_domains (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    domain text NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    CONSTRAINT "domain not empty" CHECK ((char_length(domain) > 0))
);


ALTER TABLE auth.sso_domains OWNER TO supabase_auth_admin;

--
-- Name: TABLE sso_domains; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sso_domains IS 'Auth: Manages SSO email address domain mapping to an SSO Identity Provider.';


--
-- Name: sso_providers; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sso_providers (
    id uuid NOT NULL,
    resource_id text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    CONSTRAINT "resource_id not empty" CHECK (((resource_id = NULL::text) OR (char_length(resource_id) > 0)))
);


ALTER TABLE auth.sso_providers OWNER TO supabase_auth_admin;

--
-- Name: TABLE sso_providers; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sso_providers IS 'Auth: Manages SSO identity provider information; see saml_providers for SAML.';


--
-- Name: COLUMN sso_providers.resource_id; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sso_providers.resource_id IS 'Auth: Uniquely identifies a SSO provider according to a user-chosen resource ID (case insensitive), useful in infrastructure as code.';


--
-- Name: users; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.users (
    instance_id uuid,
    id uuid NOT NULL,
    aud character varying(255),
    role character varying(255),
    email character varying(255),
    encrypted_password character varying(255),
    email_confirmed_at timestamp with time zone,
    invited_at timestamp with time zone,
    confirmation_token character varying(255),
    confirmation_sent_at timestamp with time zone,
    recovery_token character varying(255),
    recovery_sent_at timestamp with time zone,
    email_change_token_new character varying(255),
    email_change character varying(255),
    email_change_sent_at timestamp with time zone,
    last_sign_in_at timestamp with time zone,
    raw_app_meta_data jsonb,
    raw_user_meta_data jsonb,
    is_super_admin boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    phone text DEFAULT NULL::character varying,
    phone_confirmed_at timestamp with time zone,
    phone_change text DEFAULT ''::character varying,
    phone_change_token character varying(255) DEFAULT ''::character varying,
    phone_change_sent_at timestamp with time zone,
    confirmed_at timestamp with time zone GENERATED ALWAYS AS (LEAST(email_confirmed_at, phone_confirmed_at)) STORED,
    email_change_token_current character varying(255) DEFAULT ''::character varying,
    email_change_confirm_status smallint DEFAULT 0,
    banned_until timestamp with time zone,
    reauthentication_token character varying(255) DEFAULT ''::character varying,
    reauthentication_sent_at timestamp with time zone,
    is_sso_user boolean DEFAULT false NOT NULL,
    deleted_at timestamp with time zone,
    is_anonymous boolean DEFAULT false NOT NULL,
    CONSTRAINT users_email_change_confirm_status_check CHECK (((email_change_confirm_status >= 0) AND (email_change_confirm_status <= 2)))
);


ALTER TABLE auth.users OWNER TO supabase_auth_admin;

--
-- Name: TABLE users; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.users IS 'Auth: Stores user login data within a secure schema.';


--
-- Name: COLUMN users.is_sso_user; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.users.is_sso_user IS 'Auth: Set this column to true when the account comes from SSO. These accounts can have duplicate emails.';


--
-- Name: user_profiles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_profiles (
    user_id uuid NOT NULL,
    username text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    phone_number text NOT NULL,
    CONSTRAINT proper_username CHECK ((username ~* '^[a-zA-Z0-9_]+$'::text)),
    CONSTRAINT username_length CHECK (((char_length(username) > 3) AND (char_length(username) < 15)))
);


ALTER TABLE public.user_profiles OWNER TO postgres;

--
-- Name: messages; Type: TABLE; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE TABLE realtime.messages (
    id bigint NOT NULL,
    topic text NOT NULL,
    extension text NOT NULL,
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


ALTER TABLE realtime.messages OWNER TO supabase_realtime_admin;

--
-- Name: messages_id_seq; Type: SEQUENCE; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE SEQUENCE realtime.messages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE realtime.messages_id_seq OWNER TO supabase_realtime_admin;

--
-- Name: messages_id_seq; Type: SEQUENCE OWNED BY; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER SEQUENCE realtime.messages_id_seq OWNED BY realtime.messages.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.schema_migrations (
    version bigint NOT NULL,
    inserted_at timestamp(0) without time zone
);


ALTER TABLE realtime.schema_migrations OWNER TO supabase_admin;

--
-- Name: subscription; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.subscription (
    id bigint NOT NULL,
    subscription_id uuid NOT NULL,
    entity regclass NOT NULL,
    filters realtime.user_defined_filter[] DEFAULT '{}'::realtime.user_defined_filter[] NOT NULL,
    claims jsonb NOT NULL,
    claims_role regrole GENERATED ALWAYS AS (realtime.to_regrole((claims ->> 'role'::text))) STORED NOT NULL,
    created_at timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL
);


ALTER TABLE realtime.subscription OWNER TO supabase_admin;

--
-- Name: subscription_id_seq; Type: SEQUENCE; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE realtime.subscription ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME realtime.subscription_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: buckets; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.buckets (
    id text NOT NULL,
    name text NOT NULL,
    owner uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    public boolean DEFAULT false,
    avif_autodetection boolean DEFAULT false,
    file_size_limit bigint,
    allowed_mime_types text[],
    owner_id text
);


ALTER TABLE storage.buckets OWNER TO supabase_storage_admin;

--
-- Name: COLUMN buckets.owner; Type: COMMENT; Schema: storage; Owner: supabase_storage_admin
--

COMMENT ON COLUMN storage.buckets.owner IS 'Field is deprecated, use owner_id instead';


--
-- Name: migrations; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.migrations (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    hash character varying(40) NOT NULL,
    executed_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE storage.migrations OWNER TO supabase_storage_admin;

--
-- Name: objects; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.objects (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    bucket_id text,
    name text,
    owner uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    last_accessed_at timestamp with time zone DEFAULT now(),
    metadata jsonb,
    path_tokens text[] GENERATED ALWAYS AS (string_to_array(name, '/'::text)) STORED,
    version text,
    owner_id text
);


ALTER TABLE storage.objects OWNER TO supabase_storage_admin;

--
-- Name: COLUMN objects.owner; Type: COMMENT; Schema: storage; Owner: supabase_storage_admin
--

COMMENT ON COLUMN storage.objects.owner IS 'Field is deprecated, use owner_id instead';


--
-- Name: s3_multipart_uploads; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.s3_multipart_uploads (
    id text NOT NULL,
    in_progress_size bigint DEFAULT 0 NOT NULL,
    upload_signature text NOT NULL,
    bucket_id text NOT NULL,
    key text NOT NULL COLLATE pg_catalog."C",
    version text NOT NULL,
    owner_id text,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE storage.s3_multipart_uploads OWNER TO supabase_storage_admin;

--
-- Name: s3_multipart_uploads_parts; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.s3_multipart_uploads_parts (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    upload_id text NOT NULL,
    size bigint DEFAULT 0 NOT NULL,
    part_number integer NOT NULL,
    bucket_id text NOT NULL,
    key text NOT NULL COLLATE pg_catalog."C",
    etag text NOT NULL,
    owner_id text,
    version text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE storage.s3_multipart_uploads_parts OWNER TO supabase_storage_admin;

--
-- Name: schema_migrations; Type: TABLE; Schema: supabase_migrations; Owner: postgres
--

CREATE TABLE supabase_migrations.schema_migrations (
    version text NOT NULL,
    statements text[],
    name text
);


ALTER TABLE supabase_migrations.schema_migrations OWNER TO postgres;

--
-- Name: decrypted_secrets; Type: VIEW; Schema: vault; Owner: supabase_admin
--

CREATE VIEW vault.decrypted_secrets AS
 SELECT secrets.id,
    secrets.name,
    secrets.description,
    secrets.secret,
        CASE
            WHEN (secrets.secret IS NULL) THEN NULL::text
            ELSE
            CASE
                WHEN (secrets.key_id IS NULL) THEN NULL::text
                ELSE convert_from(pgsodium.crypto_aead_det_decrypt(decode(secrets.secret, 'base64'::text), convert_to(((((secrets.id)::text || secrets.description) || (secrets.created_at)::text) || (secrets.updated_at)::text), 'utf8'::name), secrets.key_id, secrets.nonce), 'utf8'::name)
            END
        END AS decrypted_secret,
    secrets.key_id,
    secrets.nonce,
    secrets.created_at,
    secrets.updated_at
   FROM vault.secrets;


ALTER VIEW vault.decrypted_secrets OWNER TO supabase_admin;

--
-- Name: refresh_tokens id; Type: DEFAULT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens ALTER COLUMN id SET DEFAULT nextval('auth.refresh_tokens_id_seq'::regclass);


--
-- Name: messages id; Type: DEFAULT; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER TABLE ONLY realtime.messages ALTER COLUMN id SET DEFAULT nextval('realtime.messages_id_seq'::regclass);


--
-- Data for Name: audit_log_entries; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.audit_log_entries (instance_id, id, payload, created_at, ip_address) FROM stdin;
00000000-0000-0000-0000-000000000000	d7744113-007e-41dc-b94d-ea9bf73a3f30	{"action":"user_confirmation_requested","actor_id":"1fa2d554-cc74-461d-8878-08c1b91f71e0","actor_username":"3017321380","actor_via_sso":false,"log_type":"user","traits":{"provider":"phone"}}	2024-07-18 23:59:17.236749+00	
00000000-0000-0000-0000-000000000000	d6ce2300-e780-4819-861b-5f8178b38224	{"action":"user_confirmation_requested","actor_id":"1fa2d554-cc74-461d-8878-08c1b91f71e0","actor_username":"3017321380","actor_via_sso":false,"log_type":"user","traits":{"provider":"phone"}}	2024-07-19 00:03:05.639131+00	
00000000-0000-0000-0000-000000000000	cffbc2dd-0470-482a-9c8e-310afc7b8f5a	{"action":"user_signedup","actor_id":"1fa2d554-cc74-461d-8878-08c1b91f71e0","actor_username":"3017321380","actor_via_sso":false,"log_type":"team"}	2024-07-19 00:03:14.120667+00	
00000000-0000-0000-0000-000000000000	5b33b281-cf86-4ba7-b150-3fac7f907e2a	{"action":"logout","actor_id":"1fa2d554-cc74-461d-8878-08c1b91f71e0","actor_username":"3017321380","actor_via_sso":false,"log_type":"account"}	2024-07-19 00:07:28.699313+00	
00000000-0000-0000-0000-000000000000	9b9bd86a-b22a-46dc-8291-f9f177a20524	{"action":"user_recovery_requested","actor_id":"1fa2d554-cc74-461d-8878-08c1b91f71e0","actor_username":"3017321380","actor_via_sso":false,"log_type":"user","traits":{"channel":"sms"}}	2024-07-19 00:08:29.361954+00	
00000000-0000-0000-0000-000000000000	8f2f18bc-a411-49a9-936e-f071b999d3d0	{"action":"user_signedup","actor_id":"1fa2d554-cc74-461d-8878-08c1b91f71e0","actor_username":"3017321380","actor_via_sso":false,"log_type":"team"}	2024-07-19 00:08:33.336831+00	
00000000-0000-0000-0000-000000000000	5b48350c-676e-4983-92dc-990a8255861c	{"action":"logout","actor_id":"1fa2d554-cc74-461d-8878-08c1b91f71e0","actor_username":"3017321380","actor_via_sso":false,"log_type":"account"}	2024-07-19 00:08:35.457671+00	
00000000-0000-0000-0000-000000000000	8b6bab1d-5fff-4e16-bfdb-d6e808d7b333	{"action":"user_recovery_requested","actor_id":"1fa2d554-cc74-461d-8878-08c1b91f71e0","actor_username":"3017321380","actor_via_sso":false,"log_type":"user","traits":{"channel":"sms"}}	2024-07-19 00:13:20.026233+00	
00000000-0000-0000-0000-000000000000	0bc2cc19-b966-4712-a0f2-492dca8c39b4	{"action":"user_signedup","actor_id":"1fa2d554-cc74-461d-8878-08c1b91f71e0","actor_username":"3017321380","actor_via_sso":false,"log_type":"team"}	2024-07-19 00:13:29.515515+00	
00000000-0000-0000-0000-000000000000	adc0d90e-38aa-456c-ab5a-179e3ac74b0b	{"action":"logout","actor_id":"1fa2d554-cc74-461d-8878-08c1b91f71e0","actor_username":"3017321380","actor_via_sso":false,"log_type":"account"}	2024-07-19 00:13:31.80675+00	
00000000-0000-0000-0000-000000000000	3075144b-00a4-4544-b34a-13df3aab1124	{"action":"user_recovery_requested","actor_id":"1fa2d554-cc74-461d-8878-08c1b91f71e0","actor_username":"3017321380","actor_via_sso":false,"log_type":"user","traits":{"channel":"sms"}}	2024-07-19 00:13:35.16323+00	
00000000-0000-0000-0000-000000000000	66586366-1394-486a-9621-d11d7fba3637	{"action":"user_signedup","actor_id":"1fa2d554-cc74-461d-8878-08c1b91f71e0","actor_username":"3017321380","actor_via_sso":false,"log_type":"team"}	2024-07-19 00:13:46.585591+00	
00000000-0000-0000-0000-000000000000	95a6941c-3bbb-4d69-8e69-4294b8ccc957	{"action":"logout","actor_id":"1fa2d554-cc74-461d-8878-08c1b91f71e0","actor_username":"3017321380","actor_via_sso":false,"log_type":"account"}	2024-07-19 00:16:55.379288+00	
00000000-0000-0000-0000-000000000000	6c7d14a0-73e5-4ee9-b9d8-3ebd60758722	{"action":"user_confirmation_requested","actor_id":"b82261ec-3aca-41e2-a3cf-c0d2b5c8558b","actor_username":"14077470791","actor_via_sso":false,"log_type":"user","traits":{"provider":"phone"}}	2024-07-19 00:29:12.530952+00	
00000000-0000-0000-0000-000000000000	8dc764ae-4dd6-4940-8368-3b316ac2beca	{"action":"user_confirmation_requested","actor_id":"b82261ec-3aca-41e2-a3cf-c0d2b5c8558b","actor_username":"14077470791","actor_via_sso":false,"log_type":"user","traits":{"provider":"phone"}}	2024-07-25 23:54:28.312368+00	
00000000-0000-0000-0000-000000000000	8dfaa438-2a82-487d-9c2d-b82fb4c840ae	{"action":"user_confirmation_requested","actor_id":"b82261ec-3aca-41e2-a3cf-c0d2b5c8558b","actor_username":"14077470791","actor_via_sso":false,"log_type":"user","traits":{"provider":"phone"}}	2024-07-26 01:16:55.680589+00	
00000000-0000-0000-0000-000000000000	c17518c3-957e-4d59-8ce3-a75768c97343	{"action":"user_signedup","actor_id":"b82261ec-3aca-41e2-a3cf-c0d2b5c8558b","actor_username":"14077470791","actor_via_sso":false,"log_type":"team"}	2024-07-26 01:17:14.528766+00	
00000000-0000-0000-0000-000000000000	8846841a-eb8d-4729-9dad-6148dedb9f73	{"action":"user_confirmation_requested","actor_id":"5bbca4ac-ad78-4c10-aaf0-b6ae018db066","actor_username":"13017321380","actor_via_sso":false,"log_type":"user","traits":{"provider":"phone"}}	2024-07-26 01:17:33.160861+00	
00000000-0000-0000-0000-000000000000	cd437153-7547-4ee5-bcb8-288b615cfe64	{"action":"user_signedup","actor_id":"5bbca4ac-ad78-4c10-aaf0-b6ae018db066","actor_username":"13017321380","actor_via_sso":false,"log_type":"team"}	2024-07-26 01:17:44.67556+00	
00000000-0000-0000-0000-000000000000	147da51c-d946-48d7-8c1e-c68eb400e1f9	{"action":"user_recovery_requested","actor_id":"b82261ec-3aca-41e2-a3cf-c0d2b5c8558b","actor_username":"14077470791","actor_via_sso":false,"log_type":"user","traits":{"channel":"sms"}}	2024-07-26 01:19:08.668113+00	
00000000-0000-0000-0000-000000000000	5a2d6d89-a263-40bc-8640-66cd0946f321	{"action":"user_signedup","actor_id":"b82261ec-3aca-41e2-a3cf-c0d2b5c8558b","actor_username":"14077470791","actor_via_sso":false,"log_type":"team"}	2024-07-26 01:19:12.590981+00	
00000000-0000-0000-0000-000000000000	6e969746-e3b2-4778-85a0-e588ef27f426	{"action":"user_confirmation_requested","actor_id":"9c2f5472-e0f3-4109-9ff6-d6c571ce3475","actor_username":"14697044024","actor_via_sso":false,"log_type":"user","traits":{"provider":"phone"}}	2024-07-26 01:23:32.586003+00	
00000000-0000-0000-0000-000000000000	8e9525bd-96a9-4d06-b752-37e403c9592a	{"action":"user_signedup","actor_id":"9c2f5472-e0f3-4109-9ff6-d6c571ce3475","actor_username":"14697044024","actor_via_sso":false,"log_type":"team"}	2024-07-26 01:23:35.343787+00	
00000000-0000-0000-0000-000000000000	c1bc9b38-cf9f-4ef7-b62b-c3cc99ba936b	{"action":"user_confirmation_requested","actor_id":"d650f4c8-d60d-4f03-b210-ab71ee77144a","actor_username":"17472224970","actor_via_sso":false,"log_type":"user","traits":{"provider":"phone"}}	2024-07-26 01:27:19.75498+00	
00000000-0000-0000-0000-000000000000	eeafd9d6-804e-4d63-9914-7e494ae8b26a	{"action":"user_signedup","actor_id":"d650f4c8-d60d-4f03-b210-ab71ee77144a","actor_username":"17472224970","actor_via_sso":false,"log_type":"team"}	2024-07-26 01:27:22.579875+00	
00000000-0000-0000-0000-000000000000	d6241cbf-2a1d-4de6-9ab3-65ec7010c988	{"action":"user_confirmation_requested","actor_id":"70c93ba9-dd94-4b4f-b8b1-6a6da8e8bbcf","actor_username":"16507703578","actor_via_sso":false,"log_type":"user","traits":{"provider":"phone"}}	2024-07-26 01:28:49.263063+00	
00000000-0000-0000-0000-000000000000	5136f6b7-9050-438a-b338-91c843a5769a	{"action":"user_signedup","actor_id":"70c93ba9-dd94-4b4f-b8b1-6a6da8e8bbcf","actor_username":"16507703578","actor_via_sso":false,"log_type":"team"}	2024-07-26 01:29:04.023283+00	
00000000-0000-0000-0000-000000000000	672fdd96-36d9-4ae8-a004-678e7b808e6d	{"action":"user_confirmation_requested","actor_id":"430a2343-05bc-44ee-9bc8-60bd76f58776","actor_username":"14073197730","actor_via_sso":false,"log_type":"user","traits":{"provider":"phone"}}	2024-07-26 01:31:19.866038+00	
00000000-0000-0000-0000-000000000000	e72aac95-421b-4185-b938-d4da3d86cbb0	{"action":"user_signedup","actor_id":"430a2343-05bc-44ee-9bc8-60bd76f58776","actor_username":"14073197730","actor_via_sso":false,"log_type":"team"}	2024-07-26 01:31:23.934522+00	
00000000-0000-0000-0000-000000000000	fc69410e-d4f2-4359-be5a-1e775956c24b	{"action":"user_recovery_requested","actor_id":"b82261ec-3aca-41e2-a3cf-c0d2b5c8558b","actor_username":"14077470791","actor_via_sso":false,"log_type":"user","traits":{"channel":"sms"}}	2024-07-26 01:42:50.246393+00	
00000000-0000-0000-0000-000000000000	047ca2be-8722-436a-beb1-08ba97c64a01	{"action":"user_signedup","actor_id":"b82261ec-3aca-41e2-a3cf-c0d2b5c8558b","actor_username":"14077470791","actor_via_sso":false,"log_type":"team"}	2024-07-26 01:42:56.929492+00	
00000000-0000-0000-0000-000000000000	7b4f81cf-1612-4747-9a8a-3c300e471f44	{"action":"user_confirmation_requested","actor_id":"a74f81ef-1068-44fa-ab85-1a77c72ba6b8","actor_username":"13017321381","actor_via_sso":false,"log_type":"user","traits":{"provider":"phone"}}	2024-07-26 01:44:41.411708+00	
00000000-0000-0000-0000-000000000000	7c3c6e2d-93be-42ac-bce7-7fe9dd500858	{"action":"user_recovery_requested","actor_id":"5bbca4ac-ad78-4c10-aaf0-b6ae018db066","actor_username":"13017321380","actor_via_sso":false,"log_type":"user","traits":{"channel":"sms"}}	2024-07-26 01:44:52.727171+00	
00000000-0000-0000-0000-000000000000	85e8297e-58ce-4c3c-b60d-5a0691cb3097	{"action":"user_signedup","actor_id":"5bbca4ac-ad78-4c10-aaf0-b6ae018db066","actor_username":"13017321380","actor_via_sso":false,"log_type":"team"}	2024-07-26 01:45:16.007209+00	
00000000-0000-0000-0000-000000000000	bc84a479-ac14-45c5-b842-124d490df102	{"action":"user_confirmation_requested","actor_id":"c1e922fd-458f-4969-84bc-0861ea992d18","actor_username":"14072568997","actor_via_sso":false,"log_type":"user","traits":{"provider":"phone"}}	2024-07-26 02:01:18.571841+00	
00000000-0000-0000-0000-000000000000	2a32b051-fe17-45ed-8522-54617d4cbfdd	{"action":"user_signedup","actor_id":"c1e922fd-458f-4969-84bc-0861ea992d18","actor_username":"14072568997","actor_via_sso":false,"log_type":"team"}	2024-07-26 02:01:34.917885+00	
00000000-0000-0000-0000-000000000000	f46ca30f-cdca-446e-9533-652ca30bdc75	{"action":"user_confirmation_requested","actor_id":"e9d57f4c-94fb-4bca-be85-3ed7d7b18973","actor_username":"18322719696","actor_via_sso":false,"log_type":"user","traits":{"provider":"phone"}}	2024-07-26 02:16:00.747717+00	
00000000-0000-0000-0000-000000000000	8d3801f4-37e7-4507-9b29-f88c25b31863	{"action":"user_signedup","actor_id":"e9d57f4c-94fb-4bca-be85-3ed7d7b18973","actor_username":"18322719696","actor_via_sso":false,"log_type":"team"}	2024-07-26 02:16:07.96802+00	
00000000-0000-0000-0000-000000000000	d48c4351-3835-4fd3-9f92-b96ed464524e	{"action":"logout","actor_id":"b82261ec-3aca-41e2-a3cf-c0d2b5c8558b","actor_username":"14077470791","actor_via_sso":false,"log_type":"account"}	2024-07-26 02:17:41.524922+00	
00000000-0000-0000-0000-000000000000	cd2472e1-5d40-4d8e-bad4-4c9f61996256	{"action":"user_recovery_requested","actor_id":"b82261ec-3aca-41e2-a3cf-c0d2b5c8558b","actor_username":"14077470791","actor_via_sso":false,"log_type":"user","traits":{"channel":"sms"}}	2024-07-26 02:17:47.219864+00	
00000000-0000-0000-0000-000000000000	03ca658a-0e38-467b-bcda-894468ecb3dd	{"action":"user_signedup","actor_id":"b82261ec-3aca-41e2-a3cf-c0d2b5c8558b","actor_username":"14077470791","actor_via_sso":false,"log_type":"team"}	2024-07-26 02:17:50.533642+00	
00000000-0000-0000-0000-000000000000	71ee5e44-ba7c-44c3-b84f-9f0fd30cbbe2	{"action":"user_confirmation_requested","actor_id":"b0381b2c-f449-48d5-8e8d-aa38448346d6","actor_username":"13109624342","actor_via_sso":false,"log_type":"user","traits":{"provider":"phone"}}	2024-07-26 02:22:01.544972+00	
00000000-0000-0000-0000-000000000000	009b9d48-36bc-4d41-8de6-5da7a4725ae8	{"action":"user_signedup","actor_id":"b0381b2c-f449-48d5-8e8d-aa38448346d6","actor_username":"13109624342","actor_via_sso":false,"log_type":"team"}	2024-07-26 02:22:05.459179+00	
00000000-0000-0000-0000-000000000000	4dd20eb7-65e4-44a1-a152-fb2dffa230a3	{"action":"user_confirmation_requested","actor_id":"3c98aa81-e773-416f-8705-6bc13588a7c4","actor_username":"15106345023","actor_via_sso":false,"log_type":"user","traits":{"provider":"phone"}}	2024-07-26 02:22:08.391411+00	
00000000-0000-0000-0000-000000000000	0a3a8c82-e41b-4256-9099-3c363bb95f79	{"action":"user_signedup","actor_id":"3c98aa81-e773-416f-8705-6bc13588a7c4","actor_username":"15106345023","actor_via_sso":false,"log_type":"team"}	2024-07-26 02:22:19.888976+00	
00000000-0000-0000-0000-000000000000	5813b85c-93e3-461d-a577-d6e53ff58d4e	{"action":"token_refreshed","actor_id":"9c2f5472-e0f3-4109-9ff6-d6c571ce3475","actor_username":"14697044024","actor_via_sso":false,"log_type":"token"}	2024-07-26 02:24:00.421114+00	
00000000-0000-0000-0000-000000000000	ce863ca0-79ed-4663-af67-83a6f7b0bd44	{"action":"token_revoked","actor_id":"9c2f5472-e0f3-4109-9ff6-d6c571ce3475","actor_username":"14697044024","actor_via_sso":false,"log_type":"token"}	2024-07-26 02:24:00.427709+00	
00000000-0000-0000-0000-000000000000	3e991264-b738-46a9-93c9-510134792a1b	{"action":"logout","actor_id":"b82261ec-3aca-41e2-a3cf-c0d2b5c8558b","actor_username":"14077470791","actor_via_sso":false,"log_type":"account"}	2024-07-26 02:27:31.646874+00	
00000000-0000-0000-0000-000000000000	38387210-b4c1-46c5-a205-a87484f6c6f7	{"action":"user_recovery_requested","actor_id":"3c98aa81-e773-416f-8705-6bc13588a7c4","actor_username":"15106345023","actor_via_sso":false,"log_type":"user","traits":{"channel":"sms"}}	2024-07-26 02:33:29.300544+00	
00000000-0000-0000-0000-000000000000	e20f887a-a0b7-44a9-946d-07681b56c7b4	{"action":"user_confirmation_requested","actor_id":"18bde0a1-f3ca-4106-97ce-cbef943bf4e6","actor_username":"14074146468","actor_via_sso":false,"log_type":"user","traits":{"provider":"phone"}}	2024-07-26 02:34:23.673936+00	
00000000-0000-0000-0000-000000000000	a29b333e-19e6-4f81-a036-8b6103aac11b	{"action":"user_signedup","actor_id":"3c98aa81-e773-416f-8705-6bc13588a7c4","actor_username":"15106345023","actor_via_sso":false,"log_type":"team"}	2024-07-26 02:34:25.028658+00	
00000000-0000-0000-0000-000000000000	977e372d-d8df-4140-abff-ecdfe7b037e3	{"action":"user_signedup","actor_id":"18bde0a1-f3ca-4106-97ce-cbef943bf4e6","actor_username":"14074146468","actor_via_sso":false,"log_type":"team"}	2024-07-26 02:34:30.360137+00	
00000000-0000-0000-0000-000000000000	3cf69536-9fb0-4d47-a25b-367c944f3102	{"action":"logout","actor_id":"18bde0a1-f3ca-4106-97ce-cbef943bf4e6","actor_username":"14074146468","actor_via_sso":false,"log_type":"account"}	2024-07-26 02:38:38.374898+00	
00000000-0000-0000-0000-000000000000	fe5c60ee-e788-42b5-931f-f37e8bf27338	{"action":"user_recovery_requested","actor_id":"18bde0a1-f3ca-4106-97ce-cbef943bf4e6","actor_username":"14074146468","actor_via_sso":false,"log_type":"user","traits":{"channel":"sms"}}	2024-07-26 02:39:01.996936+00	
00000000-0000-0000-0000-000000000000	7d73c6d6-616c-4bcc-85ce-f86c323ba3aa	{"action":"user_signedup","actor_id":"18bde0a1-f3ca-4106-97ce-cbef943bf4e6","actor_username":"14074146468","actor_via_sso":false,"log_type":"team"}	2024-07-26 02:39:06.758237+00	
00000000-0000-0000-0000-000000000000	74cdae9b-2b88-46b4-ac4f-11304372a311	{"action":"logout","actor_id":"18bde0a1-f3ca-4106-97ce-cbef943bf4e6","actor_username":"14074146468","actor_via_sso":false,"log_type":"account"}	2024-07-26 02:39:38.943489+00	
00000000-0000-0000-0000-000000000000	274a48d2-71cd-430d-8542-12828f02f878	{"action":"token_refreshed","actor_id":"9c2f5472-e0f3-4109-9ff6-d6c571ce3475","actor_username":"14697044024","actor_via_sso":false,"log_type":"token"}	2024-07-26 04:37:10.483263+00	
00000000-0000-0000-0000-000000000000	8ee93697-5770-4d06-9ad0-d529da48b12f	{"action":"token_revoked","actor_id":"9c2f5472-e0f3-4109-9ff6-d6c571ce3475","actor_username":"14697044024","actor_via_sso":false,"log_type":"token"}	2024-07-26 04:37:10.485504+00	
00000000-0000-0000-0000-000000000000	c5e08da8-9eb2-427e-a8ba-923ea9abac8d	{"action":"user_confirmation_requested","actor_id":"f7c330dd-dd80-4642-ac1f-db0eac5f5466","actor_username":"13467025531","actor_via_sso":false,"log_type":"user","traits":{"provider":"phone"}}	2024-07-26 06:41:41.359707+00	
00000000-0000-0000-0000-000000000000	d5cd88c0-7e19-402f-afe5-69bb5fc768e8	{"action":"user_signedup","actor_id":"f7c330dd-dd80-4642-ac1f-db0eac5f5466","actor_username":"13467025531","actor_via_sso":false,"log_type":"team"}	2024-07-26 06:41:45.322429+00	
00000000-0000-0000-0000-000000000000	cf3ca45c-4f01-41e5-92d8-414a485465b0	{"action":"token_refreshed","actor_id":"9c2f5472-e0f3-4109-9ff6-d6c571ce3475","actor_username":"14697044024","actor_via_sso":false,"log_type":"token"}	2024-07-26 13:04:09.076426+00	
00000000-0000-0000-0000-000000000000	8798bca5-5a51-458c-ae73-a787e4b08a7b	{"action":"token_revoked","actor_id":"9c2f5472-e0f3-4109-9ff6-d6c571ce3475","actor_username":"14697044024","actor_via_sso":false,"log_type":"token"}	2024-07-26 13:04:09.081062+00	
00000000-0000-0000-0000-000000000000	ec8853f0-10cc-402f-83f4-ce56d802d7d3	{"action":"user_recovery_requested","actor_id":"5bbca4ac-ad78-4c10-aaf0-b6ae018db066","actor_username":"13017321380","actor_via_sso":false,"log_type":"user","traits":{"channel":"sms"}}	2024-07-26 15:05:08.164582+00	
00000000-0000-0000-0000-000000000000	5aa04425-b9ff-4a73-99f6-b830da4fc118	{"action":"user_signedup","actor_id":"5bbca4ac-ad78-4c10-aaf0-b6ae018db066","actor_username":"13017321380","actor_via_sso":false,"log_type":"team"}	2024-07-26 15:05:24.967671+00	
00000000-0000-0000-0000-000000000000	64959be6-e189-420d-8fe9-0839ee7729d0	{"action":"token_refreshed","actor_id":"d650f4c8-d60d-4f03-b210-ab71ee77144a","actor_username":"17472224970","actor_via_sso":false,"log_type":"token"}	2024-07-26 15:36:36.421396+00	
00000000-0000-0000-0000-000000000000	87dad3e2-9da7-496c-b941-770e0e6a9985	{"action":"token_revoked","actor_id":"d650f4c8-d60d-4f03-b210-ab71ee77144a","actor_username":"17472224970","actor_via_sso":false,"log_type":"token"}	2024-07-26 15:36:36.423524+00	
00000000-0000-0000-0000-000000000000	aaa06492-fda6-41ef-83a8-774e61120279	{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"","user_id":"a74f81ef-1068-44fa-ab85-1a77c72ba6b8","user_phone":"13017321381"}}	2024-07-26 16:00:11.726071+00	
00000000-0000-0000-0000-000000000000	5663dfee-042f-4a77-b71a-1aa9063fa2d1	{"action":"token_refreshed","actor_id":"f7c330dd-dd80-4642-ac1f-db0eac5f5466","actor_username":"13467025531","actor_via_sso":false,"log_type":"token"}	2024-07-26 16:06:45.091585+00	
00000000-0000-0000-0000-000000000000	9b45a7aa-4482-4f7a-873c-fd37d52b98f7	{"action":"token_revoked","actor_id":"f7c330dd-dd80-4642-ac1f-db0eac5f5466","actor_username":"13467025531","actor_via_sso":false,"log_type":"token"}	2024-07-26 16:06:45.108262+00	
00000000-0000-0000-0000-000000000000	9a43c740-84bd-4e5c-ab7c-dcda069f8156	{"action":"token_refreshed","actor_id":"f7c330dd-dd80-4642-ac1f-db0eac5f5466","actor_username":"13467025531","actor_via_sso":false,"log_type":"token"}	2024-07-26 17:54:19.847697+00	
00000000-0000-0000-0000-000000000000	56729aca-e504-4826-956a-d18ffb3b8f3f	{"action":"token_revoked","actor_id":"f7c330dd-dd80-4642-ac1f-db0eac5f5466","actor_username":"13467025531","actor_via_sso":false,"log_type":"token"}	2024-07-26 17:54:19.849339+00	
00000000-0000-0000-0000-000000000000	7f644941-4fb9-4762-9e4f-b238f53f3735	{"action":"user_confirmation_requested","actor_id":"a0a837ef-7717-40f7-ba7a-7d202d18d4a4","actor_username":"16468230397","actor_via_sso":false,"log_type":"user","traits":{"provider":"phone"}}	2024-07-26 19:36:13.913455+00	
00000000-0000-0000-0000-000000000000	a52d3dcc-c6ff-4669-ab0f-b41b44875e93	{"action":"user_signedup","actor_id":"a0a837ef-7717-40f7-ba7a-7d202d18d4a4","actor_username":"16468230397","actor_via_sso":false,"log_type":"team"}	2024-07-26 19:36:22.016157+00	
00000000-0000-0000-0000-000000000000	5c78bde3-f070-46d4-b7ea-db13e1f8f96b	{"action":"token_refreshed","actor_id":"5bbca4ac-ad78-4c10-aaf0-b6ae018db066","actor_username":"13017321380","actor_via_sso":false,"log_type":"token"}	2024-07-26 19:50:48.324397+00	
00000000-0000-0000-0000-000000000000	520a00ad-25a8-4dd0-8b7f-33d3a4018371	{"action":"token_revoked","actor_id":"5bbca4ac-ad78-4c10-aaf0-b6ae018db066","actor_username":"13017321380","actor_via_sso":false,"log_type":"token"}	2024-07-26 19:50:48.327693+00	
00000000-0000-0000-0000-000000000000	eb50d543-a4cb-4b0a-9bfb-6d1a01d3bca9	{"action":"token_refreshed","actor_id":"f7c330dd-dd80-4642-ac1f-db0eac5f5466","actor_username":"13467025531","actor_via_sso":false,"log_type":"token"}	2024-07-26 22:07:18.594072+00	
00000000-0000-0000-0000-000000000000	783e3ff2-f292-4555-ab83-3a1e81032b74	{"action":"token_revoked","actor_id":"f7c330dd-dd80-4642-ac1f-db0eac5f5466","actor_username":"13467025531","actor_via_sso":false,"log_type":"token"}	2024-07-26 22:07:18.595628+00	
00000000-0000-0000-0000-000000000000	03def771-c1fd-42db-829d-6478ea0d6085	{"action":"token_refreshed","actor_id":"f7c330dd-dd80-4642-ac1f-db0eac5f5466","actor_username":"13467025531","actor_via_sso":false,"log_type":"token"}	2024-07-27 00:52:40.952129+00	
00000000-0000-0000-0000-000000000000	d4e8d0cf-2ac2-4006-9c91-361c1d4c813b	{"action":"token_revoked","actor_id":"f7c330dd-dd80-4642-ac1f-db0eac5f5466","actor_username":"13467025531","actor_via_sso":false,"log_type":"token"}	2024-07-27 00:52:40.953396+00	
00000000-0000-0000-0000-000000000000	22d573c1-228e-4ed9-954f-37860fb54332	{"action":"token_refreshed","actor_id":"5bbca4ac-ad78-4c10-aaf0-b6ae018db066","actor_username":"13017321380","actor_via_sso":false,"log_type":"token"}	2024-07-27 12:53:00.80283+00	
00000000-0000-0000-0000-000000000000	278247f8-1e1d-47b8-9f18-6a15ae6b2e40	{"action":"token_revoked","actor_id":"5bbca4ac-ad78-4c10-aaf0-b6ae018db066","actor_username":"13017321380","actor_via_sso":false,"log_type":"token"}	2024-07-27 12:53:00.808632+00	
00000000-0000-0000-0000-000000000000	0899cf2a-5ced-447b-9662-54ca6e1d56a2	{"action":"logout","actor_id":"5bbca4ac-ad78-4c10-aaf0-b6ae018db066","actor_username":"13017321380","actor_via_sso":false,"log_type":"account"}	2024-07-27 12:53:09.269323+00	
00000000-0000-0000-0000-000000000000	14810d57-76e2-4dd3-b059-2ec2839a178a	{"action":"user_recovery_requested","actor_id":"5bbca4ac-ad78-4c10-aaf0-b6ae018db066","actor_username":"13017321380","actor_via_sso":false,"log_type":"user","traits":{"channel":"sms"}}	2024-07-27 12:53:13.756069+00	
00000000-0000-0000-0000-000000000000	6374fb00-03e6-4333-8942-b15622e7a1d7	{"action":"user_signedup","actor_id":"5bbca4ac-ad78-4c10-aaf0-b6ae018db066","actor_username":"13017321380","actor_via_sso":false,"log_type":"team"}	2024-07-27 12:53:23.444723+00	
00000000-0000-0000-0000-000000000000	b966e718-2459-4847-9200-d7a1e0ca0abe	{"action":"token_refreshed","actor_id":"a0a837ef-7717-40f7-ba7a-7d202d18d4a4","actor_username":"16468230397","actor_via_sso":false,"log_type":"token"}	2024-07-27 12:54:49.309924+00	
00000000-0000-0000-0000-000000000000	ee275b49-1141-4762-9f0f-957160ec194b	{"action":"token_revoked","actor_id":"a0a837ef-7717-40f7-ba7a-7d202d18d4a4","actor_username":"16468230397","actor_via_sso":false,"log_type":"token"}	2024-07-27 12:54:49.310786+00	
00000000-0000-0000-0000-000000000000	e08f5915-9e12-4155-af89-7ae949dd7ca4	{"action":"logout","actor_id":"a0a837ef-7717-40f7-ba7a-7d202d18d4a4","actor_username":"16468230397","actor_via_sso":false,"log_type":"account"}	2024-07-27 12:54:58.88997+00	
00000000-0000-0000-0000-000000000000	c74b7c46-ee1c-4358-8f98-20ecadd385a1	{"action":"user_recovery_requested","actor_id":"5bbca4ac-ad78-4c10-aaf0-b6ae018db066","actor_username":"13017321380","actor_via_sso":false,"log_type":"user","traits":{"channel":"sms"}}	2024-07-27 12:55:12.59627+00	
00000000-0000-0000-0000-000000000000	920c41ed-e720-44f0-8cdd-a3e1771b43ab	{"action":"user_signedup","actor_id":"5bbca4ac-ad78-4c10-aaf0-b6ae018db066","actor_username":"13017321380","actor_via_sso":false,"log_type":"team"}	2024-07-27 12:55:22.629656+00	
00000000-0000-0000-0000-000000000000	df25aa27-27f9-4a03-b44c-2b39a534d36c	{"action":"logout","actor_id":"5bbca4ac-ad78-4c10-aaf0-b6ae018db066","actor_username":"13017321380","actor_via_sso":false,"log_type":"account"}	2024-07-27 13:16:41.550386+00	
00000000-0000-0000-0000-000000000000	bc67491a-e40b-4710-8078-37af491f679c	{"action":"user_recovery_requested","actor_id":"b82261ec-3aca-41e2-a3cf-c0d2b5c8558b","actor_username":"14077470791","actor_via_sso":false,"log_type":"user","traits":{"channel":"sms"}}	2024-07-27 14:59:52.429989+00	
00000000-0000-0000-0000-000000000000	3f892f56-83d1-40d4-a2fb-8d252d32a7d0	{"action":"user_signedup","actor_id":"b82261ec-3aca-41e2-a3cf-c0d2b5c8558b","actor_username":"14077470791","actor_via_sso":false,"log_type":"team"}	2024-07-27 14:59:54.693858+00	
00000000-0000-0000-0000-000000000000	05205fce-f4a6-4053-b6a6-ea73233c67b7	{"action":"token_refreshed","actor_id":"b82261ec-3aca-41e2-a3cf-c0d2b5c8558b","actor_username":"14077470791","actor_via_sso":false,"log_type":"token"}	2024-07-27 16:17:48.800769+00	
00000000-0000-0000-0000-000000000000	a74233e7-078e-4c78-b932-41d482f1a082	{"action":"token_revoked","actor_id":"b82261ec-3aca-41e2-a3cf-c0d2b5c8558b","actor_username":"14077470791","actor_via_sso":false,"log_type":"token"}	2024-07-27 16:17:48.802167+00	
00000000-0000-0000-0000-000000000000	741ce88f-fd4a-42a8-9408-228c32501fb0	{"action":"user_recovery_requested","actor_id":"5bbca4ac-ad78-4c10-aaf0-b6ae018db066","actor_username":"13017321380","actor_via_sso":false,"log_type":"user","traits":{"channel":"sms"}}	2024-07-27 18:19:43.90011+00	
00000000-0000-0000-0000-000000000000	2d2929cb-c83f-4bca-9b87-ea8447335361	{"action":"token_refreshed","actor_id":"b82261ec-3aca-41e2-a3cf-c0d2b5c8558b","actor_username":"14077470791","actor_via_sso":false,"log_type":"token"}	2024-07-27 19:32:20.859461+00	
00000000-0000-0000-0000-000000000000	f9ee2708-b7e2-4275-9583-061114d0a51f	{"action":"token_revoked","actor_id":"b82261ec-3aca-41e2-a3cf-c0d2b5c8558b","actor_username":"14077470791","actor_via_sso":false,"log_type":"token"}	2024-07-27 19:32:20.860456+00	
00000000-0000-0000-0000-000000000000	7cdb4304-f948-4a0f-8f98-5ec7820c98fc	{"action":"user_confirmation_requested","actor_id":"eee8a84c-0fdd-4354-ab42-d18c0ba4c551","actor_username":"15129149088","actor_via_sso":false,"log_type":"user","traits":{"provider":"phone"}}	2024-07-27 20:26:37.84541+00	
00000000-0000-0000-0000-000000000000	c3029739-0aea-4578-81a9-b6469e1f4123	{"action":"user_signedup","actor_id":"eee8a84c-0fdd-4354-ab42-d18c0ba4c551","actor_username":"15129149088","actor_via_sso":false,"log_type":"team"}	2024-07-27 20:26:42.016672+00	
00000000-0000-0000-0000-000000000000	4a577fbe-1d49-4400-bc69-e8532c95e0fc	{"action":"user_recovery_requested","actor_id":"b82261ec-3aca-41e2-a3cf-c0d2b5c8558b","actor_username":"14077470791","actor_via_sso":false,"log_type":"user","traits":{"channel":"sms"}}	2024-07-28 03:03:11.824844+00	
00000000-0000-0000-0000-000000000000	53f8bac7-935c-4dc2-af3b-9d131f7492ca	{"action":"user_signedup","actor_id":"b82261ec-3aca-41e2-a3cf-c0d2b5c8558b","actor_username":"14077470791","actor_via_sso":false,"log_type":"team"}	2024-07-28 03:03:33.268132+00	
00000000-0000-0000-0000-000000000000	3a6d9bb0-7cb1-4ca9-a094-64fb4c16bd2f	{"action":"user_recovery_requested","actor_id":"f7c330dd-dd80-4642-ac1f-db0eac5f5466","actor_username":"13467025531","actor_via_sso":false,"log_type":"user","traits":{"channel":"sms"}}	2024-07-28 03:32:54.381342+00	
00000000-0000-0000-0000-000000000000	74face76-a0e4-4fff-a887-44ef07c7916b	{"action":"user_signedup","actor_id":"f7c330dd-dd80-4642-ac1f-db0eac5f5466","actor_username":"13467025531","actor_via_sso":false,"log_type":"team"}	2024-07-28 03:33:15.073096+00	
00000000-0000-0000-0000-000000000000	46028dc2-4ee6-4ff2-8f2f-d50ae8044a92	{"action":"token_refreshed","actor_id":"b82261ec-3aca-41e2-a3cf-c0d2b5c8558b","actor_username":"14077470791","actor_via_sso":false,"log_type":"token"}	2024-07-28 04:23:48.628134+00	
00000000-0000-0000-0000-000000000000	5445672d-c56a-4f47-a3a9-6c8088382a0a	{"action":"token_revoked","actor_id":"b82261ec-3aca-41e2-a3cf-c0d2b5c8558b","actor_username":"14077470791","actor_via_sso":false,"log_type":"token"}	2024-07-28 04:23:48.630573+00	
00000000-0000-0000-0000-000000000000	9175117b-e91a-403c-9d32-4adbecfb7417	{"action":"user_confirmation_requested","actor_id":"d199297a-cad3-43a8-9b92-4c54e1fc5486","actor_username":"18328128035","actor_via_sso":false,"log_type":"user","traits":{"provider":"phone"}}	2024-07-28 04:40:40.356847+00	
00000000-0000-0000-0000-000000000000	aef483ab-225b-41ec-a694-1b34542869ec	{"action":"user_signedup","actor_id":"d199297a-cad3-43a8-9b92-4c54e1fc5486","actor_username":"18328128035","actor_via_sso":false,"log_type":"team"}	2024-07-28 04:40:44.432219+00	
00000000-0000-0000-0000-000000000000	2d1d75c2-b3f5-4c10-be97-683ea6b2b033	{"action":"user_confirmation_requested","actor_id":"e7614e8d-81cd-4cf3-9774-b8bce43245ce","actor_username":"18326417342","actor_via_sso":false,"log_type":"user","traits":{"provider":"phone"}}	2024-07-28 04:40:53.250456+00	
00000000-0000-0000-0000-000000000000	a57dcc3c-0e03-4429-9542-3ef5b079d4b6	{"action":"user_signedup","actor_id":"e7614e8d-81cd-4cf3-9774-b8bce43245ce","actor_username":"18326417342","actor_via_sso":false,"log_type":"team"}	2024-07-28 04:40:56.928372+00	
00000000-0000-0000-0000-000000000000	d6002b63-2cea-4921-8474-83bfa5f00cb1	{"action":"user_confirmation_requested","actor_id":"fc5da05b-8192-4127-9b48-e6c514bbf4f7","actor_username":"14082030828","actor_via_sso":false,"log_type":"user","traits":{"provider":"phone"}}	2024-07-28 04:59:00.357628+00	
00000000-0000-0000-0000-000000000000	f8041867-5671-44ec-be35-f42b3e2926dc	{"action":"user_signedup","actor_id":"fc5da05b-8192-4127-9b48-e6c514bbf4f7","actor_username":"14082030828","actor_via_sso":false,"log_type":"team"}	2024-07-28 04:59:17.052718+00	
00000000-0000-0000-0000-000000000000	d17dd274-5953-4f07-b2b1-a35343bbf131	{"action":"user_recovery_requested","actor_id":"fc5da05b-8192-4127-9b48-e6c514bbf4f7","actor_username":"14082030828","actor_via_sso":false,"log_type":"user","traits":{"channel":"sms"}}	2024-07-28 05:01:28.421929+00	
00000000-0000-0000-0000-000000000000	74290ae9-b4b9-4e4b-8454-47f1f161ed74	{"action":"user_signedup","actor_id":"fc5da05b-8192-4127-9b48-e6c514bbf4f7","actor_username":"14082030828","actor_via_sso":false,"log_type":"team"}	2024-07-28 05:01:56.913447+00	
00000000-0000-0000-0000-000000000000	c2a1ca01-667e-4294-8467-a9b2cf93fb41	{"action":"token_refreshed","actor_id":"b82261ec-3aca-41e2-a3cf-c0d2b5c8558b","actor_username":"14077470791","actor_via_sso":false,"log_type":"token"}	2024-07-28 05:29:09.896063+00	
00000000-0000-0000-0000-000000000000	3e4bbccd-414e-4b1c-8f55-b1a99ccd916c	{"action":"token_revoked","actor_id":"b82261ec-3aca-41e2-a3cf-c0d2b5c8558b","actor_username":"14077470791","actor_via_sso":false,"log_type":"token"}	2024-07-28 05:29:09.903569+00	
00000000-0000-0000-0000-000000000000	82bbe4f9-ee51-4ef4-b633-d34e1021ea54	{"action":"token_refreshed","actor_id":"e7614e8d-81cd-4cf3-9774-b8bce43245ce","actor_username":"18326417342","actor_via_sso":false,"log_type":"token"}	2024-07-28 06:36:59.178164+00	
00000000-0000-0000-0000-000000000000	6147dda0-ad31-4495-9b3a-2083d9df56d7	{"action":"token_revoked","actor_id":"e7614e8d-81cd-4cf3-9774-b8bce43245ce","actor_username":"18326417342","actor_via_sso":false,"log_type":"token"}	2024-07-28 06:36:59.180574+00	
00000000-0000-0000-0000-000000000000	8d3df04c-75e1-44e9-9bfe-6b55ea884d96	{"action":"token_refreshed","actor_id":"d199297a-cad3-43a8-9b92-4c54e1fc5486","actor_username":"18328128035","actor_via_sso":false,"log_type":"token"}	2024-07-28 06:47:55.042414+00	
00000000-0000-0000-0000-000000000000	1069db04-ff1b-4767-ae22-0f3cd4e36bc4	{"action":"token_revoked","actor_id":"d199297a-cad3-43a8-9b92-4c54e1fc5486","actor_username":"18328128035","actor_via_sso":false,"log_type":"token"}	2024-07-28 06:47:55.044161+00	
00000000-0000-0000-0000-000000000000	eb39a6ec-37bf-4c99-af6b-20a0834dc5ed	{"action":"token_refreshed","actor_id":"f7c330dd-dd80-4642-ac1f-db0eac5f5466","actor_username":"13467025531","actor_via_sso":false,"log_type":"token"}	2024-07-28 13:52:16.344549+00	
00000000-0000-0000-0000-000000000000	b6567afa-ee46-404b-a1d1-2735ee3b3353	{"action":"token_revoked","actor_id":"f7c330dd-dd80-4642-ac1f-db0eac5f5466","actor_username":"13467025531","actor_via_sso":false,"log_type":"token"}	2024-07-28 13:52:16.346308+00	
00000000-0000-0000-0000-000000000000	0821b51c-b654-4968-9d28-7a96db437199	{"action":"token_refreshed","actor_id":"f7c330dd-dd80-4642-ac1f-db0eac5f5466","actor_username":"13467025531","actor_via_sso":false,"log_type":"token"}	2024-07-28 14:57:38.200014+00	
00000000-0000-0000-0000-000000000000	0809d83d-1c25-49c3-b21a-ddab84f11223	{"action":"token_revoked","actor_id":"f7c330dd-dd80-4642-ac1f-db0eac5f5466","actor_username":"13467025531","actor_via_sso":false,"log_type":"token"}	2024-07-28 14:57:38.201261+00	
00000000-0000-0000-0000-000000000000	db2dbd8c-f647-4a40-8054-26842f03ac6e	{"action":"token_refreshed","actor_id":"fc5da05b-8192-4127-9b48-e6c514bbf4f7","actor_username":"14082030828","actor_via_sso":false,"log_type":"token"}	2024-07-28 15:01:50.809835+00	
00000000-0000-0000-0000-000000000000	0e0fd83b-ef2c-4498-9b2d-4d08b6a0d796	{"action":"token_revoked","actor_id":"fc5da05b-8192-4127-9b48-e6c514bbf4f7","actor_username":"14082030828","actor_via_sso":false,"log_type":"token"}	2024-07-28 15:01:50.814506+00	
00000000-0000-0000-0000-000000000000	5a5151d1-834e-4e7f-88d5-3041e47150f8	{"action":"logout","actor_id":"fc5da05b-8192-4127-9b48-e6c514bbf4f7","actor_username":"14082030828","actor_via_sso":false,"log_type":"account"}	2024-07-28 15:06:10.662622+00	
00000000-0000-0000-0000-000000000000	6eec4073-121b-472c-9f80-df27083778a8	{"action":"user_recovery_requested","actor_id":"5bbca4ac-ad78-4c10-aaf0-b6ae018db066","actor_username":"13017321380","actor_via_sso":false,"log_type":"user","traits":{"channel":"sms"}}	2024-07-28 15:10:55.975526+00	
00000000-0000-0000-0000-000000000000	93681b45-05f6-4ad1-8929-11f9fe54b2ec	{"action":"user_signedup","actor_id":"5bbca4ac-ad78-4c10-aaf0-b6ae018db066","actor_username":"13017321380","actor_via_sso":false,"log_type":"team"}	2024-07-28 15:11:08.324104+00	
00000000-0000-0000-0000-000000000000	3780b95d-a31d-4383-b62d-bb27a5f6806d	{"action":"token_refreshed","actor_id":"b82261ec-3aca-41e2-a3cf-c0d2b5c8558b","actor_username":"14077470791","actor_via_sso":false,"log_type":"token"}	2024-07-28 15:29:08.101582+00	
00000000-0000-0000-0000-000000000000	9aac0396-0743-4cc7-8d56-39f3accf5bb6	{"action":"token_revoked","actor_id":"b82261ec-3aca-41e2-a3cf-c0d2b5c8558b","actor_username":"14077470791","actor_via_sso":false,"log_type":"token"}	2024-07-28 15:29:08.103287+00	
00000000-0000-0000-0000-000000000000	fe15344f-0cfa-45bb-9f6d-b0b380622e27	{"action":"user_recovery_requested","actor_id":"b82261ec-3aca-41e2-a3cf-c0d2b5c8558b","actor_username":"14077470791","actor_via_sso":false,"log_type":"user","traits":{"channel":"sms"}}	2024-07-28 17:37:22.911469+00	
00000000-0000-0000-0000-000000000000	cb4dda4c-e9dd-4560-b750-683230c69c4a	{"action":"user_signedup","actor_id":"b82261ec-3aca-41e2-a3cf-c0d2b5c8558b","actor_username":"14077470791","actor_via_sso":false,"log_type":"team"}	2024-07-28 17:37:25.971207+00	
00000000-0000-0000-0000-000000000000	b8bacce6-00a6-4d31-a838-d87f61cad4f9	{"action":"token_refreshed","actor_id":"f7c330dd-dd80-4642-ac1f-db0eac5f5466","actor_username":"13467025531","actor_via_sso":false,"log_type":"token"}	2024-07-28 17:51:20.239487+00	
00000000-0000-0000-0000-000000000000	0d789b46-5a6e-456e-8247-f0b727721e60	{"action":"token_revoked","actor_id":"f7c330dd-dd80-4642-ac1f-db0eac5f5466","actor_username":"13467025531","actor_via_sso":false,"log_type":"token"}	2024-07-28 17:51:20.245749+00	
00000000-0000-0000-0000-000000000000	61609751-c553-4550-91fa-e6966dbe48d5	{"action":"user_confirmation_requested","actor_id":"e355efae-cc06-4737-8439-f731e383b285","actor_username":"19728042376","actor_via_sso":false,"log_type":"user","traits":{"provider":"phone"}}	2024-07-28 17:55:16.119556+00	
00000000-0000-0000-0000-000000000000	2cf3e996-388a-4ec1-a970-50e17d3d0bea	{"action":"user_signedup","actor_id":"e355efae-cc06-4737-8439-f731e383b285","actor_username":"19728042376","actor_via_sso":false,"log_type":"team"}	2024-07-28 17:55:21.911584+00	
00000000-0000-0000-0000-000000000000	0aa11fbb-1ba3-4418-ab6e-b2790a54b950	{"action":"token_refreshed","actor_id":"b82261ec-3aca-41e2-a3cf-c0d2b5c8558b","actor_username":"14077470791","actor_via_sso":false,"log_type":"token"}	2024-07-28 18:55:02.625818+00	
00000000-0000-0000-0000-000000000000	451b4f2a-5b14-49d3-a87d-98eedc69f917	{"action":"token_revoked","actor_id":"b82261ec-3aca-41e2-a3cf-c0d2b5c8558b","actor_username":"14077470791","actor_via_sso":false,"log_type":"token"}	2024-07-28 18:55:02.627973+00	
00000000-0000-0000-0000-000000000000	9d03f05b-31b5-497a-9a17-fd7a135727c7	{"action":"user_recovery_requested","actor_id":"c1e922fd-458f-4969-84bc-0861ea992d18","actor_username":"14072568997","actor_via_sso":false,"log_type":"user","traits":{"channel":"sms"}}	2024-07-29 03:54:37.075612+00	
00000000-0000-0000-0000-000000000000	cfddc0d9-da5e-4b95-9a05-b829fe5a6903	{"action":"user_signedup","actor_id":"c1e922fd-458f-4969-84bc-0861ea992d18","actor_username":"14072568997","actor_via_sso":false,"log_type":"team"}	2024-07-29 03:55:00.212586+00	
00000000-0000-0000-0000-000000000000	eb8d51d6-e203-4419-9d24-0973836f279d	{"action":"token_refreshed","actor_id":"b82261ec-3aca-41e2-a3cf-c0d2b5c8558b","actor_username":"14077470791","actor_via_sso":false,"log_type":"token"}	2024-07-29 14:36:20.598468+00	
00000000-0000-0000-0000-000000000000	41071209-1be7-407a-b4ed-25d69c863536	{"action":"token_revoked","actor_id":"b82261ec-3aca-41e2-a3cf-c0d2b5c8558b","actor_username":"14077470791","actor_via_sso":false,"log_type":"token"}	2024-07-29 14:36:20.613279+00	
00000000-0000-0000-0000-000000000000	0b48a302-8327-4903-bc84-33596c27353e	{"action":"logout","actor_id":"b82261ec-3aca-41e2-a3cf-c0d2b5c8558b","actor_username":"14077470791","actor_via_sso":false,"log_type":"account"}	2024-07-29 14:36:23.227595+00	
00000000-0000-0000-0000-000000000000	19b03729-f3f9-456d-bef6-6838135483b9	{"action":"user_recovery_requested","actor_id":"b82261ec-3aca-41e2-a3cf-c0d2b5c8558b","actor_username":"14077470791","actor_via_sso":false,"log_type":"user","traits":{"channel":"sms"}}	2024-07-29 14:37:01.468262+00	
00000000-0000-0000-0000-000000000000	3ef462c6-9d4b-489c-813e-e871e4f10683	{"action":"user_recovery_requested","actor_id":"c1e922fd-458f-4969-84bc-0861ea992d18","actor_username":"14072568997","actor_via_sso":false,"log_type":"user","traits":{"channel":"sms"}}	2024-07-29 16:58:03.261949+00	
00000000-0000-0000-0000-000000000000	59cdad4b-8a0d-4624-b8c8-675f19fccecf	{"action":"user_signedup","actor_id":"c1e922fd-458f-4969-84bc-0861ea992d18","actor_username":"14072568997","actor_via_sso":false,"log_type":"team"}	2024-07-29 16:58:14.026068+00	
00000000-0000-0000-0000-000000000000	11973185-7e9d-45a4-a2cb-a169b6fa3707	{"action":"user_recovery_requested","actor_id":"18bde0a1-f3ca-4106-97ce-cbef943bf4e6","actor_username":"14074146468","actor_via_sso":false,"log_type":"user","traits":{"channel":"sms"}}	2024-07-29 19:12:44.806254+00	
00000000-0000-0000-0000-000000000000	43ad0ca1-25e5-441e-a4b4-be59478c7058	{"action":"user_signedup","actor_id":"18bde0a1-f3ca-4106-97ce-cbef943bf4e6","actor_username":"14074146468","actor_via_sso":false,"log_type":"team"}	2024-07-29 19:12:49.797371+00	
00000000-0000-0000-0000-000000000000	e3528ba4-b905-4859-b057-400e7eba399b	{"action":"token_refreshed","actor_id":"18bde0a1-f3ca-4106-97ce-cbef943bf4e6","actor_username":"14074146468","actor_via_sso":false,"log_type":"token"}	2024-07-29 21:29:02.413297+00	
00000000-0000-0000-0000-000000000000	c31fc47b-d855-4282-9098-d333e65b9bf9	{"action":"token_revoked","actor_id":"18bde0a1-f3ca-4106-97ce-cbef943bf4e6","actor_username":"14074146468","actor_via_sso":false,"log_type":"token"}	2024-07-29 21:29:02.415326+00	
00000000-0000-0000-0000-000000000000	628544e7-7848-47e7-9ee8-9e63f17632a5	{"action":"user_confirmation_requested","actor_id":"e5ae9b3b-c793-4597-b82d-f9f6c461facf","actor_username":"15626676131","actor_via_sso":false,"log_type":"user","traits":{"provider":"phone"}}	2024-07-29 21:58:40.856587+00	
00000000-0000-0000-0000-000000000000	f15f06ea-0732-4d3b-a2e7-e4b9e7c9b398	{"action":"user_signedup","actor_id":"e5ae9b3b-c793-4597-b82d-f9f6c461facf","actor_username":"15626676131","actor_via_sso":false,"log_type":"team"}	2024-07-29 21:59:01.839007+00	
00000000-0000-0000-0000-000000000000	28b89a2a-5096-4823-b006-ee443d51b0bc	{"action":"token_refreshed","actor_id":"18bde0a1-f3ca-4106-97ce-cbef943bf4e6","actor_username":"14074146468","actor_via_sso":false,"log_type":"token"}	2024-07-29 23:58:33.431978+00	
00000000-0000-0000-0000-000000000000	325a2c6c-7dd3-4fb2-b434-bd8e402b0acd	{"action":"token_revoked","actor_id":"18bde0a1-f3ca-4106-97ce-cbef943bf4e6","actor_username":"14074146468","actor_via_sso":false,"log_type":"token"}	2024-07-29 23:58:33.434214+00	
00000000-0000-0000-0000-000000000000	3d2498b6-8664-4c56-b5fd-51a12c266d61	{"action":"token_refreshed","actor_id":"18bde0a1-f3ca-4106-97ce-cbef943bf4e6","actor_username":"14074146468","actor_via_sso":false,"log_type":"token"}	2024-07-30 02:07:33.529761+00	
00000000-0000-0000-0000-000000000000	abe1a0fb-f8a2-4dcd-a926-90d8b519aa2b	{"action":"token_revoked","actor_id":"18bde0a1-f3ca-4106-97ce-cbef943bf4e6","actor_username":"14074146468","actor_via_sso":false,"log_type":"token"}	2024-07-30 02:07:33.541453+00	
00000000-0000-0000-0000-000000000000	a039a2b1-bd1d-4a92-87a7-f45f50b37030	{"action":"token_refreshed","actor_id":"9c2f5472-e0f3-4109-9ff6-d6c571ce3475","actor_username":"14697044024","actor_via_sso":false,"log_type":"token"}	2024-07-30 02:26:44.748056+00	
00000000-0000-0000-0000-000000000000	e5d98ef0-2068-4154-a87d-fbda53c48ff2	{"action":"token_revoked","actor_id":"9c2f5472-e0f3-4109-9ff6-d6c571ce3475","actor_username":"14697044024","actor_via_sso":false,"log_type":"token"}	2024-07-30 02:26:44.750566+00	
00000000-0000-0000-0000-000000000000	80f65280-8e76-4425-8015-fe1c7fb9288b	{"action":"token_refreshed","actor_id":"9c2f5472-e0f3-4109-9ff6-d6c571ce3475","actor_username":"14697044024","actor_via_sso":false,"log_type":"token"}	2024-07-30 05:16:52.950703+00	
00000000-0000-0000-0000-000000000000	9d696ba6-b2fa-4ab5-a125-14291ff806e7	{"action":"token_revoked","actor_id":"9c2f5472-e0f3-4109-9ff6-d6c571ce3475","actor_username":"14697044024","actor_via_sso":false,"log_type":"token"}	2024-07-30 05:16:52.952503+00	
00000000-0000-0000-0000-000000000000	e7eca771-8e1e-433c-b5b5-0f5f81db3e55	{"action":"user_confirmation_requested","actor_id":"ae0fe4bc-71a4-4a5c-bee6-f1e3af7689f9","actor_username":"13015032787","actor_via_sso":false,"log_type":"user","traits":{"provider":"phone"}}	2024-07-30 15:37:25.781658+00	
00000000-0000-0000-0000-000000000000	8729d254-0577-49e9-ba05-d10b069d91b2	{"action":"user_signedup","actor_id":"ae0fe4bc-71a4-4a5c-bee6-f1e3af7689f9","actor_username":"13015032787","actor_via_sso":false,"log_type":"team"}	2024-07-30 15:37:33.651571+00	
00000000-0000-0000-0000-000000000000	03886370-7530-47c2-a052-e3daff59f928	{"action":"logout","actor_id":"ae0fe4bc-71a4-4a5c-bee6-f1e3af7689f9","actor_username":"13015032787","actor_via_sso":false,"log_type":"account"}	2024-07-30 15:38:54.220636+00	
00000000-0000-0000-0000-000000000000	2bf43dce-3f48-4c61-9f15-18b42d99da73	{"action":"user_recovery_requested","actor_id":"ae0fe4bc-71a4-4a5c-bee6-f1e3af7689f9","actor_username":"13015032787","actor_via_sso":false,"log_type":"user","traits":{"channel":"sms"}}	2024-07-30 15:39:14.355276+00	
00000000-0000-0000-0000-000000000000	3b8b2306-bdd1-4c74-a4fa-53b3e71cdc0a	{"action":"user_signedup","actor_id":"ae0fe4bc-71a4-4a5c-bee6-f1e3af7689f9","actor_username":"13015032787","actor_via_sso":false,"log_type":"team"}	2024-07-30 15:39:40.92923+00	
00000000-0000-0000-0000-000000000000	56eddeaf-1aac-4b2f-ac95-00786de00c65	{"action":"user_signedup","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"oseleonose@gmail.com","user_id":"58cebd00-3cc8-4ee9-926c-16833a66651d","user_phone":""}}	2024-07-30 15:45:36.687913+00	
00000000-0000-0000-0000-000000000000	d83c6428-2d89-4509-b40a-a314a670db72	{"action":"user_recovery_requested","actor_id":"ae0fe4bc-71a4-4a5c-bee6-f1e3af7689f9","actor_username":"13015032787","actor_via_sso":false,"log_type":"user","traits":{"channel":"sms"}}	2024-07-30 15:45:59.721583+00	
\.


--
-- Data for Name: flow_state; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.flow_state (id, user_id, auth_code, code_challenge_method, code_challenge, provider_type, provider_access_token, provider_refresh_token, created_at, updated_at, authentication_method, auth_code_issued_at) FROM stdin;
\.


--
-- Data for Name: identities; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id) FROM stdin;
1fa2d554-cc74-461d-8878-08c1b91f71e0	1fa2d554-cc74-461d-8878-08c1b91f71e0	{"sub": "1fa2d554-cc74-461d-8878-08c1b91f71e0", "email_verified": false, "phone_verified": false}	phone	2024-07-18 23:59:17.232195+00	2024-07-18 23:59:17.232257+00	2024-07-18 23:59:17.232257+00	b9cb8393-37c3-4d87-b777-a22a5d501dd3
b82261ec-3aca-41e2-a3cf-c0d2b5c8558b	b82261ec-3aca-41e2-a3cf-c0d2b5c8558b	{"sub": "b82261ec-3aca-41e2-a3cf-c0d2b5c8558b", "email_verified": false, "phone_verified": false}	phone	2024-07-19 00:29:12.528048+00	2024-07-19 00:29:12.528095+00	2024-07-19 00:29:12.528095+00	8120e31b-95ea-43ef-bfd4-2649bebef436
5bbca4ac-ad78-4c10-aaf0-b6ae018db066	5bbca4ac-ad78-4c10-aaf0-b6ae018db066	{"sub": "5bbca4ac-ad78-4c10-aaf0-b6ae018db066", "email_verified": false, "phone_verified": false}	phone	2024-07-26 01:17:33.157395+00	2024-07-26 01:17:33.157446+00	2024-07-26 01:17:33.157446+00	591c2bd7-1545-4c40-912c-848e0d7ac2b3
9c2f5472-e0f3-4109-9ff6-d6c571ce3475	9c2f5472-e0f3-4109-9ff6-d6c571ce3475	{"sub": "9c2f5472-e0f3-4109-9ff6-d6c571ce3475", "email_verified": false, "phone_verified": false}	phone	2024-07-26 01:23:32.581132+00	2024-07-26 01:23:32.581183+00	2024-07-26 01:23:32.581183+00	bedd2084-0775-4522-bbaf-2323e550695d
d650f4c8-d60d-4f03-b210-ab71ee77144a	d650f4c8-d60d-4f03-b210-ab71ee77144a	{"sub": "d650f4c8-d60d-4f03-b210-ab71ee77144a", "email_verified": false, "phone_verified": false}	phone	2024-07-26 01:27:19.751267+00	2024-07-26 01:27:19.751317+00	2024-07-26 01:27:19.751317+00	4b4eb5d6-3e93-40f4-85af-c0f2aeac651c
70c93ba9-dd94-4b4f-b8b1-6a6da8e8bbcf	70c93ba9-dd94-4b4f-b8b1-6a6da8e8bbcf	{"sub": "70c93ba9-dd94-4b4f-b8b1-6a6da8e8bbcf", "email_verified": false, "phone_verified": false}	phone	2024-07-26 01:28:49.260108+00	2024-07-26 01:28:49.260162+00	2024-07-26 01:28:49.260162+00	659002da-2e43-47f3-b26a-dd2396147e32
430a2343-05bc-44ee-9bc8-60bd76f58776	430a2343-05bc-44ee-9bc8-60bd76f58776	{"sub": "430a2343-05bc-44ee-9bc8-60bd76f58776", "email_verified": false, "phone_verified": false}	phone	2024-07-26 01:31:19.863006+00	2024-07-26 01:31:19.86306+00	2024-07-26 01:31:19.86306+00	66d4193a-5b56-4eef-b3bd-901a187ce597
c1e922fd-458f-4969-84bc-0861ea992d18	c1e922fd-458f-4969-84bc-0861ea992d18	{"sub": "c1e922fd-458f-4969-84bc-0861ea992d18", "email_verified": false, "phone_verified": false}	phone	2024-07-26 02:01:18.568992+00	2024-07-26 02:01:18.569039+00	2024-07-26 02:01:18.569039+00	caf80eea-5b1a-4a94-8cfb-666c56d0362e
e9d57f4c-94fb-4bca-be85-3ed7d7b18973	e9d57f4c-94fb-4bca-be85-3ed7d7b18973	{"sub": "e9d57f4c-94fb-4bca-be85-3ed7d7b18973", "email_verified": false, "phone_verified": false}	phone	2024-07-26 02:16:00.744599+00	2024-07-26 02:16:00.74465+00	2024-07-26 02:16:00.74465+00	293bd967-d379-4c5c-bbca-647c49c0c04c
b0381b2c-f449-48d5-8e8d-aa38448346d6	b0381b2c-f449-48d5-8e8d-aa38448346d6	{"sub": "b0381b2c-f449-48d5-8e8d-aa38448346d6", "email_verified": false, "phone_verified": false}	phone	2024-07-26 02:22:01.542202+00	2024-07-26 02:22:01.542258+00	2024-07-26 02:22:01.542258+00	6993ae00-866d-42c5-80a4-2faaee89756e
3c98aa81-e773-416f-8705-6bc13588a7c4	3c98aa81-e773-416f-8705-6bc13588a7c4	{"sub": "3c98aa81-e773-416f-8705-6bc13588a7c4", "email_verified": false, "phone_verified": false}	phone	2024-07-26 02:22:08.388461+00	2024-07-26 02:22:08.388508+00	2024-07-26 02:22:08.388508+00	3a47ebe4-5ac7-422e-820d-158e6e88da05
18bde0a1-f3ca-4106-97ce-cbef943bf4e6	18bde0a1-f3ca-4106-97ce-cbef943bf4e6	{"sub": "18bde0a1-f3ca-4106-97ce-cbef943bf4e6", "email_verified": false, "phone_verified": false}	phone	2024-07-26 02:34:23.669022+00	2024-07-26 02:34:23.669072+00	2024-07-26 02:34:23.669072+00	ea87453f-148c-4c3e-974b-9f3e1ea372ed
f7c330dd-dd80-4642-ac1f-db0eac5f5466	f7c330dd-dd80-4642-ac1f-db0eac5f5466	{"sub": "f7c330dd-dd80-4642-ac1f-db0eac5f5466", "email_verified": false, "phone_verified": false}	phone	2024-07-26 06:41:41.351978+00	2024-07-26 06:41:41.352029+00	2024-07-26 06:41:41.352029+00	978e2096-e59b-45fd-bc63-32d60e8ddd51
a0a837ef-7717-40f7-ba7a-7d202d18d4a4	a0a837ef-7717-40f7-ba7a-7d202d18d4a4	{"sub": "a0a837ef-7717-40f7-ba7a-7d202d18d4a4", "email_verified": false, "phone_verified": false}	phone	2024-07-26 19:36:13.907441+00	2024-07-26 19:36:13.907504+00	2024-07-26 19:36:13.907504+00	11691fd4-ffa4-4d66-8d83-f9e625f14d4c
eee8a84c-0fdd-4354-ab42-d18c0ba4c551	eee8a84c-0fdd-4354-ab42-d18c0ba4c551	{"sub": "eee8a84c-0fdd-4354-ab42-d18c0ba4c551", "email_verified": false, "phone_verified": false}	phone	2024-07-27 20:26:37.841438+00	2024-07-27 20:26:37.841503+00	2024-07-27 20:26:37.841503+00	282c5016-47b1-4a46-910e-d26f550c5f7b
d199297a-cad3-43a8-9b92-4c54e1fc5486	d199297a-cad3-43a8-9b92-4c54e1fc5486	{"sub": "d199297a-cad3-43a8-9b92-4c54e1fc5486", "email_verified": false, "phone_verified": false}	phone	2024-07-28 04:40:40.350972+00	2024-07-28 04:40:40.351029+00	2024-07-28 04:40:40.351029+00	92d49c87-7d7e-47c7-9e5a-728c067f448f
e7614e8d-81cd-4cf3-9774-b8bce43245ce	e7614e8d-81cd-4cf3-9774-b8bce43245ce	{"sub": "e7614e8d-81cd-4cf3-9774-b8bce43245ce", "email_verified": false, "phone_verified": false}	phone	2024-07-28 04:40:53.248377+00	2024-07-28 04:40:53.248421+00	2024-07-28 04:40:53.248421+00	51f9689b-3c44-42dd-a07d-4bd3ff626588
fc5da05b-8192-4127-9b48-e6c514bbf4f7	fc5da05b-8192-4127-9b48-e6c514bbf4f7	{"sub": "fc5da05b-8192-4127-9b48-e6c514bbf4f7", "email_verified": false, "phone_verified": false}	phone	2024-07-28 04:59:00.353362+00	2024-07-28 04:59:00.353424+00	2024-07-28 04:59:00.353424+00	16546c70-3f3a-4ae4-b4da-d87b38c9799a
e355efae-cc06-4737-8439-f731e383b285	e355efae-cc06-4737-8439-f731e383b285	{"sub": "e355efae-cc06-4737-8439-f731e383b285", "email_verified": false, "phone_verified": false}	phone	2024-07-28 17:55:16.112395+00	2024-07-28 17:55:16.112456+00	2024-07-28 17:55:16.112456+00	e373bee5-c88e-4445-89da-bc012caf9fb0
e5ae9b3b-c793-4597-b82d-f9f6c461facf	e5ae9b3b-c793-4597-b82d-f9f6c461facf	{"sub": "e5ae9b3b-c793-4597-b82d-f9f6c461facf", "email_verified": false, "phone_verified": false}	phone	2024-07-29 21:58:40.849028+00	2024-07-29 21:58:40.849091+00	2024-07-29 21:58:40.849091+00	15a1b669-b155-4442-9fd9-a2bd76fa02d0
ae0fe4bc-71a4-4a5c-bee6-f1e3af7689f9	ae0fe4bc-71a4-4a5c-bee6-f1e3af7689f9	{"sub": "ae0fe4bc-71a4-4a5c-bee6-f1e3af7689f9", "email_verified": false, "phone_verified": false}	phone	2024-07-30 15:37:25.763711+00	2024-07-30 15:37:25.763775+00	2024-07-30 15:37:25.763775+00	82b758a7-13c3-43ce-ba96-305de1dce7d2
58cebd00-3cc8-4ee9-926c-16833a66651d	58cebd00-3cc8-4ee9-926c-16833a66651d	{"sub": "58cebd00-3cc8-4ee9-926c-16833a66651d", "email": "oseleonose@gmail.com", "email_verified": false, "phone_verified": false}	email	2024-07-30 15:45:36.685522+00	2024-07-30 15:45:36.685579+00	2024-07-30 15:45:36.685579+00	022447a6-a26d-426b-884c-e203f0d85fe3
\.


--
-- Data for Name: instances; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.instances (id, uuid, raw_base_config, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: mfa_amr_claims; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_amr_claims (session_id, created_at, updated_at, authentication_method, id) FROM stdin;
65694f0c-7817-408e-9c14-5396f8256ba2	2024-07-26 01:23:35.357945+00	2024-07-26 01:23:35.357945+00	otp	0cd44601-6c35-4276-a47d-3ad73ebfc2e0
6c81b68f-4083-47f5-94ea-c9766465d5fe	2024-07-26 01:27:22.587162+00	2024-07-26 01:27:22.587162+00	otp	052fedb8-cfc6-49f0-a6d6-e98212d2e4a4
73c277a8-b8e9-4192-9443-98a5b333219b	2024-07-26 01:29:04.031131+00	2024-07-26 01:29:04.031131+00	otp	0694851c-923b-44d3-b320-a20c459b0acc
7ca017be-1162-4218-827b-bed96ee4fa4f	2024-07-26 01:31:23.943452+00	2024-07-26 01:31:23.943452+00	otp	dbacf797-16f6-4d79-ba01-2650eead53db
01f96f9b-c36a-4feb-a9f2-d2014f7c283f	2024-07-26 02:01:34.925088+00	2024-07-26 02:01:34.925088+00	otp	9a85263f-50a6-4adf-a68f-fafd7e5dfdc7
e8638979-e918-4233-8d19-b4e38fd94072	2024-07-26 02:16:07.97571+00	2024-07-26 02:16:07.97571+00	otp	64d13976-ba44-4d71-a01e-781a8818d579
a4a08870-e681-4249-9646-f6d1119cfcc4	2024-07-26 02:22:05.466368+00	2024-07-26 02:22:05.466368+00	otp	789db0d3-fa23-4d4e-b1a9-b1ab6d8f59fd
4dad5e61-79a5-491a-8504-4869c6f8a63f	2024-07-26 02:22:19.894829+00	2024-07-26 02:22:19.894829+00	otp	52721153-e002-4999-803a-c0295618ca94
bc5661f0-d306-4b5b-b819-021ba04fb9f0	2024-07-26 02:34:25.039622+00	2024-07-26 02:34:25.039622+00	otp	3d79eba8-5455-4cc4-a360-f189be7fbab4
cd296018-7364-4034-bc81-23447ec6461e	2024-07-26 06:41:45.339054+00	2024-07-26 06:41:45.339054+00	otp	a2f21ba0-a1ec-456e-920a-7f3056d70add
0e929324-e73b-4944-89a0-7b3e04a2d79a	2024-07-27 20:26:42.025643+00	2024-07-27 20:26:42.025643+00	otp	e4c8961c-9c9e-4d71-9d1d-441a81e72832
c5439630-9ffa-4567-944f-c81090796c11	2024-07-28 03:33:15.084136+00	2024-07-28 03:33:15.084136+00	otp	a3581be7-d33d-4100-a935-1c91f373c49a
cf192be6-07a3-4e16-aef7-e2ac18f0ec0d	2024-07-28 04:40:44.445979+00	2024-07-28 04:40:44.445979+00	otp	e22935af-cf1f-4b9f-805f-94bfbeae577c
3b36f8eb-ee4b-4011-8c11-a0a4254684f2	2024-07-28 04:40:56.939329+00	2024-07-28 04:40:56.939329+00	otp	61baf7bc-5a97-4457-9040-640c5b558a82
4d10e949-42f7-4eeb-b2b4-ced68877c711	2024-07-28 15:11:08.340789+00	2024-07-28 15:11:08.340789+00	otp	2739a828-e7ca-42dc-a66c-915a6151f1ca
3ccf4cf8-cdda-49f8-abad-6583f2d178ba	2024-07-28 17:55:21.919455+00	2024-07-28 17:55:21.919455+00	otp	90bff8fb-8d94-4a20-85de-16cb98501884
471b70b8-039e-4107-a5f7-7ddca26e7516	2024-07-29 03:55:00.264931+00	2024-07-29 03:55:00.264931+00	otp	5c5de71e-8d37-4ad7-9a28-d59c0c96eab5
2e3822aa-fc23-4b18-b1af-bb54c2a3b437	2024-07-29 16:58:14.043874+00	2024-07-29 16:58:14.043874+00	otp	1881770f-0346-4527-9a7d-2f9556d1ef7e
6efcfbdb-eb15-4608-a4e1-961a71dad270	2024-07-29 19:12:49.807996+00	2024-07-29 19:12:49.807996+00	otp	8e026f06-935c-481e-8fea-13d9310e4ae0
7becaea5-86ce-4f8d-9e28-8885800ecb4d	2024-07-29 21:59:01.849871+00	2024-07-29 21:59:01.849871+00	otp	0d0da9fb-43b2-4685-bb24-72b3ea8cac45
80c7adaf-6350-480a-939c-373164a95d97	2024-07-30 15:39:40.938387+00	2024-07-30 15:39:40.938387+00	otp	822f2f28-d9dd-485f-9558-d88e9a1a7dbd
\.


--
-- Data for Name: mfa_challenges; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_challenges (id, factor_id, created_at, verified_at, ip_address) FROM stdin;
\.


--
-- Data for Name: mfa_factors; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_factors (id, user_id, friendly_name, factor_type, status, created_at, updated_at, secret) FROM stdin;
\.


--
-- Data for Name: one_time_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.one_time_tokens (id, user_id, token_type, token_hash, relates_to, created_at, updated_at) FROM stdin;
44f518b0-c906-426b-a8e5-8f0136252500	b82261ec-3aca-41e2-a3cf-c0d2b5c8558b	confirmation_token	c53da42fe7f7c017cc63d17a068999390e8222cba151a9fb1a51cf5c	14077470791	2024-07-29 14:37:01.699658	2024-07-29 14:37:01.699658
cddb121e-6d08-4ebd-912e-8e3f989a583a	ae0fe4bc-71a4-4a5c-bee6-f1e3af7689f9	confirmation_token	aec037c5872dfb6b33112551581848630ee2e344e4b8917827f33d0e	13015032787	2024-07-30 15:46:00.006354	2024-07-30 15:46:00.006354
\.


--
-- Data for Name: refresh_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.refresh_tokens (instance_id, id, token, user_id, revoked, created_at, updated_at, parent, session_id) FROM stdin;
00000000-0000-0000-0000-000000000000	67	bdJ1b_b3h5b7OrIf8ZAVow	18bde0a1-f3ca-4106-97ce-cbef943bf4e6	t	2024-07-29 23:58:33.438582+00	2024-07-30 02:07:33.542161+00	jV7CfjMoGYU_gfvSnye50Q	6efcfbdb-eb15-4608-a4e1-961a71dad270
00000000-0000-0000-0000-000000000000	68	aZp0vli-zgktV-rD_Q-DUA	18bde0a1-f3ca-4106-97ce-cbef943bf4e6	f	2024-07-30 02:07:33.5473+00	2024-07-30 02:07:33.5473+00	bdJ1b_b3h5b7OrIf8ZAVow	6efcfbdb-eb15-4608-a4e1-961a71dad270
00000000-0000-0000-0000-000000000000	25	IsJF5GIAvL4GgqSP82OlCQ	9c2f5472-e0f3-4109-9ff6-d6c571ce3475	t	2024-07-26 13:04:09.085648+00	2024-07-30 02:26:44.752253+00	XcKP6IUfoEZVh-dykdnXMQ	65694f0c-7817-408e-9c14-5396f8256ba2
00000000-0000-0000-0000-000000000000	69	JgLqk3HRqA69sBKhy7N8fA	9c2f5472-e0f3-4109-9ff6-d6c571ce3475	t	2024-07-30 02:26:44.754249+00	2024-07-30 05:16:52.953081+00	IsJF5GIAvL4GgqSP82OlCQ	65694f0c-7817-408e-9c14-5396f8256ba2
00000000-0000-0000-0000-000000000000	70	jUVoDtLzVxGm4tQ-beAwUg	9c2f5472-e0f3-4109-9ff6-d6c571ce3475	f	2024-07-30 05:16:52.954388+00	2024-07-30 05:16:52.954388+00	JgLqk3HRqA69sBKhy7N8fA	65694f0c-7817-408e-9c14-5396f8256ba2
00000000-0000-0000-0000-000000000000	72	W_QChHiW7MricbSLe4z8Nw	ae0fe4bc-71a4-4a5c-bee6-f1e3af7689f9	f	2024-07-30 15:39:40.935663+00	2024-07-30 15:39:40.935663+00	\N	80c7adaf-6350-480a-939c-373164a95d97
00000000-0000-0000-0000-000000000000	10	DjhVT7Bi5hOiOBrPhVP8bA	70c93ba9-dd94-4b4f-b8b1-6a6da8e8bbcf	f	2024-07-26 01:29:04.028994+00	2024-07-26 01:29:04.028994+00	\N	73c277a8-b8e9-4192-9443-98a5b333219b
00000000-0000-0000-0000-000000000000	11	gERTf8_2TN_QZ9sVOv2pYQ	430a2343-05bc-44ee-9bc8-60bd76f58776	f	2024-07-26 01:31:23.941262+00	2024-07-26 01:31:23.941262+00	\N	7ca017be-1162-4218-827b-bed96ee4fa4f
00000000-0000-0000-0000-000000000000	14	jwam1jzX9_NRzBJyFKQwtw	c1e922fd-458f-4969-84bc-0861ea992d18	f	2024-07-26 02:01:34.923159+00	2024-07-26 02:01:34.923159+00	\N	01f96f9b-c36a-4feb-a9f2-d2014f7c283f
00000000-0000-0000-0000-000000000000	15	a9lTBhL33OTiR2pQ-I0pXQ	e9d57f4c-94fb-4bca-be85-3ed7d7b18973	f	2024-07-26 02:16:07.973689+00	2024-07-26 02:16:07.973689+00	\N	e8638979-e918-4233-8d19-b4e38fd94072
00000000-0000-0000-0000-000000000000	17	PldYVKu4C_42ZaMX2uucjw	b0381b2c-f449-48d5-8e8d-aa38448346d6	f	2024-07-26 02:22:05.464124+00	2024-07-26 02:22:05.464124+00	\N	a4a08870-e681-4249-9646-f6d1119cfcc4
00000000-0000-0000-0000-000000000000	18	-ujC81qlrvg9SbfvO7-iNA	3c98aa81-e773-416f-8705-6bc13588a7c4	f	2024-07-26 02:22:19.893194+00	2024-07-26 02:22:19.893194+00	\N	4dad5e61-79a5-491a-8504-4869c6f8a63f
00000000-0000-0000-0000-000000000000	8	YThJwcDcmsvbn9P7a3H03Q	9c2f5472-e0f3-4109-9ff6-d6c571ce3475	t	2024-07-26 01:23:35.354276+00	2024-07-26 02:24:00.428553+00	\N	65694f0c-7817-408e-9c14-5396f8256ba2
00000000-0000-0000-0000-000000000000	20	MvL_5gHTewPlRC6swzZmTA	3c98aa81-e773-416f-8705-6bc13588a7c4	f	2024-07-26 02:34:25.037344+00	2024-07-26 02:34:25.037344+00	\N	bc5661f0-d306-4b5b-b819-021ba04fb9f0
00000000-0000-0000-0000-000000000000	19	0ODp8sL4UexeJchDkIAnAA	9c2f5472-e0f3-4109-9ff6-d6c571ce3475	t	2024-07-26 02:24:00.429589+00	2024-07-26 04:37:10.486058+00	YThJwcDcmsvbn9P7a3H03Q	65694f0c-7817-408e-9c14-5396f8256ba2
00000000-0000-0000-0000-000000000000	23	XcKP6IUfoEZVh-dykdnXMQ	9c2f5472-e0f3-4109-9ff6-d6c571ce3475	t	2024-07-26 04:37:10.48671+00	2024-07-26 13:04:09.081718+00	0ODp8sL4UexeJchDkIAnAA	65694f0c-7817-408e-9c14-5396f8256ba2
00000000-0000-0000-0000-000000000000	9	7OtDTU_vJjo4N2hmfbwL2A	d650f4c8-d60d-4f03-b210-ab71ee77144a	t	2024-07-26 01:27:22.585104+00	2024-07-26 15:36:36.424043+00	\N	6c81b68f-4083-47f5-94ea-c9766465d5fe
00000000-0000-0000-0000-000000000000	27	_rMm_ToKsQyTgyCtOjAk8g	d650f4c8-d60d-4f03-b210-ab71ee77144a	f	2024-07-26 15:36:36.425237+00	2024-07-26 15:36:36.425237+00	7OtDTU_vJjo4N2hmfbwL2A	6c81b68f-4083-47f5-94ea-c9766465d5fe
00000000-0000-0000-0000-000000000000	24	ND0sUpHlSLDBEfizeMXMoQ	f7c330dd-dd80-4642-ac1f-db0eac5f5466	t	2024-07-26 06:41:45.333023+00	2024-07-26 16:06:45.109341+00	\N	cd296018-7364-4034-bc81-23447ec6461e
00000000-0000-0000-0000-000000000000	28	q4XK05C_xZ2iulecp6e4sA	f7c330dd-dd80-4642-ac1f-db0eac5f5466	t	2024-07-26 16:06:45.111559+00	2024-07-26 17:54:19.849865+00	ND0sUpHlSLDBEfizeMXMoQ	cd296018-7364-4034-bc81-23447ec6461e
00000000-0000-0000-0000-000000000000	29	pgnjtXRmgYVeHyrpAoG2ZQ	f7c330dd-dd80-4642-ac1f-db0eac5f5466	t	2024-07-26 17:54:19.850577+00	2024-07-26 22:07:18.596198+00	q4XK05C_xZ2iulecp6e4sA	cd296018-7364-4034-bc81-23447ec6461e
00000000-0000-0000-0000-000000000000	32	J_qM8QGW24k6mMUltiyjYA	f7c330dd-dd80-4642-ac1f-db0eac5f5466	t	2024-07-26 22:07:18.596861+00	2024-07-27 00:52:40.953929+00	pgnjtXRmgYVeHyrpAoG2ZQ	cd296018-7364-4034-bc81-23447ec6461e
00000000-0000-0000-0000-000000000000	41	Dg_j_kI02505GpUTLeEtEA	eee8a84c-0fdd-4354-ab42-d18c0ba4c551	f	2024-07-27 20:26:42.022654+00	2024-07-27 20:26:42.022654+00	\N	0e929324-e73b-4944-89a0-7b3e04a2d79a
00000000-0000-0000-0000-000000000000	46	i12S8bE6KPtbMP7XRCJCVA	e7614e8d-81cd-4cf3-9774-b8bce43245ce	t	2024-07-28 04:40:56.938047+00	2024-07-28 06:36:59.181129+00	\N	3b36f8eb-ee4b-4011-8c11-a0a4254684f2
00000000-0000-0000-0000-000000000000	50	uNaf12gkso8w54du1r3dOg	e7614e8d-81cd-4cf3-9774-b8bce43245ce	f	2024-07-28 06:36:59.183849+00	2024-07-28 06:36:59.183849+00	i12S8bE6KPtbMP7XRCJCVA	3b36f8eb-ee4b-4011-8c11-a0a4254684f2
00000000-0000-0000-0000-000000000000	45	Z-MK-j-OnLxrdWkb9Z-Nqg	d199297a-cad3-43a8-9b92-4c54e1fc5486	t	2024-07-28 04:40:44.440648+00	2024-07-28 06:47:55.04483+00	\N	cf192be6-07a3-4e16-aef7-e2ac18f0ec0d
00000000-0000-0000-0000-000000000000	51	dAD7LQ2n09urYx57--OlEQ	d199297a-cad3-43a8-9b92-4c54e1fc5486	f	2024-07-28 06:47:55.046474+00	2024-07-28 06:47:55.046474+00	Z-MK-j-OnLxrdWkb9Z-Nqg	cf192be6-07a3-4e16-aef7-e2ac18f0ec0d
00000000-0000-0000-0000-000000000000	43	d0G_BgpApKDNhaMNFmS3Bg	f7c330dd-dd80-4642-ac1f-db0eac5f5466	t	2024-07-28 03:33:15.080483+00	2024-07-28 13:52:16.346844+00	\N	c5439630-9ffa-4567-944f-c81090796c11
00000000-0000-0000-0000-000000000000	52	gAUAOu6uKtsF9lt5vhG29w	f7c330dd-dd80-4642-ac1f-db0eac5f5466	t	2024-07-28 13:52:16.348806+00	2024-07-28 14:57:38.202755+00	d0G_BgpApKDNhaMNFmS3Bg	c5439630-9ffa-4567-944f-c81090796c11
00000000-0000-0000-0000-000000000000	53	9DQ9Zt32OTa9OyVq4uPMPg	f7c330dd-dd80-4642-ac1f-db0eac5f5466	f	2024-07-28 14:57:38.203837+00	2024-07-28 14:57:38.203837+00	gAUAOu6uKtsF9lt5vhG29w	c5439630-9ffa-4567-944f-c81090796c11
00000000-0000-0000-0000-000000000000	55	pGrbMdN1SLRIfKhnRh7XJg	5bbca4ac-ad78-4c10-aaf0-b6ae018db066	f	2024-07-28 15:11:08.335081+00	2024-07-28 15:11:08.335081+00	\N	4d10e949-42f7-4eeb-b2b4-ced68877c711
00000000-0000-0000-0000-000000000000	33	rvpkPMd2MvhEbmFe6Tkp3w	f7c330dd-dd80-4642-ac1f-db0eac5f5466	t	2024-07-27 00:52:40.955152+00	2024-07-28 17:51:20.246465+00	J_qM8QGW24k6mMUltiyjYA	cd296018-7364-4034-bc81-23447ec6461e
00000000-0000-0000-0000-000000000000	58	9lTHZkD14H7UEfRU_JRSQw	f7c330dd-dd80-4642-ac1f-db0eac5f5466	f	2024-07-28 17:51:20.248923+00	2024-07-28 17:51:20.248923+00	rvpkPMd2MvhEbmFe6Tkp3w	cd296018-7364-4034-bc81-23447ec6461e
00000000-0000-0000-0000-000000000000	59	XLAzO0pRSYD0C4Zpi4ZMsg	e355efae-cc06-4737-8439-f731e383b285	f	2024-07-28 17:55:21.917328+00	2024-07-28 17:55:21.917328+00	\N	3ccf4cf8-cdda-49f8-abad-6583f2d178ba
00000000-0000-0000-0000-000000000000	61	QGiY9cxjxwrOqdMuKn_Oig	c1e922fd-458f-4969-84bc-0861ea992d18	f	2024-07-29 03:55:00.243337+00	2024-07-29 03:55:00.243337+00	\N	471b70b8-039e-4107-a5f7-7ddca26e7516
00000000-0000-0000-0000-000000000000	63	IJbDaPMWwG0vGXX20iiUhw	c1e922fd-458f-4969-84bc-0861ea992d18	f	2024-07-29 16:58:14.038147+00	2024-07-29 16:58:14.038147+00	\N	2e3822aa-fc23-4b18-b1af-bb54c2a3b437
00000000-0000-0000-0000-000000000000	64	xCEBIxSIKOQgIroCA1_NZg	18bde0a1-f3ca-4106-97ce-cbef943bf4e6	t	2024-07-29 19:12:49.803897+00	2024-07-29 21:29:02.415871+00	\N	6efcfbdb-eb15-4608-a4e1-961a71dad270
00000000-0000-0000-0000-000000000000	66	2hKdexlJxlye3yKW5VNBNg	e5ae9b3b-c793-4597-b82d-f9f6c461facf	f	2024-07-29 21:59:01.845056+00	2024-07-29 21:59:01.845056+00	\N	7becaea5-86ce-4f8d-9e28-8885800ecb4d
00000000-0000-0000-0000-000000000000	65	jV7CfjMoGYU_gfvSnye50Q	18bde0a1-f3ca-4106-97ce-cbef943bf4e6	t	2024-07-29 21:29:02.418515+00	2024-07-29 23:58:33.435212+00	xCEBIxSIKOQgIroCA1_NZg	6efcfbdb-eb15-4608-a4e1-961a71dad270
\.


--
-- Data for Name: saml_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.saml_providers (id, sso_provider_id, entity_id, metadata_xml, metadata_url, attribute_mapping, created_at, updated_at, name_id_format) FROM stdin;
\.


--
-- Data for Name: saml_relay_states; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.saml_relay_states (id, sso_provider_id, request_id, for_email, redirect_to, created_at, updated_at, flow_state_id) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.schema_migrations (version) FROM stdin;
20171026211738
20171026211808
20171026211834
20180103212743
20180108183307
20180119214651
20180125194653
00
20210710035447
20210722035447
20210730183235
20210909172000
20210927181326
20211122151130
20211124214934
20211202183645
20220114185221
20220114185340
20220224000811
20220323170000
20220429102000
20220531120530
20220614074223
20220811173540
20221003041349
20221003041400
20221011041400
20221020193600
20221021073300
20221021082433
20221027105023
20221114143122
20221114143410
20221125140132
20221208132122
20221215195500
20221215195800
20221215195900
20230116124310
20230116124412
20230131181311
20230322519590
20230402418590
20230411005111
20230508135423
20230523124323
20230818113222
20230914180801
20231027141322
20231114161723
20231117164230
20240115144230
20240214120130
20240306115329
20240314092811
20240427152123
20240612123726
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sessions (id, user_id, created_at, updated_at, factor_id, aal, not_after, refreshed_at, user_agent, ip, tag) FROM stdin;
73c277a8-b8e9-4192-9443-98a5b333219b	70c93ba9-dd94-4b4f-b8b1-6a6da8e8bbcf	2024-07-26 01:29:04.027818+00	2024-07-26 01:29:04.027818+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36	136.25.95.29	\N
7ca017be-1162-4218-827b-bed96ee4fa4f	430a2343-05bc-44ee-9bc8-60bd76f58776	2024-07-26 01:31:23.939995+00	2024-07-26 01:31:23.939995+00	\N	aal1	\N	\N	Mozilla/5.0 (iPhone; CPU iPhone OS 16_1_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.1 Mobile/15E148 Safari/604.1	71.47.73.192	\N
01f96f9b-c36a-4feb-a9f2-d2014f7c283f	c1e922fd-458f-4969-84bc-0861ea992d18	2024-07-26 02:01:34.921946+00	2024-07-26 02:01:34.921946+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.5 Safari/605.1.15	71.47.73.192	\N
e8638979-e918-4233-8d19-b4e38fd94072	e9d57f4c-94fb-4bca-be85-3ed7d7b18973	2024-07-26 02:16:07.972525+00	2024-07-26 02:16:07.972525+00	\N	aal1	\N	\N	Mozilla/5.0 (iPhone; CPU iPhone OS 17_5_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.5 Mobile/15E148 Safari/604.1	104.28.39.45	\N
a4a08870-e681-4249-9646-f6d1119cfcc4	b0381b2c-f449-48d5-8e8d-aa38448346d6	2024-07-26 02:22:05.463007+00	2024-07-26 02:22:05.463007+00	\N	aal1	\N	\N	Mozilla/5.0 (iPhone; CPU iPhone OS 17_5_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.5 Mobile/15E148 Safari/604.1	174.229.49.51	\N
4dad5e61-79a5-491a-8504-4869c6f8a63f	3c98aa81-e773-416f-8705-6bc13588a7c4	2024-07-26 02:22:19.892399+00	2024-07-26 02:22:19.892399+00	\N	aal1	\N	\N	Mozilla/5.0 (iPhone; CPU iPhone OS 17_2_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.2 Mobile/15E148 Safari/604.1	98.255.121.39	\N
2e3822aa-fc23-4b18-b1af-bb54c2a3b437	c1e922fd-458f-4969-84bc-0861ea992d18	2024-07-29 16:58:14.035678+00	2024-07-29 16:58:14.035678+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.5 Safari/605.1.15	71.47.73.192	\N
bc5661f0-d306-4b5b-b819-021ba04fb9f0	3c98aa81-e773-416f-8705-6bc13588a7c4	2024-07-26 02:34:25.036081+00	2024-07-26 02:34:25.036081+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.5 Safari/605.1.15	98.255.121.39	\N
3b36f8eb-ee4b-4011-8c11-a0a4254684f2	e7614e8d-81cd-4cf3-9774-b8bce43245ce	2024-07-28 04:40:56.93506+00	2024-07-28 06:36:59.187691+00	\N	aal1	\N	2024-07-28 06:36:59.187617	Mozilla/5.0 (iPhone; CPU iPhone OS 17_5_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.5 Mobile/15E148 Safari/604.1	73.76.37.67	\N
6c81b68f-4083-47f5-94ea-c9766465d5fe	d650f4c8-d60d-4f03-b210-ab71ee77144a	2024-07-26 01:27:22.583549+00	2024-07-26 15:36:36.427766+00	\N	aal1	\N	2024-07-26 15:36:36.427694	Mozilla/5.0 (iPhone; CPU iPhone OS 17_5_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.5 Mobile/15E148 Safari/604.1	151.205.108.133	\N
cf192be6-07a3-4e16-aef7-e2ac18f0ec0d	d199297a-cad3-43a8-9b92-4c54e1fc5486	2024-07-28 04:40:44.438097+00	2024-07-28 06:47:55.049181+00	\N	aal1	\N	2024-07-28 06:47:55.049098	Mozilla/5.0 (iPhone; CPU iPhone OS 17_5_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.5 Mobile/15E148 Safari/604.1	76.142.47.20	\N
c5439630-9ffa-4567-944f-c81090796c11	f7c330dd-dd80-4642-ac1f-db0eac5f5466	2024-07-28 03:33:15.078919+00	2024-07-28 14:57:38.206166+00	\N	aal1	\N	2024-07-28 14:57:38.206069	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36	173.224.105.96	\N
0e929324-e73b-4944-89a0-7b3e04a2d79a	eee8a84c-0fdd-4354-ab42-d18c0ba4c551	2024-07-27 20:26:42.021266+00	2024-07-27 20:26:42.021266+00	\N	aal1	\N	\N	Mozilla/5.0 (iPhone; CPU iPhone OS 17_5_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.5 Mobile/15E148 Safari/604.1	174.224.112.217	\N
4d10e949-42f7-4eeb-b2b4-ced68877c711	5bbca4ac-ad78-4c10-aaf0-b6ae018db066	2024-07-28 15:11:08.331544+00	2024-07-28 15:11:08.331544+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36	66.65.129.46	\N
7becaea5-86ce-4f8d-9e28-8885800ecb4d	e5ae9b3b-c793-4597-b82d-f9f6c461facf	2024-07-29 21:59:01.84323+00	2024-07-29 21:59:01.84323+00	\N	aal1	\N	\N	Mozilla/5.0 (iPhone; CPU iPhone OS 17_5_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.5 Mobile/15E148 Safari/604.1	198.134.98.50	\N
cd296018-7364-4034-bc81-23447ec6461e	f7c330dd-dd80-4642-ac1f-db0eac5f5466	2024-07-26 06:41:45.329725+00	2024-07-28 17:51:20.251393+00	\N	aal1	\N	2024-07-28 17:51:20.251323	Mozilla/5.0 (iPhone; CPU iPhone OS 17_5_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.5 Mobile/15E148 Safari/604.1	157.130.145.10	\N
3ccf4cf8-cdda-49f8-abad-6583f2d178ba	e355efae-cc06-4737-8439-f731e383b285	2024-07-28 17:55:21.915623+00	2024-07-28 17:55:21.915623+00	\N	aal1	\N	\N	Mozilla/5.0 (iPhone; CPU iPhone OS 17_5_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.5 Mobile/15E148 Safari/604.1	96.91.37.9	\N
6efcfbdb-eb15-4608-a4e1-961a71dad270	18bde0a1-f3ca-4106-97ce-cbef943bf4e6	2024-07-29 19:12:49.801843+00	2024-07-30 02:07:33.55998+00	\N	aal1	\N	2024-07-30 02:07:33.559873	Mozilla/5.0 (iPhone; CPU iPhone OS 17_5_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.5 Mobile/15E148 Safari/604.1	71.47.73.192	\N
471b70b8-039e-4107-a5f7-7ddca26e7516	c1e922fd-458f-4969-84bc-0861ea992d18	2024-07-29 03:55:00.233258+00	2024-07-29 03:55:00.233258+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.5 Safari/605.1.15	71.47.73.192	\N
65694f0c-7817-408e-9c14-5396f8256ba2	9c2f5472-e0f3-4109-9ff6-d6c571ce3475	2024-07-26 01:23:35.350768+00	2024-07-30 05:16:52.956943+00	\N	aal1	\N	2024-07-30 05:16:52.95687	Mozilla/5.0 (iPhone; CPU iPhone OS 17_5_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.5 Mobile/15E148 Safari/604.1	207.96.89.203	\N
80c7adaf-6350-480a-939c-373164a95d97	ae0fe4bc-71a4-4a5c-bee6-f1e3af7689f9	2024-07-30 15:39:40.934646+00	2024-07-30 15:39:40.934646+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36	174.194.128.187	\N
\.


--
-- Data for Name: sso_domains; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sso_domains (id, sso_provider_id, domain, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: sso_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sso_providers (id, resource_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, invited_at, confirmation_token, confirmation_sent_at, recovery_token, recovery_sent_at, email_change_token_new, email_change, email_change_sent_at, last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at, phone, phone_confirmed_at, phone_change, phone_change_token, phone_change_sent_at, email_change_token_current, email_change_confirm_status, banned_until, reauthentication_token, reauthentication_sent_at, is_sso_user, deleted_at, is_anonymous) FROM stdin;
00000000-0000-0000-0000-000000000000	9c2f5472-e0f3-4109-9ff6-d6c571ce3475	authenticated	authenticated	\N	$2a$10$AZNx4G.RScOeCQE6KU3S5.baEolmjGnKGGNe9zwatDMwo7/5lvysm	\N	\N		2024-07-26 01:23:32.587515+00		\N			\N	2024-07-26 01:23:35.350687+00	{"provider": "phone", "providers": ["phone"]}	{"sub": "9c2f5472-e0f3-4109-9ff6-d6c571ce3475", "email_verified": false, "phone_verified": false}	\N	2024-07-26 01:23:32.574911+00	2024-07-30 05:16:52.955595+00	14697044024	2024-07-26 01:23:35.344681+00			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	430a2343-05bc-44ee-9bc8-60bd76f58776	authenticated	authenticated	\N	$2a$10$rqgqANmO8mAd.BV/OVANcO8lHU8AUKlk76uL.ikP14JeYqiD/mqoq	\N	\N		2024-07-26 01:31:19.867148+00		\N			\N	2024-07-26 01:31:23.93992+00	{"provider": "phone", "providers": ["phone"]}	{"sub": "430a2343-05bc-44ee-9bc8-60bd76f58776", "email_verified": false, "phone_verified": false}	\N	2024-07-26 01:31:19.858596+00	2024-07-26 01:31:23.942936+00	14073197730	2024-07-26 01:31:23.935267+00			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	1fa2d554-cc74-461d-8878-08c1b91f71e0	authenticated	authenticated	\N	$2a$10$6n4lH9rM1M53mPU5HEW3.OfHJyudtlmAmyICEQeD0Lmcsx63ftN4C	\N	\N		2024-07-19 00:13:35.163889+00		\N			\N	2024-07-19 00:13:46.58954+00	{"provider": "phone", "providers": ["phone"]}	{"sub": "1fa2d554-cc74-461d-8878-08c1b91f71e0", "email_verified": false, "phone_verified": false}	\N	2024-07-18 23:59:17.221013+00	2024-07-19 00:13:46.591666+00	3017321380	2024-07-19 00:13:46.586212+00			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	18bde0a1-f3ca-4106-97ce-cbef943bf4e6	authenticated	authenticated	\N	$2a$10$rnLQBcuolBTrwX8bIAIabulRaLyo3/Wu1M/v6yHLulkFcfO4FCiq6	\N	\N		2024-07-29 19:12:44.808834+00		\N			\N	2024-07-29 19:12:49.80176+00	{"provider": "phone", "providers": ["phone"]}	{"sub": "18bde0a1-f3ca-4106-97ce-cbef943bf4e6", "email_verified": false, "phone_verified": false}	\N	2024-07-26 02:34:23.665774+00	2024-07-30 02:07:33.552188+00	14074146468	2024-07-29 19:12:49.798117+00			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	ae0fe4bc-71a4-4a5c-bee6-f1e3af7689f9	authenticated	authenticated	\N	$2a$10$8llt4FRMz4w/iaxiYewUHeJLRE5DbTsEcHCz3oxZBQm9RQS7XFRim	\N	\N	aec037c5872dfb6b33112551581848630ee2e344e4b8917827f33d0e	2024-07-30 15:45:59.722254+00		\N			\N	2024-07-30 15:39:40.93457+00	{"provider": "phone", "providers": ["phone"]}	{"sub": "ae0fe4bc-71a4-4a5c-bee6-f1e3af7689f9", "email_verified": false, "phone_verified": false}	\N	2024-07-30 15:37:25.721189+00	2024-07-30 15:46:00.003749+00	13015032787	2024-07-30 15:39:40.930062+00			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	d650f4c8-d60d-4f03-b210-ab71ee77144a	authenticated	authenticated	\N	$2a$10$/u6X6N0h3cYQYEHNofvmb.osTN4CP5E2wyD70Dvl3zUxgjz6oQm9C	\N	\N		2024-07-26 01:27:19.757511+00		\N			\N	2024-07-26 01:27:22.583481+00	{"provider": "phone", "providers": ["phone"]}	{"sub": "d650f4c8-d60d-4f03-b210-ab71ee77144a", "email_verified": false, "phone_verified": false}	\N	2024-07-26 01:27:19.747232+00	2024-07-26 15:36:36.426412+00	17472224970	2024-07-26 01:27:22.580604+00			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	a0a837ef-7717-40f7-ba7a-7d202d18d4a4	authenticated	authenticated	\N	$2a$10$Wzszzn1GNJ3H0WBetomXkOLBZA4q8tRJjpDWmuPSxKHjU.euuDlei	\N	\N		2024-07-26 19:36:13.914218+00		\N			\N	2024-07-26 19:36:22.022765+00	{"provider": "phone", "providers": ["phone"]}	{"sub": "a0a837ef-7717-40f7-ba7a-7d202d18d4a4", "email_verified": false, "phone_verified": false}	\N	2024-07-26 19:36:13.893596+00	2024-07-27 12:54:49.314038+00	16468230397	2024-07-26 19:36:22.01711+00			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	eee8a84c-0fdd-4354-ab42-d18c0ba4c551	authenticated	authenticated	\N	$2a$10$zYSBhzuqtArgex1HMqJpBuuiYpfBLeY.it88yZzAe6exyH.auVCZC	\N	\N		2024-07-27 20:26:37.846565+00		\N			\N	2024-07-27 20:26:42.021188+00	{"provider": "phone", "providers": ["phone"]}	{"sub": "eee8a84c-0fdd-4354-ab42-d18c0ba4c551", "email_verified": false, "phone_verified": false}	\N	2024-07-27 20:26:37.830169+00	2024-07-27 20:26:42.025008+00	15129149088	2024-07-27 20:26:42.017617+00			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	70c93ba9-dd94-4b4f-b8b1-6a6da8e8bbcf	authenticated	authenticated	\N	$2a$10$ZNBZ1pjRMcmRLaoopaYuSuSRngmWG7piiwk3ZVe/.P8VBeH3NsJEi	\N	\N		2024-07-26 01:28:49.263858+00		\N			\N	2024-07-26 01:29:04.027747+00	{"provider": "phone", "providers": ["phone"]}	{"sub": "70c93ba9-dd94-4b4f-b8b1-6a6da8e8bbcf", "email_verified": false, "phone_verified": false}	\N	2024-07-26 01:28:49.255816+00	2024-07-26 01:29:04.030651+00	16507703578	2024-07-26 01:29:04.024148+00			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	d199297a-cad3-43a8-9b92-4c54e1fc5486	authenticated	authenticated	\N	$2a$10$82dHwvjtNwjwRtBLM3Hcn.XwP4M5qRnV3owPvW.RSoyem5v1O7IFC	\N	\N		2024-07-28 04:40:40.358871+00		\N			\N	2024-07-28 04:40:44.438013+00	{"provider": "phone", "providers": ["phone"]}	{"sub": "d199297a-cad3-43a8-9b92-4c54e1fc5486", "email_verified": false, "phone_verified": false}	\N	2024-07-28 04:40:40.341229+00	2024-07-28 06:47:55.04773+00	18328128035	2024-07-28 04:40:44.432994+00			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	f7c330dd-dd80-4642-ac1f-db0eac5f5466	authenticated	authenticated	\N	$2a$10$4y7v06Mzbl68Rvi2mf1aG.d9Rg0JfBAcn98ThtiFdtNs3esfZEHKm	\N	\N		2024-07-28 03:32:54.383829+00		\N			\N	2024-07-28 03:33:15.078821+00	{"provider": "phone", "providers": ["phone"]}	{"sub": "f7c330dd-dd80-4642-ac1f-db0eac5f5466", "email_verified": false, "phone_verified": false}	\N	2024-07-26 06:41:41.333282+00	2024-07-28 17:51:20.250052+00	13467025531	2024-07-28 03:33:15.074139+00			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	5bbca4ac-ad78-4c10-aaf0-b6ae018db066	authenticated	authenticated	\N	$2a$10$hrNIF40c1SVjywrY7FoiIOqkKv.AsdDr6vTFZNWIqSn2jvX9Bmz1u	\N	\N		2024-07-28 15:10:55.97985+00		\N			\N	2024-07-28 15:11:08.330904+00	{"provider": "phone", "providers": ["phone"]}	{"sub": "5bbca4ac-ad78-4c10-aaf0-b6ae018db066", "email_verified": false, "phone_verified": false}	\N	2024-07-26 01:17:33.139107+00	2024-07-28 15:11:08.340261+00	13017321380	2024-07-28 15:11:08.324907+00			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	b82261ec-3aca-41e2-a3cf-c0d2b5c8558b	authenticated	authenticated	\N	$2a$10$2KExdOJSUTn.gIg8oDhQhuCpm/8hhU.ynOXpVC0ESwej7JJBp7ZUC	\N	\N	c53da42fe7f7c017cc63d17a068999390e8222cba151a9fb1a51cf5c	2024-07-29 14:37:01.469917+00		\N			\N	2024-07-28 17:37:25.976275+00	{"provider": "phone", "providers": ["phone"]}	{"sub": "b82261ec-3aca-41e2-a3cf-c0d2b5c8558b", "email_verified": false, "phone_verified": false}	\N	2024-07-19 00:29:12.524128+00	2024-07-29 14:37:01.689816+00	14077470791	2024-07-28 17:37:25.971953+00			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	e9d57f4c-94fb-4bca-be85-3ed7d7b18973	authenticated	authenticated	\N	$2a$10$a74VOeWw1g.8MkjqZ/tvZ.0D54BCN5bctGbhxEvlNtzhd0Gv9SKG6	\N	\N		2024-07-26 02:16:00.748474+00		\N			\N	2024-07-26 02:16:07.972441+00	{"provider": "phone", "providers": ["phone"]}	{"sub": "e9d57f4c-94fb-4bca-be85-3ed7d7b18973", "email_verified": false, "phone_verified": false}	\N	2024-07-26 02:16:00.739486+00	2024-07-26 02:16:07.975245+00	18322719696	2024-07-26 02:16:07.969153+00			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	b0381b2c-f449-48d5-8e8d-aa38448346d6	authenticated	authenticated	\N	$2a$10$VIiOCuiOZsR6h2JxP6x08O9Q7ZysEQlHCrXP1m3/hywyKVpLGqKuO	\N	\N		2024-07-26 02:22:01.546487+00		\N			\N	2024-07-26 02:22:05.462937+00	{"provider": "phone", "providers": ["phone"]}	{"sub": "b0381b2c-f449-48d5-8e8d-aa38448346d6", "email_verified": false, "phone_verified": false}	\N	2024-07-26 02:22:01.537658+00	2024-07-26 02:22:05.465716+00	13109624342	2024-07-26 02:22:05.459997+00			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	3c98aa81-e773-416f-8705-6bc13588a7c4	authenticated	authenticated	\N	$2a$10$6j5juMkk/2uZAml7BImjH.Erm8BkdMCPQn8WLTYv6CM1tdd9WHHDq	\N	\N		2024-07-26 02:33:29.302372+00		\N			\N	2024-07-26 02:34:25.035995+00	{"provider": "phone", "providers": ["phone"]}	{"sub": "3c98aa81-e773-416f-8705-6bc13588a7c4", "email_verified": false, "phone_verified": false}	\N	2024-07-26 02:22:08.385916+00	2024-07-26 02:34:25.039071+00	15106345023	2024-07-26 02:34:25.030588+00			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	58cebd00-3cc8-4ee9-926c-16833a66651d	authenticated	authenticated	oseleonose@gmail.com	$2a$10$pMwaCW7jwsVuIFLpR1S6yuIKpxathkEsqKGDKKmCKx4HjStacLcfS	2024-07-30 15:45:36.695639+00	\N		\N		\N			\N	\N	{"provider": "email", "providers": ["email"]}	{}	\N	2024-07-30 15:45:36.683159+00	2024-07-30 15:45:36.695857+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	e355efae-cc06-4737-8439-f731e383b285	authenticated	authenticated	\N	$2a$10$5eTXYdFM5dMlfFKe08fePuzOKxrocSwzO3wpYyy25.vu6YovXMl7u	\N	\N		2024-07-28 17:55:16.120251+00		\N			\N	2024-07-28 17:55:21.915554+00	{"provider": "phone", "providers": ["phone"]}	{"sub": "e355efae-cc06-4737-8439-f731e383b285", "email_verified": false, "phone_verified": false}	\N	2024-07-28 17:55:16.09947+00	2024-07-28 17:55:21.91891+00	19728042376	2024-07-28 17:55:21.912336+00			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	c1e922fd-458f-4969-84bc-0861ea992d18	authenticated	authenticated	\N	$2a$10$9nMBNGlnXRZcNzK/TqFHk.AlXcwXLR.w8CZocB8KSFyLlcmDt8TX2	\N	\N		2024-07-29 16:58:03.264051+00		\N			\N	2024-07-29 16:58:14.035594+00	{"provider": "phone", "providers": ["phone"]}	{"sub": "c1e922fd-458f-4969-84bc-0861ea992d18", "email_verified": false, "phone_verified": false}	\N	2024-07-26 02:01:18.564509+00	2024-07-29 16:58:14.04254+00	14072568997	2024-07-29 16:58:14.02732+00			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	e7614e8d-81cd-4cf3-9774-b8bce43245ce	authenticated	authenticated	\N	$2a$10$p2vqwDHrKRuAwDYxpntD2.6IAZM8manWf9D7kvDc6tdU.9wPMPjn6	\N	\N		2024-07-28 04:40:53.250944+00		\N			\N	2024-07-28 04:40:56.934992+00	{"provider": "phone", "providers": ["phone"]}	{"sub": "e7614e8d-81cd-4cf3-9774-b8bce43245ce", "email_verified": false, "phone_verified": false}	\N	2024-07-28 04:40:53.246066+00	2024-07-28 06:36:59.185062+00	18326417342	2024-07-28 04:40:56.929125+00			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	fc5da05b-8192-4127-9b48-e6c514bbf4f7	authenticated	authenticated	\N	$2a$10$PDKv04pqkYZzsK5Nem2tie8iATmdYvR4r47vzsWBRb3Z9aP53zAve	\N	\N		2024-07-28 05:01:28.423579+00		\N			\N	2024-07-28 05:01:56.917874+00	{"provider": "phone", "providers": ["phone"]}	{"sub": "fc5da05b-8192-4127-9b48-e6c514bbf4f7", "email_verified": false, "phone_verified": false}	\N	2024-07-28 04:59:00.347631+00	2024-07-28 15:01:50.818365+00	14082030828	2024-07-28 05:01:56.914242+00			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	e5ae9b3b-c793-4597-b82d-f9f6c461facf	authenticated	authenticated	\N	$2a$10$KSoKCeW1IGxJL5ZyYOYCNe1ysoozYmlFeSPMNj7rRiWZUlN02EzZy	\N	\N		2024-07-29 21:58:40.858497+00		\N			\N	2024-07-29 21:59:01.843161+00	{"provider": "phone", "providers": ["phone"]}	{"sub": "e5ae9b3b-c793-4597-b82d-f9f6c461facf", "email_verified": false, "phone_verified": false}	\N	2024-07-29 21:58:40.838715+00	2024-07-29 21:59:01.849389+00	15626676131	2024-07-29 21:59:01.839781+00			\N		0	\N		\N	f	\N	f
\.


--
-- Data for Name: key; Type: TABLE DATA; Schema: pgsodium; Owner: supabase_admin
--

COPY pgsodium.key (id, status, created, expires, key_type, key_id, key_context, name, associated_data, raw_key, raw_key_nonce, parent_key, comment, user_data) FROM stdin;
\.


--
-- Data for Name: user_profiles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_profiles (user_id, username, created_at, phone_number) FROM stdin;
430a2343-05bc-44ee-9bc8-60bd76f58776	Rivas142	2024-07-26 01:31:19.858596+00	14073197730
9c2f5472-e0f3-4109-9ff6-d6c571ce3475	chant	2024-07-26 01:23:32.574911+00	14697044024
d650f4c8-d60d-4f03-b210-ab71ee77144a	nicole	2024-07-26 01:27:19.747232+00	17472224970
f7c330dd-dd80-4642-ac1f-db0eac5f5466	faizan	2024-07-26 06:41:41.333282+00	13467025531
a0a837ef-7717-40f7-ba7a-7d202d18d4a4	hanna	2024-07-26 19:36:13.893596+00	16468230397
5bbca4ac-ad78-4c10-aaf0-b6ae018db066	kenny	2024-07-26 01:17:33.139107+00	13017321380
70c93ba9-dd94-4b4f-b8b1-6a6da8e8bbcf	elena	2024-07-26 01:28:49.255816+00	16507703578
c1e922fd-458f-4969-84bc-0861ea992d18	Larivas	2024-07-26 02:01:18.564509+00	14072568997
b82261ec-3aca-41e2-a3cf-c0d2b5c8558b	npcmilo	2024-07-19 00:29:12.524128+00	14077470791
e9d57f4c-94fb-4bca-be85-3ed7d7b18973	neelsn	2024-07-26 02:16:00.739486+00	18322719696
b0381b2c-f449-48d5-8e8d-aa38448346d6	Jaya	2024-07-26 02:22:01.537658+00	13109624342
3c98aa81-e773-416f-8705-6bc13588a7c4	claire	2024-07-26 02:22:08.385916+00	15106345023
18bde0a1-f3ca-4106-97ce-cbef943bf4e6	Quest6904	2024-07-26 02:34:23.665774+00	14074146468
eee8a84c-0fdd-4354-ab42-d18c0ba4c551	Qrahman	2024-07-27 20:26:37.830169+00	15129149088
d199297a-cad3-43a8-9b92-4c54e1fc5486	harrishafeez	2024-07-28 04:40:40.341229+00	18328128035
e7614e8d-81cd-4cf3-9774-b8bce43245ce	Arnavgaryali	2024-07-28 04:40:53.246066+00	18326417342
fc5da05b-8192-4127-9b48-e6c514bbf4f7	jinhee	2024-07-28 04:59:00.347631+00	14082030828
e355efae-cc06-4737-8439-f731e383b285	chris1	2024-07-28 17:55:16.09947+00	19728042376
e5ae9b3b-c793-4597-b82d-f9f6c461facf	tobeycsc	2024-07-29 21:58:40.838715+00	15626676131
ae0fe4bc-71a4-4a5c-bee6-f1e3af7689f9	david	2024-07-30 15:37:25.721189+00	13015032787
58cebd00-3cc8-4ee9-926c-16833a66651d	dummy	2024-07-30 15:49:22.40483+00	3017321381
\.


--
-- Data for Name: messages; Type: TABLE DATA; Schema: realtime; Owner: supabase_realtime_admin
--

COPY realtime.messages (id, topic, extension, inserted_at, updated_at) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.schema_migrations (version, inserted_at) FROM stdin;
20211116024918	2024-07-18 21:48:29
20211116045059	2024-07-18 21:48:30
20211116050929	2024-07-18 21:48:30
20211116051442	2024-07-18 21:48:30
20211116212300	2024-07-18 21:48:30
20211116213355	2024-07-18 21:48:30
20211116213934	2024-07-18 21:48:30
20211116214523	2024-07-18 21:48:30
20211122062447	2024-07-18 21:48:30
20211124070109	2024-07-18 21:48:30
20211202204204	2024-07-18 21:48:30
20211202204605	2024-07-18 21:48:30
20211210212804	2024-07-18 21:48:30
20211228014915	2024-07-18 21:48:30
20220107221237	2024-07-18 21:48:30
20220228202821	2024-07-18 21:48:30
20220312004840	2024-07-18 21:48:30
20220603231003	2024-07-18 21:48:30
20220603232444	2024-07-18 21:48:30
20220615214548	2024-07-18 21:48:30
20220712093339	2024-07-18 21:48:30
20220908172859	2024-07-18 21:48:30
20220916233421	2024-07-18 21:48:30
20230119133233	2024-07-18 21:48:30
20230128025114	2024-07-18 21:48:30
20230128025212	2024-07-18 21:48:30
20230227211149	2024-07-18 21:48:30
20230228184745	2024-07-18 21:48:30
20230308225145	2024-07-18 21:48:30
20230328144023	2024-07-18 21:48:30
20231018144023	2024-07-18 21:48:30
20231204144023	2024-07-18 21:48:30
20231204144024	2024-07-18 21:48:30
20231204144025	2024-07-18 21:48:30
20240108234812	2024-07-18 21:48:30
20240109165339	2024-07-18 21:48:30
20240227174441	2024-07-18 21:48:30
20240311171622	2024-07-18 21:48:30
20240321100241	2024-07-18 21:48:30
20240401105812	2024-07-18 21:48:30
20240418121054	2024-07-18 21:48:30
20240523004032	2024-07-18 21:48:31
20240618124746	2024-07-18 21:48:31
\.


--
-- Data for Name: subscription; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.subscription (id, subscription_id, entity, filters, claims, created_at) FROM stdin;
\.


--
-- Data for Name: buckets; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.buckets (id, name, owner, created_at, updated_at, public, avif_autodetection, file_size_limit, allowed_mime_types, owner_id) FROM stdin;
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.migrations (id, name, hash, executed_at) FROM stdin;
0	create-migrations-table	e18db593bcde2aca2a408c4d1100f6abba2195df	2024-07-18 21:47:08.282942
1	initialmigration	6ab16121fbaa08bbd11b712d05f358f9b555d777	2024-07-18 21:47:08.394131
2	storage-schema	5c7968fd083fcea04050c1b7f6253c9771b99011	2024-07-18 21:47:08.453126
3	pathtoken-column	2cb1b0004b817b29d5b0a971af16bafeede4b70d	2024-07-18 21:47:08.538636
4	add-migrations-rls	427c5b63fe1c5937495d9c635c263ee7a5905058	2024-07-18 21:47:08.619905
5	add-size-functions	79e081a1455b63666c1294a440f8ad4b1e6a7f84	2024-07-18 21:47:08.675975
6	change-column-name-in-get-size	f93f62afdf6613ee5e7e815b30d02dc990201044	2024-07-18 21:47:08.735843
7	add-rls-to-buckets	e7e7f86adbc51049f341dfe8d30256c1abca17aa	2024-07-18 21:47:08.80354
8	add-public-to-buckets	fd670db39ed65f9d08b01db09d6202503ca2bab3	2024-07-18 21:47:08.874064
9	fix-search-function	3a0af29f42e35a4d101c259ed955b67e1bee6825	2024-07-18 21:47:08.941131
10	search-files-search-function	68dc14822daad0ffac3746a502234f486182ef6e	2024-07-18 21:47:09.00585
11	add-trigger-to-auto-update-updated_at-column	7425bdb14366d1739fa8a18c83100636d74dcaa2	2024-07-18 21:47:09.061764
12	add-automatic-avif-detection-flag	8e92e1266eb29518b6a4c5313ab8f29dd0d08df9	2024-07-18 21:47:09.118781
13	add-bucket-custom-limits	cce962054138135cd9a8c4bcd531598684b25e7d	2024-07-18 21:47:09.174589
14	use-bytes-for-max-size	941c41b346f9802b411f06f30e972ad4744dad27	2024-07-18 21:47:09.230314
15	add-can-insert-object-function	934146bc38ead475f4ef4b555c524ee5d66799e5	2024-07-18 21:47:09.347607
16	add-version	76debf38d3fd07dcfc747ca49096457d95b1221b	2024-07-18 21:47:09.412559
17	drop-owner-foreign-key	f1cbb288f1b7a4c1eb8c38504b80ae2a0153d101	2024-07-18 21:47:09.471904
18	add_owner_id_column_deprecate_owner	e7a511b379110b08e2f214be852c35414749fe66	2024-07-18 21:47:09.537837
19	alter-default-value-objects-id	02e5e22a78626187e00d173dc45f58fa66a4f043	2024-07-18 21:47:09.604489
20	list-objects-with-delimiter	cd694ae708e51ba82bf012bba00caf4f3b6393b7	2024-07-18 21:47:09.678476
21	s3-multipart-uploads	8c804d4a566c40cd1e4cc5b3725a664a9303657f	2024-07-18 21:47:09.743222
22	s3-multipart-uploads-big-ints	9737dc258d2397953c9953d9b86920b8be0cdb73	2024-07-18 21:47:09.829819
23	optimize-search-function	9d7e604cddc4b56a5422dc68c9313f4a1b6f132c	2024-07-18 21:47:09.907632
24	operation-function	8312e37c2bf9e76bbe841aa5fda889206d2bf8aa	2024-07-18 21:47:09.961731
\.


--
-- Data for Name: objects; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.objects (id, bucket_id, name, owner, created_at, updated_at, last_accessed_at, metadata, version, owner_id) FROM stdin;
\.


--
-- Data for Name: s3_multipart_uploads; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.s3_multipart_uploads (id, in_progress_size, upload_signature, bucket_id, key, version, owner_id, created_at) FROM stdin;
\.


--
-- Data for Name: s3_multipart_uploads_parts; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.s3_multipart_uploads_parts (id, upload_id, size, part_number, bucket_id, key, etag, owner_id, version, created_at) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: supabase_migrations; Owner: postgres
--

COPY supabase_migrations.schema_migrations (version, statements, name) FROM stdin;
20240719182243	{"create table user_profiles (\n  user_id uuid primary key references auth.users (id) not null,\n  username text unique not null\n  CONSTRAINT proper_username CHECK (username ~* '^[a-zA-Z0-9_]+$')\n  CONSTRAINT username_length CHECK (char_length(username) > 3 and char_length(username) < 15)\n)","alter table user_profiles enable row level security","-- NOTE: permissives will allow as long as one is true\n-- Permissive for select is just true so anyone can see it\nCREATE POLICY \\"all can see\\" ON \\"public\\".\\"user_profiles\\"\nAS PERMISSIVE FOR SELECT\nTO public\nUSING (true)","-- checks (using the supabase provided auth.uid function) that the user\n--  trying to create or change a user profile is the right one\n-- NOTE: we never allow users to delete a username\nCREATE POLICY \\"users can insert\\" ON \\"public\\".\\"user_profiles\\"\nAS PERMISSIVE FOR INSERT\nTO public\nWITH CHECK (auth.uid() = user_id)","-- there's an extra USING in this one cause it first filters all the rows\n-- that the user can even see first let alone update\nCREATE POLICY \\"owners can update\\" ON \\"public\\".\\"user_profiles\\"\nAS PERMISSIVE FOR UPDATE\nTO public\nUSING (auth.uid()=user_id)\nWITH CHECK (auth.uid()=user_id)"}	original-ddl
20240726223208	{"-- Add created_at and phone_number columns to user_profiles so we can\n-- create the leaderboard in beta-mini-site\nALTER TABLE \\"public\\".\\"user_profiles\\" ADD COLUMN \\"created_at\\" timestamp with time zone","ALTER TABLE \\"public\\".\\"user_profiles\\" ADD COLUMN \\"phone_number\\" text","-- Updating existing rows with data from auth.users\nUPDATE \\"public\\".\\"user_profiles\\" up\nSET\n    phone_number = au.phone,\n    created_at = au.created_at\nFROM \\"auth\\".\\"users\\" au\nWHERE up.user_id = au.id","-- Alter tables to be not null after migrating existing users\nALTER TABLE \\"public\\".\\"user_profiles\\" ALTER COLUMN \\"created_at\\" SET NOT NULL","ALTER TABLE \\"public\\".\\"user_profiles\\" ALTER COLUMN \\"phone_number\\" SET NOT NULL","-- same for the default\nALTER TABLE \\"public\\".\\"user_profiles\\" ALTER COLUMN \\"created_at\\" SET DEFAULT now()","-- unique index shit that supabase made... don't know what it does lmao\nCREATE UNIQUE INDEX user_profiles_phone_number_key ON public.user_profiles USING btree (phone_number)","alter table \\"public\\".\\"user_profiles\\" add constraint \\"user_profiles_phone_number_key\\" UNIQUE using index \\"user_profiles_phone_number_key\\""}	add_num_created_at-ddl
\.


--
-- Data for Name: secrets; Type: TABLE DATA; Schema: vault; Owner: supabase_admin
--

COPY vault.secrets (id, name, description, secret, key_id, nonce, created_at, updated_at) FROM stdin;
\.


--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: supabase_auth_admin
--

SELECT pg_catalog.setval('auth.refresh_tokens_id_seq', 72, true);


--
-- Name: key_key_id_seq; Type: SEQUENCE SET; Schema: pgsodium; Owner: supabase_admin
--

SELECT pg_catalog.setval('pgsodium.key_key_id_seq', 1, false);


--
-- Name: messages_id_seq; Type: SEQUENCE SET; Schema: realtime; Owner: supabase_realtime_admin
--

SELECT pg_catalog.setval('realtime.messages_id_seq', 1, false);


--
-- Name: subscription_id_seq; Type: SEQUENCE SET; Schema: realtime; Owner: supabase_admin
--

SELECT pg_catalog.setval('realtime.subscription_id_seq', 1, false);


--
-- Name: mfa_amr_claims amr_id_pk; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT amr_id_pk PRIMARY KEY (id);


--
-- Name: audit_log_entries audit_log_entries_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.audit_log_entries
    ADD CONSTRAINT audit_log_entries_pkey PRIMARY KEY (id);


--
-- Name: flow_state flow_state_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.flow_state
    ADD CONSTRAINT flow_state_pkey PRIMARY KEY (id);


--
-- Name: identities identities_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_pkey PRIMARY KEY (id);


--
-- Name: identities identities_provider_id_provider_unique; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_provider_id_provider_unique UNIQUE (provider_id, provider);


--
-- Name: instances instances_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.instances
    ADD CONSTRAINT instances_pkey PRIMARY KEY (id);


--
-- Name: mfa_amr_claims mfa_amr_claims_session_id_authentication_method_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT mfa_amr_claims_session_id_authentication_method_pkey UNIQUE (session_id, authentication_method);


--
-- Name: mfa_challenges mfa_challenges_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_challenges
    ADD CONSTRAINT mfa_challenges_pkey PRIMARY KEY (id);


--
-- Name: mfa_factors mfa_factors_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_pkey PRIMARY KEY (id);


--
-- Name: one_time_tokens one_time_tokens_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.one_time_tokens
    ADD CONSTRAINT one_time_tokens_pkey PRIMARY KEY (id);


--
-- Name: refresh_tokens refresh_tokens_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_pkey PRIMARY KEY (id);


--
-- Name: refresh_tokens refresh_tokens_token_unique; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_token_unique UNIQUE (token);


--
-- Name: saml_providers saml_providers_entity_id_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_entity_id_key UNIQUE (entity_id);


--
-- Name: saml_providers saml_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_pkey PRIMARY KEY (id);


--
-- Name: saml_relay_states saml_relay_states_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: sso_domains sso_domains_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_domains
    ADD CONSTRAINT sso_domains_pkey PRIMARY KEY (id);


--
-- Name: sso_providers sso_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_providers
    ADD CONSTRAINT sso_providers_pkey PRIMARY KEY (id);


--
-- Name: users users_phone_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_phone_key UNIQUE (phone);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: user_profiles user_profiles_phone_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_profiles
    ADD CONSTRAINT user_profiles_phone_number_key UNIQUE (phone_number);


--
-- Name: user_profiles user_profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_profiles
    ADD CONSTRAINT user_profiles_pkey PRIMARY KEY (user_id);


--
-- Name: user_profiles user_profiles_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_profiles
    ADD CONSTRAINT user_profiles_username_key UNIQUE (username);


--
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER TABLE ONLY realtime.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id);


--
-- Name: subscription pk_subscription; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.subscription
    ADD CONSTRAINT pk_subscription PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: buckets buckets_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.buckets
    ADD CONSTRAINT buckets_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_name_key; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.migrations
    ADD CONSTRAINT migrations_name_key UNIQUE (name);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: objects objects_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.objects
    ADD CONSTRAINT objects_pkey PRIMARY KEY (id);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_pkey PRIMARY KEY (id);


--
-- Name: s3_multipart_uploads s3_multipart_uploads_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads
    ADD CONSTRAINT s3_multipart_uploads_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: supabase_migrations; Owner: postgres
--

ALTER TABLE ONLY supabase_migrations.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: audit_logs_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX audit_logs_instance_id_idx ON auth.audit_log_entries USING btree (instance_id);


--
-- Name: confirmation_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX confirmation_token_idx ON auth.users USING btree (confirmation_token) WHERE ((confirmation_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: email_change_token_current_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX email_change_token_current_idx ON auth.users USING btree (email_change_token_current) WHERE ((email_change_token_current)::text !~ '^[0-9 ]*$'::text);


--
-- Name: email_change_token_new_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX email_change_token_new_idx ON auth.users USING btree (email_change_token_new) WHERE ((email_change_token_new)::text !~ '^[0-9 ]*$'::text);


--
-- Name: factor_id_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX factor_id_created_at_idx ON auth.mfa_factors USING btree (user_id, created_at);


--
-- Name: flow_state_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX flow_state_created_at_idx ON auth.flow_state USING btree (created_at DESC);


--
-- Name: identities_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX identities_email_idx ON auth.identities USING btree (email text_pattern_ops);


--
-- Name: INDEX identities_email_idx; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON INDEX auth.identities_email_idx IS 'Auth: Ensures indexed queries on the email column';


--
-- Name: identities_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX identities_user_id_idx ON auth.identities USING btree (user_id);


--
-- Name: idx_auth_code; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX idx_auth_code ON auth.flow_state USING btree (auth_code);


--
-- Name: idx_user_id_auth_method; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX idx_user_id_auth_method ON auth.flow_state USING btree (user_id, authentication_method);


--
-- Name: mfa_challenge_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX mfa_challenge_created_at_idx ON auth.mfa_challenges USING btree (created_at DESC);


--
-- Name: mfa_factors_user_friendly_name_unique; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX mfa_factors_user_friendly_name_unique ON auth.mfa_factors USING btree (friendly_name, user_id) WHERE (TRIM(BOTH FROM friendly_name) <> ''::text);


--
-- Name: mfa_factors_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX mfa_factors_user_id_idx ON auth.mfa_factors USING btree (user_id);


--
-- Name: one_time_tokens_relates_to_hash_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX one_time_tokens_relates_to_hash_idx ON auth.one_time_tokens USING hash (relates_to);


--
-- Name: one_time_tokens_token_hash_hash_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX one_time_tokens_token_hash_hash_idx ON auth.one_time_tokens USING hash (token_hash);


--
-- Name: one_time_tokens_user_id_token_type_key; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX one_time_tokens_user_id_token_type_key ON auth.one_time_tokens USING btree (user_id, token_type);


--
-- Name: reauthentication_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX reauthentication_token_idx ON auth.users USING btree (reauthentication_token) WHERE ((reauthentication_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: recovery_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX recovery_token_idx ON auth.users USING btree (recovery_token) WHERE ((recovery_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: refresh_tokens_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_instance_id_idx ON auth.refresh_tokens USING btree (instance_id);


--
-- Name: refresh_tokens_instance_id_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_instance_id_user_id_idx ON auth.refresh_tokens USING btree (instance_id, user_id);


--
-- Name: refresh_tokens_parent_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_parent_idx ON auth.refresh_tokens USING btree (parent);


--
-- Name: refresh_tokens_session_id_revoked_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_session_id_revoked_idx ON auth.refresh_tokens USING btree (session_id, revoked);


--
-- Name: refresh_tokens_updated_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_updated_at_idx ON auth.refresh_tokens USING btree (updated_at DESC);


--
-- Name: saml_providers_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_providers_sso_provider_id_idx ON auth.saml_providers USING btree (sso_provider_id);


--
-- Name: saml_relay_states_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_created_at_idx ON auth.saml_relay_states USING btree (created_at DESC);


--
-- Name: saml_relay_states_for_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_for_email_idx ON auth.saml_relay_states USING btree (for_email);


--
-- Name: saml_relay_states_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_sso_provider_id_idx ON auth.saml_relay_states USING btree (sso_provider_id);


--
-- Name: sessions_not_after_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sessions_not_after_idx ON auth.sessions USING btree (not_after DESC);


--
-- Name: sessions_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sessions_user_id_idx ON auth.sessions USING btree (user_id);


--
-- Name: sso_domains_domain_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX sso_domains_domain_idx ON auth.sso_domains USING btree (lower(domain));


--
-- Name: sso_domains_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sso_domains_sso_provider_id_idx ON auth.sso_domains USING btree (sso_provider_id);


--
-- Name: sso_providers_resource_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX sso_providers_resource_id_idx ON auth.sso_providers USING btree (lower(resource_id));


--
-- Name: user_id_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX user_id_created_at_idx ON auth.sessions USING btree (user_id, created_at);


--
-- Name: users_email_partial_key; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX users_email_partial_key ON auth.users USING btree (email) WHERE (is_sso_user = false);


--
-- Name: INDEX users_email_partial_key; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON INDEX auth.users_email_partial_key IS 'Auth: A partial unique index that applies only when is_sso_user is false';


--
-- Name: users_instance_id_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_instance_id_email_idx ON auth.users USING btree (instance_id, lower((email)::text));


--
-- Name: users_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_instance_id_idx ON auth.users USING btree (instance_id);


--
-- Name: users_is_anonymous_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_is_anonymous_idx ON auth.users USING btree (is_anonymous);


--
-- Name: ix_realtime_subscription_entity; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE INDEX ix_realtime_subscription_entity ON realtime.subscription USING hash (entity);


--
-- Name: messages_topic_index; Type: INDEX; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE INDEX messages_topic_index ON realtime.messages USING btree (topic);


--
-- Name: subscription_subscription_id_entity_filters_key; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE UNIQUE INDEX subscription_subscription_id_entity_filters_key ON realtime.subscription USING btree (subscription_id, entity, filters);


--
-- Name: bname; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX bname ON storage.buckets USING btree (name);


--
-- Name: bucketid_objname; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX bucketid_objname ON storage.objects USING btree (bucket_id, name);


--
-- Name: idx_multipart_uploads_list; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_multipart_uploads_list ON storage.s3_multipart_uploads USING btree (bucket_id, key, created_at);


--
-- Name: idx_objects_bucket_id_name; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_objects_bucket_id_name ON storage.objects USING btree (bucket_id, name COLLATE "C");


--
-- Name: name_prefix_search; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX name_prefix_search ON storage.objects USING btree (name text_pattern_ops);


--
-- Name: subscription tr_check_filters; Type: TRIGGER; Schema: realtime; Owner: supabase_admin
--

CREATE TRIGGER tr_check_filters BEFORE INSERT OR UPDATE ON realtime.subscription FOR EACH ROW EXECUTE FUNCTION realtime.subscription_check_filters();


--
-- Name: objects update_objects_updated_at; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER update_objects_updated_at BEFORE UPDATE ON storage.objects FOR EACH ROW EXECUTE FUNCTION storage.update_updated_at_column();


--
-- Name: identities identities_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: mfa_amr_claims mfa_amr_claims_session_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT mfa_amr_claims_session_id_fkey FOREIGN KEY (session_id) REFERENCES auth.sessions(id) ON DELETE CASCADE;


--
-- Name: mfa_challenges mfa_challenges_auth_factor_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_challenges
    ADD CONSTRAINT mfa_challenges_auth_factor_id_fkey FOREIGN KEY (factor_id) REFERENCES auth.mfa_factors(id) ON DELETE CASCADE;


--
-- Name: mfa_factors mfa_factors_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: one_time_tokens one_time_tokens_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.one_time_tokens
    ADD CONSTRAINT one_time_tokens_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: refresh_tokens refresh_tokens_session_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_session_id_fkey FOREIGN KEY (session_id) REFERENCES auth.sessions(id) ON DELETE CASCADE;


--
-- Name: saml_providers saml_providers_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: saml_relay_states saml_relay_states_flow_state_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_flow_state_id_fkey FOREIGN KEY (flow_state_id) REFERENCES auth.flow_state(id) ON DELETE CASCADE;


--
-- Name: saml_relay_states saml_relay_states_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: sessions sessions_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: sso_domains sso_domains_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_domains
    ADD CONSTRAINT sso_domains_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: user_profiles user_profiles_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_profiles
    ADD CONSTRAINT user_profiles_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id);


--
-- Name: objects objects_bucketId_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.objects
    ADD CONSTRAINT "objects_bucketId_fkey" FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads s3_multipart_uploads_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads
    ADD CONSTRAINT s3_multipart_uploads_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_upload_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_upload_id_fkey FOREIGN KEY (upload_id) REFERENCES storage.s3_multipart_uploads(id) ON DELETE CASCADE;


--
-- Name: audit_log_entries; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.audit_log_entries ENABLE ROW LEVEL SECURITY;

--
-- Name: flow_state; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.flow_state ENABLE ROW LEVEL SECURITY;

--
-- Name: identities; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.identities ENABLE ROW LEVEL SECURITY;

--
-- Name: instances; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.instances ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_amr_claims; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.mfa_amr_claims ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_challenges; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.mfa_challenges ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_factors; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.mfa_factors ENABLE ROW LEVEL SECURITY;

--
-- Name: one_time_tokens; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.one_time_tokens ENABLE ROW LEVEL SECURITY;

--
-- Name: refresh_tokens; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.refresh_tokens ENABLE ROW LEVEL SECURITY;

--
-- Name: saml_providers; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.saml_providers ENABLE ROW LEVEL SECURITY;

--
-- Name: saml_relay_states; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.saml_relay_states ENABLE ROW LEVEL SECURITY;

--
-- Name: schema_migrations; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.schema_migrations ENABLE ROW LEVEL SECURITY;

--
-- Name: sessions; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.sessions ENABLE ROW LEVEL SECURITY;

--
-- Name: sso_domains; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.sso_domains ENABLE ROW LEVEL SECURITY;

--
-- Name: sso_providers; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.sso_providers ENABLE ROW LEVEL SECURITY;

--
-- Name: users; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.users ENABLE ROW LEVEL SECURITY;

--
-- Name: user_profiles all can see; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "all can see" ON public.user_profiles FOR SELECT USING (true);


--
-- Name: user_profiles owners can update; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "owners can update" ON public.user_profiles FOR UPDATE USING ((auth.uid() = user_id)) WITH CHECK ((auth.uid() = user_id));


--
-- Name: user_profiles; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.user_profiles ENABLE ROW LEVEL SECURITY;

--
-- Name: user_profiles users can insert; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "users can insert" ON public.user_profiles FOR INSERT WITH CHECK ((auth.uid() = user_id));


--
-- Name: messages; Type: ROW SECURITY; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER TABLE realtime.messages ENABLE ROW LEVEL SECURITY;

--
-- Name: buckets; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.buckets ENABLE ROW LEVEL SECURITY;

--
-- Name: migrations; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.migrations ENABLE ROW LEVEL SECURITY;

--
-- Name: objects; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.objects ENABLE ROW LEVEL SECURITY;

--
-- Name: s3_multipart_uploads; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.s3_multipart_uploads ENABLE ROW LEVEL SECURITY;

--
-- Name: s3_multipart_uploads_parts; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.s3_multipart_uploads_parts ENABLE ROW LEVEL SECURITY;

--
-- Name: supabase_realtime; Type: PUBLICATION; Schema: -; Owner: postgres
--

CREATE PUBLICATION supabase_realtime WITH (publish = 'insert, update, delete, truncate');


ALTER PUBLICATION supabase_realtime OWNER TO postgres;

--
-- Name: SCHEMA auth; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA auth TO anon;
GRANT USAGE ON SCHEMA auth TO authenticated;
GRANT USAGE ON SCHEMA auth TO service_role;
GRANT ALL ON SCHEMA auth TO supabase_auth_admin;
GRANT ALL ON SCHEMA auth TO dashboard_user;
GRANT ALL ON SCHEMA auth TO postgres;


--
-- Name: SCHEMA extensions; Type: ACL; Schema: -; Owner: postgres
--

GRANT USAGE ON SCHEMA extensions TO anon;
GRANT USAGE ON SCHEMA extensions TO authenticated;
GRANT USAGE ON SCHEMA extensions TO service_role;
GRANT ALL ON SCHEMA extensions TO dashboard_user;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pg_database_owner
--

GRANT USAGE ON SCHEMA public TO postgres;
GRANT USAGE ON SCHEMA public TO anon;
GRANT USAGE ON SCHEMA public TO authenticated;
GRANT USAGE ON SCHEMA public TO service_role;


--
-- Name: SCHEMA realtime; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA realtime TO postgres;
GRANT USAGE ON SCHEMA realtime TO anon;
GRANT USAGE ON SCHEMA realtime TO authenticated;
GRANT USAGE ON SCHEMA realtime TO service_role;
GRANT ALL ON SCHEMA realtime TO supabase_realtime_admin;


--
-- Name: SCHEMA storage; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT ALL ON SCHEMA storage TO postgres;
GRANT USAGE ON SCHEMA storage TO anon;
GRANT USAGE ON SCHEMA storage TO authenticated;
GRANT USAGE ON SCHEMA storage TO service_role;
GRANT ALL ON SCHEMA storage TO supabase_storage_admin;
GRANT ALL ON SCHEMA storage TO dashboard_user;


--
-- Name: FUNCTION email(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.email() TO dashboard_user;


--
-- Name: FUNCTION jwt(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.jwt() TO postgres;
GRANT ALL ON FUNCTION auth.jwt() TO dashboard_user;


--
-- Name: FUNCTION role(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.role() TO dashboard_user;


--
-- Name: FUNCTION uid(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.uid() TO dashboard_user;


--
-- Name: FUNCTION algorithm_sign(signables text, secret text, algorithm text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.algorithm_sign(signables text, secret text, algorithm text) FROM postgres;
GRANT ALL ON FUNCTION extensions.algorithm_sign(signables text, secret text, algorithm text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.algorithm_sign(signables text, secret text, algorithm text) TO dashboard_user;


--
-- Name: FUNCTION armor(bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.armor(bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.armor(bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.armor(bytea) TO dashboard_user;


--
-- Name: FUNCTION armor(bytea, text[], text[]); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.armor(bytea, text[], text[]) FROM postgres;
GRANT ALL ON FUNCTION extensions.armor(bytea, text[], text[]) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.armor(bytea, text[], text[]) TO dashboard_user;


--
-- Name: FUNCTION crypt(text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.crypt(text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.crypt(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.crypt(text, text) TO dashboard_user;


--
-- Name: FUNCTION dearmor(text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.dearmor(text) FROM postgres;
GRANT ALL ON FUNCTION extensions.dearmor(text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.dearmor(text) TO dashboard_user;


--
-- Name: FUNCTION decrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION decrypt_iv(bytea, bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION digest(bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.digest(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.digest(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.digest(bytea, text) TO dashboard_user;


--
-- Name: FUNCTION digest(text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.digest(text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.digest(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.digest(text, text) TO dashboard_user;


--
-- Name: FUNCTION encrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION encrypt_iv(bytea, bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION gen_random_bytes(integer); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.gen_random_bytes(integer) FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_random_bytes(integer) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_random_bytes(integer) TO dashboard_user;


--
-- Name: FUNCTION gen_random_uuid(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.gen_random_uuid() FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_random_uuid() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_random_uuid() TO dashboard_user;


--
-- Name: FUNCTION gen_salt(text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.gen_salt(text) FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_salt(text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_salt(text) TO dashboard_user;


--
-- Name: FUNCTION gen_salt(text, integer); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.gen_salt(text, integer) FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_salt(text, integer) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_salt(text, integer) TO dashboard_user;


--
-- Name: FUNCTION grant_pg_cron_access(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.grant_pg_cron_access() FROM postgres;
GRANT ALL ON FUNCTION extensions.grant_pg_cron_access() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.grant_pg_cron_access() TO dashboard_user;


--
-- Name: FUNCTION grant_pg_graphql_access(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.grant_pg_graphql_access() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION grant_pg_net_access(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.grant_pg_net_access() FROM postgres;
GRANT ALL ON FUNCTION extensions.grant_pg_net_access() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.grant_pg_net_access() TO dashboard_user;


--
-- Name: FUNCTION hmac(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.hmac(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.hmac(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.hmac(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION hmac(text, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.hmac(text, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.hmac(text, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.hmac(text, text, text) TO dashboard_user;


--
-- Name: FUNCTION pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT blk_read_time double precision, OUT blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT blk_read_time double precision, OUT blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision) FROM postgres;
GRANT ALL ON FUNCTION extensions.pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT blk_read_time double precision, OUT blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT blk_read_time double precision, OUT blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision) TO dashboard_user;


--
-- Name: FUNCTION pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone) FROM postgres;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone) TO dashboard_user;


--
-- Name: FUNCTION pg_stat_statements_reset(userid oid, dbid oid, queryid bigint); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pg_stat_statements_reset(userid oid, dbid oid, queryid bigint) FROM postgres;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_reset(userid oid, dbid oid, queryid bigint) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_reset(userid oid, dbid oid, queryid bigint) TO dashboard_user;


--
-- Name: FUNCTION pgp_armor_headers(text, OUT key text, OUT value text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) TO dashboard_user;


--
-- Name: FUNCTION pgp_key_id(bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_key_id(bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_key_id(bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_key_id(bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_encrypt(text, bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_encrypt(text, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_encrypt_bytea(bytea, bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_encrypt_bytea(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_decrypt(bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_decrypt(bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_decrypt_bytea(bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_decrypt_bytea(bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_encrypt(text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_encrypt(text, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_encrypt_bytea(bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_encrypt_bytea(bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgrst_ddl_watch(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgrst_ddl_watch() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgrst_drop_watch(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgrst_drop_watch() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION set_graphql_placeholder(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.set_graphql_placeholder() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION sign(payload json, secret text, algorithm text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.sign(payload json, secret text, algorithm text) FROM postgres;
GRANT ALL ON FUNCTION extensions.sign(payload json, secret text, algorithm text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.sign(payload json, secret text, algorithm text) TO dashboard_user;


--
-- Name: FUNCTION try_cast_double(inp text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.try_cast_double(inp text) FROM postgres;
GRANT ALL ON FUNCTION extensions.try_cast_double(inp text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.try_cast_double(inp text) TO dashboard_user;


--
-- Name: FUNCTION url_decode(data text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.url_decode(data text) FROM postgres;
GRANT ALL ON FUNCTION extensions.url_decode(data text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.url_decode(data text) TO dashboard_user;


--
-- Name: FUNCTION url_encode(data bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.url_encode(data bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.url_encode(data bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.url_encode(data bytea) TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v1(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v1() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1() TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v1mc(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v1mc() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1mc() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1mc() TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v3(namespace uuid, name text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v4(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v4() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v4() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v4() TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v5(namespace uuid, name text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) TO dashboard_user;


--
-- Name: FUNCTION uuid_nil(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_nil() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_nil() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_nil() TO dashboard_user;


--
-- Name: FUNCTION uuid_ns_dns(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_ns_dns() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_dns() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_dns() TO dashboard_user;


--
-- Name: FUNCTION uuid_ns_oid(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_ns_oid() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_oid() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_oid() TO dashboard_user;


--
-- Name: FUNCTION uuid_ns_url(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_ns_url() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_url() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_url() TO dashboard_user;


--
-- Name: FUNCTION uuid_ns_x500(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_ns_x500() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_x500() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_x500() TO dashboard_user;


--
-- Name: FUNCTION verify(token text, secret text, algorithm text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.verify(token text, secret text, algorithm text) FROM postgres;
GRANT ALL ON FUNCTION extensions.verify(token text, secret text, algorithm text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.verify(token text, secret text, algorithm text) TO dashboard_user;


--
-- Name: FUNCTION graphql("operationName" text, query text, variables jsonb, extensions jsonb); Type: ACL; Schema: graphql_public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO postgres;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO anon;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO authenticated;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO service_role;


--
-- Name: FUNCTION lo_export(oid, text); Type: ACL; Schema: pg_catalog; Owner: supabase_admin
--

REVOKE ALL ON FUNCTION pg_catalog.lo_export(oid, text) FROM postgres;
GRANT ALL ON FUNCTION pg_catalog.lo_export(oid, text) TO supabase_admin;


--
-- Name: FUNCTION lo_import(text); Type: ACL; Schema: pg_catalog; Owner: supabase_admin
--

REVOKE ALL ON FUNCTION pg_catalog.lo_import(text) FROM postgres;
GRANT ALL ON FUNCTION pg_catalog.lo_import(text) TO supabase_admin;


--
-- Name: FUNCTION lo_import(text, oid); Type: ACL; Schema: pg_catalog; Owner: supabase_admin
--

REVOKE ALL ON FUNCTION pg_catalog.lo_import(text, oid) FROM postgres;
GRANT ALL ON FUNCTION pg_catalog.lo_import(text, oid) TO supabase_admin;


--
-- Name: FUNCTION get_auth(p_usename text); Type: ACL; Schema: pgbouncer; Owner: postgres
--

REVOKE ALL ON FUNCTION pgbouncer.get_auth(p_usename text) FROM PUBLIC;
GRANT ALL ON FUNCTION pgbouncer.get_auth(p_usename text) TO pgbouncer;


--
-- Name: FUNCTION crypto_aead_det_decrypt(message bytea, additional bytea, key_uuid uuid, nonce bytea); Type: ACL; Schema: pgsodium; Owner: pgsodium_keymaker
--

GRANT ALL ON FUNCTION pgsodium.crypto_aead_det_decrypt(message bytea, additional bytea, key_uuid uuid, nonce bytea) TO service_role;


--
-- Name: FUNCTION crypto_aead_det_encrypt(message bytea, additional bytea, key_uuid uuid, nonce bytea); Type: ACL; Schema: pgsodium; Owner: pgsodium_keymaker
--

GRANT ALL ON FUNCTION pgsodium.crypto_aead_det_encrypt(message bytea, additional bytea, key_uuid uuid, nonce bytea) TO service_role;


--
-- Name: FUNCTION crypto_aead_det_keygen(); Type: ACL; Schema: pgsodium; Owner: supabase_admin
--

GRANT ALL ON FUNCTION pgsodium.crypto_aead_det_keygen() TO service_role;


--
-- Name: FUNCTION apply_rls(wal jsonb, max_record_bytes integer); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO postgres;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO anon;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO authenticated;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO service_role;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO supabase_realtime_admin;


--
-- Name: FUNCTION build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO postgres;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO anon;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO authenticated;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO service_role;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO supabase_realtime_admin;


--
-- Name: FUNCTION "cast"(val text, type_ regtype); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO postgres;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO dashboard_user;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO anon;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO authenticated;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO service_role;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO supabase_realtime_admin;


--
-- Name: FUNCTION check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO postgres;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO anon;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO authenticated;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO service_role;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO supabase_realtime_admin;


--
-- Name: FUNCTION is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO postgres;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO anon;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO authenticated;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO service_role;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO supabase_realtime_admin;


--
-- Name: FUNCTION list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO postgres;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO anon;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO authenticated;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO service_role;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO supabase_realtime_admin;


--
-- Name: FUNCTION quote_wal2json(entity regclass); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO postgres;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO anon;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO authenticated;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO service_role;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO supabase_realtime_admin;


--
-- Name: FUNCTION subscription_check_filters(); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO postgres;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO dashboard_user;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO anon;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO authenticated;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO service_role;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO supabase_realtime_admin;


--
-- Name: FUNCTION to_regrole(role_name text); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO postgres;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO anon;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO authenticated;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO service_role;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO supabase_realtime_admin;


--
-- Name: FUNCTION topic(); Type: ACL; Schema: realtime; Owner: supabase_realtime_admin
--

GRANT ALL ON FUNCTION realtime.topic() TO postgres;
GRANT ALL ON FUNCTION realtime.topic() TO dashboard_user;


--
-- Name: TABLE audit_log_entries; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.audit_log_entries TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.audit_log_entries TO postgres;
GRANT SELECT ON TABLE auth.audit_log_entries TO postgres WITH GRANT OPTION;


--
-- Name: TABLE flow_state; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.flow_state TO postgres;
GRANT SELECT ON TABLE auth.flow_state TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.flow_state TO dashboard_user;


--
-- Name: TABLE identities; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.identities TO postgres;
GRANT SELECT ON TABLE auth.identities TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.identities TO dashboard_user;


--
-- Name: TABLE instances; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.instances TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.instances TO postgres;
GRANT SELECT ON TABLE auth.instances TO postgres WITH GRANT OPTION;


--
-- Name: TABLE mfa_amr_claims; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.mfa_amr_claims TO postgres;
GRANT SELECT ON TABLE auth.mfa_amr_claims TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.mfa_amr_claims TO dashboard_user;


--
-- Name: TABLE mfa_challenges; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.mfa_challenges TO postgres;
GRANT SELECT ON TABLE auth.mfa_challenges TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.mfa_challenges TO dashboard_user;


--
-- Name: TABLE mfa_factors; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.mfa_factors TO postgres;
GRANT SELECT ON TABLE auth.mfa_factors TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.mfa_factors TO dashboard_user;


--
-- Name: TABLE one_time_tokens; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.one_time_tokens TO postgres;
GRANT SELECT ON TABLE auth.one_time_tokens TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.one_time_tokens TO dashboard_user;


--
-- Name: TABLE refresh_tokens; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.refresh_tokens TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.refresh_tokens TO postgres;
GRANT SELECT ON TABLE auth.refresh_tokens TO postgres WITH GRANT OPTION;


--
-- Name: SEQUENCE refresh_tokens_id_seq; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON SEQUENCE auth.refresh_tokens_id_seq TO dashboard_user;
GRANT ALL ON SEQUENCE auth.refresh_tokens_id_seq TO postgres;


--
-- Name: TABLE saml_providers; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.saml_providers TO postgres;
GRANT SELECT ON TABLE auth.saml_providers TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.saml_providers TO dashboard_user;


--
-- Name: TABLE saml_relay_states; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.saml_relay_states TO postgres;
GRANT SELECT ON TABLE auth.saml_relay_states TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.saml_relay_states TO dashboard_user;


--
-- Name: TABLE schema_migrations; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.schema_migrations TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.schema_migrations TO postgres;
GRANT SELECT ON TABLE auth.schema_migrations TO postgres WITH GRANT OPTION;


--
-- Name: TABLE sessions; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.sessions TO postgres;
GRANT SELECT ON TABLE auth.sessions TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.sessions TO dashboard_user;


--
-- Name: TABLE sso_domains; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.sso_domains TO postgres;
GRANT SELECT ON TABLE auth.sso_domains TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.sso_domains TO dashboard_user;


--
-- Name: TABLE sso_providers; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.sso_providers TO postgres;
GRANT SELECT ON TABLE auth.sso_providers TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.sso_providers TO dashboard_user;


--
-- Name: TABLE users; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.users TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.users TO postgres;
GRANT SELECT ON TABLE auth.users TO postgres WITH GRANT OPTION;


--
-- Name: TABLE pg_stat_statements; Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON TABLE extensions.pg_stat_statements FROM postgres;
GRANT ALL ON TABLE extensions.pg_stat_statements TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE extensions.pg_stat_statements TO dashboard_user;


--
-- Name: TABLE pg_stat_statements_info; Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON TABLE extensions.pg_stat_statements_info FROM postgres;
GRANT ALL ON TABLE extensions.pg_stat_statements_info TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE extensions.pg_stat_statements_info TO dashboard_user;


--
-- Name: TABLE decrypted_key; Type: ACL; Schema: pgsodium; Owner: supabase_admin
--

GRANT ALL ON TABLE pgsodium.decrypted_key TO pgsodium_keyholder;


--
-- Name: TABLE masking_rule; Type: ACL; Schema: pgsodium; Owner: supabase_admin
--

GRANT ALL ON TABLE pgsodium.masking_rule TO pgsodium_keyholder;


--
-- Name: TABLE mask_columns; Type: ACL; Schema: pgsodium; Owner: supabase_admin
--

GRANT ALL ON TABLE pgsodium.mask_columns TO pgsodium_keyholder;


--
-- Name: TABLE user_profiles; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.user_profiles TO anon;
GRANT ALL ON TABLE public.user_profiles TO authenticated;
GRANT ALL ON TABLE public.user_profiles TO service_role;


--
-- Name: TABLE messages; Type: ACL; Schema: realtime; Owner: supabase_realtime_admin
--

GRANT ALL ON TABLE realtime.messages TO postgres;
GRANT ALL ON TABLE realtime.messages TO dashboard_user;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO anon;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO authenticated;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO service_role;


--
-- Name: SEQUENCE messages_id_seq; Type: ACL; Schema: realtime; Owner: supabase_realtime_admin
--

GRANT ALL ON SEQUENCE realtime.messages_id_seq TO postgres;
GRANT ALL ON SEQUENCE realtime.messages_id_seq TO dashboard_user;
GRANT USAGE ON SEQUENCE realtime.messages_id_seq TO anon;
GRANT USAGE ON SEQUENCE realtime.messages_id_seq TO authenticated;
GRANT USAGE ON SEQUENCE realtime.messages_id_seq TO service_role;


--
-- Name: TABLE schema_migrations; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.schema_migrations TO postgres;
GRANT ALL ON TABLE realtime.schema_migrations TO dashboard_user;
GRANT SELECT ON TABLE realtime.schema_migrations TO anon;
GRANT SELECT ON TABLE realtime.schema_migrations TO authenticated;
GRANT SELECT ON TABLE realtime.schema_migrations TO service_role;
GRANT ALL ON TABLE realtime.schema_migrations TO supabase_realtime_admin;


--
-- Name: TABLE subscription; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.subscription TO postgres;
GRANT ALL ON TABLE realtime.subscription TO dashboard_user;
GRANT SELECT ON TABLE realtime.subscription TO anon;
GRANT SELECT ON TABLE realtime.subscription TO authenticated;
GRANT SELECT ON TABLE realtime.subscription TO service_role;
GRANT ALL ON TABLE realtime.subscription TO supabase_realtime_admin;


--
-- Name: SEQUENCE subscription_id_seq; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO postgres;
GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO dashboard_user;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO anon;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO authenticated;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO service_role;
GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO supabase_realtime_admin;


--
-- Name: TABLE buckets; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.buckets TO anon;
GRANT ALL ON TABLE storage.buckets TO authenticated;
GRANT ALL ON TABLE storage.buckets TO service_role;
GRANT ALL ON TABLE storage.buckets TO postgres;


--
-- Name: TABLE migrations; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.migrations TO anon;
GRANT ALL ON TABLE storage.migrations TO authenticated;
GRANT ALL ON TABLE storage.migrations TO service_role;
GRANT ALL ON TABLE storage.migrations TO postgres;


--
-- Name: TABLE objects; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.objects TO anon;
GRANT ALL ON TABLE storage.objects TO authenticated;
GRANT ALL ON TABLE storage.objects TO service_role;
GRANT ALL ON TABLE storage.objects TO postgres;


--
-- Name: TABLE s3_multipart_uploads; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.s3_multipart_uploads TO service_role;
GRANT SELECT ON TABLE storage.s3_multipart_uploads TO authenticated;
GRANT SELECT ON TABLE storage.s3_multipart_uploads TO anon;


--
-- Name: TABLE s3_multipart_uploads_parts; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.s3_multipart_uploads_parts TO service_role;
GRANT SELECT ON TABLE storage.s3_multipart_uploads_parts TO authenticated;
GRANT SELECT ON TABLE storage.s3_multipart_uploads_parts TO anon;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON SEQUENCES TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON FUNCTIONS TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON TABLES TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON SEQUENCES TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON FUNCTIONS TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON TABLES TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: pgsodium; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA pgsodium GRANT ALL ON SEQUENCES TO pgsodium_keyholder;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: pgsodium; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA pgsodium GRANT ALL ON TABLES TO pgsodium_keyholder;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: pgsodium_masks; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA pgsodium_masks GRANT ALL ON SEQUENCES TO pgsodium_keyiduser;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: pgsodium_masks; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA pgsodium_masks GRANT ALL ON FUNCTIONS TO pgsodium_keyiduser;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: pgsodium_masks; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA pgsodium_masks GRANT ALL ON TABLES TO pgsodium_keyiduser;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON SEQUENCES TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON FUNCTIONS TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON TABLES TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO service_role;


--
-- Name: issue_graphql_placeholder; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_graphql_placeholder ON sql_drop
         WHEN TAG IN ('DROP EXTENSION')
   EXECUTE FUNCTION extensions.set_graphql_placeholder();


ALTER EVENT TRIGGER issue_graphql_placeholder OWNER TO supabase_admin;

--
-- Name: issue_pg_cron_access; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_pg_cron_access ON ddl_command_end
         WHEN TAG IN ('CREATE EXTENSION')
   EXECUTE FUNCTION extensions.grant_pg_cron_access();


ALTER EVENT TRIGGER issue_pg_cron_access OWNER TO supabase_admin;

--
-- Name: issue_pg_graphql_access; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_pg_graphql_access ON ddl_command_end
         WHEN TAG IN ('CREATE FUNCTION')
   EXECUTE FUNCTION extensions.grant_pg_graphql_access();


ALTER EVENT TRIGGER issue_pg_graphql_access OWNER TO supabase_admin;

--
-- Name: issue_pg_net_access; Type: EVENT TRIGGER; Schema: -; Owner: postgres
--

CREATE EVENT TRIGGER issue_pg_net_access ON ddl_command_end
         WHEN TAG IN ('CREATE EXTENSION')
   EXECUTE FUNCTION extensions.grant_pg_net_access();


ALTER EVENT TRIGGER issue_pg_net_access OWNER TO postgres;

--
-- Name: pgrst_ddl_watch; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER pgrst_ddl_watch ON ddl_command_end
   EXECUTE FUNCTION extensions.pgrst_ddl_watch();


ALTER EVENT TRIGGER pgrst_ddl_watch OWNER TO supabase_admin;

--
-- Name: pgrst_drop_watch; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER pgrst_drop_watch ON sql_drop
   EXECUTE FUNCTION extensions.pgrst_drop_watch();


ALTER EVENT TRIGGER pgrst_drop_watch OWNER TO supabase_admin;

--
-- PostgreSQL database dump complete
--

