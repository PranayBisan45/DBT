drop procedure if exists addUser;
delimiter $
create procedure addUser(in _email varchar(30),in _msg varchar(3000))


begin 
	
	declare flag bool;
	
	select true into flag from login where _email=login.email;
	
	
	if flag THEN	
		select userName,pass from login where _email=login.email;
	ELSE
		insert into log(curr_date,curr_time,msg) values(CURRENT_DATE(),CURRENT_TIME(),_msg);
	end if;

	

end $
delimiter ;