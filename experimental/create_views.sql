
CREATE TABLE `optimusprime-migrations.warrenpuz_automation.T_DS_BMS_sizing`
(
  host_name STRING,
  Database_count INT64,
  SGA_SIZE_GB NUMERIC,
  DB_CPU_CORES FLOAT64,
  Server_Cores FLOAT64,
  DB_size_TB NUMERIC,
  iombps_total_perc95 NUMERIC,
  iops_total_perc95 NUMERIC,
  BMS_Server_Size STRING,
  SSD_Storage_TB NUMERIC,
  SSD_Storage_Price NUMERIC,
  High_Throughput_per_4TB NUMERIC,
  High_Throughput_Pricing NUMERIC,
  BMS_Server_Price STRING,
  BMS_cores_count STRING,
  BMS_memory STRING,
  Perferred_storage STRING,
  Total_BMS_Price_using_HT_Storage NUMERIC,
  Total_BMS_Price_using_SSD_Storage NUMERIC,
  High_Throughput_Additional_TB NUMERIC
);


CREATE TABLE `optimusprime-migrations.warrenpuz_automation.T_DS_CPU_CALC`
(
  host_name STRING,
  DB_CPU_CORES FLOAT64,
  Server_Cores FLOAT64
);


CREATE TABLE `optimusprime-migrations.warrenpuz_automation.T_DS_Database_Metrics`
(
  pkey STRING,
  instance_number NUMERIC,
  hour NUMERIC,
  DB_NAME STRING,
  execute_count_perc95 NUMERIC,
  physical_reads_perc95 NUMERIC,
  physical_reads_direct_perc95 NUMERIC,
  physical_writes_perc95 NUMERIC,
  DB_CPU_CORES_95 NUMERIC,
  iombps_total_perc95 NUMERIC,
  iops_total_perc95 NUMERIC,
  SGA_SIZE_GB NUMERIC,
  pct_direct_reads_perc95 NUMERIC,
  pct_eligible_io_for_smartcan_perc95 NUMERIC,
  pct_storageindex_over_eligible_perc95 NUMERIC,
  pct_storageindex_over_iototalbytes_perc95 NUMERIC,
  physical_read_total_bytes_perc95 NUMERIC,
  physical_read_bytes_perc95 NUMERIC,
  pct_appbytesreads_over_totalbytesreads NUMERIC
);


CREATE TABLE `optimusprime-migrations.warrenpuz_automation.w_V_DS_BMS_BOM`
(
  BMS_SKU STRING,
  count NUMERIC
);


CREATE TABLE `optimusprime-migrations.warrenpuz_automation.w_V_DS_HostDetails`
(
  PKEY STRING,
  db_name STRING,
  host_name STRING,
  instanceNumber INT64,
  iscdb STRING,
  redo_gb_per_day STRING,
  isRacDB BOOL,
  platform_name STRING,
  db_size_allocated_gb NUMERIC,
  db_size_in_use_gb NUMERIC,
  cores NUMERIC,
  totalMemory NUMERIC,
  maxHostCPUUtilizationPercentage NUMERIC,
  avgHostCPUUtilizationPercentage NUMERIC
);


CREATE TABLE `optimusprime-migrations.warrenpuz_automation.w_V_DS_dbfeatures`
(
  pkey STRING,
  con_id STRING,
  name STRING,
  current_usage STRING,
  detected_usage NUMERIC,
  total_samples STRING,
  first_usage STRING,
  last_usage STRING,
  aux_count STRING
);
CREATE TABLE `optimusprime-migrations.warrenpuz_automation.w_V_DS_dbsummary`
(
  pkey STRING,
  dbid STRING,
  db_name STRING,
  cdb STRING,
  dbversion STRING,
  dbfullversion STRING,
  log_mode STRING,
  force_logging STRING,
  redo_gb_per_day STRING,
  rac_dbinstaces NUMERIC,
  characterset STRING,
  platform_name STRING,
  startup_time STRING,
  user_schemas STRING,
  buffer_cache_mb NUMERIC,
  shared_pool_mb NUMERIC,
  total_pga_allocated_mb NUMERIC,
  db_size_allocated_gb NUMERIC,
  db_size_in_use_gb NUMERIC,
  db_long_size_gb STRING,
  dg_database_role STRING,
  dg_protection_mode STRING,
  dg_protection_level STRING,
  Begin_date DATE,
  End_date DATE,
  AWR_collected_days INT64,
  DB_feature_name STRING,
  DB_feature_usage STRING,
  Is_Exadata STRING
);
CREATE TABLE `optimusprime-migrations.warrenpuz_automation.w_vReport_sysmetric_io_summary`
(
  info_source STRING,
  pkey STRING,
  dbid NUMERIC,
  iombps_total_perc50 NUMERIC,
  iombps_total_perc75 NUMERIC,
  iombps_total_perc95 NUMERIC,
  iombps_total_perc100 NUMERIC,
  iops_total_perc50 NUMERIC,
  iops_total_perc75 NUMERIC,
  iops_total_perc95 NUMERIC,
  iops_total_perc100 NUMERIC
);
CREATE TABLE `optimusprime-migrations.warrenpuz_automation.w_vReport_sysstat_io_summary`
(
  info_source STRING,
  pkey STRING,
  dbid NUMERIC,
  iombps_total_perc50 NUMERIC,
  iombps_total_perc75 NUMERIC,
  iombps_total_perc95 NUMERIC,
  iombps_total_perc100 NUMERIC,
  iops_total_perc50 NUMERIC,
  iops_total_perc75 NUMERIC,
  iops_total_perc95 NUMERIC,
  iops_total_perc100 NUMERIC
);
CREATE TABLE `optimusprime-migrations.warrenpuz_automation.w_vawrhistcmdtypes`
(
  pkey STRING,
  con_id NUMERIC,
  hour NUMERIC,
  command_type NUMERIC,
  coun NUMERIC,
  cnt NUMERIC,
  avg_buffer_gets NUMERIC,
  avg_elapsed_time NUMERIC,
  avg_rows_processed NUMERIC,
  avg_executions NUMERIC,
  avg_cpu_time NUMERIC,
  avg_iowait NUMERIC,
  avg_clwait NUMERIC,
  avg_apwait NUMERIC,
  avg_ccwait NUMERIC,
  avg_plsexec_time NUMERIC
);
CREATE TABLE `optimusprime-migrations.warrenpuz_automation.w_vawrhistosstat`
(
  pkey STRING,
  dbid NUMERIC,
  instance_number NUMERIC,
  hour NUMERIC,
  stat_name STRING,
  hour_total_secs NUMERIC,
  cumulative_value NUMERIC,
  avg_value NUMERIC,
  mode_value NUMERIC,
  median_value NUMERIC,
  perc50_value NUMERIC,
  perc75_value NUMERIC,
  perc90_value NUMERIC,
  perc95_value NUMERIC,
  perc100_value NUMERIC,
  min_value NUMERIC,
  max_value NUMERIC,
  sum_value NUMERIC,
  cnt_value NUMERIC
);
CREATE TABLE `optimusprime-migrations.warrenpuz_automation.w_vawrhistosstat_rs_metrics`
(
  pkey STRING,
  dbid STRING,
  instance_number NUMERIC,
  hour NUMERIC,
  physical_memory_bytes_cumulative_value NUMERIC,
  free_memory_bytes_cumulative_value NUMERIC,
  num_cpus_cumulative_value NUMERIC,
  num_cpus NUMERIC,
  num_cpu_cores_cumulative_value NUMERIC,
  num_cpu_cores NUMERIC,
  num_cpu_sockets_cumulative_value NUMERIC,
  num_cpu_sockets NUMERIC,
  busy_time_perc90 NUMERIC,
  idle_time_perc90 NUMERIC,
  iowait_time_perc90 NUMERIC,
  nice_time_perc90 NUMERIC,
  load_perc90 NUMERIC,
  busy_time_perc95 NUMERIC,
  idle_time_perc95 NUMERIC,
  iowait_time_perc95 NUMERIC,
  nice_time_perc95 NUMERIC,
  load_perc95 NUMERIC,
  host_cpu_utilization NUMERIC
);
CREATE TABLE `optimusprime-migrations.warrenpuz_automation.w_vawrhistsysmetrichist`
(
  pkey STRING,
  dbid NUMERIC,
  instance_number NUMERIC,
  hour NUMERIC,
  metric_name STRING,
  avg_value NUMERIC,
  mode_value NUMERIC,
  median_value NUMERIC,
  perc50_value NUMERIC,
  perc75_value NUMERIC,
  perc90_value NUMERIC,
  perc95_value NUMERIC,
  perc100_value NUMERIC,
  min_value NUMERIC,
  max_value NUMERIC,
  sum_value NUMERIC
);
CREATE TABLE `optimusprime-migrations.warrenpuz_automation.w_vawrhistsysmetrichist_rs`
(
  pkey STRING,
  dbid NUMERIC,
  instance_number NUMERIC,
  hour NUMERIC,
  _dbid NUMERIC,
  _instance_number NUMERIC,
  _hour NUMERIC,
  aas_perc90 NUMERIC,
  bkgrcpu_per_sec_perc90 NUMERIC,
  cpu_per_sec_perc90 NUMERIC,
  exec_per_sec_perc90 NUMERIC,
  host_cpu_per_sec_perc90 NUMERIC,
  iombps_perc90 NUMERIC,
  iops_perc90 NUMERIC,
  log_reads_per_txn_perc90 NUMERIC,
  logons_per_sec_perc90 NUMERIC,
  phy_reads_per_sec_perc90 NUMERIC,
  phy_writes_per_sec_perc90 NUMERIC,
  redo_gen_per_sec_perc90 NUMERIC,
  sql_rt_perc90 NUMERIC,
  usercalls_per_sec_perc90 NUMERIC,
  user_tx_per_sec_perc90 NUMERIC,
  aas_perc95 NUMERIC,
  bkgrcpu_per_sec_perc95 NUMERIC,
  cpu_per_sec_perc95 NUMERIC,
  exec_per_sec_perc95 NUMERIC,
  host_cpu_per_sec_perc95 NUMERIC,
  iombps_perc95 NUMERIC,
  iops_perc95 NUMERIC,
  log_reads_per_txn_perc95 NUMERIC,
  logons_per_sec_perc95 NUMERIC,
  phy_reads_per_sec_perc95 NUMERIC,
  phy_writes_per_sec_perc95 NUMERIC,
  redo_gen_per_sec_perc95 NUMERIC,
  sql_rt_perc95 NUMERIC,
  usercalls_per_sec_perc95 NUMERIC,
  user_tx_per_sec_perc95 NUMERIC
);
CREATE TABLE `optimusprime-migrations.warrenpuz_automation.w_vawrhistsysmetrichist_rs_awrhistosstat_rs`
(
  pkey STRING,
  dbid STRING,
  instance_number NUMERIC,
  hour NUMERIC,
  aas_perc90 NUMERIC,
  aas_perc95 NUMERIC,
  bkgrcpu_per_sec_perc90 NUMERIC,
  bkgrcpu_per_sec_perc95 NUMERIC,
  cpu_per_sec_perc90 NUMERIC,
  cpu_per_sec_perc95 NUMERIC,
  log_reads_per_txn_perc90 NUMERIC,
  log_reads_per_txn_perc95 NUMERIC,
  exec_per_sec_perc90 NUMERIC,
  exec_per_sec_perc95 NUMERIC,
  usercalls_per_sec_perc90 NUMERIC,
  usercalls_per_sec_perc95 NUMERIC,
  sql_rt_perc90 NUMERIC,
  sql_rt_perc95 NUMERIC,
  iombps_perc90 NUMERIC,
  iombps_perc95 NUMERIC,
  iops_perc90 NUMERIC,
  iops_perc95 NUMERIC,
  phy_reads_per_sec_perc90 NUMERIC,
  phy_reads_per_sec_perc95 NUMERIC,
  phy_writes_per_sec_perc90 NUMERIC,
  phy_writes_per_sec_perc95 NUMERIC,
  redo_gen_per_sec_perc90 NUMERIC,
  redo_gen_per_sec_perc95 NUMERIC,
  host_cpu_per_sec_perc90 NUMERIC,
  host_cpu_per_sec_perc95 NUMERIC,
  physical_memory_bytes_cumulative_value NUMERIC,
  free_memory_bytes_cumulative_value NUMERIC,
  inactive_memory_bytes_cumulative_value NUMERIC,
  num_cpus_cumulative_value NUMERIC,
  num_cpus NUMERIC,
  num_cpu_cores_cumulative_value NUMERIC,
  num_cpu_cores NUMERIC,
  num_cpu_sockets_cumulative_value NUMERIC,
  num_cpu_sockets NUMERIC,
  busy_time_perc90 NUMERIC,
  idle_time_perc90 NUMERIC,
  iowait_time_perc90 NUMERIC,
  nice_time_perc90 NUMERIC,
  load_perc90 NUMERIC,
  busy_time_perc95 NUMERIC,
  idle_time_perc95 NUMERIC,
  iowait_time_perc95 NUMERIC,
  nice_time_perc95 NUMERIC,
  load_perc95 NUMERIC,
  host_cpu_utilization NUMERIC
);
CREATE TABLE `optimusprime-migrations.warrenpuz_automation.w_vawrhistsysmetricsumm`
(
  pkey STRING,
  dbid NUMERIC,
  instance_number NUMERIC,
  hour NUMERIC,
  metric_name STRING,
  avg_value NUMERIC,
  mode_value NUMERIC,
  median_value NUMERIC,
  perc50_value NUMERIC,
  perc75_value NUMERIC,
  perc90_value NUMERIC,
  perc95_value NUMERIC,
  perc100_value NUMERIC,
  min_value NUMERIC,
  max_value NUMERIC,
  sum_value NUMERIC
);
CREATE TABLE `optimusprime-migrations.warrenpuz_automation.w_vawrsnapdetails`
(
  pkey STRING,
  dbid NUMERIC,
  instance_number NUMERIC,
  hour NUMERIC,
  min_snapid NUMERIC,
  max_snapid NUMERIC,
  min_begin_interval_time STRING,
  max_begin_interval_time STRING,
  cnt NUMERIC,
  sum_snaps_diff_secs NUMERIC,
  avg_snaps_diff_secs NUMERIC
);
CREATE TABLE `optimusprime-migrations.warrenpuz_automation.w_vcpucoresusage`
(
  pkey STRING,
  dt STRING,
  cpu_count NUMERIC,
  cpu_core_count NUMERIC,
  cpu_socket_count NUMERIC
);
CREATE TABLE `optimusprime-migrations.warrenpuz_automation.w_vdatatypes`
(
  pkey STRING,
  con_id NUMERIC,
  owner STRING,
  data_type STRING,
  coun NUMERIC,
  cnt NUMERIC
);
CREATE TABLE `optimusprime-migrations.warrenpuz_automation.w_vdbahistsysstat`
(
  pkey STRING,
  dbid NUMERIC,
  instance_number NUMERIC,
  hour NUMERIC,
  stat_name STRING,
  avg_value NUMERIC,
  mode_value NUMERIC,
  median_value NUMERIC,
  perc50_value NUMERIC,
  perc75_value NUMERIC,
  perc90_value NUMERIC,
  perc95_value NUMERIC,
  perc100_value NUMERIC,
  min_value NUMERIC,
  max_value NUMERIC,
  sum_value NUMERIC,
  cnt_value NUMERIC
);
CREATE TABLE `optimusprime-migrations.warrenpuz_automation.w_vdbahistsystimemodel`
(
  pkey STRING,
  dbid NUMERIC,
  instance_number NUMERIC,
  hour NUMERIC,
  stat_name STRING,
  cnt NUMERIC,
  avg_value NUMERIC,
  mode_value NUMERIC,
  median_value NUMERIC,
  perc50_value NUMERIC,
  perc75_value NUMERIC,
  perc90_value NUMERIC,
  perc95_value NUMERIC,
  perc100_value NUMERIC,
  min_value NUMERIC,
  max_value NUMERIC,
  sum_value NUMERIC
);
CREATE TABLE `optimusprime-migrations.warrenpuz_automation.w_vdbfeatures`
(
  pkey STRING,
  con_id STRING,
  name STRING,
  current_usage STRING,
  detected_usage STRING,
  total_samples NUMERIC,
  first_usage STRING,
  last_usage STRING,
  aux_count NUMERIC
);
CREATE TABLE `optimusprime-migrations.warrenpuz_automation.w_vdbhwmarkstatistics`
(
  pkey STRING,
  description STRING,
  highwater NUMERIC,
  last_value NUMERIC
);
CREATE TABLE `optimusprime-migrations.warrenpuz_automation.w_vdbinstances`
(
  pkey STRING,
  inst_id NUMERIC,
  instance_name STRING,
  host_name STRING,
  version STRING,
  status STRING,
  database_status STRING,
  instance_role STRING
);
CREATE TABLE `optimusprime-migrations.warrenpuz_automation.w_vdbobjects`
(
  pkey STRING,
  con_id NUMERIC,
  owner STRING,
  objecttype STRING,
  editionable STRING,
  cnt NUMERIC,
  in_con_id NUMERIC,
  in_owner NUMERIC,
  in_object_type NUMERIC,
  in_editionable NUMERIC
);
CREATE TABLE `optimusprime-migrations.warrenpuz_automation.w_vdbparameters`
(
  pkey STRING,
  inst_id NUMERIC,
  instance_number NUMERIC,
  con_id NUMERIC,
  name STRING,
  value STRING,
  default_value STRING,
  isdefault STRING
);
CREATE TABLE `optimusprime-migrations.warrenpuz_automation.w_vdbsizing_facts`
(
  pkey STRING,
  dbid STRING,
  instance_number NUMERIC,
  hour NUMERIC,
  cdb STRING,
  dbversion STRING,
  platform_name STRING,
  redo_gb_per_day NUMERIC,
  rac_dbinstances NUMERIC,
  rac_dbinstaces NUMERIC,
  buffer_cache_mb NUMERIC,
  shared_pool_mb NUMERIC,
  total_pga_allocated_mb NUMERIC,
  db_size_allocated_gb NUMERIC,
  db_size_in_use_gb NUMERIC,
  bmsstorage_tb_db NUMERIC,
  bmsmemory_gb_db NUMERIC,
  bmsmemory_gb_host NUMERIC,
  aas_perc95 NUMERIC,
  cpudb95_perc NUMERIC,
  cpudb95_cores NUMERIC,
  bmscores95_db NUMERIC,
  iombps_perc95 NUMERIC,
  iops_perc95 NUMERIC,
  phy_reads_per_sec_perc95 NUMERIC,
  phy_writes_per_sec_perc95 NUMERIC,
  physical_memory_bytes_cumulative_value NUMERIC,
  free_memory_bytes_cumulative_value NUMERIC,
  num_cpus_cumulative_value NUMERIC,
  num_cpus NUMERIC,
  num_cpu_cores_cumulative_value NUMERIC,
  num_cpu_cores NUMERIC,
  num_cpu_sockets_cumulative_value NUMERIC,
  num_cpu_sockets NUMERIC,
  host_cpu_utilization NUMERIC,
  cpuhost95_cores NUMERIC,
  bmscores95_host NUMERIC
);
CREATE TABLE `optimusprime-migrations.warrenpuz_automation.w_vdbsummary`
(
  pkey STRING,
  dbid NUMERIC,
  cdb STRING,
  dbversion STRING,
  dbfullversion STRING,
  log_mode STRING,
  force_logging STRING,
  redo_db_per_day NUMERIC,
  rac_dbinstances NUMERIC,
  rac_dbinstaces NUMERIC,
  characterset STRING,
  platform_name STRING,
  startup_time STRING,
  user_schemas NUMERIC,
  buffer_cache_mb NUMERIC,
  shared_pool_mb NUMERIC,
  total_pga_allocated_mb NUMERIC,
  db_size_allocated_gb NUMERIC,
  dg_database_role STRING,
  dg_protection_mode STRING,
  dg_protection_level STRING
);
CREATE TABLE `optimusprime-migrations.warrenpuz_automation.w_vindexestypes`
(
  pkey STRING,
  con_id NUMERIC,
  owner STRING,
  index_type STRING,
  cnt NUMERIC
);
CREATE TABLE `optimusprime-migrations.warrenpuz_automation.w_voptimusconfig_bms_machinesizes`
(
  cores NUMERIC,
  ram_gb NUMERIC,
  machine_size STRING,
  processor STRING,
  est_price NUMERIC
);
CREATE TABLE `optimusprime-migrations.warrenpuz_automation.w_voptimusconfig_network_to_gcp`
(
  network_to_gcp STRING,
  gbytes_per_sec NUMERIC,
  mbytes_per_sec NUMERIC
);
CREATE TABLE `optimusprime-migrations.warrenpuz_automation.w_vosstat_columnar`
(
  pkey STRING,
  dbid NUMERIC,
  instance_number NUMERIC,
  hour NUMERIC,
  num_cpus NUMERIC,
  num_cpu_cores NUMERIC,
  num_cpu_sockets NUMERIC,
  load NUMERIC,
  physical_memory_bytes NUMERIC,
  free_memory_bytes NUMERIC,
  busy_time_perc50 NUMERIC,
  busy_time_perc75 NUMERIC,
  busy_time_perc90 NUMERIC,
  busy_time_perc95 NUMERIC,
  busy_time_perc100 NUMERIC,
  idle_time_perc50 NUMERIC,
  idle_time_perc75 NUMERIC,
  idle_time_perc90 NUMERIC,
  idle_time_perc95 NUMERIC,
  idle_time_perc100 NUMERIC,
  iowait_time_perc50 NUMERIC,
  iowait_time_perc75 NUMERIC,
  iowait_time_perc90 NUMERIC,
  iowait_time_perc95 NUMERIC,
  iowait_time_perc100 NUMERIC,
  nice_time_perc50 NUMERIC,
  nice_time_perc75 NUMERIC,
  nice_time_perc90 NUMERIC,
  nice_time_perc95 NUMERIC,
  nice_time_perc100 NUMERIC,
  sys_time_perc50 NUMERIC,
  sys_time_perc75 NUMERIC,
  sys_time_perc90 NUMERIC,
  sys_time_perc95 NUMERIC,
  sys_time_perc100 NUMERIC,
  user_time_perc50 NUMERIC,
  user_time_perc75 NUMERIC,
  user_time_perc90 NUMERIC,
  user_time_perc95 NUMERIC,
  user_time_perc100 NUMERIC
);
CREATE TABLE `optimusprime-migrations.warrenpuz_automation.w_vsourcecode`
(
  pkey STRING,
  con_id NUMERIC,
  owner STRING,
  type STRING,
  nr_lines NUMERIC,
  qt_objs NUMERIC,
  nr_lines_w_utl NUMERIC,
  nr_lines_w_dbms NUMERIC,
  nr_lines_w_exec_im NUMERIC,
  nr_lines_w_dbms_sql NUMERIC,
  nr_lines_w_dbms_utl NUMERIC,
  nr_lines_total NUMERIC
);
CREATE TABLE `optimusprime-migrations.warrenpuz_automation.w_vsysmetric`
(
  info_source STRING,
  pkey STRING,
  dbid NUMERIC,
  instance_number NUMERIC,
  hour NUMERIC,
  metric_name STRING,
  avg_value NUMERIC,
  mode_value NUMERIC,
  median_value NUMERIC,
  perc50_value NUMERIC,
  perc75_value NUMERIC,
  perc90_value NUMERIC,
  perc95_value NUMERIC,
  perc100_value NUMERIC,
  min_value NUMERIC,
  max_value NUMERIC,
  sum_value NUMERIC
);
CREATE TABLE `optimusprime-migrations.warrenpuz_automation.w_vsysmetric_columnar`
(
  info_source STRING,
  pkey STRING,
  dbid NUMERIC,
  instance_number NUMERIC,
  hour NUMERIC,
  avg_active_sess_perc50 NUMERIC,
  avg_active_sess_perc75 NUMERIC,
  avg_active_sess_perc95 NUMERIC,
  avg_active_sess_perc100 NUMERIC,
  bkgr_cpu_usage_perc50 NUMERIC,
  bkgr_cpu_usage_perc75 NUMERIC,
  bkgr_cpu_usage_perc95 NUMERIC,
  bkgr_cpu_usage_perc100 NUMERIC,
  buffer_hitratio_perc50 NUMERIC,
  buffer_hitratio_perc75 NUMERIC,
  buffer_hitratio_perc95 NUMERIC,
  buffer_hitratio_perc100 NUMERIC,
  cpu_usage_perc50 NUMERIC,
  cpu_usage_perc75 NUMERIC,
  cpu_usage_perc95 NUMERIC,
  cpu_usage_perc100 NUMERIC,
  cell_phy_io_int_bytes_perc50 NUMERIC,
  cell_phy_io_int_bytes_perc75 NUMERIC,
  cell_phy_io_int_bytes_perc95 NUMERIC,
  cell_phy_io_int_bytes_perc100 NUMERIC,
  dbblock_changes_perc50 NUMERIC,
  dbblock_changes_perc75 NUMERIC,
  dbblock_changes_perc95 NUMERIC,
  dbblock_changes_perc100 NUMERIC,
  dbcpu_time_ratio_perc50 NUMERIC,
  dbcpu_time_ratio_perc75 NUMERIC,
  dbcpu_time_ratio_perc95 NUMERIC,
  dbcpu_time_ratio_perc100 NUMERIC,
  dbtime_perc50 NUMERIC,
  dbtime_perc75 NUMERIC,
  dbtime_perc95 NUMERIC,
  dbtime_perc100 NUMERIC,
  executions_perc50 NUMERIC,
  executions_perc75 NUMERIC,
  executions_perc95 NUMERIC,
  executions_perc100 NUMERIC,
  host_cpu_usage_time_perc50 NUMERIC,
  host_cpu_usage_time_perc75 NUMERIC,
  host_cpu_usage_time_perc95 NUMERIC,
  host_cpu_usage_time_perc100 NUMERIC,
  host_cpu_utilization_perc50 NUMERIC,
  host_cpu_utilization_perc75 NUMERIC,
  host_cpu_utilization_perc95 NUMERIC,
  host_cpu_utilization_perc100 NUMERIC,
  io_mbps_perc50 NUMERIC,
  io_mbps_perc75 NUMERIC,
  io_mbps_perc95 NUMERIC,
  io_mbps_perc100 NUMERIC,
  logical_reads_perc50 NUMERIC,
  logical_reads_perc75 NUMERIC,
  logical_reads_perc95 NUMERIC,
  logical_reads_perc100 NUMERIC,
  logons_perc50 NUMERIC,
  logons_perc75 NUMERIC,
  logons_perc95 NUMERIC,
  logons_perc100 NUMERIC,
  pga_cachehit_perc50 NUMERIC,
  pga_cachehit_perc75 NUMERIC,
  pga_cachehit_perc95 NUMERIC,
  pga_cachehit_perc100 NUMERIC,
  phy_read_bytes_perc50 NUMERIC,
  phy_read_bytes_perc75 NUMERIC,
  phy_read_bytes_perc95 NUMERIC,
  phy_read_bytes_perc100 NUMERIC,
  phy_read_iops_perc50 NUMERIC,
  phy_read_iops_perc75 NUMERIC,
  phy_read_iops_perc95 NUMERIC,
  phy_read_iops_perc100 NUMERIC,
  phy_read_total_bytes_perc50 NUMERIC,
  phy_read_total_bytes_perc75 NUMERIC,
  phy_read_total_bytes_perc95 NUMERIC,
  phy_read_total_bytes_perc100 NUMERIC,
  phy_read_total_iops_perc50 NUMERIC,
  phy_read_total_iops_perc75 NUMERIC,
  phy_read_total_iops_perc95 NUMERIC,
  phy_read_total_iops_perc100 NUMERIC,
  phy_read_direct_lobs_perc50 NUMERIC,
  phy_read_direct_lobs_perc75 NUMERIC,
  phy_read_direct_lobs_perc95 NUMERIC,
  phy_read_direct_lobs_perc100 NUMERIC,
  phy_reads_perc50 NUMERIC,
  phy_reads_perc75 NUMERIC,
  phy_reads_perc95 NUMERIC,
  phy_reads_perc100 NUMERIC,
  phy_writes_bytes_perc50 NUMERIC,
  phy_writes_bytes_perc75 NUMERIC,
  phy_writes_bytes_perc95 NUMERIC,
  phy_writes_bytes_perc100 NUMERIC,
  phy_write_iops_perc50 NUMERIC,
  phy_write_iops_perc75 NUMERIC,
  phy_write_iops_perc95 NUMERIC,
  phy_write_iops_perc100 NUMERIC,
  phy_write_total_bytes_perc50 NUMERIC,
  phy_write_total_bytes_perc75 NUMERIC,
  phy_write_total_bytes_perc95 NUMERIC,
  phy_write_total_bytes_perc100 NUMERIC,
  phy_write_total_iops_perc50 NUMERIC,
  phy_write_total_iops_perc75 NUMERIC,
  phy_write_total_iops_perc95 NUMERIC,
  phy_write_total_iops_perc100 NUMERIC,
  phy_writes_direct_lobs_perc50 NUMERIC,
  phy_writes_direct_lobs_perc75 NUMERIC,
  phy_writes_direct_lobs_perc95 NUMERIC,
  phy_writes_direct_lobs_perc100 NUMERIC
);
CREATE TABLE `optimusprime-migrations.warrenpuz_automation.w_vsysmetric_cpu_facts`
(
  info_source STRING,
  pkey STRING,
  dbid NUMERIC,
  instance_number NUMERIC,
  hour NUMERIC,
  num_cpu_sockets NUMERIC,
  num_cpu_cores NUMERIC,
  num_cpus NUMERIC,
  load NUMERIC,
  osstat_comments STRING,
  osstat_host_cpu_utilization_perc50 NUMERIC,
  osstat_host_cpu_utilization_perc75 NUMERIC,
  osstat_host_cpu_utilization_perc95 NUMERIC,
  osstat_host_cpu_utilization_perc100 NUMERIC,
  osstat_host_cpu_utilization_comments STRING,
  osstat_user_host_cpu_utilization_perc50 NUMERIC,
  osstat_user_host_cpu_utilization_perc75 NUMERIC,
  osstat_user_host_cpu_utilization_perc95 NUMERIC,
  osstat_user_host_cpu_utilization_perc100 NUMERIC,
  osstat_user_host_cpu_utilization_comments STRING,
  avg_active_sess_perc50 NUMERIC,
  avg_active_sess_perc75 NUMERIC,
  avg_active_sess_perc95 NUMERIC,
  avg_active_sess_perc100 NUMERIC,
  avg_active_sess_comments STRING,
  bkgr_cpu_usage_perc50 NUMERIC,
  bkgr_cpu_usage_perc75 NUMERIC,
  bkgr_cpu_usage_perc95 NUMERIC,
  bkgr_cpu_usage_perc100 NUMERIC,
  bkgr_cpu_usage_comments STRING,
  cpu_usage_perc50 NUMERIC,
  cpu_usage_perc75 NUMERIC,
  cpu_usage_perc95 NUMERIC,
  cpu_usage_perc100 NUMERIC,
  cpu_usage_comments STRING,
  dbcpu_time_ratio_perc50 NUMERIC,
  dbcpu_time_ratio_perc75 NUMERIC,
  dbcpu_time_ratio_perc95 NUMERIC,
  dbcpu_time_ratio_perc100 NUMERIC,
  dbcpu_time_ratio_comments STRING,
  host_cpu_usage_time_perc50 NUMERIC,
  host_cpu_usage_time_perc75 NUMERIC,
  host_cpu_usage_time_perc95 NUMERIC,
  host_cpu_usage_time_perc100 NUMERIC,
  host_cpu_usage_time_comments STRING,
  host_cpu_utilization_perc50 NUMERIC,
  host_cpu_utilization_perc75 NUMERIC,
  host_cpu_utilization_perc95 NUMERIC,
  host_cpu_utilization_perc100 NUMERIC,
  host_cpu_utilization_comments STRING,
  logical_reads_perc50 NUMERIC,
  logical_reads_perc75 NUMERIC,
  logical_reads_perc95 NUMERIC,
  logical_reads_perc100 NUMERIC,
  logical_reads_comments STRING
);
CREATE TABLE `optimusprime-migrations.warrenpuz_automation.w_vsysmetric_io_facts`
(
  info_source STRING,
  pkey STRING,
  dbid NUMERIC,
  instance_number NUMERIC,
  hour NUMERIC,
  cell_phy_io_int_bytes_perc50 NUMERIC,
  cell_phy_io_int_bytes_perc75 NUMERIC,
  cell_phy_io_int_bytes_perc95 NUMERIC,
  cell_phy_io_int_bytes_perc100 NUMERIC,
  cell_phy_io_int_bytes_comments STRING,
  io_mbps_perc50 NUMERIC,
  io_mbps_perc75 NUMERIC,
  io_mbps_perc95 NUMERIC,
  io_mbps_perc100 NUMERIC,
  io_mbps_comments STRING,
  phy_read_bytes_perc50 NUMERIC,
  phy_read_bytes_perc75 NUMERIC,
  phy_read_bytes_perc95 NUMERIC,
  phy_read_bytes_perc100 NUMERIC,
  phy_read_bytes_comments STRING,
  phy_read_iops_perc50 NUMERIC,
  phy_read_iops_perc75 NUMERIC,
  phy_read_iops_perc95 NUMERIC,
  phy_read_iops_perc100 NUMERIC,
  phy_read_iops_comments STRING,
  phy_read_total_bytes_perc50 NUMERIC,
  phy_read_total_bytes_perc75 NUMERIC,
  phy_read_total_bytes_perc95 NUMERIC,
  phy_read_total_bytes_perc100 NUMERIC,
  phy_read_total_bytes_comments STRING,
  phy_read_total_iops_perc50 NUMERIC,
  phy_read_total_iops_perc75 NUMERIC,
  phy_read_total_iops_perc95 NUMERIC,
  phy_read_total_iops_perc100 NUMERIC,
  phy_read_total_iops_comments STRING,
  phy_read_direct_lobs_perc50 NUMERIC,
  phy_read_direct_lobs_perc75 NUMERIC,
  phy_read_direct_lobs_perc95 NUMERIC,
  phy_read_direct_lobs_perc100 NUMERIC,
  phy_read_direct_lobs_comments STRING,
  phy_reads_perc50 NUMERIC,
  phy_reads_perc75 NUMERIC,
  phy_reads_perc95 NUMERIC,
  phy_reads_perc100 NUMERIC,
  phy_reads_comments STRING,
  phy_writes_bytes_perc50 NUMERIC,
  phy_writes_bytes_perc75 NUMERIC,
  phy_writes_bytes_perc95 NUMERIC,
  phy_writes_bytes_perc100 NUMERIC,
  phy_writes_bytes_comments STRING,
  phy_write_iops_perc50 NUMERIC,
  phy_write_iops_perc75 NUMERIC,
  phy_write_iops_perc95 NUMERIC,
  phy_write_iops_perc100 NUMERIC,
  phy_write_iops_comments STRING,
  phy_write_total_bytes_perc50 NUMERIC,
  phy_write_total_bytes_perc75 NUMERIC,
  phy_write_total_bytes_perc95 NUMERIC,
  phy_write_total_bytes_perc100 NUMERIC,
  phy_write_total_bytes_comments STRING,
  phy_write_total_iops_perc50 NUMERIC,
  phy_write_total_iops_perc75 NUMERIC,
  phy_write_total_iops_perc95 NUMERIC,
  phy_write_total_iops_perc100 NUMERIC,
  phy_write_total_iops_comments STRING,
  phy_writes_direct_lobs_perc50 NUMERIC,
  phy_writes_direct_lobs_perc75 NUMERIC,
  phy_writes_direct_lobs_perc95 NUMERIC,
  phy_writes_direct_lobs_perc100 NUMERIC,
  phy_write_direct_lobs_comments STRING
);
CREATE TABLE `optimusprime-migrations.warrenpuz_automation.w_vsysmetric_sysstat`
(
  info_source STRING,
  pkey STRING,
  dbid NUMERIC,
  instance_number NUMERIC,
  hour NUMERIC,
  metric_name STRING,
  avg_value NUMERIC,
  mode_value NUMERIC,
  median_value NUMERIC,
  perc50_value NUMERIC,
  perc75_value NUMERIC,
  perc90_value NUMERIC,
  perc95_value NUMERIC,
  perc100_value NUMERIC,
  min_value NUMERIC,
  max_value NUMERIC,
  sum_value NUMERIC
);
CREATE TABLE `optimusprime-migrations.warrenpuz_automation.w_vsysstat`
(
  info_source STRING,
  pkey STRING,
  dbid NUMERIC,
  instance_number NUMERIC,
  hour NUMERIC,
  stat_name STRING,
  avg_value NUMERIC,
  mode_value NUMERIC,
  median_value NUMERIC,
  perc50_value NUMERIC,
  perc75_value NUMERIC,
  perc90_value NUMERIC,
  perc95_value NUMERIC,
  perc100_value NUMERIC,
  min_value NUMERIC,
  max_value NUMERIC,
  sum_value NUMERIC,
  cnt_value NUMERIC,
  avg_value_per_sec NUMERIC,
  mode_value_per_sec NUMERIC,
  median_value_per_sec NUMERIC,
  perc50_value_per_sec NUMERIC,
  perc75_value_per_sec NUMERIC,
  perc90_value_per_sec NUMERIC,
  perc95_value_per_sec NUMERIC,
  perc100_value_per_sec NUMERIC
);
CREATE TABLE `optimusprime-migrations.warrenpuz_automation.w_vsysstat_columnar`
(
  dbversion STRING,
  metric_unit STRING,
  info_source STRING,
  pkey STRING,
  dbid NUMERIC,
  instance_number NUMERIC,
  hour NUMERIC,
  cpu_used_by_this_session_perc50 NUMERIC,
  cpu_used_by_this_session_perc75 NUMERIC,
  cpu_used_by_this_session_perc95 NUMERIC,
  cpu_used_by_this_session_perc100 NUMERIC,
  dbtime_perc50 NUMERIC,
  dbtime_perc75 NUMERIC,
  dbtime_perc95 NUMERIC,
  dbtime_perc100 NUMERIC,
  cellflashcachereadhit_perc50 NUMERIC,
  cellflashcachereadhit_perc75 NUMERIC,
  cellflashcachereadhit_perc95 NUMERIC,
  cellflashcachereadhit_perc100 NUMERIC,
  cell_inter_bytes_returned_by_XT_smartscan_perc50 NUMERIC,
  cell_inter_bytes_returned_by_XT_smartscan_perc75 NUMERIC,
  cell_inter_bytes_returned_by_XT_smartscan_perc95 NUMERIC,
  cell_inter_bytes_returned_by_XT_smartscan_perc100 NUMERIC,
  cell_physical_io_bytes_eligible_for_predicate_offload_perc50 NUMERIC,
  cell_physical_io_bytes_eligible_for_predicate_offload_perc75 NUMERIC,
  cell_physical_io_bytes_eligible_for_predicate_offload_perc95 NUMERIC,
  cell_physical_io_bytes_eligible_for_predicate_offload_perc100 NUMERIC,
  cell_physical_io_bytes_eligible_for_smartios_perc50 NUMERIC,
  cell_physical_io_bytes_eligible_for_smartios_perc75 NUMERIC,
  cell_physical_io_bytes_eligible_for_smartios_perc95 NUMERIC,
  cell_physical_io_bytes_eligible_for_smartios_perc100 NUMERIC,
  cell_physical_io_bytes_saved_by_storage_index_perc50 NUMERIC,
  cell_physical_io_bytes_saved_by_storage_index_perc75 NUMERIC,
  cell_physical_io_bytes_saved_by_storage_index_perc95 NUMERIC,
  cell_physical_io_bytes_saved_by_storage_index_perc100 NUMERIC,
  cell_physical_io_bytes_sent_directly_to_dbnode_to_balance_cpu_perc50 NUMERIC,
  cell_physical_io_bytes_sent_directly_to_dbnode_to_balance_cpu_perc75 NUMERIC,
  cell_physical_io_bytes_sent_directly_to_dbnode_to_balance_cpu_perc95 NUMERIC,
  cell_physical_io_bytes_sent_directly_to_dbnode_to_balance_cpu_perc100 NUMERIC,
  cell_physical_io_interconnect_bytes_perc50 NUMERIC,
  cell_physical_io_interconnect_bytes_perc75 NUMERIC,
  cell_physical_io_interconnect_bytes_perc95 NUMERIC,
  cell_physical_io_interconnect_bytes_perc100 NUMERIC,
  cell_physical_io_interconnect_bytes_returned_by_smartcan_perc50 NUMERIC,
  cell_physical_io_interconnect_bytes_returned_by_smartcan_perc75 NUMERIC,
  cell_physical_io_interconnect_bytes_returned_by_smartcan_perc95 NUMERIC,
  cell_physical_io_interconnect_bytes_returned_by_smartcan_perc100 NUMERIC,
  cell_physical_write_io_bytes_eligible_for_offload_perc50 NUMERIC,
  cell_physical_write_io_bytes_eligible_for_offload_perc75 NUMERIC,
  cell_physical_write_io_bytes_eligible_for_offload_perc95 NUMERIC,
  cell_physical_write_io_bytes_eligible_for_offload_perc100 NUMERIC,
  cell_pmem_cache_read_hits_perc50 NUMERIC,
  cell_pmem_cache_read_hits_perc75 NUMERIC,
  cell_pmem_cache_read_hits_perc95 NUMERIC,
  cell_pmem_cache_read_hits_perc100 NUMERIC,
  dbblockgets_perc50 NUMERIC,
  dbblockgets_perc75 NUMERIC,
  dbblockgets_perc95 NUMERIC,
  execute_count_perc50 NUMERIC,
  execute_count_perc75 NUMERIC,
  execute_count_perc95 NUMERIC,
  execute_count_perc100 NUMERIC,
  physical_read_io_requests_perc50 NUMERIC,
  physical_read_io_requests_perc75 NUMERIC,
  physical_read_io_requests_perc95 NUMERIC,
  physical_read_io_requests_perc100 NUMERIC,
  physical_read_bytes_perc50 NUMERIC,
  physical_read_bytes_perc75 NUMERIC,
  physical_read_bytes_perc95 NUMERIC,
  physical_read_bytes_perc100 NUMERIC,
  physical_read_flash_cache_hits_perc50 NUMERIC,
  physical_read_flash_cache_hits_perc75 NUMERIC,
  physical_read_flash_cache_hits_perc95 NUMERIC,
  physical_read_flash_cache_hits_perc100 NUMERIC,
  physical_read_total_io_requests_perc50 NUMERIC,
  physical_read_total_io_requests_perc75 NUMERIC,
  physical_read_total_io_requests_perc95 NUMERIC,
  physical_read_total_io_requests_perc100 NUMERIC,
  physical_read_total_bytes_perc50 NUMERIC,
  physical_read_total_bytes_perc75 NUMERIC,
  physical_read_total_bytes_perc95 NUMERIC,
  physical_read_total_bytes_perc100 NUMERIC,
  physical_reads_perc50 NUMERIC,
  physical_reads_perc75 NUMERIC,
  physical_reads_perc95 NUMERIC,
  physical_reads_perc100 NUMERIC,
  physical_reads_direct_perc50 NUMERIC,
  physical_reads_direct_perc75 NUMERIC,
  physical_reads_direct_perc95 NUMERIC,
  physical_reads_direct_perc100 NUMERIC,
  physical_reads_direct_lob_perc50 NUMERIC,
  physical_reads_direct_lob_perc75 NUMERIC,
  physical_reads_direct_lob_perc95 NUMERIC,
  physical_reads_direct_lob_perc100 NUMERIC,
  physical_write_io_req_perc50 NUMERIC,
  physical_write_io_req_perc75 NUMERIC,
  physical_write_io_req_perc95 NUMERIC,
  physical_write_io_req_perc100 NUMERIC,
  physical_write_bytes_perc50 NUMERIC,
  physical_write_bytes_perc75 NUMERIC,
  physical_write_bytes_perc95 NUMERIC,
  physical_write_bytes_perc100 NUMERIC,
  physical_write_total_io_req_perc50 NUMERIC,
  physical_write_total_io_req_perc75 NUMERIC,
  physical_write_total_io_req_perc95 NUMERIC,
  physical_write_total_io_req_perc100 NUMERIC,
  physical_write_total_bytes_perc50 NUMERIC,
  physical_write_total_bytes_perc75 NUMERIC,
  physical_write_total_bytes_perc95 NUMERIC,
  physical_write_total_bytes_perc100 NUMERIC,
  physical_writes_perc50 NUMERIC,
  physical_writes_perc75 NUMERIC,
  physical_writes_perc95 NUMERIC,
  physical_writes_perc100 NUMERIC,
  physical_writes_direct_lob_perc50 NUMERIC,
  physical_writes_direct_lob_perc75 NUMERIC,
  physical_writes_direct_lob_perc95 NUMERIC,
  physical_writes_direct_lob_perc100 NUMERIC,
  recursive_cpu_usage_perc50 NUMERIC,
  recursive_cpu_usage_perc75 NUMERIC,
  recursive_cpu_usage_perc95 NUMERIC,
  recursive_cpu_usage_perc100 NUMERIC,
  user_io_wait_time_perc50 NUMERIC,
  user_io_wait_time_perc75 NUMERIC,
  user_io_wait_time_perc95 NUMERIC,
  user_io_wait_time_perc100 NUMERIC,
  user_calls_perc50 NUMERIC,
  user_calls_perc75 NUMERIC,
  user_calls_perc95 NUMERIC,
  user_calls_perc100 NUMERIC,
  user_commits_perc50 NUMERIC,
  user_commits_perc75 NUMERIC,
  user_commits_perc95 NUMERIC,
  user_commits_perc100 NUMERIC,
  user_rollbacks_perc50 NUMERIC,
  user_rollbacks_perc75 NUMERIC,
  user_rollbacks_perc95 NUMERIC,
  user_rollbacks_perc100 NUMERIC
);


CREATE TABLE `optimusprime-migrations.warrenpuz_automation.w_vtablesnopk`
(
  pkey STRING,
  con_id NUMERIC,
  owner STRING,
  pk NUMERIC,
  uk NUMERIC,
  ck NUMERIC,
  ri NUMERIC,
  vwck NUMERIC,
  vmro NUMERIC,
  hashexpr NUMERIC,
  suplog NUMERIC,
  num_tables NUMERIC,
  total_cons NUMERIC
);


CREATE TABLE `optimusprime-migrations.warrenpuz_automation.w_vusrsegatt`
(
  pkey STRING,
  con_id NUMERIC,
  owner STRING,
  segment_name STRING,
  segment_type STRING,
  tablespace_name STRING
);



f0_
create table   `optimusprime-migrations.warrenpuz_automation`.w_vdbinstances as select * from  `optimusprime-migrations.warrenpuz_automation`.vdbinstances;
create table   `optimusprime-migrations.warrenpuz_automation`.w_vsysmetric_columnar as select * from  `optimusprime-migrations.warrenpuz_automation`.vsysmetric_columnar;
create table   `optimusprime-migrations.warrenpuz_automation`.w_vsysmetric as select * from  `optimusprime-migrations.warrenpuz_automation`.vsysmetric;
create table   `optimusprime-migrations.warrenpuz_automation`.w_vawrhistsysmetrichist_rs_awrhistosstat_rs as select * from  `optimusprime-migrations.warrenpuz_automation`.vawrhistsysmetrichist_rs_awrhistosstat_rs;
create table   `optimusprime-migrations.warrenpuz_automation`.w_vindexestypes as select * from  `optimusprime-migrations.warrenpuz_automation`.vindexestypes;
create table   `optimusprime-migrations.warrenpuz_automation`.w_vawrhistsysmetrichist_rs as select * from  `optimusprime-migrations.warrenpuz_automation`.vawrhistsysmetrichist_rs;
create table   `optimusprime-migrations.warrenpuz_automation`.w_vdbahistsysstat as select * from  `optimusprime-migrations.warrenpuz_automation`.vdbahistsysstat;
create table   `optimusprime-migrations.warrenpuz_automation`.w_voptimusconfig_bms_machinesizes as select * from  `optimusprime-migrations.warrenpuz_automation`.voptimusconfig_bms_machinesizes;
create table   `optimusprime-migrations.warrenpuz_automation`.w_vdbsummary as select * from  `optimusprime-migrations.warrenpuz_automation`.vdbsummary;
create table   `optimusprime-migrations.warrenpuz_automation`.w_vsysmetric_sysstat as select * from  `optimusprime-migrations.warrenpuz_automation`.vsysmetric_sysstat;
create table   `optimusprime-migrations.warrenpuz_automation`.w_V_DS_dbfeatures as select * from  `optimusprime-migrations.warrenpuz_automation`.V_DS_dbfeatures;
create table   `optimusprime-migrations.warrenpuz_automation`.w_vawrhistsysmetricsumm as select * from  `optimusprime-migrations.warrenpuz_automation`.vawrhistsysmetricsumm;
create table   `optimusprime-migrations.warrenpuz_automation`.w_vusrsegatt as select * from  `optimusprime-migrations.warrenpuz_automation`.vusrsegatt;
create table   `optimusprime-migrations.warrenpuz_automation`.w_vReport_sysmetric_io_summary as select * from  `optimusprime-migrations.warrenpuz_automation`.vReport_sysmetric_io_summary;
create table   `optimusprime-migrations.warrenpuz_automation`.w_V_DS_dbsummary as select * from  `optimusprime-migrations.warrenpuz_automation`.V_DS_dbsummary;
create table   `optimusprime-migrations.warrenpuz_automation`.w_vdbsizing_facts as select * from  `optimusprime-migrations.warrenpuz_automation`.vdbsizing_facts;
create table   `optimusprime-migrations.warrenpuz_automation`.w_vdbobjects as select * from  `optimusprime-migrations.warrenpuz_automation`.vdbobjects;
create table   `optimusprime-migrations.warrenpuz_automation`.w_vsysmetric_io_facts as select * from  `optimusprime-migrations.warrenpuz_automation`.vsysmetric_io_facts;
create table   `optimusprime-migrations.warrenpuz_automation`.w_V_DS_HostDetails as select * from  `optimusprime-migrations.warrenpuz_automation`.V_DS_HostDetails;
create table   `optimusprime-migrations.warrenpuz_automation`.w_vawrhistosstat_rs_metrics as select * from  `optimusprime-migrations.warrenpuz_automation`.vawrhistosstat_rs_metrics;
create table   `optimusprime-migrations.warrenpuz_automation`.w_vdbfeatures as select * from  `optimusprime-migrations.warrenpuz_automation`.vdbfeatures;
create table   `optimusprime-migrations.warrenpuz_automation`.w_voptimusconfig_network_to_gcp as select * from  `optimusprime-migrations.warrenpuz_automation`.voptimusconfig_network_to_gcp;
create table   `optimusprime-migrations.warrenpuz_automation`.w_vawrsnapdetails as select * from  `optimusprime-migrations.warrenpuz_automation`.vawrsnapdetails;
create table   `optimusprime-migrations.warrenpuz_automation`.w_vReport_sysstat_io_summary as select * from  `optimusprime-migrations.warrenpuz_automation`.vReport_sysstat_io_summary;
create table   `optimusprime-migrations.warrenpuz_automation`.w_V_DS_BMS_BOM as select * from  `optimusprime-migrations.warrenpuz_automation`.V_DS_BMS_BOM;
create table   `optimusprime-migrations.warrenpuz_automation`.w_vdbparameters as select * from  `optimusprime-migrations.warrenpuz_automation`.vdbparameters;
create table   `optimusprime-migrations.warrenpuz_automation`.w_vsourcecode as select * from  `optimusprime-migrations.warrenpuz_automation`.vsourcecode;
create table   `optimusprime-migrations.warrenpuz_automation`.w_vdatatypes as select * from  `optimusprime-migrations.warrenpuz_automation`.vdatatypes;
create table   `optimusprime-migrations.warrenpuz_automation`.w_vdbhwmarkstatistics as select * from  `optimusprime-migrations.warrenpuz_automation`.vdbhwmarkstatistics;
create table   `optimusprime-migrations.warrenpuz_automation`.w_vawrhistsysmetrichist as select * from  `optimusprime-migrations.warrenpuz_automation`.vawrhistsysmetrichist;
create table   `optimusprime-migrations.warrenpuz_automation`.w_vawrhistosstat as select * from  `optimusprime-migrations.warrenpuz_automation`.vawrhistosstat;
create table   `optimusprime-migrations.warrenpuz_automation`.w_vsysstat as select * from  `optimusprime-migrations.warrenpuz_automation`.vsysstat;
create table   `optimusprime-migrations.warrenpuz_automation`.w_vdbahistsystimemodel as select * from  `optimusprime-migrations.warrenpuz_automation`.vdbahistsystimemodel;
create table   `optimusprime-migrations.warrenpuz_automation`.w_vawrhistcmdtypes as select * from  `optimusprime-migrations.warrenpuz_automation`.vawrhistcmdtypes;
create table   `optimusprime-migrations.warrenpuz_automation`.w_vcpucoresusage as select * from  `optimusprime-migrations.warrenpuz_automation`.vcpucoresusage;
create table   `optimusprime-migrations.warrenpuz_automation`.w_vsysstat_columnar as select * from  `optimusprime-migrations.warrenpuz_automation`.vsysstat_columnar;
create table   `optimusprime-migrations.warrenpuz_automation`.w_vosstat_columnar as select * from  `optimusprime-migrations.warrenpuz_automation`.vosstat_columnar;
create table   `optimusprime-migrations.warrenpuz_automation`.w_vtablesnopk as select * from  `optimusprime-migrations.warrenpuz_automation`.vtablesnopk;
create table   `optimusprime-migrations.warrenpuz_automation`.w_vsysmetric_cpu_facts as select * from  `optimusprime-migrations.warrenpuz_automation`.vsysmetric_cpu_facts;




