-- Exemplos de consultas SQL que podem ser feitas no AWS Athena

-- 1. Top 5 ligas com mais gols em todas as temporadas
SELECT
    league_name,
    country_name,
    season,
    avg_goals_per_match
FROM gold_top_leagues
ORDER BY season, rank;

-- 2. Comparativo entre países (média de gols por partida)
SELECT
    country_name,
    ROUND(AVG(avg_goals_per_match), 2) AS overall_avg_goals
FROM gold_goals_by_country
GROUP BY
    country_name
ORDER BY overall_avg_goals DESC;

-- 3. Evolução da média de gols por temporada em uma liga específica (ex: Premier League)
SELECT season, avg_goals_per_match
FROM gold_goals_by_league
WHERE
    league_name = 'Premier League'
ORDER BY season;

-- 4. Países com maior variação na média de gols entre temporadas
WITH
    country_stats AS (
        SELECT
            country_name,
            STDDEV(avg_goals_per_match) AS goals_stddev,
            AVG(avg_goals_per_match) AS goals_avg
        FROM gold_goals_by_country
        GROUP BY
            country_name
    )
SELECT
    country_name,
    goals_avg,
    goals_stddev,
    ROUND(
        goals_stddev / goals_avg * 100,
        2
    ) AS variability_percentage
FROM country_stats
ORDER BY variability_percentage DESC;