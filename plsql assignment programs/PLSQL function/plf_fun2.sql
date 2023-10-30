drop function if exists autoNumber;
delimiter $
create function autoNumber() returns int
deterministic 
begin
	
	declare max_id int;
	declare flag bool;
	select distinct true into flag from student_new;
	if flag then 
		select max(studentID)+1 into max_id from student_new;
		return max_id;
	else
		return 1;
	end if;
	
end $
delimiter ;



	
