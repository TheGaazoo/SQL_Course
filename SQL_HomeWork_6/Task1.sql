/*
Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов.
Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '
*/
DROP DATABASE IF EXISTS time;
CREATE DATABASE time;
USE time;
DELIMITER $$

CREATE FUNCTION format_seconds (seconds INT)
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
    DECLARE days INT; -- Дни
    DECLARE hours INT; -- Часы
    DECLARE minutes INT; -- Минуты
    DECLARE remaining_seconds INT; -- Секунды
    SET days = seconds DIV (60 * 60 * 24); -- Получаем кол-во дней
    SET remaining_seconds = seconds MOD (60 * 60 * 24);
    SET hours = remaining_seconds DIV (60 * 60); -- Получаем кол-во часов
    SET remaining_seconds = remaining_seconds MOD (60 * 60);
    SET minutes = remaining_seconds DIV 60; -- Получаем кол-во минут
    SET remaining_seconds = remaining_seconds MOD 60;
    RETURN CONCAT(days, ' days ', hours, ' hours ', minutes, ' minutes ', remaining_seconds, ' seconds'); -- Формируем выходные данные
END$$

DELIMITER ;

-- проверка
SELECT format_seconds(1111) AS formatted_time;