drop procedure if exists getQualification;
delimiter $
create procedure getQualification(_studentid int)


begin 
	
	declare flag bool;
	
	select true into flag from student where _studentid=student.id;
	
	
	if flag THEN	
		select * from student join student_qualifications on _studentid=student.id=student_qualifications.studentid;
	ELSE
		select "Student not found!!" as "Error";
	end if;

	

end $
delimiter ;