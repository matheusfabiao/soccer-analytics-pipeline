## 🛠️ Como Executar

### 📋 Pré-requisitos
- 🐳 Docker e Docker Compose
- 🐍 Python 3.8+
- 📦 Acesso ao bucket `s3://dev-lab-02-us-east-2-landing/soccer/` (ou dados locais)

---

### 🚀 Passo a Passo

#### 1. 📥 Clone o repositório
```bash
git clone https://github.com/matheusfabiao/soccer-analytics-pipeline.git
```

#### 2. ⚙️ Instale as dependências com UV
```bash
uv sync
```

#### 3. 🐋 Suba os containers
```bash
task up
```

#### 4. 🔐 Acesse o MinIO
- **🌐 URL**: `http://localhost:9000`
- **🔑 Credenciais**: Definidas no arquivo `.env`

#### 5. 🗂️ Crie os buckets necessários
- `bucket-bronze-zone` (Camada bronze)
- `bucket-silver-zone` (Camada silver)
- `bucket-gold-zone` (Camada gold)

#### 6. 💻 Acesse o JupyterLab
- **🌐 URL**: `http://localhost:8888`
- **🔢 Token**: Definido no arquivo `.env`

#### 7. 📊 Execute os notebooks em ordem
1. `01_bronze.ipynb` (Ingestão)
2. `02_silver.ipynb` (Transformação)
3. `03_gold.ipynb` (Análise)

#### 8. 🔍 (Opcional) Consulte os dados no Athena
- Utilize as queries do diretório `athena/gold.sql`

---

> ℹ️ Caso deseje utilizar o AWS Athena, consulte a documentação de utilização:

> [📚 Acessar a Documentação](../usage/examples.md){ .md-button }

---

## 📂 Estrutura do Projeto

Essa deve ser a estrutura do projeto após as etapas de instalação e execução:

```
soccer-analytics-pipeline/
├── notebooks/              # 🧪 Pipeline em Jupyter
│   ├── 01_bronze.ipynb     # 🥉 Camada Bronze (ingestão)
│   ├── 02_silver.ipynb     # 🥈 Camada Silver (transformação)
│   └── 03_gold.ipynb       # 🥇 Camada Gold (análise)
├── docs/                   # 📖 Documentação
│   └── getting-started/    # 🏁 Instalação e execução
├── athena/                 # 🔍 Consultas SQL
│   └── gold.sql            # 📜 Exemplos para Athena
├── docker-compose.yml      # 🐳 Configuração de containers
├── env_files/              # ⚙️ Variáveis de ambiente
└── README.md               # 📄 Documentação principal
```