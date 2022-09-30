CREATE OR REPLACE FUNCTION load_data(dir_name VARCHAR, file_prefix VARCHAR, file_tag VARCHAR, truncate_tables BOOLEAN) 
RETURNS TABLE (table_loaded VARCHAR, rows_loaded INT, file_name VARCHAR)
AS $$
DECLARE
    loadsql RECORD;
	cnt BIGINT = 0;
	rc BIGINT = 0;
	fsize BIGINT = 0;
BEGIN

    FOR loadsql IN
      SELECT 'COPY ' || table_name || ' FROM ' ||chr(39) AS pre,
	         dir_name || '/' || file_prefix || table_name || file_tag AS fname,
             chr(39) || ' with (format CSV, delimiter ' ||chr(39) || '|' || chr(39) ||', header true);' AS suf,
			 table_name
      FROM information_schema.tables
      WHERE table_schema ='public'
      ORDER BY table_name
    LOOP
        table_loaded := loadsql.table_name;
		file_name := loadsql.fname;
	    SELECT size FROM pg_stat_file(loadsql.fname , true) INTO fsize;
		
		IF (fsize IS NOT NULL ) THEN
  	      IF truncate_tables THEN EXECUTE 'TRUNCATE TABLE ' || loadsql.table_name ;
  		  END IF;

          EXECUTE loadsql.pre || loadsql.fname || loadsql.suf;
		  GET DIAGNOSTICS rc=row_count;
		
		  rows_loaded := rc;
	    ELSE rows_loaded := 0;
		END IF;
		RETURN NEXT;

    END LOOP;

END;
$$ LANGUAGE plpgsql;

/* Usage :
SELECT *
FROM load_data('/tmp/new', 'opdb__', '__190_3.0.4_rac194.wpuziewicz.com_OUSPRD_ousprd1_092922083826.csv', TRUE);

SELECT *
FROM load_data('/tmp/new', 'optconfig__', '__.csv', TRUE);

*/

