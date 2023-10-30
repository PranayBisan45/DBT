drop trigger if exists insertStudent;
delimiter $
create trigger insertStudent before insert on insertStudent for each row 
begin
	insert into log values("Record inserted successfully");
end $
delimiter ;
