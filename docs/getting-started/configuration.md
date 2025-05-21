# Configuração

## Variáveis de Ambiente

Configure no arquivo `.env`:

```ini
# Configurações MinIO
MINIO_ROOT_USER=admin
MINIO_ROOT_PASSWORD=senhasegura
MINIO_ENDPOINT=http://minio:9000

# Configurações AWS S3 (leitura)
AWS_ACCESS_KEY_ID=sua-chave-de-acesso
AWS_SECRET_ACCESS_KEY=sua-chave-secreta
AWS_REGION=sua-regiao
AWS_ENDPOINT=endereco-do-servico-s3

# Configurações Jupyter
JUPYTER_TOKEN=senhasegura
```
## Configuração do MinIO

Acesse o MinIO através do endereço `http://localhost:9000` e faça login com as credenciais definidas no arquivo `.env`.
O sistema espera esta estrutura no MinIO/S3:
```
bucket-bronze-zone/soccer
bucket-silver-zone/soccer
bucket-gold-zone/soccer
```
As demais partições serão criadas automaticamente através da execução dos notebooks.