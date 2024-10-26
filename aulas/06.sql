SELECT * FROM loja;

SELECT * FROM fornecedor WHERE id IN (
	SELECT id_fornecedor
	FROM loja
);

-- Não é a forma mais perfomática
SELECT v.*
FROM pdv.venda v
WHERE id IN (
	SELECT vi.id_venda
	FROM pdv.vendaitem vi
	WHERE vi.id_produto IN (
		SELECT p.id
		FROM produto p
		WHERE p.descricaocompleta ILIKE '%coca%'
	)
)

SELECT
	p.descricaocompleta,
	vi.*
FROM pdv.vendaitem vi
INNER JOIN produto p ON p.id = vi.id_produto
WHERE vi.id_venda = 463187
AND p.descricaocompleta ILIKE '%coca%'

-- CTE (Common Table Expressions)
WITH produtos_desejados AS (
	SELECT id FROM produto WHERE descricaocompleta ILIKE '%COCA%'
),
vendas_desejadas AS (
	SELECT id_venda FROM pdv.vendaitem WHERE id_produto IN (SELECT id FROM produtos_desejados)
)
SELECT *
FROM pdv.venda v
WHERE id IN (SELECT id_venda FROM vendas_desejadas);

-- CTE (Common Table Expressions) Recursivo
SELECT
	m.descricao || ' >> ' || mi.descricao || ' >> ' || msi.descricao
FROM menu_subitem msi
INNER JOIN menu_item mi ON mi.id = msi.id_menu_item
INNER JOIN menu m ON m.id = mi.id_menu;

SELECT
	m.descricao || ' >> ' || mi.descricao || ' >> ' || msi.descricao
FROM menu_subitem msi
INNER JOIN menu_item mi ON mi.id = msi.id_menu_item
INNER JOIN menu m ON m.id = mi.id_menu
UNION
SELECT
	m.descricao || ' >> ' || mi.descricao
FROM  menu_item mi
INNER JOIN menu m ON m.id = mi.id_menu
UNION
SELECT
	m.descricao
FROM menu m;

-- Individual
SELECT * FROM menu_recursivo mr WHERE mr.id = 14;
SELECT * FROM menu_recursivo mr WHERE mr.id = 4;
SELECT * FROM menu_recursivo mr WHERE mr.id = 1;

WITH RECURSIVE menu_cte AS (
	SELECT mr.id, mr.descricao, mr.id_pai
	FROM menu_recursivo mr
	WHERE mr.id = 14
)
SELECT * FROM menu_cte mc;

SELECT * FROM menu_recursivo mr WHERE mr.id = 14
UNION
SELECT * FROM menu_recursivo mr WHERE mr.id = 4
UNION
SELECT * FROM menu_recursivo mr WHERE mr.id = 1;

WITH RECURSIVE menu_cte AS (
	SELECT mr.id, mr.descricao, mr.id_pai
	FROM menu_recursivo mr
	WHERE mr.id = 14

	UNION ALL

	SELECT mr.id, mr.descricao, mr.id_pai
	FROM menu_cte mc
	INNER JOIN menu_recursivo mr ON mr.id = mc.id_pai
)
SELECT * FROM menu_cte mc;

WITH RECURSIVE menu_cte AS (
	SELECT mr.id, mr.descricao, mr.id_pai, 1 AS nivel
	FROM menu_recursivo mr
	WHERE mr.id = 14

	UNION ALL

	SELECT mr.id, mr.descricao, mr.id_pai, mc.nivel + 1 AS nivel
	FROM menu_cte mc
	INNER JOIN menu_recursivo mr ON mr.id = mc.id_pai
)
SELECT * FROM menu_cte mc;

WITH RECURSIVE menu_cte AS (
	SELECT mr.id, mr.descricao, mr.id_pai, 1 AS nivel
	FROM menu_recursivo mr
	WHERE mr.id = 14

	UNION ALL

	SELECT mr.id, mr.descricao, mr.id_pai, mc.nivel + 1 AS nivel
	FROM menu_cte mc
	INNER JOIN menu_recursivo mr ON mr.id = mc.id_pai
)
SELECT string_agg(mc.descricao, ' >> ' ORDER BY mc.nivel DESC) FROM menu_cte mc;