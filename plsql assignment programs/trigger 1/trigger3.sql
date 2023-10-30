drop trigger if exists update_studentDetails;
delimiter $
create trigger update_studentDetails before update on student for each row
BEGIN
	
	insert into student_log values( new.ID,new.namefirst,new.namelast,new.DOB,new.emailID);
end $
delimiter ;
