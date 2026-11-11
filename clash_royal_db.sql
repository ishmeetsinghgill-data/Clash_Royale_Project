CREATE DATABASE clash_royale_db;

USE clash_royale_db;


-- KPI SECTION

SELECT COUNT(*) AS Total_Cards
FROM clash_royale;

SELECT ROUND(AVG(hitpoints),0) AS Avg_Hitpoints
FROM clash_royale;

SELECT ROUND(AVG(elixircost),2) AS Avg_Elixir_Cost
FROM clash_royale;

SELECT ROUND(AVG(card_usage),2) AS Avg_Usage
FROM clash_royale;

SELECT COUNT(*) AS Evolution_Cards
FROM clash_royale
WHERE maxevolutionlevel = 1;


-- CARDS BY RARITY

SELECT
    rarity,
    COUNT(*) AS Total_Cards
FROM clash_royale
GROUP BY rarity
ORDER BY Total_Cards DESC;


-- CARDS BY TYPE

SELECT
    type,
    COUNT(*) AS Total_Cards
FROM clash_royale
GROUP BY type
ORDER BY Total_Cards DESC;


-- TOP 15 CARDS BY USAGE

SELECT
    name,
    card_usage
FROM clash_royale
ORDER BY card_usage DESC
LIMIT 15;


-- AVERAGE HITPOINTS BY RARITY

SELECT
    rarity,
    ROUND(AVG(hitpoints),0) AS Avg_HP
FROM clash_royale
GROUP BY rarity
ORDER BY Avg_HP DESC;


-- ELIXIR COST VS HITPOINTS

SELECT
    name,
    rarity,
    elixircost,
    hitpoints,
    card_usage
FROM clash_royale
WHERE hitpoints > 0;


-- USAGE VS HITPOINTS

SELECT
    name,
    rarity,
    card_usage,
    hitpoints,
    elixircost
FROM clash_royale
WHERE hitpoints > 0;


-- EVOLUTION VS NON-EVOLUTION

SELECT
    CASE
        WHEN maxevolutionlevel = 1 THEN 'Evolution'
        ELSE 'Non-Evolution'
    END AS Evolution_Status,
    COUNT(*) AS Total_Cards
FROM clash_royale
GROUP BY Evolution_Status;


-- AVERAGE USAGE COMPARISON

SELECT
    CASE
        WHEN maxevolutionlevel = 1 THEN 'Evolution'
        ELSE 'Non-Evolution'
    END AS Evolution_Status,
    ROUND(AVG(card_usage),2) AS Avg_Usage
FROM clash_royale
GROUP BY Evolution_Status;


-- TOP 10 TANK CARDS

SELECT
    name,
    hitpoints
FROM clash_royale
ORDER BY hitpoints DESC
LIMIT 10;


-- MOST EFFICIENT CARDS

SELECT
    name,
    card_usage,
    elixircost,
    ROUND(card_usage/elixircost,2) AS Efficiency
FROM clash_royale
WHERE elixircost > 0
ORDER BY Efficiency DESC;


-- USAGE BY MOBILITY

SELECT
    mobility,
    ROUND(AVG(card_usage),2) AS Avg_Usage
FROM clash_royale
GROUP BY mobility;


-- USAGE BY TARGETS


SELECT
    targets,
    ROUND(AVG(card_usage),2) AS Avg_Usage
FROM clash_royale
GROUP BY targets;


-- USAGE BY ATTACK TYPE

SELECT
    attack_type,
    ROUND(AVG(card_usage),2) AS Avg_Usage
FROM clash_royale
GROUP BY attack_type;


-- CARD DETAIL TABLE

SELECT
    name,
    rarity,
    type,
    elixircost,
    card_usage,
    hitpoints,
    mobility,
    targets,
    attack_type,
    groupcard,
    maxevolutionlevel
FROM clash_royale;


