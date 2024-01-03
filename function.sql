-- Функція повертає різновид рамену з максимальною оцінкою за заданим брендом
CREATE OR REPLACE FUNCTION GetMaxGradedRamen(IN brandname VARCHAR)
RETURNS TABLE (variety VARCHAR, stars FLOAT)
LANGUAGE plpgsql
AS $$
BEGIN 
	RETURN QUERY
    SELECT ramen.variety AS Variety, review.stars AS Grade    
	FROM ramen
    INNER JOIN review
	ON ramen.review_id = review.review_id
	WHERE ramen.brand_name = brandname
    ORDER BY review.stars DESC
    LIMIT 1;
END;
$$;