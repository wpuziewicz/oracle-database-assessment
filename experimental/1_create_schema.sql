
select  table_name
      FROM information_schema.tables
      WHERE table_schema ='public'
      ORDER BY table_name;
	  
--------------------------------------------------------
--  DDL for Table AWRHISTCMDTYPES
--------------------------------------------------------

  CREATE TABLE public.AWRHISTCMDTYPES 
   (	PKEY VARCHAR(256 ), 
	CON_ID SMALLINT,
	HH24 SMALLINT, 
	COMMAND_TYPE SMALLINT, 
	CNT BIGINT, 
	AVG_BUFFER_GETS BIGINT, 
	AVG_ELASPED_TIME BIGINT, 
	AVG_ROWS_PROCESSED BIGINT, 
	AVG_EXECUTIONS BIGINT, 
	AVG_CPU_TIME BIGINT, 
	AVG_IOWAIT BIGINT, 
	AVG_CLWAIT BIGINT, 
	AVG_APWAIT BIGINT, 
	AVG_CCWAIT BIGINT, 
	AVG_PLSEXEC_TIME BIGINT
   ) ;
  
 
  
  
 
 
--------------------------------------------------------
--  DDL for Table AWRHISTOSSTAT
--------------------------------------------------------

  CREATE TABLE public.AWRHISTOSSTAT 
   (	PKEY VARCHAR(256 ), 
	DBID BIGINT, 
	INSTANCE_NUMBER SMALLINT, 
	HH24 SMALLINT, 
	STAT_NAME VARCHAR(64 ), 
	HH24_TOTAL_SECS BIGINT, 
	CUMULATIVE_VALUE BIGINT, 
	AVG_VALUE BIGINT, 
	MODE_VALUE BIGINT, 
	MEDIAN_VALUE BIGINT, 
	PERC50 BIGINT, 
	PERC75 BIGINT, 
	PERC90 BIGINT, 
	PERC95 BIGINT, 
	PERC100 BIGINT, 
	MIN_VALUE BIGINT, 
	MAX_VALUE BIGINT, 
	SUM_VALUE BIGINT, 
	COUNT BIGINT
   ) ;
  
 
  
  
 
 
--------------------------------------------------------
--  DDL for Table AWRHISTSYSMETRICHIST
--------------------------------------------------------

  CREATE TABLE public.AWRHISTSYSMETRICHIST 
   (	PKEY VARCHAR(256 ), 
	DBID BIGINT, 
	INSTANCE_NUMBER SMALLINT, 
	HOUR SMALLINT, 
	METRIC_NAME VARCHAR(64 ), 
	METRIC_UNIT VARCHAR(64 ), 
	AVG_VALUE BIGINT, 
	MODE_VALUE BIGINT, 
	MEDIAN_VALUE BIGINT, 
	MIN_VALUE BIGINT, 
	MAX_VALUE BIGINT, 
	SUM_VALUE BIGINT, 
	PERC50 BIGINT, 
	PERC75 BIGINT, 
	PERC90 BIGINT, 
	PERC95 BIGINT, 
	PERC100 BIGINT
   ) ;
  
 
  
  
 
 
--------------------------------------------------------
--  DDL for Table AWRHISTSYSMETRICSUMM
--------------------------------------------------------

  CREATE TABLE public.AWRHISTSYSMETRICSUMM 
   (	PKEY VARCHAR(256 ), 
	DBID BIGINT, 
	INSTANCE_NUMBER SMALLINT, 
	HOUR SMALLINT, 
	METRIC_NAME VARCHAR(64 ), 
	METRIC_UNIT VARCHAR(64 ), 
	AVG_VALUE BIGINT, 
	MODE_VALUE BIGINT, 
	MEDIAN_VALUE BIGINT, 
	MIN_VALUE BIGINT, 
	MAX_VALUE BIGINT, 
	SUM_VALUE BIGINT, 
	PERC50 BIGINT, 
	PERC75 BIGINT, 
	PERC90 BIGINT, 
	PERC95 BIGINT, 
	PERC100 BIGINT
   ) ;
  
 
  
  
 
 
--------------------------------------------------------
--  DDL for Table AWRSNAPDETAILS
--------------------------------------------------------

  CREATE TABLE public.AWRSNAPDETAILS 
   (	PKEY VARCHAR(256 ), 
	DBID BIGINT, 
	INSTANCE_NUMBER SMALLINT, 
	HOUR SMALLINT, 
	MIN_SNAP_ID BIGINT, 
	MAX_SNAP_ID BIGINT, 
	MIN_BEGIN_INTERVAL_TIME VARCHAR(40 ), 
	MAX_BEGIN_INTERVAL_TIME VARCHAR(40 ), 
	CNT BIGINT, 
	SUM_SNAPS_DIFF_SECS BIGINT, 
	AVG_SNAPS_DIFF_SECS BIGINT, 
	MEDIAN_SNAPS_DIFF_SECS BIGINT, 
	MODE_SNAPS_DIFF_SECS BIGINT, 
	MIN_SNAPS_DIFF_SECS BIGINT, 
	MAX_SNAPS_DIFF_SECS BIGINT
   ) ;
  
 
  
  
 
 
--------------------------------------------------------
--  DDL for Table COMPRESSBYTYPE
--------------------------------------------------------

  CREATE TABLE public.COMPRESSBYTYPE 
   (	PKEY VARCHAR(256 ), 
	CON_ID SMALLINT, 
	OWNER VARCHAR(128 ), 
	BASIC BIGINT, 
	OLTP BIGINT, 
	QUERY_LOW BIGINT, 
	QUERY_HIGH BIGINT, 
	ARCHIVE_LOW BIGINT, 
	ARCHIVE_HIGH BIGINT, 
	TOTAL_GB BIGINT
   ) ; 
  
 
 
--------------------------------------------------------
--  DDL for Table CPUCORESUSAGE
--------------------------------------------------------

  CREATE TABLE public.CPUCORESUSAGE 
   (	PKEY VARCHAR(256 ), 
	DT VARCHAR(14 ), 
	CPU_COUNT BIGINT, 
	CPU_CORE_COUNT BIGINT, 
	CPU_SOCKET_COUNT BIGINT
   ) ;
  
 
  
  
 
 
--------------------------------------------------------
--  DDL for Table DATAGUARD
--------------------------------------------------------

  CREATE TABLE public.DATAGUARD 
   (	PKEY VARCHAR(256 ), 
	CON_ID SMALLINT, 
	INST_ID BIGINT, 
	LOG_ARCHIVE_CONFIG VARCHAR(4000 ), 
	DEST_ID BIGINT, 
	DEST_NAME VARCHAR(256 ), 
	DESTINATION VARCHAR(256 ), 
	STATUS VARCHAR(9 ), 
	TARGET VARCHAR(16 ), 
	SCHEDULE VARCHAR(8 ), 
	REGISTER VARCHAR(3 ), 
	ALTERNATE VARCHAR(256 ), 
	TRANSMIT_MODE VARCHAR(12 ), 
	AFFIRM VARCHAR(3 ), 
	VALID_ROLE VARCHAR(12 ), 
	VERIFY VARCHAR(3 )
   ) ;
  
 
  
  
 
 
--------------------------------------------------------
--  DDL for Table DATATYPES
--------------------------------------------------------

  CREATE TABLE public.DATATYPES 
   (	PKEY VARCHAR(256 ), 
	CON_ID SMALLINT, 
	OWNER VARCHAR(128 ), 
	DATA_TYPE VARCHAR(128 ), 
	CNT BIGINT
   ) ;
  
 
  
  
 
 
--------------------------------------------------------
--  DDL for Table DBAHISTSYSSTAT
--------------------------------------------------------

  CREATE TABLE public.DBAHISTSYSSTAT 
   (	PKEY VARCHAR(256 ), 
	DBID BIGINT, 
	INSTANCE_NUMBER SMALLINT, 
	HOUR SMALLINT, 
	STAT_NAME VARCHAR(64 ), 
	CNT BIGINT, 
	AVG_VALUE BIGINT, 
	MODE_VALUE BIGINT, 
	MEDIAN_VALUE BIGINT, 
	MIN_VALUE BIGINT, 
	MAX_VALUE BIGINT, 
	SUM_VALUE BIGINT, 
	PERC50 BIGINT, 
	PERC75 BIGINT, 
	PERC90 BIGINT, 
	PERC95 BIGINT, 
	PERC100 BIGINT
   ) ;
  
 
  
  
 
 
--------------------------------------------------------
--  DDL for Table DBAHISTSYSTIMEMODEL
--------------------------------------------------------

  CREATE TABLE public.DBAHISTSYSTIMEMODEL 
   (	PKEY VARCHAR(256 ), 
	DBID BIGINT, 
	INSTANCE_NUMBER SMALLINT, 
	HOUR SMALLINT, 
	STAT_NAME VARCHAR(64 ), 
	CNT BIGINT, 
	AVG_VALUE BIGINT, 
	MODE_VALUE BIGINT, 
	MEDIAN_VALUE BIGINT, 
	MIN_VALUE BIGINT, 
	MAX_VALUE BIGINT, 
	SUM_VALUE BIGINT, 
	PERC50 BIGINT, 
	PERC75 BIGINT, 
	PERC90 BIGINT, 
	PERC95 BIGINT, 
	PERC100 BIGINT
   ) ;
  
 
  
  
 
 
--------------------------------------------------------
--  DDL for Table DBFEATURES
--------------------------------------------------------

  CREATE TABLE public.DBFEATURES 
   (	PKEY VARCHAR(256 ), 
	CON_ID SMALLINT, 
	NAME VARCHAR(128 ), 
	CURRENTLY_USED VARCHAR(5 ), 
	DETECTED_USAGES BIGINT, 
	TOTAL_SAMPLES BIGINT, 
	FIRST_USAGE VARCHAR(14 ), 
	LAST_USAGE VARCHAR(14 ), 
	AUX_COUNT NUMERIC
   ) ;
  
 
  
  
 
 
--------------------------------------------------------
--  DDL for Table DBHWMARKSTATISTICS
--------------------------------------------------------

  CREATE TABLE public.DBHWMARKSTATISTICS 
   (	PKEY VARCHAR(256 ), 
	DESCRIPTION VARCHAR(128 ), 
	HIGHWATER BIGINT, 
	LAST_VALUE BIGINT
   ) ;
  
 
  
  
 
 
--------------------------------------------------------
--  DDL for Table DBINSTANCES
--------------------------------------------------------

  CREATE TABLE public.DBINSTANCES 
   (	PKEY VARCHAR(256 ), 
	INST_ID BIGINT, 
	INSTANCE_NAME VARCHAR(16 ), 
	HOST_NAME VARCHAR(64 ), 
	VERSION VARCHAR(17 ), 
	STATUS VARCHAR(12 ), 
	DATABASE_STATUS VARCHAR(17 ), 
	INSTANCE_ROLE VARCHAR(18 )
   ) ;
  
 
  
  
 
 
--------------------------------------------------------
--  DDL for Table DBLINKS
--------------------------------------------------------

  CREATE TABLE public.DBLINKS 
   (	PKEY VARCHAR(256 ), 
	CON_ID SMALLINT, 
	OWNER VARCHAR(128 ), 
	COUNT BIGINT
   ) ; 
  
 
 
--------------------------------------------------------
--  DDL for Table DBOBJECTS
--------------------------------------------------------

  CREATE TABLE public.DBOBJECTS 
   (	PKEY VARCHAR(256 ), 
	CON_ID SMALLINT, 
	OWNER VARCHAR(128 ), 
	OBJECT_TYPE VARCHAR(23 ), 
	EDITIONABLE VARCHAR(3 ), 
	COUNT BIGINT, 
	IN_CON_ID VARCHAR(40 ), 
	IN_OWNER BIGINT, 
	IN_OBJECT_TYPE BIGINT, 
	IN_EDITIONABLE VARCHAR(40 )
   ) ;
  
 
  
  
 
 
--------------------------------------------------------
--  DDL for Table DBPARAMETERS
--------------------------------------------------------

  CREATE TABLE public.DBPARAMETERS 
   (	PKEY VARCHAR(256 ), 
	INST_ID BIGINT, 
	CON_ID SMALLINT, 
	NAME VARCHAR(80 ), 
	VALUE VARCHAR(960 ), 
	DEFAULT_VALUE VARCHAR(480 ), 
	ISDEFAULT VARCHAR(9 )
   ) ;
  
 
  
  
 
 
--------------------------------------------------------
--  DDL for Table DBSUMMARY
--------------------------------------------------------

  CREATE TABLE public.DBSUMMARY 
   (	PKEY VARCHAR(256 ), 
	DBID BIGINT, 
	DB_NAME VARCHAR(9 ), 
	CDB VARCHAR(3 ), 
	DB_VERSION VARCHAR(17 ), 
	DB_FULLVERSION VARCHAR(80 ), 
	LOG_MODE VARCHAR(12 ), 
	FORCE_LOGGING VARCHAR(39 ), 
	REDO_GB_PER_DAY BIGINT, 
	RAC_DBINSTACES BIGINT, 
	CHARACTERSET VARCHAR(770 ), 
	PLATFORM_NAME VARCHAR(101 ), 
	STARTUP_TIME VARCHAR(17 ), 
	USER_SCHEMAS BIGINT, 
	BUFFER_CACHE_MB BIGINT, 
	SHARED_POOL_MB BIGINT, 
	TOTAL_PGA_ALLOCATED_MB BIGINT, 
	DB_SIZE_ALLOCATED_GB BIGINT, 
	DB_SIZE_IN_USE_GB BIGINT, 
	DB_LONG_SIZE_GB BIGINT, 
	DG_DATABASE_ROLE VARCHAR(16 ), 
	DG_PROTECTION_MODE VARCHAR(20 ), 
	DG_PROTECTION_LEVEL VARCHAR(20 )
   ) ;
  
 
  
  
 
 
--------------------------------------------------------
--  DDL for Table EXTTAB
--------------------------------------------------------

  CREATE TABLE public.EXTTAB 
   (	PKEY VARCHAR(256 ), 
	CON_ID SMALLINT, 
	OWNER VARCHAR(128 ), 
	TABLE_NAME VARCHAR(128 ), 
	TYPE_OWNER VARCHAR(3 ), 
	TYPE_NAME VARCHAR(128 ), 
	DEFAULT_DIRECTORY_OWNER VARCHAR(3 ), 
	DEFAULT_DIRECTORY_NAME VARCHAR(128 )
   ) ;
  
 
  
  
 
 
--------------------------------------------------------
--  DDL for Table IDXPERTABLE
--------------------------------------------------------

  CREATE TABLE public.IDXPERTABLE 
   (	PKEY VARCHAR(256 ), 
	CON_ID SMALLINT, 
	TAB_COUNT BIGINT, 
	IDX_CNT BIGINT, 
	IDX_PERC BIGINT
   ) ; 
  
 
 
--------------------------------------------------------
--  DDL for Table INDEXESTYPES
--------------------------------------------------------

  CREATE TABLE public.INDEXESTYPES 
   (	PKEY VARCHAR(256 ), 
	CON_ID SMALLINT, 
	OWNER VARCHAR(128 ), 
	INDEX_TYPE VARCHAR(27 ), 
	CNT BIGINT
   ) ; 
  
 
 
--------------------------------------------------------
--  DDL for Table IOEVENTS
--------------------------------------------------------

  CREATE TABLE public.IOEVENTS 
   (	PKEY VARCHAR(256 ), 
	DBID BIGINT, 
	INSTANCE_NUMBER SMALLINT, 
	HOUR SMALLINT, 
	WAIT_CLASS VARCHAR(64 ), 
	EVENT_NAME VARCHAR(64 ), 
	TOT_WAITS_DELTA_VALUE_P95 BIGINT, 
	TOT_TOUT_DELTA_VALUE_P95 BIGINT, 
	TIME_WA_US_DELTA_VALUE_P95 BIGINT
   ) ;
  
 
  
  
 
 
--------------------------------------------------------
--  DDL for Table IOFUNCTION
--------------------------------------------------------

  CREATE TABLE public.IOFUNCTION 
   (	PKEY VARCHAR(256 ), 
	DBID BIGINT, 
	INSTANCE_NUMBER SMALLINT, 
	HOUR SMALLINT, 
	FUNCTION_NAME VARCHAR(128 ), 
	SM_READ_MB_DELTA_VALUE_P95 BIGINT, 
	SM_WRITE_MB_DELTA_VALUE_P95 BIGINT, 
	SM_READ_RQ_DELTA_VALUE_P95 BIGINT, 
	SM_WRITE_RQ_DELTA_VALUE_P95 BIGINT, 
	LG_READ_MB_DELTA_VALUE_P95 BIGINT, 
	LG_WRITE_MB_DELTA_VALUE_P95 BIGINT, 
	LG_READ_RQ_DELTA_VALUE_P95 BIGINT, 
	LG_WRITE_RQ_DELTA_VALUE_P95 BIGINT, 
	NO_IOWAIT_DELTA_VALUE_P95 BIGINT, 
	TOT_WATIME_DELTA_VALUE_P95 BIGINT, 
	TOTAL_READS_MB_P95 BIGINT, 
	TOTAL_READS_REQ_P95 BIGINT, 
	TOTAL_WRITES_MB_P95 BIGINT, 
	TOTAL_WRITE_REQ_P95 BIGINT
   ) ;
  
 
  
  
 
 
--------------------------------------------------------
--  DDL for Table PDBSINFO
--------------------------------------------------------

  CREATE TABLE public.PDBSINFO 
   (	PKEY VARCHAR(256 ), 
	DBID BIGINT, 
	PDB_ID BIGINT, 
	PDB_NAME VARCHAR(128 ), 
	STATUS VARCHAR(10 ), 
	LOGGING VARCHAR(9 )
   ) ;
  
 
  
  
 
 
--------------------------------------------------------
--  DDL for Table PDBSOPENMODE
--------------------------------------------------------

  CREATE TABLE public.PDBSOPENMODE 
   (	PKEY VARCHAR(256 ), 
	CON_ID SMALLINT, 
	NAME VARCHAR(128 ), 
	OPEN_MODE VARCHAR(10 ), 
	TOTAL_GB NUMERIC
   ) ;
  
 
  
  
 
 
--------------------------------------------------------
--  DDL for Table SOURCECODE
--------------------------------------------------------

  CREATE TABLE public.SOURCECODE 
   (	PKEY VARCHAR(256 ), 
	CON_ID SMALLINT, 
	OWNER VARCHAR(128 ), 
	TYPE VARCHAR(12 ), 
	SUM_NR_LINES BIGINT, 
	QT_OBJS BIGINT, 
	SUM_NR_LINES_W_UTL BIGINT, 
	SUM_NR_LINES_W_DBMS BIGINT, 
	COUNT_EXEC_IM BIGINT, 
	COUNT_DBMS_SQL BIGINT, 
	SUM_NR_LINES_W_DBMS_UTL BIGINT, 
	SUM_COUNT_TOTAL BIGINT
   ) ; 
  
 
 
--------------------------------------------------------
--  DDL for Table SOURCECONN
--------------------------------------------------------

  CREATE TABLE public.SOURCECONN 
   (	PKEY VARCHAR(256 ), 
	DBID BIGINT, 
	INSTANCE_NUMBER SMALLINT, 
	HOUR SMALLINT, 
	PROGRAM VARCHAR(84 ), 
	MODULE VARCHAR(64 ), 
	MACHINE VARCHAR(64 ), 
	COMMAND_NAME VARCHAR(64 ), 
	CNT BIGINT
   ) ;
  
 
  
  
 
 
--------------------------------------------------------
--  DDL for Table SQLSTATS
--------------------------------------------------------

  CREATE TABLE public.SQLSTATS 
   (	PKEY VARCHAR(256 ), 
	CON_ID SMALLINT, 
	DBID BIGINT, 
	INSTANCE_NUMBER SMALLINT, 
	FORCE_MATCHING_SIGNATURE VARCHAR(40 ), 
	SQL_ID VARCHAR(13 ), 
	TOTAL_EXECUTIONS BIGINT, 
	TOTAL_PX_SERVERS_EXECS BIGINT, 
	ELAPSED_TIME_TOTAL BIGINT, 
	DISK_READS_TOTAL BIGINT, 
	PHYSICAL_READ_BYTES_TOTAL BIGINT, 
	PHYSICAL_WRITE_BYTES_TOTAL BIGINT, 
	IO_OFFLOAD_ELIG_BYTES_TOTAL BIGINT, 
	IO_INTERCONNECT_BYTES_TOTAL BIGINT, 
	OPTIMIZED_PHYSICAL_READS_TOTAL BIGINT, 
	CELL_UNCOMPRESSED_BYTES_TOTAL BIGINT, 
	IO_OFFLOAD_RETURN_BYTES_TOTAL BIGINT, 
	DIRECT_WRITES_TOTAL BIGINT, 
	PERC_EXEC_FINISHED BIGINT, 
	AVG_ROWS BIGINT, 
	AVG_DISK_READS BIGINT, 
	AVG_BUFFER_GETS BIGINT, 
	AVG_CPU_TIME_US BIGINT, 
	AVG_ELAPSED_US BIGINT, 
	AVG_IOWAIT_US BIGINT, 
	AVG_CLWAIT_US BIGINT, 
	AVG_APWAIT_US BIGINT, 
	AVG_CCWAIT_US BIGINT, 
	AVG_PLSEXEC_US BIGINT, 
	AVG_JAVEXEC_US BIGINT
   ) ;
  
 
  
  
 
 
--------------------------------------------------------
--  DDL for Table TABLESNOPK
--------------------------------------------------------

  CREATE TABLE public.TABLESNOPK 
   (	PKEY VARCHAR(256 ), 
	CON_ID SMALLINT, 
	OWNER VARCHAR(128 ), 
	PK BIGINT, 
	UK BIGINT, 
	CK BIGINT, 
	RI BIGINT, 
	VWCK BIGINT, 
	VWRO BIGINT, 
	HASHEXPR BIGINT, 
	SUPLOG BIGINT, 
	NUM_TABLES BIGINT, 
	TOTAL_CONS BIGINT
   ) ;
  
 
  
  
 
 
--------------------------------------------------------
--  DDL for Table USEDSPACEDETAILS
--------------------------------------------------------

  CREATE TABLE public.USEDSPACEDETAILS 
   (	PKEY VARCHAR(256 ), 
	CON_ID SMALLINT, 
	OWNER VARCHAR(128 ), 
	SEGMENT_TYPE VARCHAR(18 ), 
	GB BIGINT
   ) ;
 
 
--------------------------------------------------------
--  DDL for Table USRSEGATT
--------------------------------------------------------

  CREATE TABLE public.USRSEGATT 
   (	PKEY VARCHAR(256 ), 
	CON_ID SMALLINT, 
	OWNER VARCHAR(128 ), 
	SEGMENT_NAME VARCHAR(128 ), 
	SEGMENT_TYPE VARCHAR(18 ), 
	TABLESPACE_NAME VARCHAR(30 )
   ) ;
  
 
 
