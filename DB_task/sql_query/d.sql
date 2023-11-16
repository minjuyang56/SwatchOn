# 패턴이 존재 하지 않는 원단
SELECT f.*
FROM Fabric f
LEFT JOIN Fabric_Pattern fp ON f.fabric_id = fp.fabric_id
WHERE fp.fabric_pattern_id IS NULL;
