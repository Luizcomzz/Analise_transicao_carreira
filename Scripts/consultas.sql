
=====================================================
CAREER ANALYTICS TRACKER
CONSULTAS SQL
=====================================================


=====================================================
1. VISÃO GERAL
=====================================================

-- Total de aplicações realizadas
SELECT COUNT(*) AS total_aplicacoes
FROM aplicacoes;


-- Total de empresas cadastradas
SELECT COUNT(*) AS total_empresas
FROM empresas;


-- Total de vagas cadastradas
SELECT COUNT(*) AS total_vagas
FROM vagas;


-- Aplicações por status
SELECT
    status,
    COUNT(*) AS quantidade
FROM aplicacoes
GROUP BY status
ORDER BY quantidade DESC;


-- Aplicações por mês
SELECT
    strftime('%Y-%m', data_aplicacao) AS mes,
    COUNT(*) AS total_aplicacoes
FROM aplicacoes
GROUP BY mes
ORDER BY mes;


-- =====================================================
-- 2. PERFORMANCE DO PROCESSO
-- =====================================================

-- Reprovação por etapa
SELECT
    etapa,
    COUNT(*) AS quantidade_reprovacoes
FROM aplicacoes
WHERE status = 'Reprovado'
GROUP BY etapa
ORDER BY quantidade_reprovacoes DESC;

-- Taxa de Avanço
SELECT
    etapa,
    COUNT(*) AS total,
    (COUNT(*) * 100.0 / SUM(COUNT(*)) OVER()) AS taxa_avanço
FROM aplicacoes
GROUP BY etapa
ORDER BY
CASE
    WHEN etapa = 'Inscrição' THEN 1
    WHEN etapa = 'testes(lógico/inglês)' THEN 2
    WHEN etapa = 'fit cultural' THEN 3
    WHEN etapa = 'entrevista online' THEN 4
    WHEN etapa = 'entrevista virtual' THEN 5
    WHEN etapa = 'entrevista do gestor' THEN 6
    WHEN etapa = 'final' THEN 7
END;

-- Empresas com mais aplicações
SELECT
    empresas.nome,
    COUNT(*) AS total_aplicacoes
FROM aplicacoes
JOIN vagas
    ON aplicacoes.vagas_id = vagas.id
JOIN empresas
    ON vagas.empresas_id = empresas.id
GROUP BY empresas.nome
ORDER BY total_aplicacoes DESC;


-- Vagas com melhor desempenho
SELECT
    vagas.vaga,
    status,
    COUNT(*) AS quantidade
FROM aplicacoes
JOIN vagas
    ON aplicacoes.vagas_id = vagas.id
GROUP BY vagas.vaga, status
ORDER BY quantidade DESC;


-- =====================================================
-- 3. ESTRATÉGIAS
-- =====================================================

-- Estratégias utilizadas x resultado
SELECT
    estrategias,
    status,
    COUNT(*) AS total
FROM aplicacoes
GROUP BY estrategias, status
ORDER BY estrategias, total DESC;


-- Estratégias mais utilizadas
SELECT
    estrategias,
    COUNT(*) AS total_uso
FROM aplicacoes
GROUP BY estrategias
ORDER BY total_uso DESC;


-- =====================================================
-- 4. MERCADO E VAGAS
-- =====================================================

-- Hard skills mais pedidas
SELECT
    hardskills,
    COUNT(*) AS quantidade
FROM vagas
GROUP BY hardskills
ORDER BY quantidade DESC;


-- Empresas por setor
SELECT
    setor,
    COUNT(*) AS total_empresas
FROM empresas
GROUP BY setor
ORDER BY total_empresas DESC;


-- Vagas por empresa
SELECT
    empresas.nome,
    vagas.vaga
FROM vagas
JOIN empresas
    ON vagas.empresas_id = empresas.id
ORDER BY empresas.nome;


-- =====================================================
-- 5. VIEWS
-- =====================================================

-- View: aplicações por mês
CREATE VIEW vw_aplicacoes_mes AS
SELECT
    strftime('%Y-%m', data_aplicacao) AS mes,
    COUNT(*) AS total_aplicacoes
FROM aplicacoes
GROUP BY mes
ORDER BY mes;


-- View: estratégias x resultado
CREATE VIEW vw_estrategias_resultado AS
SELECT
    estrategias,
    status,
    COUNT(*) AS total
FROM aplicacoes
GROUP BY estrategias, status
ORDER BY estrategias, total DESC;


-- View: aplicações por empresa em ordem alfabética
CREATE VIEW vw_aplicacoes_empresa AS
SELECT
    empresas.nome AS empresa,
    COUNT(*) AS total_aplicacoes
FROM aplicacoes
JOIN vagas
    ON aplicacoes.vagas_id = vagas.id
JOIN empresas
    ON vagas.empresas_id = empresas.id
GROUP BY empresas.nome;


-- View: reprovações por etapa
CREATE VIEW vw_reprovacoes_etapa AS
SELECT
    etapa,
    COUNT(*) AS quantidade_reprovacoes
FROM aplicacoes
WHERE status = 'Reprovado'
GROUP BY etapa
ORDER BY quantidade_reprovacoes DESC;
```
