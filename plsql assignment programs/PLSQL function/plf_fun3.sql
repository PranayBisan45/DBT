drop function if exists f3;
delimiter $
create function f3(_emailID varchar(50))  returns varchar(30)
deterministic
BEGIN	
		declare info varchar(50);
		declare flag bool;
		select true into flag from login where _emailID = emailID;
		
		if flag then
			set info := concat('Uname:',(select username  from login where _emailID=emailID),
						' pwd:',(select password  from login where _emailID=emailID));
			return info;
		else 
			return "Employee not exists!!";
		end if;
end $
delimiter ;
