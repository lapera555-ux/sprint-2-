# Sompo Risk Intelligence Platform — Sprint 2

## Identificação

**Aluno:** Pedro Vinicius Gomes dos Santos  
**RM:** 571446  
**Turma:** 1TIAOB-2026  
**Challenge:** Sompo Seguros  
**Sprint:** 2  

---

## 1. Objetivo do Projeto

Esta Sprint 2 transforma a proposta criada na Sprint 1 em uma prova de conceito funcional, integrando coleta de dados simulados, banco SQL, modelos preditivos em Python, validação estatística, dashboard e alertas preventivos.

O objetivo é apoiar a Sompo na identificação antecipada de fatores que aumentam a probabilidade de sinistros em equipamentos agrícolas, como atolamento, falhas mecânicas, operação em solo instável e risco em áreas próximas a corpos d'água.

---

## 2. Fluxo da Solução

```text
Sensores e Telemetria
        ↓
Dataset Simulado
        ↓
Ingestão Python
        ↓
Banco SQL
        ↓
Modelos de Machine Learning
        ↓
Score de Risco
        ↓
Dashboard
        ↓
Alertas Preventivos
```

---

## 3. Evolução da Sprint 1 para a Sprint 2

| Sprint 1 | Sprint 2 |
|---|---|
| Entendimento do problema | Prova de conceito funcional |
| User Stories | User Stories implementadas no dashboard |
| Arquitetura inicial | Arquitetura integrada com dados, SQL, modelo e interface |
| Dataset simples | Dataset com 400 eventos e 42 variáveis |
| IA proposta | 5 modelos preditivos comparados |
| Score conceitual | Score de risco de 0 a 100 |
| Dashboard planejado | Dashboard funcional com visão por persona |
| Sem auditoria prática | Histórico auditável no banco SQL |

---

## 4. User Story Principal

**Como Gestor de Frota**, quero identificar fatores que elevam a probabilidade de sinistros para agir preventivamente antes da operação.

### Saídas do sistema

- Score de risco;
- Classe de risco;
- Alerta preventivo;
- Recomendação operacional;
- Impacto financeiro estimado;
- Histórico auditável para a seguradora.

---

## 5. Dataset

Arquivo principal:

```text
data/dataset_risco_operacional_max.csv
```

O dataset possui **400 registros simulados** e **42 variáveis**, representando sensores, telemetria, localização, histórico do equipamento e resultados de risco.

### Principais grupos de variáveis

| Grupo | Exemplos |
|---|---|
| Localização | latitude, longitude, altitude, região, zona de risco |
| Solo e ambiente | umidade do solo, declividade, distância da água, chuva 24h, chuva 7d, visibilidade |
| Telemetria | RPM do motor, temperatura do motor, pressão do pneu, vibração, velocidade média |
| Histórico | horas de operação, falhas históricas, dias desde manutenção, manutenção atrasada |
| Saídas | score de risco, classe de risco, alerta, recomendação, impacto financeiro |

---

## 6. Banco SQL

A persistência dos dados é feita em banco SQL local SQLite.

Arquivos:

```text
sql/create_tables.sql
sql/consultas.sql
sompo_risk_max.db
```

Tabelas principais:

- `leituras_telemetria`
- `predicoes_risco`

A tabela `leituras_telemetria` armazena os dados simulados de sensores e operação.  
A tabela `predicoes_risco` armazena os resultados gerados pelo modelo, como score, classe, alerta, recomendação, impacto financeiro e sinistro simulado.

### Evidência — Criação das tabelas SQL

![Criação das tabelas SQL](prints/01_create_tables_sql.png)

### Evidência — Consultas SQL executivas

![Consultas SQL](prints/02_consultas_sql.png)

---

## 7. Scripts Python

Arquivos principais:

```text
python/ingestao_sql.py
python/treinar_modelo.py
python/score_risco.py
python/verificar_banco_sql.py
dashboard/app.py
```

Funções:

- `ingestao_sql.py`: recria e popula o banco SQL;
- `treinar_modelo.py`: treina e compara os modelos;
- `score_risco.py`: simula uma nova previsão individual;
- `verificar_banco_sql.py`: valida tabelas e registros do banco;
- `dashboard/app.py`: executa a interface Streamlit.

### Evidência — Execução dos scripts

![Execução dos scripts Python](prints/03_execucao_scripts_python.png)

---

## 8. Modelagem Preditiva

Foram avaliados cinco modelos supervisionados:

| Modelo | Objetivo |
|---|---|
| Logistic Regression | Modelo de referência para classificação |
| Decision Tree | Modelo interpretável baseado em regras |
| Random Forest | Conjunto de árvores para maior robustez |
| KNN | Classificação por similaridade entre registros |
| Gradient Boosting | Modelo que melhora aprendendo com erros anteriores |

O melhor modelo foi selecionado com base em métricas de classificação.

### Métricas do melhor modelo

| Métrica | Valor |
|---|---|
| Modelo | LogisticRegression |
| Accuracy | 0.7000 |
| Precision | 0.6829 |
| Recall | 0.7000 |
| F1-Score | 0.6894 |
| Validação Cruzada F1 | 0.7065 |

### Evidência — Comparação dos modelos

![Comparação dos modelos](prints/08_comparacao_modelos.png)

### Evidência — Matriz de confusão

![Matriz de confusão](prints/05_matriz_confusao.png)

### Evidência — Correlação das variáveis

![Matriz de correlação](prints/06_matriz_correlacao.png)

### Evidência — Importância das variáveis

![Importância das variáveis](prints/07_importancia_variaveis.png)

---

## 9. Score de Risco

O sistema classifica o risco operacional em quatro níveis:

| Score | Classe | Interpretação |
|---|---|---|
| 0 a 25 | BAIXO | Operação liberada com monitoramento padrão |
| 26 a 50 | MÉDIO | Operação permitida com atenção |
| 51 a 75 | ALTO | Operação com restrição e acompanhamento |
| 76 a 100 | CRÍTICO | Suspender, reavaliar ou alterar operação |

O score considera fatores como:

- proximidade de corpos d'água;
- umidade do solo;
- chuva acumulada;
- declividade;
- nível de lama;
- vibração do motor;
- pressão dos pneus;
- manutenção atrasada;
- falhas históricas.

---

## 10. Dashboard

O dashboard foi desenvolvido em Streamlit e possui visões por persona:

### Resumo Executivo
Mostra indicadores gerais, economia potencial, ranking de regiões e mapa.

### Operador
Mostra score, classe de risco, fatores críticos e recomendação imediata.

### Gestor de Frota
Mostra ranking de eventos críticos, mapa das operações, score médio por região e impacto financeiro.

### Analista Sompo
Mostra validação estatística, comparação de modelos, matriz de confusão, correlação e histórico auditável.

### Banco SQL
Mostra as tabelas, registros e consultas diretamente no dashboard.

### Evidência — Dashboard em execução

![Dashboard](prints/04_dashboard_execucao.png)

### Evidência — Top eventos críticos

![Top eventos críticos](prints/09_dashboard_top_eventos.png)

### Evidência — Score médio por região

![Score médio por região](prints/10_score_medio_regiao.png)

### Evidência — Impacto financeiro

![Impacto financeiro](prints/11_impacto_financeiro.png)

### Evidência — Sinistros por região

![Sinistros por região](prints/12_sinistros_regiao.png)

---

## 11. Resultados Executivos

| Indicador | Resultado |
|---|---|
| Eventos monitorados | 400 |
| Variáveis no dataset | 42 |
| Alertas críticos | 219 |
| Impacto financeiro estimado | R$ 9,522,431 |
| Prejuízo evitável estimado | R$ 4,785,138 |
| Modelos avaliados | 5 |
| Banco SQL | Sim |
| Dashboard funcional | Sim |
| Mapa geográfico | Sim |
| Histórico auditável | Sim |

---

## 12. Segurança e Governança

A solução considera:

- separação entre dados de telemetria e predições;
- histórico auditável no banco SQL;
- rastreabilidade de cada evento;
- validação das entradas do modelo;
- perfis de visualização por persona;
- possibilidade futura de autenticação, controle de acesso e hospedagem em nuvem.

---

## 13. Arquitetura Consolidada

O desenho técnico da solução está documentado em:

```text
docs/arquitetura.md
```

Resumo:

```text
Sensores / APIs
      ↓
Ingestão Python
      ↓
Banco SQL
      ↓
Modelo Preditivo
      ↓
Score + Classe + Recomendação
      ↓
Dashboard Operador / Gestor / Analista Sompo
```

---

## 14. Como Executar

### Execução recomendada no Windows

Use os arquivos `.bat` nesta ordem:

```text
01_instalar_dependencias.bat
02_testar_scripts_python.bat
03_abrir_dashboard_rapido.bat
04_verificar_banco_sql.bat
```

### Execução manual

```bash
pip install -r requirements.txt
python python/ingestao_sql.py
python python/treinar_modelo.py
python python/score_risco.py
streamlit run dashboard/app.py
```

---

## 15. Organização do Repositório

```text
data/
dashboard/
docs/
models/
prints/
python/
reports/
sql/

README.md
requirements.txt
01_instalar_dependencias.bat
02_testar_scripts_python.bat
03_abrir_dashboard_rapido.bat
04_verificar_banco_sql.bat
sompo_risk_max.db
```

---

## 16. Vídeo Demonstrativo

O vídeo da apresentação foi publicado como não listado:

https://youtube.com/shorts/mzgnyyAf6jI?si=vXIoK7WXfBYdm4Wx

---

## 17. Conclusão

A Sprint 2 apresenta uma solução integrada para prevenção de sinistros em equipamentos agrícolas segurados. O projeto conecta dados simulados de sensores e telemetria, banco SQL, modelos de Machine Learning, validação estatística e dashboard por persona.

Com isso, a Sompo pode migrar de uma atuação reativa para uma atuação preventiva, identificando riscos antes da ocorrência de danos, reduzindo prejuízos e apoiando decisões operacionais com base em dados.
