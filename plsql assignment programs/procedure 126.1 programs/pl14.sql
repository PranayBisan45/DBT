
drop procedure if exists Print1;

delimiter $
CREATE  PROCEDURE Print1(num int) 
BEGIN
	
	
	declare lastDigit int;
	declare lastDigit2 int;
	declare countDigit int;
	declare alldigit varchar(200) default '';
	declare sumDigit int;
	
	drop table if exists decimalPlace;
	create table decimalPlace(num int auto_increment primary key,wrd varchar(25),decWord varchar(25),forOne varchar(25));
	insert into decimalplace(wrd,decWord,forOne) values("One","Ten","Eleven"),("Two","Twenty","Twelve"),("Three","Thirty","Thirteen"),("Four","Fourty","Fourteen"),("Five","Fifty","Fifteen"),("Six","Sixty","Sixteen"),("Seven","Seventy","Seventeen"),("Eight","Eighty","Eighteen"),("Nine","Ninty","Nineteen"),("Ten","Ten","Ten");
	
	
	
	
	l1:loop
	if num > 0 THEN
		set lastDigit:= num%10;
		set sumDigit := sumDigit + lastDigit;
		set num:=(num/10);	
	ELSE
		leave l1;
	end if;
	end loop l1;
	
	
	
	l2:loop
	if sumDigit > 0 THEN
		set lastDigit2:= sumDigit%10;
		set sumDigit:=(sumDigit/10);
		set countDigit := countDigit +1;
		
		set alldigit := concat((select numWord from decimalPlace where lastDigit2=decimalPlace.num ), ' ' ,alldigit);
	ELSE
		leave l2;
	end if;
	
	
	
	
	
	
	
	
	end loop l2;
	select alldigit;
END $
delimiter ;


