-- Процедура додає в таблицю brand назву нового бренду
CREATE OR REPLACE PROCEDURE addBrand(brandName VARCHAR)
AS $$
DECLARE
	brandExists BOOLEAN;
BEGIN
	SELECT EXISTS(SELECT 1 FROM brand WHERE brand_name = brandName) INTO brandExists;
	IF brandExists THEN
        RAISE EXCEPTION 'Brand already exists in the table';
	ELSE
    	INSERT INTO brand(brand_name)
    	VALUES (brandName);
	END IF;
END;
$$ LANGUAGE plpgsql;


