
drop procedure if exists Print1;

delimiter $
CREATE  PROCEDURE Print1(num  int) 
BEGIN
	
	
	declare lastDigit int;
	declare alldigit varchar(200) default '';
	
	
	drop table if exists word;
	create table word(num int auto_increment primary key,numWord varchar(25));
	insert into word(numWord) values("One"),("Two"),("Three"),("Four"),("Five"),("Six"),("Seven"),("Eight"),("Nine");
	
	l1:loop
	if num > 0 THEN
		set lastDigit:= num%10;
		set num:=(num div 10);
		if lastDigit=0 then 
			set alldigit := concat('zero', ' ' ,alldigit);
		else
			set alldigit := concat((select numWord from word where lastDigit=word.num), ' ' ,alldigit);
		end if;
	ELSE
		leave l1;
	end if;
	end loop l1;
	select alldigit;
END $
delimiter ;


