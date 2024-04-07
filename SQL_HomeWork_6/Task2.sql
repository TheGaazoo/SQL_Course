/*
Выведите только четные числа от 1 до 10. Пример: 2,4,6,8,10
*/
DROP DATABASE IF EXISTS chislo;
CREATE DATABASE chislo;
USE chislo;

DELIMITER //
CREATE PROCEDURE get_even(`start` INT, `end` INT) -- Задаем диапазон чисел (от start до end)
BEGIN
	DECLARE i INT DEFAULT `start`;
    DECLARE res_str TEXT DEFAULT NULL;
    WHILE  i<=`end` DO -- начинаем проверять числа на четность
        IF i%2 = 0 THEN -- проверяем текущее число
			IF res_str IS NULL THEN
				SET res_str = concat(i);
			ELSE
				SET res_str = concat(res_str, ', ', i); -- добавляем четное число в выборку
			END IF;
		END IF;
        SET i = i + 1;
    END WHILE;
	SELECT res_str;
END //
DELIMITER ;

CALL get_even(1, 10); -- диапазон чисел для проверки
