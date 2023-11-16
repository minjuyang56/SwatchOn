# 카테고리가 “전기” 혹은 패턴이 “체크”인 원단
SELECT *
FROM Fabric f
JOIN Category c ON f.category_id = c.category_id
LEFT JOIN Fabric_Pattern fp ON f.fabric_id = fp.fabric_id
LEFT JOIN Pattern p ON fp.pattern_id = p.pattern_id
WHERE c.category_name = '전기' OR p.pattern_name = '체크';
