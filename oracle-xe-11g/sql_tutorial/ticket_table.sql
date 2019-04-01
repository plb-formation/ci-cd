CREATE TABLE public.ticket
(
  sku integer NOT NULL,
  logged_user character varying(15) NOT NULL,
  categorie integer,
  last_update timestamp without time zone NOT NULL DEFAULT now(),
  CONSTRAINT id_pk PRIMARY KEY (sku, logged_user)
)