drop procedure if exists addUser;
delimiter $
create procedure addUser(in userName varchar(30),in pass varchar(30),in email varchar(30))


begin 
	declare exit handler for 1050 select "Table with same name already exists" as 'Error';
	create table login(userName varchar(30),pass varchar(30),email varchar(30));
	insert into login values(username,pass,email);


end $
delimiter ;