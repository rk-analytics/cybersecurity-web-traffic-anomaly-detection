-- Verify total number of rows in the dataset to ensure CSV data was imported correctly

SELECT COUNT(*) AS total_rows
FROM cybersecurity_web_attack_behavioral_data;

-- Preview sample data to visually inspect the structure and values

SELECT TOP 10 *
FROM cybersecurity_web_attack_behavioral_data;

-- Country-wise attack frequency 

SELECT
    src_ip_country_code,
    COUNT(*) AS attack_count
FROM cybersecurity_web_attack_behavioral_data
GROUP BY src_ip_country_code
ORDER BY attack_count DESC;

-- Repeated vs Single-time source IP

SELECT
    CASE 
        WHEN is_repeated_src_ip_flag = 1 THEN 'Yes'
        ELSE 'No'
    END AS repeated_source,
    COUNT(*) AS attack_count
FROM cybersecurity_web_attack_behavioral_data
GROUP BY is_repeated_src_ip_flag;

-- Attack distribution by hour of day

SELECT
    attack_hour,
    COUNT(*) AS attack_count
FROM cybersecurity_web_attack_behavioral_data
GROUP BY attack_hour
ORDER BY attack_hour;

-- Top attacking source IPs by frequency and traffic

SELECT TOP 10
    src_ip,
    COUNT(*) AS attack_count,
    SUM(total_bytes) AS total_traffic
FROM cybersecurity_web_attack_behavioral_data
GROUP BY src_ip
ORDER BY attack_count DESC;

-- Unique repeated attackers by country

SELECT
    src_ip_country_code,
    COUNT(DISTINCT src_ip) AS unique_attackers
FROM cybersecurity_web_attack_behavioral_data
WHERE is_repeated_src_ip_flag = 1
GROUP BY src_ip_country_code
ORDER BY unique_attackers DESC;

-- High traffic attack events

SELECT TOP 10
    src_ip,
    total_bytes,
    attack_hour,
    src_ip_country_code
FROM cybersecurity_web_attack_behavioral_data
ORDER BY total_bytes DESC;

-- Traffic impact comparison: Repeated IP vs Single-time IP

SELECT
    CASE 
        WHEN is_repeated_src_ip_flag = 1 THEN 'Repeated IP'
        ELSE 'Single-time IP'
    END AS ip_type,
    COUNT(*) AS attack_count,
    AVG(total_bytes) AS avg_bytes_per_attack
FROM cybersecurity_web_attack_behavioral_data
GROUP BY is_repeated_src_ip_flag;

-- Average traffic per attack by country

SELECT
    src_ip_country_code,
    COUNT(*) AS attack_count,
    AVG(total_bytes) AS avg_bytes_per_attack
FROM cybersecurity_web_attack_behavioral_data
GROUP BY src_ip_country_code
ORDER BY avg_bytes_per_attack DESC;
