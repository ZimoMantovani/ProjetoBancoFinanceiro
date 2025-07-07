# Projeto Banco Financeiro

**Disciplina:** Banco de Dados — IFSP-PRC (1º semestre de 2024)  
**Curso:** Análise e Desenvolvimento de Sistemas  
**Participantes:** Symon O. Mantovani, Natalia M. P. Prado, Felipe T. Nakano  

## 📚 Descrição

Este projeto consiste na modelagem e implementação de um banco de dados relacional em PostgreSQL para gerenciamento de investimentos e financiamentos em projetos inovadores. Ele contempla desde a definição de esquemas e tabelas até a implementação de visões, procedimentos armazenados, gatilhos e mecanismos de segurança de acesso.

---

## ⚙️ Tecnologias Utilizadas

- PostgreSQL 13+
- PL/pgSQL
- pgAdmin (opcional)
- SQL Shell (psql)

---

## 🏗️ Estrutura do Projeto

### 1. Esquema e Tabelas

- **Esquema:** `financeiro`
- **Tabelas Principais:**
  - `investidor`
  - `projeto`
  - `financiamento`
  - `log` (para rastreamento de atualizações)

### 2. Restrições e Regras

- Uso de `PRIMARY KEY`, `FOREIGN KEY`, `CHECK`, `DEFAULT`, `UNIQUE`
- Uso de gatilhos para validação de regras de negócio (limite de financiamento)

### 3. Carga de Dados

- Inserção de múltiplos registros para teste com dados fictícios

### 4. Consultas SQL

- Consultas com `JOIN`, `GROUP BY`, `ORDER BY` e funções agregadas
- Visões (`VIEW`) e visões materializadas (`MATERIALIZED VIEW`)

### 5. Procedimentos Armazenados (Stored Procedures)

- Ex: `add_financiamento()` — insere dados com verificação de limites e criação condicional de investidor

### 6. Funções Definidas pelo Usuário (UDF)

- Ex: `total_investido_por_investidor()` — retorna total investido por CPF

### 7. Gatilhos (Triggers)

- Nível de tupla (ex: validar limite de R$200.000,00 por projeto)
- Nível de sentença (ex: registrar operações de `UPDATE`)

### 8. Segurança e Acessos

- Criação de papéis:
  - `adm_financeiro`
  - `analista_financeiro`
  - `cliente_financeiro`
- Atribuição e revogação de privilégios via `GRANT` e `REVOKE`
- Simulação de `pg_hba.conf` para acesso local com autenticação segura

---

## 🔐 Considerações de Segurança

- Controle de acesso baseado em papéis
- Procedimentos protegidos por permissões específicas
- Indexação e tuning para desempenho de consultas

---

## 📊 Desempenho

Análises de custo com `EXPLAIN ANALYZE`  
Criação de índices para otimizar performance de joins e buscas textuais com trigramas (`pg_trgm`)

---

## 🚀 Execução

1. Execute o script `ProjetoBancoFinanceiro.sql` no PostgreSQL.
2. Os objetos do banco serão criados automaticamente.
3. Utilize os exemplos de consultas no final do script para testes e análises.

---

## 📌 Observações

- Projeto elaborado conforme diretrizes da disciplina BADC5.
- Desenvolvido em grupo como parte das avaliações semestrais.
- Todos os dados utilizados são fictícios e usados exclusivamente para fins didáticos.

---

## 🧾 Licença

Este projeto é de uso acadêmico e não possui fins comerciais.

