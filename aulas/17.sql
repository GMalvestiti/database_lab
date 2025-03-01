CREATE EXTENSION amcheck;

-- checksum errors
SET ignore_checksum_failure = on;
REINDEX DATABASE;

-- corrupted blocks
-- garantir backup físico em outro lugar
SET zero_damaged_pages = on;
VACUUM FULL public.table;

-- transaction não concluída
-- dump e restore

-- verificar intervalo
SELECT MIN(id) FROM tabela_com_problemas;
SELECT MAX(id) FROM tabela_com_problemas;

-- verificar registros saudáveis e identificar corrompidos
-- pulando 0 linhas
SELECT * FROM tabela_com_problemas ORDER BY id OFFSET 0 LIMIT 10000;
SELECT * FROM tabela_com_problemas ORDER BY id OFFSET 10000 LIMIT 10000;
SELECT * FROM tabela_com_problemas WHERE id NOT IN ();

-- criar tabela de backup
CREATE TABLE tabela_com_problemas_backup AS SELECT * FROM tabela_com_problemas WHERE id NOT IN ();

TRUNCATE TABLE tabela_com_problemas;
INSET INTO tabela_com_problemas SELECT * FROM tabela_com_problemas_backup;