-- Active: 1700049520163@@127.0.0.1@3306@pokemon
# 원단 이름이 “피카츄” 이면서 패턴이 “솔리드” 인 원단
SELECT *
FROM Fabric f
JOIN Fabric_Pattern fp ON f.fabric_id = fp.fabric_id
JOIN Pattern p ON fp.pattern_id = p.pattern_id
WHERE f.fabric_name = '피카츄' AND p.pattern_name = '솔리드';
