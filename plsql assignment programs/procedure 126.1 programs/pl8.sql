
drop procedure if exists string2;

delimiter $
create procedure string2()
BEGIN
     declare i int;
	 set i:=1;
	 drop table if exists t;
	create table t(id int auto_increment primary key,message varchar(30));
	 l1:loop
	if i <=10 then
	
		if (i%2)=0 then 
			
			insert into t(message) values("id is even");
		ELSE
	
			insert into t(message) values("id is odd");
		end if;
		set i:=i+1;
	
	else
		leave l1;
	end if;
	
	end loop l1;
	select * from t;
end $
delimiter ;
