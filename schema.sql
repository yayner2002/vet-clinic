-----------animals table---------------------------------------
CREATE TABLE IF NOT EXISTS public.animals
(
    id integer NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    name character varying(100) COLLATE pg_catalog."default",
    date_of_birth date,
    escape_attempts integer,
    neutered boolean,
    weight_kg numeric,
    species_id integer,
    owner_id integer,
    CONSTRAINT animals_pkey PRIMARY KEY (id),
    CONSTRAINT fk_owner FOREIGN KEY (owner_id)
        REFERENCES public.owners (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE SET NULL,
    CONSTRAINT fk_species FOREIGN KEY (species_id)
        REFERENCES public.species (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE SET NULL
)

---------------owners table-----------------------------------------
CREATE TABLE IF NOT EXISTS public.owners
(
    id integer NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    full_name character varying(30) COLLATE pg_catalog."default",
    age integer,
    CONSTRAINT owners_pkey PRIMARY KEY (id)
)
-------------------------- species table---------------
CREATE TABLE IF NOT EXISTS public.species
(
    id integer NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    name character varying(30) COLLATE pg_catalog."default",
    CONSTRAINT species_pkey PRIMARY KEY (id)
)

-----------------------vets table ----------------------
CREATE TABLE IF NOT EXISTS public.vets
(
    id integer NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    name character varying(30) COLLATE pg_catalog."default",
    age integer,
    date_of_graduation date,
    CONSTRAINT vets_pkey PRIMARY KEY (id)
)

------------create specialization table structure------------------------------
CREATE TABLE specializations (
	species_id integer, 
	vets_id integer,
	PRIMARY KEY(species_id, vets_id),
	FOREIGN  KEY(species_id) REFERENCES species(id) ON DELETE CASCADE,
	FOREIGN KEY(vets_id) REFERENCES vets(id) ON DELETE CASCADE
)
------------- create visits table structure-------------------------------------
CREATE TABLE IF NOT EXISTS public.visits
(
    animal_id integer NOT NULL,
    vets_id integer NOT NULL,
    visit_date date NOT NULL,
    CONSTRAINT visits_pkey PRIMARY KEY (animal_id, vets_id, visit_date),
    CONSTRAINT visits_animal_id_fkey FOREIGN KEY (animal_id)
        REFERENCES public.animals (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE CASCADE,
    CONSTRAINT visits_vets_id_fkey FOREIGN KEY (vets_id)
        REFERENCES public.vets (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE CASCADE
)
---------- query plan and indexing-------------------
ALTER TABLE owners ADD COLUMN email VARCHAR(120);

