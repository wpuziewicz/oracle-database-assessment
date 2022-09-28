CREATE OR REPLACE FUNCTION load_data(dir_name VARCHAR, file_tag VARCHAR, truncate_tables BOOLEAN) 
RETURNS TABLE (table_loaded VARCHAR, rows_loaded INT)
AS $$
DECLARE
    loadsql RECORD;
	cnt bigINT = 0;
BEGIN

    FOR loadsql IN
      SELECT 'COPY ' || table_name || ' FROM '||chr(39)|| dir_name || '/opdb__' || table_name || file_tag ||chr(39)||
             ' with (format CSV, delimiter ' ||chr(39) || '|' || chr(39) ||', header true);' AS the_sql,
			 table_name
      FROM information_schema.tables
      WHERE table_schema ='public'
      ORDER BY table_name
    LOOP
	    IF truncate_tables THEN EXECUTE 'TRUNCATE TABLE ' || loadsql.table_name ;
		END IF;

        EXECUTE loadsql.the_sql;
		GET DIAGNOSTICS rc=row_count;
		
		table_loaded := loadsql.table_name;
		rows_loaded := rc;
		RETURN NEXT;

    END LOOP;

END;
$$ LANGUAGE plpgsql;

/* Usage :
SELECT *
FROM load_data('/tmp/new', '__210_3.0.3_317593e95c22_XE_XE_092022202249.csv', TRUE);
*/
