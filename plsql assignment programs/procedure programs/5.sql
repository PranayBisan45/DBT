
drop procedure if exists addQualification;
delimiter $
create procedure addQualification(_id int,_sId int,_name varchar(128),_college varchar(128),_university varchar(128), _marks varchar(45),_year int)
begin 
	declare flag bool;
	select true into flag from student where  _id=student.id;
	if flag THEN			
		insert into student_qualifications values(_sid ,id ,_name,_college ,_university , _marks ,_year);		
	ELSE
		select "Student with this id is not found" as "Result";
	end if;
end $
delimiter ;



/*
drop procedure if EXISTS addQualification;
delimiter $
create procedure addQualification(sid int , studentid int, name varchar(200), college varchar(200), university varchar (200), marks varchar (200), years int)
BEGIN
declare x bool ;
SELECT true into x from student where id = studentid;
if(x=true)
then 
insert into student_qualifications VALUES(sid,studentid,name, college, university, marks, years);
ELSE
SELECT 'student not found';
end if;
end $
delimiter ;
