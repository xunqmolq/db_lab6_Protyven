-- Тригер, що переводить оцінку з 10-бальної шкали в 5-бальну, але якщо оцінка більше 10 дає виняток. Тригер спрацьовує перед вставкою в таблицю review
CREATE OR REPLACE FUNCTION correctGrade()
RETURNS TRIGGER AS $$
BEGIN
  
    IF NEW.stars > 5 AND NEW.stars < 10 THEN
        NEW.stars = NEW.stars / 2;
		
    ELSIF NEW.stars > 10 THEN
        RAISE EXCEPTION 'Please check rating';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER addCorrectGrade
BEFORE INSERT OR UPDATE ON review
FOR EACH ROW
EXECUTE FUNCTION correctGrade();