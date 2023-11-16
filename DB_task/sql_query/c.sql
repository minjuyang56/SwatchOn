# 혼용률이 2가지 이상인 원단
SELECT f.fabric_name, COUNT(*) AS num_contents
FROM Fabric f
JOIN Fabric_Content fc ON f.fabric_id = fc.fabric_id
GROUP BY f.fabric_name
HAVING COUNT(*) >= 2;
