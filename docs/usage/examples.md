# 🛠️ Exemplos de Uso

## 🔍 Consultas no AWS Athena

### 1. Acesse o Console AWS
- Navegue até o serviço **Athena**
- Certifique-se de que a região está correta (ex: `us-east-1`)

### 2. Configurar o Catálogo de Dados
- No Athena, vá em **Data Source** > **Create data source**
- Escolha **Delta Lake** (ou **S3** se os dados estiverem em formato Delta no S3)
- Especifique o caminho do bucket Gold (`s3a://bucket-gold-zone/soccer/`)

### 3. Criar Tabelas no Glue Data Catalog (Opcional)
- Se preferir, use o **AWS Glue Crawler** para criar tabelas automaticamente a partir dos arquivos Delta

---

### 📊 Passo 2: Executar Consultas

#### No Editor de Consultas do Athena
- Cole as consultas do arquivo `gold.sql`
- Exemplo para criar uma tabela manualmente:

```sql
CREATE EXTERNAL TABLE IF NOT EXISTS gold_goals_by_league (
  country_name STRING,
  league_name STRING,
  season STRING,
  total_goals BIGINT,
  total_matches BIGINT,
  avg_goals_per_match DOUBLE
)
STORED AS DELTA
LOCATION 's3://bucket-gold-zone/soccer/goals_by_league/';
```

#### Salvar Resultados
- Os resultados podem ser exportados para CSV ou conectados a ferramentas de BI (ex: QuickSight)

---

### ⚡ Passo 3: Otimização para Performance
- **Particionamento**: Se as tabelas Gold estiverem particionadas (ex: por `season`), adicione:

```sql
PARTITIONED BY (season STRING)
```

- **Compressão**: Use `PARQUET` ou `DELTA` para reduzir custos de armazenamento e consulta

---

### 📈 Passo 4: Monitoramento
- **Custos**: Verifique o **AWS Cost Explorer** para monitorar gastos com consultas
- **Performance**: Use o **Athena Query History** para identificar consultas lentas

---

> ℹ️ Para mais informações, consulte a documentação oficial do AWS Athena:

> [📚 Acessar a Documentação](https://docs.aws.amazon.com/pt_br/athena/latest/ug/what-is.html){:target="_blank", .md-button}

---

## 📊 AWS QuickSight

### Dashboards no QuickSight

#### 1. Conecte o Athena ao QuickSight
- No QuickSight, vá em **Datasets** > **New Dataset** > **Athena**
- Selecione a tabela `gold_goals_by_league`

#### 2. Visualizações Sugeridas
- **Heatmap**: Média de gols por liga e temporada
- **Ranking**: Top 5 ligas com mais gols (usando `gold_top_leagues`)
- **Série Temporal**: Evolução da média de gols por país