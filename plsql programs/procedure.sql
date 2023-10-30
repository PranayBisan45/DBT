DROP PROCEDURE IF EXISTS checkUser;
delimiter $
CREATE PROCEDURE checkUser(_email varchar(20))
BEGIN
	DECLARE p BOOLEAN;
	SELECT TRUE into p WHERE _email IN (select emailid from login1);
	IF p THEN
	SELECT username, password from login1 WHERE emailid = _email;
	ELSE
	INSERT INTO log1 (curr_date, curr_time, msg) VALUES (CURRENT_DATE(), CURRENT_TIME(), DEFAULT);
	END IF;
END $
delimiter ;

