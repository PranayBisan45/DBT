drop trigger if exists insertDuplicate;
delimiter $
create trigger insertDuplicate before insert on student for each row 
begin

	
	insert into student_log values(new.ID,new.namefirst,new.namelast,new.DOB,new.emailID);
end $
delimiter ;
