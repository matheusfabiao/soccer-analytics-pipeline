# Dicionário de Dados - Camada Silver

## Tabela `silver_country`
| Coluna         | Tipo   | Descrição                     |
|----------------|--------|-------------------------------|
| country_id     | long   | ID único do país             |
| country_name   | string | Nome do país                 |

## Tabela `silver_league`
| Coluna         | Tipo   | Descrição                     |
|----------------|--------|-------------------------------|
| league_id      | long   | ID único da liga             |
| league_name    | string | Nome da liga                 |
| country_name   | string | Nome do país da liga         |

## Tabela `silver_match`
| Coluna         | Tipo   | Descrição                     |
|----------------|--------|-------------------------------|
| match_id       | long   | ID único da partida          |
| season         | string | Temporada (ex: 2008/2009)    |
| total_goals    | long   | Soma de gols (casa + fora)   |
| country_name   | string | País da partida              |