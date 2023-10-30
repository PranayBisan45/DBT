drop function if exists f4;
delimiter $
create function f4(_studentID int) returns int
deterministic
BEGIN	
	declare sumMarks int;
	
	select sum(marks) from student_qualifications where _studentID=studentID group by studentID into sumMarks;

	return sumMarks;

end $
delimiter ;

	