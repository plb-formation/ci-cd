CREATE OR REPLACE VIEW vw_ticket AS
SELECT vw1.* from dblink('host=51.255.211.239 user=postgres password=tcwow12 dbname=crdticket', 
                      'select * from ticket')
as vw1
(   
    skuid integer,
    logged_user character varying(15),
    categorie integer,
    last_update timestamp
);