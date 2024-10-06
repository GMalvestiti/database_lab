SELECT * FROM alunos WHERE idade = 20 OR idade = 21 OR idade = 22;

SELECT * FROM alunos WHERE idade NOT IN (20, 21, 22);

SELECT * FROM alunos WHERE idade BETWEEN 20 AND 22;

SELECT primeiro_nome, ultimo_nome FROM alunos WHERE primeiro_nome ILIKE '_n%';

SELECT mensagem FROM texto WHERE mensagem ILIKE '%$%%' ESCAPE '$'