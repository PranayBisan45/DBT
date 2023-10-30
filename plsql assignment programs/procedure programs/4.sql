drop procedure if exists addStudent;
delimiter $
create procedure addStudent(nfirst varchar(45),nlast varchar(45),_number varchar(45),_address varchar(128))


begin 
	
	declare flag bool;
	
	select true into flag from student where nfirst=student.namefirst and nlast=student.namelast;
	
	
	if flag THEN	
		select "student with same namefirst and namelast already existed" as "Duplication";
		
	ELSE
		
		insert into s(namefirst,namelast) values(nfirst,nlast);
		insert into student_phone(number) values(_number);
		insert into student_address(address) values(_address);
		
	end if;

	

end $
delimiter ;