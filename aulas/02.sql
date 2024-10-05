SELECT * FROM alunos;

SELECT primeiro_nome || ' ' || ultimo_nome AS nome_completo FROM alunos ORDER BY nome_completo DESC;

SELECT DISTINCT primeiro_nome FROM alunos ORDER BY primeiro_nome;

SELECT primeiro_nome, ultimo_nome, idade FROM alunos WHERE idade = 20;

SELECT primeiro_nome || ' ' || ultimo_nome AS nome_completo FROM alunos WHERE primeiro_nome = 'Ana' ORDER BY nome_completo DESC;