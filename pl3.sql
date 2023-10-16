/*
drop trigger if exists tr1
delimiter $
create trigger tr1 before insert on g for each ROW
BEGIN
insert on d1 values(new.deptno,new.dname,new.loc)
end $
delimeter ;

*/

drop trigger if exists tr2
delimeter $
create trigger tr2 before DELETE on g for each ROW
BEGIN
insert into g1 values(OLD.deptno,OLD.dname,OLD.loc)
end $
delimiter ;
 