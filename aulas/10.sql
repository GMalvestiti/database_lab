CREATE TABLE vendas_2023 AS
SELECT * FROM public.venda WHERE data BETWEEN '2023-01-01' AND '2023-12-31';

CREATE TABLE vendas_2023 AS
SELECT * FROM public.venda WITH NO DATA;

CREATE SEQUENCE sequencia START 1 INCREMENT 1;

CREATE TEMP TABLE usuario_check (
    id INTEGER DEFAULT nextval('sequencia') UNIQUE NOT NULL,
    nome VARCHAR(255)
);

SELECT * FROM pg_available_extensions;