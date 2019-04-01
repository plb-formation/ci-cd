SELECT ' pg_dump --table='||table_name||'  --data-only --column-inserts sakila >'|| table_name ||'.sql' table_name FROM information_schema.tables WHERE table_schema='public'
CREATE EXTENSION plperl
select name, default_version, installed_version from pg_available_extensions