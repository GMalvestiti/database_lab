CREATE ROLE gustavo;

DROP ROLE gustavo;

CREATE ROLE gustavo WITH LOGIN;

CREATE USER gustavo;

SELECT rolname FROM pg_roles;

ALTER ROLE gustavo WITH PASSWORD '123';

CREATE ROLE grupo_alunos WITH CREATEDB;

GRANT grupo_alunos TO gustavo;

DROP USER gustavo;

CREATE ROLE gustavo WITH LOGIN PASSWORD '123' IN ROLE grupo_alunos;

SET ROLE grupo_alunos;

GRANT SELECT ON tabela TO gustavo;

REVOKE SELECT ON TABLE tabela FROM gustavo;

GRANT SELECT,UPDATE ON tabela TO gustavo;