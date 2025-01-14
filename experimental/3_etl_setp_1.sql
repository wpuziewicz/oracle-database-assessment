
/*
"db_migration-rule00": {
    "priority": 100,
    "min_sql_script_version": "2.0.0",
    "max_sql_script_version": "3.0.3",
    "min_db_version": "111",
    "max_db_version": "216",
    "execution_group": "1",
    "action_details": {
      "action": "CREATE_OR_REPLACE_DATAFRAME",
      "expr1": "dataframes[DBSUMMARY][[PKEY, DBID, DB_NAME,DBFULLVERSION,LOG_MODE,REDO_GB_PER_DAY,PLATFORM_NAME,DB_SIZE_ALLOCATED_GB,DB_SIZE_IN_USE_GB]]",
      "if_error": "None",
      "type": "FREESTYLE",
      "dataframe_name": "DBMIGRATION_BASE",
      "store": "BIGQUERY"
    },
    "status": "ENABLED",
    "tags": ["DB_MIGRATION"],
    "description": "Creating a new dataframe out of some columns from DBSUMMARY."
  },
*/
  CREATE TABLE DBMIGRATION_BASE AS 
  SELECT 
  PKEY, 
  DBID, 
  DB_NAME,
  DB_FULLVERSION,
  LOG_MODE,
  REDO_GB_PER_DAY,
  PLATFORM_NAME,
  DB_SIZE_ALLOCATED_GB,
  DB_SIZE_IN_USE_GB
  FROM DBSUMMARY;

/*
  "db_migration-rule01": {
    "priority": 200,
    "min_sql_script_version": "2.0.0",
    "max_sql_script_version": "3.0.3",
    "min_db_version": "111",
    "max_db_version": "216",
    "execution_group": "1",
    "action_details": {
      "action": "CREATE_OR_REPLACE_DATAFRAME",
      "expr1": "pd.concat([dataframes[DBMIGRATION_BASE].assign(TECHNIQUE=RMAN_BACKUP_RESTORE),dataframes[DBMIGRATION_BASE].assign(TECHNIQUE=EXP_FULL),dataframes[DBMIGRATION_BASE].assign(TECHNIQUE=XTTS_INCREMENTAL),dataframes[DBMIGRATION_BASE].assign(TECHNIQUE=DATA_GUARD)])",
      "if_error": "None",
      "type": "FREESTYLE",
      "dataframe_name": "DBMIGRATION_DETAILS",
      "store": "BIGQUERY"
    },
    "status": "ENABLED",
    "tags": ["DB_MIGRATION"],
    "description": "This rule adds a new column dataframes['OPTIMUSCONFIG_NETWORK_TO_GCP'].loc[dataframes['OPTIMUSCONFIG_NETWORK_TO_GCP']['network_to_gcp'] == transformersParameters['network_to_gcp']]"
  },
*/
--DROP TABLE DBMIGRATION_DETAILS;
  CREATE TABLE DBMIGRATION_DETAILS
  AS SELECT * FROM DBMIGRATION_BASE
  WHERE 1=2;
  
  ALTER TABLE DBMIGRATION_DETAILS ADD TECHNIQUE VARCHAR(30);

  INSERT INTO DBMIGRATION_DETAILS 
  SELECT a.*, 'RMAN_BACKUP_RESTORE'
  FROM DBMIGRATION_BASE a;

  INSERT INTO DBMIGRATION_DETAILS 
  SELECT a.*, 'EXP_FULL'
  FROM DBMIGRATION_BASE a;

  INSERT INTO DBMIGRATION_DETAILS 
  SELECT a.*, 'XTTS_INCREMENTAL'
  FROM DBMIGRATION_BASE a;

  INSERT INTO DBMIGRATION_DETAILS 
  SELECT a.*, 'DATA_GUARD'
  FROM DBMIGRATION_BASE a;


/*
  INSERT INTO DBMIGRATION_DETAILS (TECHNIQUE) VALUES ('RMAN_BACKUP_RESTORE');
  INSERT INTO DBMIGRATION_DETAILS (TECHNIQUE) VALUES ('EXP_FULL');
  INSERT INTO DBMIGRATION_DETAILS (TECHNIQUE) VALUES ('XTTS_INCREMENTAL');
  INSERT INTO DBMIGRATION_DETAILS (TECHNIQUE) VALUES ('DATA_GUARD');
*/  
select * from DBMIGRATION_DETAILS;
/*
  "varname": "AWRHISTSYSMETRICHIST",
  "value": "{from_to_rows_to_columns: 
  {
    Average Active Sessions: AAS, 
    Background CPU Usage Per Sec: BKGRCPU_PER_SEC, 
    CPU Usage Per Sec: CPU_PER_SEC, 
    DB Block Changes Per Txn : DBBLKSCHANGES_PER_SEC, 
    Executions Per Sec: EXEC_PER_SEC, 
    Host CPU Usage Per Sec: HOST_CPU_PER_SEC, 
    I/O Megabytes per Second: IOMBPS, 
    I/O Requests per Second: IOPS, 
    Logical Reads Per Txn: LOG_READS_PER_TXN, 
    Logons Per Sec: LOGONS_PER_SEC,  
    Physical Reads Per Sec: PHY_READS_PER_SEC,  
    Physical Writes Per Sec: PHY_WRITES_PER_SEC, 
    Redo Generated Per Sec: REDO_GEN_PER_SEC, 
    SQL Service Response Time: SQL_RT, 
    User Calls Per Sec: USERCALLS_PER_SEC, 
    User Transaction Per Sec: USER_TX_PER_SEC
}, 
    TARGET_COLUMN: METRIC_NAME, 
    TARGET_STATS_COLUMNS: [PERC90,PERC95], 
    INDEX_COLUMNS: [PKEY, DBID,INSTANCE_NUMBER,HOUR], 
    store: BIGQUERY, 
    filterrows: YES
    }",
*/
    CREATE TABLE AWRHISTSYSMETRICHIST_RS 
    AS
    SELECT
    PKEY, DBID,INSTANCE_NUMBER,HOUR,
    SUM(CASE WHEN metric_name = 'Average Active Sessions' THEN PERC90 ELSE 0 END) AS  AAS_PERC90, 
    SUM(CASE WHEN metric_name = 'Background CPU Usage Per Sec' THEN PERC90 ELSE 0 END) AS  BKGRCPU_PER_SEC_PERC90, 
    SUM(CASE WHEN metric_name = 'CPU Usage Per Sec' THEN PERC90 ELSE 0 END) AS  CPU_PER_SEC_PERC90, 
    SUM(CASE WHEN metric_name = 'DB Block Changes Per Txn' THEN PERC90 ELSE 0 END) AS  DBBLKSCHANGES_PER_SEC_PERC90, 
    SUM(CASE WHEN metric_name = 'Executions Per Sec' THEN PERC90 ELSE 0 END) AS  EXEC_PER_SEC_PERC90, 
    SUM(CASE WHEN metric_name = 'Host CPU Usage Per Sec' THEN PERC90 ELSE 0 END) AS  HOST_CPU_PER_SEC_PERC90, 
    SUM(CASE WHEN metric_name = 'I/O Megabytes per Second' THEN PERC90 ELSE 0 END) AS  IOMBPS_PERC90, 
    SUM(CASE WHEN metric_name = 'I/O Requests per Second' THEN PERC90 ELSE 0 END) AS  IOPS_PERC90, 
    SUM(CASE WHEN metric_name = 'Logical Reads Per Txn' THEN PERC90 ELSE 0 END) AS  LOG_READS_PER_TXN_PERC90, 
    SUM(CASE WHEN metric_name = 'Logons Per Sec' THEN PERC90 ELSE 0 END) AS  LOGONS_PER_SEC_PERC90,  
    SUM(CASE WHEN metric_name = 'Physical Reads Per Sec' THEN PERC90 ELSE 0 END) AS  PHY_READS_PER_SEC_PERC90,  
    SUM(CASE WHEN metric_name = 'Physical Writes Per Sec' THEN PERC90 ELSE 0 END) AS  PHY_WRITES_PER_SEC_PERC90, 
    SUM(CASE WHEN metric_name = 'Redo Generated Per Sec' THEN PERC90 ELSE 0 END) AS  REDO_GEN_PER_SEC_PERC90, 
    SUM(CASE WHEN metric_name = 'SQL Service Response Time' THEN PERC90 ELSE 0 END) AS  SQL_RT_PERC90, 
    SUM(CASE WHEN metric_name = 'User Calls Per Sec' THEN PERC90 ELSE 0 END) AS  USERCALLS_PER_SEC_PERC90, 
    SUM(CASE WHEN metric_name = 'User Transaction Per Sec' THEN PERC90 ELSE 0 END) AS  USER_TX_PER_SEC_PERC90,
    SUM(CASE WHEN metric_name = 'Average Active Sessions' THEN PERC95 ELSE 0 END) AS  AAS_PERC95, 
    SUM(CASE WHEN metric_name = 'Background CPU Usage Per Sec' THEN PERC95 ELSE 0 END) AS  BKGRCPU_PER_SEC_PERC95, 
    SUM(CASE WHEN metric_name = 'CPU Usage Per Sec' THEN PERC95 ELSE 0 END) AS  CPU_PER_SEC_PERC95, 
    SUM(CASE WHEN metric_name = 'DB Block Changes Per Txn' THEN PERC95 ELSE 0 END) AS  DBBLKSCHANGES_PER_SEC_PERC95, 
    SUM(CASE WHEN metric_name = 'Executions Per Sec' THEN PERC95 ELSE 0 END) AS  EXEC_PER_SEC_PERC95, 
    SUM(CASE WHEN metric_name = 'Host CPU Usage Per Sec' THEN PERC95 ELSE 0 END) AS  HOST_CPU_PER_SEC_PERC95, 
    SUM(CASE WHEN metric_name = 'I/O Megabytes per Second' THEN PERC95 ELSE 0 END) AS  IOMBPS_PERC95, 
    SUM(CASE WHEN metric_name = 'I/O Requests per Second' THEN PERC95 ELSE 0 END) AS  IOPS_PERC95, 
    SUM(CASE WHEN metric_name = 'Logical Reads Per Txn' THEN PERC95 ELSE 0 END) AS  LOG_READS_PER_TXN_PERC95, 
    SUM(CASE WHEN metric_name = 'Logons Per Sec' THEN PERC95 ELSE 0 END) AS  LOGONS_PER_SEC_PERC95,  
    SUM(CASE WHEN metric_name = 'Physical Reads Per Sec' THEN PERC95 ELSE 0 END) AS  PHY_READS_PER_SEC_PERC95,  
    SUM(CASE WHEN metric_name = 'Physical Writes Per Sec' THEN PERC95 ELSE 0 END) AS  PHY_WRITES_PER_SEC_PERC95, 
    SUM(CASE WHEN metric_name = 'Redo Generated Per Sec' THEN PERC95 ELSE 0 END) AS  REDO_GEN_PER_SEC_PERC95, 
    SUM(CASE WHEN metric_name = 'SQL Service Response Time' THEN PERC95 ELSE 0 END) AS  SQL_RT_PERC95, 
    SUM(CASE WHEN metric_name = 'User Calls Per Sec' THEN PERC95 ELSE 0 END) AS  USERCALLS_PER_SEC_PERC95, 
    SUM(CASE WHEN metric_name = 'User Transaction Per Sec' THEN PERC95 ELSE 0 END) AS  USER_TX_PER_SEC_PERC95
    FROM AWRHISTSYSMETRICHIST
    GROUP BY PKEY, DBID,INSTANCE_NUMBER,HOUR;

select * from AWRHISTSYSMETRICHIST_RS;
/*
    "action_details": {
        "action": "CREATE",
        "expr1": "",
        "if_error": "IGNORE",
        "type": "VARIABLE",
        "varname": "AWRHISTOSSTAT",
        "value": "{from_to_rows_to_columns: {
            LOAD: LOAD, 
            NUM_CPUS: NUM_CPUS, 
            SYS_TIME: SYS_TIME, 
            BUSY_TIME: BUSY_TIME, 
            IDLE_TIME: IDLE_TIME, 
            NICE_TIME: NICE_TIME, 
            USER_TIME: USER_TIME, 
            IOWAIT_TIME: IOWAIT_TIME, 
            VM_IN_BYTES: VM_IN_BYTES, 
            VM_OUT_BYTES: VM_OUT_BYTES, 
            NUM_CPU_CORES: NUM_CPU_CORES, 
            NUM_CPU_SOCKETS: NUM_CPU_SOCKETS, 
            SWAP_FREE_BYTES: SWAP_FREE_BYTES, 
            FREE_MEMORY_BYTES: FREE_MEMORY_BYTES, 
            PHYSICAL_MEMORY_BYTES: PHYSICAL_MEMORY_BYTES, 
            RSRC_MGR_CPU_WAIT_TIME: RSRC_MGR_CPU_WAIT_TIME, 
            INACTIVE_MEMORY_BYTES: INACTIVE_MEMORY_BYTES
            }, 
            TARGET_COLUMN: STAT_NAME, 
            TARGET_STATS_COLUMNS: [
                CUMULATIVE_VALUE,PERC90,PERC95], 
                INDEX_COLUMNS: [PKEY, DBID,INSTANCE_NUMBER,HOUR], 
            store: BIGQUERY, filterrows: YES}",
        "datatype": "DICTIONARY"
      },
*/

CREATE TABLE AWRHISTOSSTAT_RS AS
SELECT PKEY, DBID,INSTANCE_NUMBER,HH24 AS HOUR,
SUM(CASE WHEN STAT_NAME = 'LOAD' THEN CUMULATIVE_VALUE ELSE 0 END) AS LOAD_CUMULATIVE_VALUE,
SUM(CASE WHEN STAT_NAME = 'NUM_CPUS' THEN CUMULATIVE_VALUE ELSE 0 END) AS NUM_CPUS_CUMULATIVE_VALUE,
SUM(CASE WHEN STAT_NAME = 'SYS_TIME' THEN CUMULATIVE_VALUE ELSE 0 END) AS SYS_TIME_CUMULATIVE_VALUE,
SUM(CASE WHEN STAT_NAME = 'BUSY_TIME' THEN CUMULATIVE_VALUE ELSE 0 END) AS BUSY_TIME_CUMULATIVE_VALUE,
SUM(CASE WHEN STAT_NAME = 'IDLE_TIME' THEN CUMULATIVE_VALUE ELSE 0 END) AS IDLE_TIME_CUMULATIVE_VALUE,
SUM(CASE WHEN STAT_NAME = 'NICE_TIME' THEN CUMULATIVE_VALUE ELSE 0 END) AS NICE_TIME_CUMULATIVE_VALUE,
SUM(CASE WHEN STAT_NAME = 'USER_TIME' THEN CUMULATIVE_VALUE ELSE 0 END) AS USER_TIME_CUMULATIVE_VALUE,
SUM(CASE WHEN STAT_NAME = 'IOWAIT_TIME' THEN CUMULATIVE_VALUE ELSE 0 END) AS IOWAIT_TIME_CUMULATIVE_VALUE,
SUM(CASE WHEN STAT_NAME = 'VM_IN_BYTES' THEN CUMULATIVE_VALUE ELSE 0 END) AS VM_IN_BYTES_CUMULATIVE_VALUE,
SUM(CASE WHEN STAT_NAME = 'VM_OUT_BYTES' THEN CUMULATIVE_VALUE ELSE 0 END) AS VM_OUT_BYTES_CUMULATIVE_VALUE,
SUM(CASE WHEN STAT_NAME = 'NUM_CPU_CORES' THEN CUMULATIVE_VALUE ELSE 0 END) AS NUM_CPU_CORES_CUMULATIVE_VALUE,
SUM(CASE WHEN STAT_NAME = 'NUM_CPU_SOCKETS' THEN CUMULATIVE_VALUE ELSE 0 END) AS NUM_CPU_SOCKETS_CUMULATIVE_VALUE,
SUM(CASE WHEN STAT_NAME = 'SWAP_FREE_BYTES' THEN CUMULATIVE_VALUE ELSE 0 END) AS SWAP_FREE_BYTES_CUMULATIVE_VALUE,
SUM(CASE WHEN STAT_NAME = 'FREE_MEMORY_BYTES' THEN CUMULATIVE_VALUE ELSE 0 END) AS FREE_MEMORY_BYTES_CUMULATIVE_VALUE,
SUM(CASE WHEN STAT_NAME = 'PHYSICAL_MEMORY_BYTES' THEN CUMULATIVE_VALUE ELSE 0 END) AS PHYSICAL_MEMORY_BYTES_CUMULATIVE_VALUE,
SUM(CASE WHEN STAT_NAME = 'RSRC_MGR_CPU_WAIT_TIME' THEN CUMULATIVE_VALUE ELSE 0 END) AS RSRC_MGR_CPU_WAIT_TIME_CUMULATIVE_VALUE,
SUM(CASE WHEN STAT_NAME = 'INACTIVE_MEMORY_BYTES' THEN CUMULATIVE_VALUE ELSE 0 END) AS INACTIVE_MEMORY_BYTES_CUMULATIVE_VALUE,
SUM(CASE WHEN STAT_NAME = 'LOAD' THEN PERC90 ELSE 0 END) AS LOAD_PERC90,
SUM(CASE WHEN STAT_NAME = 'NUM_CPUS' THEN PERC90 ELSE 0 END) AS NUM_CPUS_PERC90,
SUM(CASE WHEN STAT_NAME = 'SYS_TIME' THEN PERC90 ELSE 0 END) AS SYS_TIME_PERC90,
SUM(CASE WHEN STAT_NAME = 'BUSY_TIME' THEN PERC90 ELSE 0 END) AS BUSY_TIME_PERC90,
SUM(CASE WHEN STAT_NAME = 'IDLE_TIME' THEN PERC90 ELSE 0 END) AS IDLE_TIME_PERC90,
SUM(CASE WHEN STAT_NAME = 'NICE_TIME' THEN PERC90 ELSE 0 END) AS NICE_TIME_PERC90,
SUM(CASE WHEN STAT_NAME = 'USER_TIME' THEN PERC90 ELSE 0 END) AS USER_TIME_PERC90,
SUM(CASE WHEN STAT_NAME = 'IOWAIT_TIME' THEN PERC90 ELSE 0 END) AS IOWAIT_TIME_PERC90,
SUM(CASE WHEN STAT_NAME = 'VM_IN_BYTES' THEN PERC90 ELSE 0 END) AS VM_IN_BYTES_PERC90,
SUM(CASE WHEN STAT_NAME = 'VM_OUT_BYTES' THEN PERC90 ELSE 0 END) AS VM_OUT_BYTES_PERC90,
SUM(CASE WHEN STAT_NAME = 'NUM_CPU_CORES' THEN PERC90 ELSE 0 END) AS NUM_CPU_CORES_PERC90,
SUM(CASE WHEN STAT_NAME = 'NUM_CPU_SOCKETS' THEN PERC90 ELSE 0 END) AS NUM_CPU_SOCKETS_PERC90,
SUM(CASE WHEN STAT_NAME = 'SWAP_FREE_BYTES' THEN PERC90 ELSE 0 END) AS SWAP_FREE_BYTES_PERC90,
SUM(CASE WHEN STAT_NAME = 'FREE_MEMORY_BYTES' THEN PERC90 ELSE 0 END) AS FREE_MEMORY_BYTES_PERC90,
SUM(CASE WHEN STAT_NAME = 'PHYSICAL_MEMORY_BYTES' THEN PERC90 ELSE 0 END) AS PHYSICAL_MEMORY_BYTES_PERC90,
SUM(CASE WHEN STAT_NAME = 'RSRC_MGR_CPU_WAIT_TIME' THEN PERC90 ELSE 0 END) AS RSRC_MGR_CPU_WAIT_TIME_PERC90,
SUM(CASE WHEN STAT_NAME = 'INACTIVE_MEMORY_BYTES' THEN PERC90 ELSE 0 END) AS INACTIVE_MEMORY_BYTES_PERC90,
SUM(CASE WHEN STAT_NAME = 'LOAD' THEN PERC95 ELSE 0 END) AS LOAD_PERC95,
SUM(CASE WHEN STAT_NAME = 'NUM_CPUS' THEN PERC95 ELSE 0 END) AS NUM_CPUS_PERC95,
SUM(CASE WHEN STAT_NAME = 'SYS_TIME' THEN PERC95 ELSE 0 END) AS SYS_TIME_PERC95,
SUM(CASE WHEN STAT_NAME = 'BUSY_TIME' THEN PERC95 ELSE 0 END) AS BUSY_TIME_PERC95,
SUM(CASE WHEN STAT_NAME = 'IDLE_TIME' THEN PERC95 ELSE 0 END) AS IDLE_TIME_PERC95,
SUM(CASE WHEN STAT_NAME = 'NICE_TIME' THEN PERC95 ELSE 0 END) AS NICE_TIME_PERC95,
SUM(CASE WHEN STAT_NAME = 'USER_TIME' THEN PERC95 ELSE 0 END) AS USER_TIME_PERC95,
SUM(CASE WHEN STAT_NAME = 'IOWAIT_TIME' THEN PERC95 ELSE 0 END) AS IOWAIT_TIME_PERC95,
SUM(CASE WHEN STAT_NAME = 'VM_IN_BYTES' THEN PERC95 ELSE 0 END) AS VM_IN_BYTES_PERC95,
SUM(CASE WHEN STAT_NAME = 'VM_OUT_BYTES' THEN PERC95 ELSE 0 END) AS VM_OUT_BYTES_PERC95,
SUM(CASE WHEN STAT_NAME = 'NUM_CPU_CORES' THEN PERC95 ELSE 0 END) AS NUM_CPU_CORES_PERC95,
SUM(CASE WHEN STAT_NAME = 'NUM_CPU_SOCKETS' THEN PERC95 ELSE 0 END) AS NUM_CPU_SOCKETS_PERC95,
SUM(CASE WHEN STAT_NAME = 'SWAP_FREE_BYTES' THEN PERC95 ELSE 0 END) AS SWAP_FREE_BYTES_PERC95,
SUM(CASE WHEN STAT_NAME = 'FREE_MEMORY_BYTES' THEN PERC95 ELSE 0 END) AS FREE_MEMORY_BYTES_PERC95,
SUM(CASE WHEN STAT_NAME = 'PHYSICAL_MEMORY_BYTES' THEN PERC95 ELSE 0 END) AS PHYSICAL_MEMORY_BYTES_PERC95,
SUM(CASE WHEN STAT_NAME = 'RSRC_MGR_CPU_WAIT_TIME' THEN PERC95 ELSE 0 END) AS RSRC_MGR_CPU_WAIT_TIME_PERC95,
SUM(CASE WHEN STAT_NAME = 'INACTIVE_MEMORY_BYTES' THEN PERC95 ELSE 0 END) AS INACTIVE_MEMORY_BYTES_PERC95
FROM AWRHISTOSSTAT
GROUP BY PKEY, DBID,INSTANCE_NUMBER,HOUR;


/* -- Replace all references with the original table
CREATE TABLE AWRHISTOSSTAT_RS_METRICS
AS SELECT * FROM AWRHISTOSSTAT_RS;
*/
/*
"action_details": {"action": "ADD_OR_UPDATE_COLUMN", "expr1": 
"dataFrames[\"AWRHISTOSSTAT_RS\"][\"BUSY_TIME_PERC95\"];/;(;dataFrames[\"AWRHISTOSSTAT_RS\"][\"BUSY_TIME_PERC95\"];+;dataFrames[\"AWRHISTOSSTAT_RS\"][\"IDLE_TIME_PERC95\"];);*;100", 
"iferror": "None", "type": "NUMBER", "dataframe_name": "AWRHISTOSSTAT_RS",
"target_dataframe_name": "AWRHISTOSSTAT_RS_METRICS","column_name": "HOST_CPU_UTILIZATION", "store": "BIGQUERY"},
*/
ALTER TABLE AWRHISTOSSTAT_RS ADD COLUMN HOST_CPU_UTILIZATION NUMERIC;
UPDATE AWRHISTOSSTAT_RS SET HOST_CPU_UTILIZATION = (BUSY_TIME_PERC95 / (BUSY_TIME_PERC95 +IDLE_TIME_PERC95 )) * 100;


/*
  "bms_sizing-rule02": {
    "priority": 275,
    "min_sql_script_version": "2.0.0",
    "max_sql_script_version": "3.0.3",
    "min_db_version": "111",
    "max_db_version": "216",
    "execution_group": "1",
    "action_details": {
      "action": "CREATE_OR_REPLACE_DATAFRAME",
      "expr1": "pd.merge(dataframes[AWRHISTSYSMETRICHIST_RS], dataframes[AWRHISTOSSTAT_RS], on=[_PKEY, _DBID, _INSTANCE_NUMBER, _HOUR])",
      "if_error": "None",
      "type": "FREESTYLE",
      "dataframe_name": "AWRHISTSYSMETRICHIST_RS_AWRHISTOSSTAT_RS",
      "store": "BIGQUERY"
    },
    "status": "ENABLED",
    "tags": ["BMS_SIZING"],
    "description": "Create a new dataframe out of joining AWRHISTSYSMETRICHIST_RS(database metrics) and AWRHISTOSSTAT_RS(os metrics)"
  },
*/
--DROP TABLE AWRHISTSYSMETRICHIST_RS_AWRHISTOSSTAT_RS;

  CREATE TABLE AWRHISTSYSMETRICHIST_RS_AWRHISTOSSTAT_RS AS 
  SELECT 
a.pkey, 
a.dbid, 
a.instance_number, 
a.hour, 
a.aas_perc90, 
a.bkgrcpu_per_sec_perc90, 
a.cpu_per_sec_perc90, 
a.dbblkschanges_per_sec_perc90, 
a.exec_per_sec_perc90, 
a.host_cpu_per_sec_perc90, 
a.iombps_perc90, 
a.iops_perc90, 
a.log_reads_per_txn_perc90, 
a.logons_per_sec_perc90, 
a.phy_reads_per_sec_perc90, 
a.phy_writes_per_sec_perc90, 
a.redo_gen_per_sec_perc90, 
a.sql_rt_perc90, 
a.usercalls_per_sec_perc90, 
a.user_tx_per_sec_perc90, 
a.aas_perc95, 
a.bkgrcpu_per_sec_perc95, 
a.cpu_per_sec_perc95, 
a.dbblkschanges_per_sec_perc95, 
a.exec_per_sec_perc95, 
a.host_cpu_per_sec_perc95, 
a.iombps_perc95, 
a.iops_perc95, 
a.log_reads_per_txn_perc95, 
a.logons_per_sec_perc95, 
a.phy_reads_per_sec_perc95, 
a.phy_writes_per_sec_perc95, 
a.redo_gen_per_sec_perc95, 
a.sql_rt_perc95, 
a.usercalls_per_sec_perc95, 
a.user_tx_per_sec_perc95, 
b.load_cumulative_value, 
b.num_cpus_cumulative_value, 
b.sys_time_cumulative_value, 
b.busy_time_cumulative_value, 
b.idle_time_cumulative_value, 
b.nice_time_cumulative_value, 
b.user_time_cumulative_value, 
b.iowait_time_cumulative_value, 
b.vm_in_bytes_cumulative_value, 
b.vm_out_bytes_cumulative_value, 
b.num_cpu_cores_cumulative_value, 
b.num_cpu_sockets_cumulative_value, 
b.swap_free_bytes_cumulative_value, 
b.free_memory_bytes_cumulative_value, 
b.physical_memory_bytes_cumulative_value, 
b.rsrc_mgr_cpu_wait_time_cumulative_value, 
b.inactive_memory_bytes_cumulative_value, 
b.load_perc90, 
b.num_cpus_perc90, 
b.sys_time_perc90, 
b.busy_time_perc90, 
b.idle_time_perc90, 
b.nice_time_perc90, 
b.user_time_perc90, 
b.iowait_time_perc90, 
b.vm_in_bytes_perc90, 
b.vm_out_bytes_perc90, 
b.num_cpu_cores_perc90, 
b.num_cpu_sockets_perc90, 
b.swap_free_bytes_perc90, 
b.free_memory_bytes_perc90, 
b.physical_memory_bytes_perc90, 
b.rsrc_mgr_cpu_wait_time_perc90, 
b.inactive_memory_bytes_perc90, 
b.load_perc95, 
b.num_cpus_perc95, 
b.sys_time_perc95, 
b.busy_time_perc95, 
b.idle_time_perc95, 
b.nice_time_perc95, 
b.user_time_perc95, 
b.iowait_time_perc95, 
b.vm_in_bytes_perc95, 
b.vm_out_bytes_perc95, 
b.num_cpu_cores_perc95, 
b.num_cpu_sockets_perc95, 
b.swap_free_bytes_perc95, 
b.free_memory_bytes_perc95, 
b.physical_memory_bytes_perc95, 
b.rsrc_mgr_cpu_wait_time_perc95, 
b.inactive_memory_bytes_perc95,
b.host_cpu_utilization
  FROM AWRHISTSYSMETRICHIST_RS a 
      JOIN AWRHISTOSSTAT_RS b ON a.PKEY = b.PKEY AND a.DBID = b.DBID AND a.INSTANCE_NUMBER=b.INSTANCE_NUMBER AND a.HOUR=b.HOUR;



ALTER TABLE AWRHISTSYSMETRICHIST_RS_AWRHISTOSSTAT_RS ADD COLUMN CPUDB95_PERC NUMERIC;
ALTER TABLE AWRHISTSYSMETRICHIST_RS_AWRHISTOSSTAT_RS ADD COLUMN CPUDB95_CORES NUMERIC;
ALTER TABLE AWRHISTSYSMETRICHIST_RS_AWRHISTOSSTAT_RS ADD COLUMN CPUHOST95_CORES NUMERIC;
ALTER TABLE AWRHISTSYSMETRICHIST_RS_AWRHISTOSSTAT_RS ADD COLUMN BMSCORES95_DB NUMERIC;
ALTER TABLE AWRHISTSYSMETRICHIST_RS_AWRHISTOSSTAT_RS ADD COLUMN IOPS95_TB_BMS NUMERIC;
ALTER TABLE AWRHISTSYSMETRICHIST_RS_AWRHISTOSSTAT_RS ADD COLUMN BMSCORES95_HOST NUMERIC;

SELECT hour, HOST_CPU_PER_SEC_PERC95, HOST_CPU_UTILIZATION FROM AWRHISTSYSMETRICHIST_RS_AWRHISTOSSTAT_RS where hour='16';
-- No column HOST_CPU_UTILIZATION ??
-- Divide by Zero
UPDATE AWRHISTSYSMETRICHIST_RS_AWRHISTOSSTAT_RS SET CPUDB95_PERC = 
CASE WHEN HOST_CPU_PER_SEC_PERC95 = 0 OR HOST_CPU_UTILIZATION = 0 THEN NULL ELSE
(CPU_PER_SEC_PERC95 + BKGRCPU_PER_SEC_PERC95) / HOST_CPU_PER_SEC_PERC95 / HOST_CPU_UTILIZATION END;
--(;dataframes[AWRHISTSYSMETRICHIST_RS_AWRHISTOSSTAT_RS][CPU_PER_SEC_PERC95];+;dataframes[AWRHISTSYSMETRICHIST_RS_AWRHISTOSSTAT_RS][BKGRCPU_PER_SEC_PERC95];);/;
--(;dataframes[AWRHISTSYSMETRICHIST_RS_AWRHISTOSSTAT_RS][HOST_CPU_PER_SEC_PERC95];/;dataframes[AWRHISTSYSMETRICHIST_RS_AWRHISTOSSTAT_RS][HOST_CPU_UTILIZATION];)

UPDATE AWRHISTSYSMETRICHIST_RS_AWRHISTOSSTAT_RS SET CPUDB95_CORES = (NUM_CPU_CORES_CUMULATIVE_VALUE / 100) * CPUDB95_PERC;
--(dataframes[AWRHISTSYSMETRICHIST_RS_AWRHISTOSSTAT_RS][NUM_CPU_CORES_CUMULATIVE_VALUE];/;100);*;dataframes[AWRHISTSYSMETRICHIST_RS_AWRHISTOSSTAT_RS][CPUDB95_PERC]

UPDATE AWRHISTSYSMETRICHIST_RS_AWRHISTOSSTAT_RS SET CPUHOST95_CORES = (NUM_CPU_CORES_CUMULATIVE_VALUE / 100) * HOST_CPU_UTILIZATION;
--dataframes[AWRHISTSYSMETRICHIST_RS_AWRHISTOSSTAT_RS][NUM_CPU_CORES_CUMULATIVE_VALUE];/;100);*;dataframes[AWRHISTSYSMETRICHIST_RS_AWRHISTOSSTAT_RS][HOST_CPU_UTILIZATION]

UPDATE AWRHISTSYSMETRICHIST_RS_AWRHISTOSSTAT_RS SET BMSCORES95_DB = CPUDB95_CORES * 0.8;
--(;dataframes[AWRHISTSYSMETRICHIST_RS_AWRHISTOSSTAT_RS][CPUDB95_CORES];*;0.8;)

UPDATE AWRHISTSYSMETRICHIST_RS_AWRHISTOSSTAT_RS SET BMSCORES95_HOST = CPUHOST95_CORES * 0.8;
--(dataframes[AWRHISTSYSMETRICHIST_RS_AWRHISTOSSTAT_RS][CPUHOST95_CORES];*;0.8)

UPDATE AWRHISTSYSMETRICHIST_RS_AWRHISTOSSTAT_RS SET IOPS95_TB_BMS = IOPS_PERC95 / 6000;
--(dataframes[AWRHISTSYSMETRICHIST_RS_AWRHISTOSSTAT_RS][IOPS_PERC95];/;6000)


/*
select case when table_name = lower('AWRHISTSYSMETRICHIST_RS') then 'a.' else 'b.' end ||column_name || ', '
from information_schema.columns
where table_name in (lower('AWRHISTSYSMETRICHIST_RS'), lower('AWRHISTOSSTAT_RS'))
order by table_name desc, ordinal_position;
;
*/
/*
  "bms_sizing-rule09": {
    "priority": 350,
    "min_sql_script_version": "2.0.0",
    "max_sql_script_version": "3.0.3",
    "min_db_version": "111",
    "max_db_version": "216",
    "execution_group": "1",
    "action_details": {
      "action": "CREATE_OR_REPLACE_DATAFRAME",
      "expr1": "dataframes[AWRHISTSYSMETRICHIST_RS_AWRHISTOSSTAT_RS][[_PKEY, _DBID, _INSTANCE_NUMBER,_HOUR,AAS_PERC95,IOMBPS_PERC95,IOPS_PERC95,PHY_READS_PER_SEC_PERC95,PHY_WRITES_PER_SEC_PERC95,CPUDB95_PERC,CPUDB95_CORES,FREE_MEMORY_BYTES_PERC95,LOAD_PERC95,HOST_CPU_UTILIZATION,CPUHOST95_CORES,VM_IN_BYTES_PERC95,VM_OUT_BYTES_PERC95,PHYSICAL_MEMORY_BYTES_CUMULATIVE_VALUE,FREE_MEMORY_BYTES_CUMULATIVE_VALUE,NUM_CPUS_CUMULATIVE_VALUE,NUM_CPU_CORES_CUMULATIVE_VALUE,NUM_CPU_SOCKETS_CUMULATIVE_VALUE,PHYSICAL_MEMORY_BYTES_PERC95,NUM_CPUS_PERC95,NUM_CPU_CORES_PERC95,NUM_CPU_SOCKETS_PERC95,IOPS95_TB_BMS,BMSCORES95_DB,BMSCORES95_HOST]]",
      "if_error": "dataframes[AWRHISTSYSMETRICHIST_RS_AWRHISTOSSTAT_RS][[_PKEY, _DBID, _INSTANCE_NUMBER,_HOUR,AAS_PERC95,IOMBPS_PERC95,IOPS_PERC95,PHY_READS_PER_SEC_PERC95,PHY_WRITES_PER_SEC_PERC95,CPUDB95_PERC,CPUDB95_CORES,LOAD_PERC95,HOST_CPU_UTILIZATION,CPUHOST95_CORES,VM_IN_BYTES_PERC95,VM_OUT_BYTES_PERC95,PHYSICAL_MEMORY_BYTES_CUMULATIVE_VALUE,NUM_CPUS_CUMULATIVE_VALUE,NUM_CPU_CORES_CUMULATIVE_VALUE,PHYSICAL_MEMORY_BYTES_PERC95,NUM_CPUS_PERC95,NUM_CPU_CORES_PERC95,IOPS95_TB_BMS,BMSCORES95_DB,BMSCORES95_HOST]]",
      "type": "FREESTYLE",
      "dataframe_name": "DBSIZING_FACTS",
      "store": "BIGQUERY"
    },
    "status": "ENABLED",
    "tags": ["BMS_SIZING"],
    "description": "This rule creates a new dataframe out of a selected list of columns from AWRHISTSYSMETRICHIST_RS_AWRHISTOSSTAT_RS dataframe."
  },
*/

  CREATE TABLE DBSIZING_FACTS AS 
  SELECT 
  PKEY, 
  DBID, 
  INSTANCE_NUMBER,
  HOUR,
  AAS_PERC95,
  IOMBPS_PERC95,
  IOPS_PERC95,
  PHY_READS_PER_SEC_PERC95,
  PHY_WRITES_PER_SEC_PERC95,
  CPUDB95_PERC,
  CPUDB95_CORES,
  FREE_MEMORY_BYTES_PERC95,
  LOAD_PERC95,
  HOST_CPU_UTILIZATION,
  CPUHOST95_CORES,VM_IN_BYTES_PERC95,
  VM_OUT_BYTES_PERC95,
  PHYSICAL_MEMORY_BYTES_CUMULATIVE_VALUE,
  FREE_MEMORY_BYTES_CUMULATIVE_VALUE,
  NUM_CPUS_CUMULATIVE_VALUE,
  NUM_CPU_CORES_CUMULATIVE_VALUE,
  NUM_CPU_SOCKETS_CUMULATIVE_VALUE,
  PHYSICAL_MEMORY_BYTES_PERC95,
  NUM_CPUS_PERC95,
  NUM_CPU_CORES_PERC95,
  NUM_CPU_SOCKETS_PERC95,
  IOPS95_TB_BMS,
  BMSCORES95_DB,
  BMSCORES95_HOST
    FROM AWRHISTSYSMETRICHIST_RS_AWRHISTOSSTAT_RS;
	
	
--ALTER TABLE DBSIZING_FACTS ADD COLUMN NUM_CPUS_PERC95 NUMERIC;
UPDATE DBSIZING_FACTS SET NUM_CPUS_PERC95 = NUM_CPUS_CUMULATIVE_VALUE;
--(;dataframes[DBSIZING_FACTS][NUM_CPUS_CUMULATIVE_VALUE])

--ALTER TABLE DBSIZING_FACTS ADD COLUMN NUM_CPU_CORES_PERC95 NUMERIC;
UPDATE DBSIZING_FACTS SET NUM_CPU_CORES_PERC95 = NUM_CPU_CORES_CUMULATIVE_VALUE;
--;dataframes[DBSIZING_FACTS][NUM_CPU_CORES_CUMULATIVE_VALUE])

--ALTER TABLE DBSIZING_FACTS ADD COLUMN NUM_CPU_SOCKETS_PERC95 NUMERIC;
UPDATE DBSIZING_FACTS SET NUM_CPU_SOCKETS_PERC95 = NUM_CPU_SOCKETS_CUMULATIVE_VALUE;
--(;dataframes[DBSIZING_FACTS][NUM_CPU_SOCKETS_CUMULATIVE_VALUE])

--ALTER TABLE DBSIZING_FACTS ADD COLUMN PHYSICAL_MEMORY_BYTES_PERC95 NUMERIC;
UPDATE DBSIZING_FACTS SET PHYSICAL_MEMORY_BYTES_PERC95 = PHYSICAL_MEMORY_BYTES_CUMULATIVE_VALUE;
--;dataframes[DBSIZING_FACTS][PHYSICAL_MEMORY_BYTES_CUMULATIVE_VALUE])



/*
    -- If error then:
  CREATE TABLE DBSIZING_FACTS AS 
  SELECT 
  _PKEY, _DBID, _INSTANCE_NUMBER,_HOUR,AAS_PERC95,IOMBPS_PERC95,IOPS_PERC95,PHY_READS_PER_SEC_PERC95,PHY_WRITES_PER_SEC_PERC95,CPUDB95_PERC,
  CPUDB95_CORES,LOAD_PERC95,HOST_CPU_UTILIZATION,CPUHOST95_CORES,VM_IN_BYTES_PERC95,VM_OUT_BYTES_PERC95,PHYSICAL_MEMORY_BYTES_CUMULATIVE_VALUE,
  NUM_CPUS_CUMULATIVE_VALUE,NUM_CPU_CORES_CUMULATIVE_VALUE,PHYSICAL_MEMORY_BYTES_PERC95,NUM_CPUS_PERC95,NUM_CPU_CORES_PERC95,IOPS95_TB_BMS,BMSCORES95_DB,BMSCORES95_HOST
FROM AWRHISTSYSMETRICHIST_RS_AWRHISTOSSTAT_RS;
*/
/*
  "bms_sizing-rule10": {
    "priority": 355,
    "min_sql_script_version": "2.0.0",
    "max_sql_script_version": "3.0.3",
    "min_db_version": "111",
    "max_db_version": "216",
    "execution_group": "1",
    "action_details": {
      "action": "CREATE_OR_REPLACE_DATAFRAME",
      "expr1": "pd.merge(dataframes[DBSIZING_FACTS], dataframes[DBSUMMARY], left_on=[_PKEY, _DBID], right_on=[PKEY, DBID], how=inner)",
      "if_error": "None",
      "type": "FREESTYLE",
      "dataframe_name": "DBSIZING_FACTS",
      "store": "BIGQUERY"
    },
    "status": "ENABLED",
    "tags": ["BMS_SIZING"],
    "description": "Creating new dataframe out of joining DBSIZING_FACTS and DBSUMMARY."
  },
*/
/*
select case when table_name = lower('DBSIZING_FACTS') then 'a.' else 'b.' end ||column_name || ', '
from information_schema.columns
where table_name in (lower('DBSIZING_FACTS'), lower('DBSUMMARY'))
order by table_name , ordinal_position;
*/
ALTER TABLE DBSIZING_FACTS RENAME TO DBSIZING_FACTS_ORIG;

  CREATE TABLE
  DBSIZING_FACTS AS 
  SELECT 
  a.pkey, 
a.dbid, 
a.instance_number, 
a.hour, 
a.aas_perc95, 
a.iombps_perc95, 
a.iops_perc95, 
a.phy_reads_per_sec_perc95, 
a.phy_writes_per_sec_perc95, 
a.cpudb95_perc, 
a.cpudb95_cores, 
a.free_memory_bytes_perc95, 
a.load_perc95, 
a.host_cpu_utilization, 
a.cpuhost95_cores, 
a.vm_in_bytes_perc95, 
a.vm_out_bytes_perc95, 
a.physical_memory_bytes_cumulative_value, 
a.free_memory_bytes_cumulative_value, 
a.num_cpus_cumulative_value, 
a.num_cpu_cores_cumulative_value, 
a.num_cpu_sockets_cumulative_value, 
a.physical_memory_bytes_perc95, 
a.num_cpus_perc95, 
a.num_cpu_cores_perc95, 
a.num_cpu_sockets_perc95, 
a.iops95_tb_bms, 
a.bmscores95_db, 
a.bmscores95_host, 
--b.pkey, 
--b.dbid, 
b.db_name, 
b.cdb, 
b.db_version, 
b.db_fullversion, 
b.log_mode, 
b.force_logging, 
b.redo_gb_per_day, 
b.rac_dbinstaces, 
b.characterset, 
b.platform_name, 
b.startup_time, 
b.user_schemas, 
b.buffer_cache_mb, 
b.shared_pool_mb, 
b.total_pga_allocated_mb, 
b.db_size_allocated_gb, 
b.db_size_in_use_gb, 
b.db_long_size_gb, 
b.dg_database_role, 
b.dg_protection_mode, 
b.dg_protection_level
  FROM DBSIZING_FACTS_ORIG a
  JOIN DBSUMMARY b ON a.PKEY = b.PKEY AND a.DBID = b.DBID;

ALTER TABLE DBSIZING_FACTS ADD COLUMN BMSSTORAGE_TB_DB NUMERIC;
UPDATE DBSIZING_FACTS SET BMSSTORAGE_TB_DB = GREATEST(IOPS95_TB_BMS, CEIL(DB_SIZE_ALLOCATED_GB/1024));
/*--"np.where((dataframes[DBSIZING_FACTS][IOPS95_TB_BMS] > (dataframes[DBSIZING_FACTS][DB_SIZE_ALLOCATED_GB]/1024)),
--np.ceil(dataframes[DBSIZING_FACTS][IOPS95_TB_BMS]),np.ceil(dataframes[DBSIZING_FACTS][DB_SIZE_ALLOCATED_GB]/1024))"
{"action": "ADD_OR_UPDATE_COLUMN", "expr1": 
"np.where((dataFrames[\"DBSIZING_FACTS\"][\"IOPS95_TB_BMS\"] > (dataFrames[\"DBSIZING_FACTS\"][\"DB_SIZE_ALLOCATED_GB\"]/1024)),
		  np.ceil(dataFrames[\"DBSIZING_FACTS\"][\"IOPS95_TB_BMS\"]),np.ceil(dataFrames[\"DBSIZING_FACTS\"][\"DB_SIZE_ALLOCATED_GB\"]/1024))", 
		  "iferror": "None", "type": "FREESTYLE", "dataframe_name": "DBSIZING_FACTS","target_dataframe_name": "DBSIZING_FACTS","column_name": "BMSSTORAGE_TB_DB", "store": "BIGQUERY"},
*/


ALTER TABLE DBSIZING_FACTS ADD COLUMN BMSMEMORY_GB_DB NUMERIC;
UPDATE DBSIZING_FACTS SET BMSMEMORY_GB_DB = CEIL(((BUFFER_CACHE_MB + SHARED_POOL_MB + TOTAL_PGA_ALLOCATED_MB)/1024)*1.2);
--"np.ceil((dataframes[DBSIZING_FACTS][BUFFER_CACHE_MB]+dataframes[DBSIZING_FACTS][SHARED_POOL_MB]+dataframes[DBSIZING_FACTS][TOTAL_PGA_ALLOCATED_MB])/1024*1.2)"

ALTER TABLE DBSIZING_FACTS ADD COLUMN BMSMEMORY_GB_HOST NUMERIC;
UPDATE DBSIZING_FACTS SET BMSMEMORY_GB_HOST = CEIL(PHYSICAL_MEMORY_BYTES_PERC95/1024/1024/1024);
--"np.ceil(dataframes[DBSIZING_FACTS][PHYSICAL_MEMORY_BYTES_PERC95]/1024/1024/1024)",

UPDATE DBSIZING_FACTS SET BMSCORES95_DB = CEIL(BMSCORES95_DB );
--"np.ceil(dataframes[DBSIZING_SUMMARY][BMSCORES95_DB])",

UPDATE DBSIZING_FACTS SET BMSCORES95_HOST = CEIL(BMSCORES95_HOST) ;
--"np.ceil(dataframes[DBSIZING_SUMMARY][BMSCORES95_HOST])",



/*
  "bms_sizing-rule14": {
    "priority": 390,
    "min_sql_script_version": "2.0.0",
    "max_sql_script_version": "3.0.3",
    "min_db_version": "111",
    "max_db_version": "216",
    "execution_group": "1",
    "action_details": {
      "action": "CREATE_OR_REPLACE_DATAFRAME",
      "expr1": "dataframes[DBSIZING_FACTS].groupby([PKEY,_DBID,_INSTANCE_NUMBER])[PKEY,_DBID,DB_NAME,DBFULLVERSION,_INSTANCE_NUMBER,BMSSTORAGE_TB_DB,BMSCORES95_DB,BMSCORES95_HOST,BMSMEMORY_GB_DB,BMSMEMORY_GB_HOST].agg(max)",
      "if_error": "None",
      "type": "FREESTYLE",
      "dataframe_name": "DBSIZING_SUMMARY",
      "store": "BIGQUERY"
    },
    "status": "ENABLED",
    "tags": ["BMS_SIZING"],
    "description": "Creating dataframe. Getting the MAX CPU Cores Percentil 95% and Memory per environment per hour."
  },
*/
--select * from DBSIZING_FACTS_ORIG;
CREATE TABLE DBSIZING_SUMMARY 
AS 
SELECT PKEY,DBID,INSTANCE_NUMBER,
max(DB_FULLVERSION) DBFULLVERSION,
max(BMSSTORAGE_TB_DB) BMSSTORAGE_TB_DB,
max(BMSCORES95_DB) BMSCORES95_DB,
max(BMSCORES95_HOST) BMSCORES95_HOST,
max(BMSMEMORY_GB_DB) BMSMEMORY_GB_DB,
max(BMSMEMORY_GB_HOST) BMSMEMORY_GB_HOST
FROM DBSIZING_FACTS
GROUP BY PKEY,DBID,INSTANCE_NUMBER;


ALTER TABLE DBMIGRATION_DETAILS ADD COLUMN NETWORK_TO_GCP VARCHAR(30);
UPDATE DBMIGRATION_DETAILS SET NETWORK_TO_GCP = '1 Gbps';

ALTER TABLE DBMIGRATION_DETAILS ADD COLUMN NETWORK_TRANSFER_RATE_GBYTESPS NUMERIC;
UPDATE DBMIGRATION_DETAILS SET  NETWORK_TRANSFER_RATE_GBYTESPS = 0.1220703125;

ALTER TABLE DBMIGRATION_DETAILS ADD COLUMN NETWORK_TRANSFER_RATE_MBYTESPS NUMERIC;
UPDATE DBMIGRATION_DETAILS SET  NETWORK_TRANSFER_RATE_MBYTESPS = 125;

ALTER TABLE DBMIGRATION_DETAILS ADD COLUMN SSD_DISK_WRITE_RATE_GBYTESPS NUMERIC;
UPDATE DBMIGRATION_DETAILS SET SSD_DISK_WRITE_RATE_GBYTESPS = 0.36;

ALTER TABLE DBMIGRATION_DETAILS ADD COLUMN SSD_DISK_WRITE_RATE_MBYTESPS NUMERIC;
UPDATE DBMIGRATION_DETAILS SET SSD_DISK_WRITE_RATE_MBYTESPS=360;


-- Current
ALTER TABLE DBMIGRATION_DETAILS ADD COLUMN TIME_TO_BACKUP_TO_DISK_HOUR NUMERIC;
UPDATE DBMIGRATION_DETAILS SET TIME_TO_BACKUP_TO_DISK_HOUR = ( DB_SIZE_ALLOCATED_GB / SSD_DISK_WRITE_RATE_GBYTESPS);

--dataframes[DBMIGRATION_DETAILS][DB_SIZE_ALLOCATED_GB];/;dataframes[DBMIGRATION_DETAILS][SSD_DISK_WRITE_RATE_GBYTESPS];/;60;/;60

ALTER TABLE DBMIGRATION_DETAILS ADD COLUMN TIME_TO_TRANSFER_BACKUP_OVER_NETWORK_HOUR NUMERIC;
UPDATE DBMIGRATION_DETAILS SET TIME_TO_TRANSFER_BACKUP_OVER_NETWORK_HOUR = (DB_SIZE_ALLOCATED_GB * 0.7) / NETWORK_TRANSFER_RATE_GBYTESPS;
--dataframes[DBMIGRATION_DETAILS][DB_SIZE_ALLOCATED_GB];*;0.7;);/;dataframes[DBMIGRATION_DETAILS][NETWORK_TRANSFER_RATE_GBYTESPS];/;60;/;60

ALTER TABLE DBMIGRATION_DETAILS ADD COLUMN TIME_TO_RESTORE_BACKUP_HOUR NUMERIC;
UPDATE DBMIGRATION_DETAILS SET TIME_TO_RESTORE_BACKUP_HOUR = TIME_TO_BACKUP_TO_DISK_HOUR * 2.5;
--dataframes[DBMIGRATION_DETAILS][TIME_TO_BACKUP_TO_DISK_HOUR];*;2.5;)

ALTER TABLE DBMIGRATION_DETAILS ADD COLUMN TIME_TO_RESTORE_INCR_7DAY_BKP_HOUR NUMERIC;
UPDATE DBMIGRATION_DETAILS SET TIME_TO_RESTORE_INCR_7DAY_BKP_HOUR = (REDO_GB_PER_DAY * 0.7) / 0.36 / 60 / 60;

--;dataframes[DBMIGRATION_DETAILS][REDO_GB_PER_DAY];*;7;);/;0.36;/;60;/;60


-- Rule 11
ALTER TABLE DBMIGRATION_DETAILS ADD COLUMN REQUIRED_DB_DOWNTIME_HOURS NUMERIC;
UPDATE DBMIGRATION_DETAILS SET REQUIRED_DB_DOWNTIME_HOURS = TIME_TO_BACKUP_TO_DISK_HOUR + TIME_TO_TRANSFER_BACKUP_OVER_NETWORK_HOUR + TIME_TO_RESTORE_BACKUP_HOUR
WHERE TECHNIQUE = 'RMAN_BACKUP_RESTORE' ;
--"np.where((dataframes[DBMIGRATION_DETAILS][TECHNIQUE] == RMAN_BACKUP_RESTORE),dataframes[DBMIGRATION_DETAILS][TIME_TO_BACKUP_TO_DISK_HOUR]+dataframes[DBMIGRATION_DETAILS][TIME_TO_TRANSFER_BACKUP_OVER_NETWORK_HOUR]+dataframes[      DBMIGRATION_DETAILS][TIME_TO_RESTORE_BACKUP_HOUR],dataframes[DBMIGRATION_DETAILS][TECHNIQUE])"

-- Rule 12 REQUIRED_DB_DOWNTIME_HOURS
UPDATE DBMIGRATION_DETAILS SET REQUIRED_DB_DOWNTIME_HOURS = (TIME_TO_BACKUP_TO_DISK_HOUR + TIME_TO_TRANSFER_BACKUP_OVER_NETWORK_HOUR + TIME_TO_RESTORE_BACKUP_HOUR) * 1.2
WHERE TECHNIQUE = 'EXP_FULL' ;
--"np.where((dataframes[DBMIGRATION_DETAILS][TECHNIQUE] == EXP_FULL),(dataframes[DBMIGRATION_DETAILS][TIME_TO_BACKUP_TO_DISK_HOUR]+dataframes[DBMIGRATION_DETAILS][TIME_TO_TRANSFER_BACKUP_OVER_NETWORK_HOUR]+dataframes[DBMIGRAT      ION_DETAILS][TIME_TO_RESTORE_BACKUP_HOUR])*1.2,dataframes[DBMIGRATION_DETAILS][REQUIRED_DB_DOWNTIME_HOURS])",

-- Rule 13 REQUIRED_DB_DOWNTIME_HOURS
UPDATE DBMIGRATION_DETAILS SET REQUIRED_DB_DOWNTIME_HOURS =  TIME_TO_RESTORE_INCR_7DAY_BKP_HOUR + 2
WHERE TECHNIQUE = 'XTTS_INCREMENTAL' ;

--"np.where((dataframes[DBMIGRATION_DETAILS][TECHNIQUE] == XTTS_INCREMENTAL),dataframes[DBMIGRATION_DETAILS][TIME_TO_RESTORE_INCR_7DAY_BKP_HOUR]+2,dataframes[DBMIGRATION_DETAILS][REQUIRED_DB_DOWNTIME_HOURS])",

-- Rule 14 REQUIRED_DB_DOWNTIME_HOURS
UPDATE DBMIGRATION_DETAILS SET REQUIRED_DB_DOWNTIME_HOURS =  TIME_TO_RESTORE_INCR_7DAY_BKP_HOUR / 7
WHERE TECHNIQUE = 'DATA_GUARD' ;
--"np.where((dataframes[DBMIGRATION_DETAILS][TECHNIQUE] == DATA_GUARD),
--dataframes[DBMIGRATION_DETAILS][TIME_TO_RESTORE_INCR_7DAY_BKP_HOUR]/7,dataframes[DBMIGRATION_DETAILS][REQUIRED_DB_DOWNTIME_HOURS])",

ALTER TABLE DBMIGRATION_DETAILS ADD COLUMN LEVEL_OF_EFFORT_HOURS VARCHAR(30);
UPDATE DBMIGRATION_DETAILS SET LEVEL_OF_EFFORT_HOURS = 'TBD';

