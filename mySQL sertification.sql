DROP DATABASE IF EXISTS certification;
CREATE DATABASE IF NOT EXISTS certification;
USE certification;

/*
ЗАДАЧА 1 
Создайте процедуру, которая принимает кол-во сек и формат их в кол-во дней часов. 
Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds ' 
*/

DROP PROCEDURE IF EXISTS convTime;

DELIMITER //
CREATE PROCEDURE convTime(sec INT)
BEGIN
	DECLARE days INT;
    DECLARE hours INT;
    DECLARE minutes INT;
    DECLARE seconds INT;
    
    SET days = sec / 60 / 60 / 24;
    SET hours = sec / 60 / 60 % 24;
    SET minutes = sec / 60 % 60;
    SET seconds = sec % 60;
    
    SELECT CONCAT(days, ' Day ', hours, ' Hours ', minutes, ' Minutes ', seconds, ' Seconds ') AS Result;
END //
DELIMITER ;

CALL convTime(123456); -- 1 Day 10 Hours 18 Minutes 36 Seconds 


/* 
ЗАДАЧА 2
Создайте функцию, которая выводит только четные числа от 1 до 10. 
Пример: 2,4,6,8,10
*/

DROP FUNCTION IF EXISTS num;

DELIMITER //
CREATE FUNCTION num(numbers INT)
	RETURNS VARCHAR(150)
	DETERMINISTIC
BEGIN
	DECLARE start0 INT DEFAULT 1;
    DECLARE result VARCHAR(150) DEFAULT ' ';
    IF numbers > 100 THEN
    RETURN 'Значение должно быть меньше 100';
    ELSE
		WHILE start0 <= numbers DO
			IF (start0 % 2 = 0) THEN
			SET result = CONCAT(result, ' ', start0);
			END IF;
        
			SET start0 = start0 + 1;
		END WHILE;
    END IF;
    RETURN TRIM(result);
END //
DELIMITER ;

SELECT num(100) AS result;