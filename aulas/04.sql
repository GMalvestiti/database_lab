SELECT b.descricao AS descricao_nome_banco, bc.* FROM banco AS b INNER JOIN bancoconfiguracao AS bc ON bc.id = b.id;

CREATE TABLE alunos_backup AS
SELECT * FROM alunos WHERE primeiro_nome ILIKE '%a%';

SELECT a.*, ab.* FROM alunos AS a NATURAL JOIN alunos_backup AS ab;

SELECT *
INTO alunos_backup2
FROM alunos
WHERE primeiro_nome ILIKE '%b%';