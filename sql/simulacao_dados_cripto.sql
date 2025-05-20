
-- Script de criação de tabela simulando estrutura para armazenar dados de criptomoedas

CREATE TABLE cripto_ativos (
    id SERIAL PRIMARY KEY,
    moeda VARCHAR(20) NOT NULL,
    preco_usd DECIMAL(18, 2),
    variacao_24h DECIMAL(6, 2),
    data_coleta TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Inserção de dados de exemplo

INSERT INTO cripto_ativos (moeda, preco_usd, variacao_24h)
VALUES 
('bitcoin', 77759.00, 0.25),
('ethereum', 1497.00, 0.05),
('solana', 107.00, 2.35);

-- Consulta para obter o valor total atual da carteira (exemplo)

SELECT 
    moeda,
    preco_usd,
    variacao_24h,
    preco_usd * CASE 
        WHEN moeda = 'bitcoin' THEN 0.084157
        WHEN moeda = 'ethereum' THEN 4.370942
        WHEN moeda = 'solana' THEN 61.078962
    END AS valor_total_usd
FROM cripto_ativos;