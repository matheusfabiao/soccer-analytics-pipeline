# **⚽ Soccer Analytics Pipeline**  

**Pipeline de dados para análise comparativa de ligas e países de futebol europeu**  
*Processamento de dados com Spark, Delta Lake e AWS Athena em arquitetura Medallion (Bronze/Silver/Gold)*  

---

## **📌 Visão Geral**  
Este projeto é uma pipeline de dados escalável que extrai, transforma e analisa estatísticas de futebol europeu (partidas, times e ligas), gerando métricas como:  
- **Média de gols por liga/temporada**  
- **Rankings de países com mais gols**  
- **Evolução tática por temporada**  

Dados brutos são ingeridos de um bucket S3, processados em camadas (Bronze → Silver → Gold) e disponibilizados para consulta no **AWS Athena** ou ferramentas de BI.  

**Tecnologias**: `PySpark` | `Delta Lake` | `MinIO/S3` | `AWS Athena` | `Docker`  

---

## **🎯 Casos de Uso**  
- **Clubes e Scouts**: Identificar ligas com maior ofensividade para contratações.  
- **Plataformas de Apostas**: Cruzar odds históricas com desempenho real dos times.  
- **Jornalismo Esportivo**: Gerar conteúdos baseados em dados (ex: "La Liga tem 20% mais gols que a Premier League").  

---

## **🛠️ Como Executar**  

### **Pré-requisitos**  
- Docker e Docker Compose  
- Python 3.8+  
- Acesso ao bucket `s3://dev-lab-02-us-east-2-landing/soccer/` (ou dados locais)  

### **Passo a Passo**  
1. **Clone o repositório**:
   ```bash
   git clone https://github.com/matheusfabiao/soccer-analytics-pipeline.git
   ```

2. **Instale as dependências com UV**:
   ```bash
   uv sync
   ```

3. **Suba os containers**:  
   ```bash
   task up
   ```

4. **Acesse o MinIO**:
   - URL: `http://localhost:9000`
   - Login e senha: Definidos no arquivo `.env`


5. **Crie os seguintes buckets**:
   - `bucket-bronze-zone` (Camada bronze)
   - `bucket-silver-zone` (Camada silver)
   - `bucket-gold-zone` (Camada gold)


6. **Acesse o JupyterLab**:  
   - URL: `http://localhost:8888`  
   - Token: Definido no arquivo `.env`


7. **Execute os notebooks em ordem**:  
   - `01_bronze.ipynb` (Ingestão)
   - `02_silver.ipynb` (Transformação)
   - `03_gold.ipynb` (Análise)


8. **(Opcional) Consulte os dados no Athena**:  
   - Use as queries do diretório `athena/gold.sql`.

---

## **📂 Estrutura do Projeto**  
```
soccer-analytics-pipeline/
├── notebooks/               # Pipeline em Jupyter
│   ├── 01_bronze.ipynb     # Camada Bronze (ingestão)
│   ├── 02_silver.ipynb     # Camada Silver (transformação)
│   └── 03_gold.ipynb       # Camada Gold (análise)
├── docs/                   # Documentação do projeto
│   └── getting-started/    # Instalação e execução
├── athena/                 # Consultas SQL prontas
│   └── gold.sql            # Exemplos para Athena
├── docker-compose.yml      # Containers Jupyter + MinIO
├── env_files/              # Variáveis de ambiente
└── README.md               # Este arquivo
```

---

## **📊 Resultados Esperados**  
### **Tabelas Gold (Exemplo)**  
| league_name   | country_name | season    | avg_goals_per_match |  
|---------------|--------------|-----------|---------------------|  
| Premier League| England      | 2015/2016 | 2.78                |  
| La Liga       | Spain        | 2015/2016 | 3.12                |

---

## Documentação Adicional

Acesse a documentação completa do projeto através do comando:
```bash
mkdocs serve
```

Caso já tiver instalado as ferramentas necessárias, basta rodar o comando:
```bash
task docs
```

Em ambos os casos, acesse a documentação em: `http://127.0.0.1:8000`

---

*Desenvolvido por Matheus Fabião 🔥*