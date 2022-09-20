-------create patients table from the ERD-------
CREATE TABLE IF NOT EXISTS public.patients
(
    id integer NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    name character varying COLLATE pg_catalog."default",
    date_of_birth date,
    CONSTRAINT patients_pkey PRIMARY KEY (id)
)

--------create treatments table ---------
CREATE TABLE IF NOT EXISTS public.treatments
(
    id integer NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    type character varying COLLATE pg_catalog."default",
    name character varying COLLATE pg_catalog."default",
    CONSTRAINT treatments_pkey PRIMARY KEY (id)
)
--------create medical histories table -------
CREATE TABLE IF NOT EXISTS public.medical_histories
(
    id integer NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    admitted_at timestamp with time zone,
    patient_id integer,
    CONSTRAINT medical_histories_pkey PRIMARY KEY (id),
    CONSTRAINT fk_medical_history_patients FOREIGN KEY (patient_id)
        REFERENCES public.patients (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)