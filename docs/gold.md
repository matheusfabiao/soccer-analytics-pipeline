# Dicionário de Dados - Camada Gold

## Tabela `gold_goals_by_league`
| Coluna               | Tipo    | Descrição                              |
|----------------------|---------|----------------------------------------|
| country_name         | string  | Nome do país                          |
| league_name          | string  | Nome da liga                          |
| season               | string  | Temporada (ex: "2008/2009")           |
| total_goals          | long    | Soma de gols na temporada             |
| total_matches        | long    | Número de partidas                    |
| avg_goals_per_match  | double  | Média de gols por partida             |

## Tabela `gold_goals_by_country`
| Coluna               | Tipo    | Descrição                              |
|----------------------|---------|----------------------------------------|
| country_name         | string  | Nome do país                          |
| season               | string  | Temporada                              |
| total_goals          | long    | Soma de gols (todas as ligas)         |
| avg_goals_per_match  | double  | Média de gols por partida no país     |

## Tabela `gold_top_leagues`
| Coluna               | Tipo    | Descrição                              |
|----------------------|---------|----------------------------------------|
| country_name         | string  | Nome do país                          |
| league_name          | string  | Nome da liga                          |
| season               | string  | Temporada                              |
| avg_goals_per_match  | double  | Média de gols por partida             |
| rank                 | int     | Posição no ranking (1 a 5)            |