--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--



--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: -
--



SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: collections; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE collections (
    uuid uuid DEFAULT uuid_generate_v4() NOT NULL,
    name text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone,
    deleted_at timestamp with time zone
);


--
-- Name: resources; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE resources (
    uuid uuid DEFAULT uuid_generate_v4() NOT NULL,
    type text NOT NULL,
    title text,
    url text,
    excerpt text,
    response_code integer,
    collection_id uuid NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone,
    deleted_at timestamp with time zone
);


--
-- Name: resources_tags; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE resources_tags (
    resource_id uuid NOT NULL,
    tag_id uuid NOT NULL
);


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schema_migrations (
    filename text NOT NULL
);


--
-- Name: tags; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE tags (
    uuid uuid DEFAULT uuid_generate_v4() NOT NULL,
    collection_id uuid NOT NULL,
    name text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone,
    deleted_at timestamp with time zone
);


--
-- Name: collections_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY collections
    ADD CONSTRAINT collections_pkey PRIMARY KEY (uuid);


--
-- Name: resources_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY resources
    ADD CONSTRAINT resources_pkey PRIMARY KEY (uuid);


--
-- Name: resources_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY resources_tags
    ADD CONSTRAINT resources_tags_pkey PRIMARY KEY (resource_id, tag_id);


--
-- Name: schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (filename);


--
-- Name: tags_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (uuid);


--
-- Name: resources_tags_tag_id_resource_id_index; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX resources_tags_tag_id_resource_id_index ON resources_tags USING btree (tag_id, resource_id);


--
-- Name: resources_tags_resource_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY resources_tags
    ADD CONSTRAINT resources_tags_resource_id_fkey FOREIGN KEY (resource_id) REFERENCES resources(uuid);


--
-- Name: resources_tags_tag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY resources_tags
    ADD CONSTRAINT resources_tags_tag_id_fkey FOREIGN KEY (tag_id) REFERENCES tags(uuid);


--
-- PostgreSQL database dump complete
--

INSERT INTO "schema_migrations" ("filename") VALUES ('1426591233_create_collections.rb');
INSERT INTO "schema_migrations" ("filename") VALUES ('1426718074_create_resources.rb');
INSERT INTO "schema_migrations" ("filename") VALUES ('1427112968_create_tags.rb');
INSERT INTO "schema_migrations" ("filename") VALUES ('1427134884_create_tags_resources.rb');
