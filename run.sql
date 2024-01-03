-- Перевірка функції за брендом
select * from GetMaxGradedRamen('Tasty Bite');

-- Перевірка процедури, що додає новий бренд
call addBrand('Reeva');

-- Перевірка тригеру, що змінює оцінку, якщшо вона знаходиться в інтервалі 5-10.
INSERT INTO review(stars, review_id)
VALUES (7, 1002);
SELECT * FROM review;