-- V_DS_dbsummary

CREATE TABLE V_DS_dbsummary AS
WITH awr AS 
(
	SELECT PKEY, 
	MIN(TO_DATE(SUBSTR(min_begin_interval_time,1,9), 'DD-MON_RR')) AS begin_Date,
	MAX(TO_DATE(SUBSTR(max_begin_interval_time,1,9), 'DD-MON_RR')) AS End_date
	FROM awrsnapdetails 
	GROUP BY PKEY
),
a as (SELECT DISTINCT
dbsummary.pkey,
dbsummary.dbid,
db_name,
cdb,
db_version as dbversion,
db_fullversion as dbfullversion,
log_mode,
force_logging,
redo_gb_per_day,
CAST(rac_dbinstaces as numeric) as rac_dbinstaces,
characterset,
platform_name,
startup_time,
user_schemas,
CAST(buffer_cache_mb as numeric) as buffer_cache_mb,
CAST(shared_pool_mb as numeric) as shared_pool_mb,
CAST(total_pga_allocated_mb as numeric) as total_pga_allocated_mb,
CAST(db_size_allocated_gb as numeric) as db_size_allocated_gb,
CAST(db_size_in_use_gb as numeric) as db_size_in_use_gb,
db_long_size_gb,dg_database_role,
dg_protection_mode,dg_protection_level,
awr.begin_date,
awr.end_date,
awr.end_date - awr.begin_date AS awr_collected_days ,
--IFNULL(SAFE_CAST(TRIM(SUBSTR(TRIM(awr.min_begin_interval_time),1,8)) as DATE  format 'DD-MON-YY'), SAFE_CAST(REPLACE(TRIM(SUBSTR(TRIM(awr.min_begin_interval_time),1,10)), '.', '-') as DATE  format 'DD-MM-YYYY')) Begin_date,
--TO_DATE(SUBSTR(awr.min_begin_interval_time,1,9), 'DD-MON_RR') AS begin_Date,
--IFNULL(SAFE_CAST(TRIM(SUBSTR(TRIM(awr.max_begin_interval_time),1,8)) as DATE  format 'DD-MON-YY'), SAFE_CAST(REPLACE(TRIM(SUBSTR(TRIM(awr.max_begin_interval_time),1,10)), '.', '-') as DATE  format 'DD-MM-YYYY')) End_date,
--TO_DATE(SUBSTR(awr.max_begin_interval_time,1,9), 'DD-MON_RR') AS End_date,
 /*
DATE_DIFF(IFNULL(SAFE_CAST(TRIM(SUBSTR(TRIM(awr.max_begin_interval_time),1,8)) as DATE  format 'DD-MON-YY'), SAFE_CAST(REPLACE(TRIM(SUBSTR(TRIM(awr.max_begin_interval_time),1,10)), '.', '-') as DATE  format 'DD-MM-YYYY')),
          IFNULL(SAFE_CAST(TRIM(SUBSTR(TRIM(awr.min_begin_interval_time),1,8)) as DATE  format 'DD-MON-YY'), SAFE_CAST(REPLACE(TRIM(SUBSTR(TRIM(awr.min_begin_interval_time),1,10)), '.', '-') as DATE  format 'DD-MM-YYYY')), DAY) as AWR_collected_days,
*/
--TO_DATE(SUBSTR(awr.max_begin_interval_time,1,9), 'DD-MON_RR') - TO_DATE(SUBSTR(awr.min_begin_interval_time,1,9), 'DD-MON_RR') as AWR_collected_days,
features.name as DB_feature_name,
features.current_usage as DB_feature_usage
 --,
 --awr.hour
FROM  dbsummary
--inner join awrsnapdetails as awr using (PKEY)
inner join awr using (PKEY) 
inner join dbfeatures as features using (PKEY)
--ON dbsummary.PKEY = awr.PKEY
where 
 --awr.hour=14
--and 
 features.name like '%Exadata%'
)
select a.*,
CASE
when a.DB_feature_usage = 'False' then 'Non-Exadata'
when a.DB_feature_usage = 'True' then 'Exadata'
else 'UNKOWN'
end as Is_Exadata
from a;

