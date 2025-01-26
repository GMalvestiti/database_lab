SELECT name, setting, boot_val FROM pg_settings WHERE setting <> boot_val;

-- DB Version: 14
-- OS Type: linux
-- DB Type: mixed
-- Total Memory (RAM): 32 GB
-- CPUs num: 6
-- Connections num: 100
-- Data Storage: ssd

ALTER SYSTEM SET
 max_connections = '100';
ALTER SYSTEM SET
 shared_buffers = '8GB';
ALTER SYSTEM SET
 effective_cache_size = '24GB';
ALTER SYSTEM SET
 maintenance_work_mem = '2GB';
ALTER SYSTEM SET
 checkpoint_completion_target = '0.9';
ALTER SYSTEM SET
 wal_buffers = '16MB';
ALTER SYSTEM SET
 default_statistics_target = '100';
ALTER SYSTEM SET
 random_page_cost = '1.1';
ALTER SYSTEM SET
 effective_io_concurrency = '200';
ALTER SYSTEM SET
 work_mem = '13981kB';
ALTER SYSTEM SET
 huge_pages = 'try';
ALTER SYSTEM SET
 min_wal_size = '1GB';
ALTER SYSTEM SET
 max_wal_size = '4GB';
ALTER SYSTEM SET
 max_worker_processes = '6';
ALTER SYSTEM SET
 max_parallel_workers_per_gather = '3';
ALTER SYSTEM SET
 max_parallel_workers = '6';
ALTER SYSTEM SET
 max_parallel_maintenance_workers = '3';

SELECT pg_reload_conf();

ALTER SYSTEM RESET max_connections;

CREATE DATABASE vr_aula_09 with template vr_template; (vr_restore)

CREATE EXTENSION pg_stat_statements;