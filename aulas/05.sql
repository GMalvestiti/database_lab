SELECT primeiro_nome FROM alunos GROUP BY primeiro_nome ORDER BY primeiro_nome;

SELECT data, subtotalimpressora FROM pdv.venda;

SELECT data, SUM(subtotalimpressora) FROM pdv.venda GROUP BY data ORDER BY data;

SELECT
	data,
	SUM(subtotalimpressora) AS total_vendas,
	COUNT(id) AS total_cupons,
	ROUND(AVG(subtotalimpressora), 2)
FROM pdv.venda
GROUP BY data
ORDER BY data;

SELECT
	data,
	SUM(subtotalimpressora) AS total_vendas,
	COUNT(id) AS total_cupons,
	ROUND(AVG(subtotalimpressora), 2) AS media
FROM pdv.venda
GROUP BY data
HAVING ROUND(AVG(subtotalimpressora), 2) > 40
ORDER BY data;

SELECT
	primeiro_nome,
	COUNT(*)
FROM alunos
GROUP BY primeiro_nome
HAVING COUNT(*) > 1;

SELECT * FROM alunos
UNION
SELECT * FROM alunos_backup;

SELECT * FROM alunos
UNION ALL
SELECT * FROM alunos_backup;

SELECT * FROM alunos
INTERSECT
SELECT * FROM alunos_backup;

SELECT * FROM alunos
EXCEPT
SELECT * FROM alunos_backup;