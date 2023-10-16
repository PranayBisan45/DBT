/* drop procedure if exists pro1;
delimiter $
create procedure pro1()
BEGIN
	select "Hello World" as "Mesage Box";
end $
delimiter ;



drop procedure if exists pro2;
delimiter $
create procedure pro2(in x int, in y int)
BEGIN
	select x+y;
end $
delimiter ;


drop procedure if exists pro2;
delimiter $
create procedure pro2(in x int, in y int, out z1 int, out z2 int)
BEGIN
	SET z1 := x + y;
	SET z2 := x * y;
end $
delimiter ;




drop procedure if exists pro2;
delimiter $
create procedure pro2(in x int)
BEGIN
	if x between 1 and 10 THEN
		select "Good";
	ELSE
		select "Bad";
	end if;
end $
delimiter ;



drop procedure if exists pro2;
delimiter $
create procedure pro2(in y int)
BEGIN
	declare x int;
	set x:=0;
	SET @z :="";
	lbl1:LOOP
		set x:= x + 1;
		if x > 10 THEN
			leave lbl1;
		end if;
		
		SET @z := concat(@z , ' ',x * y);
		
		select x*y;
		
	end loop lbl1;
end $
delimiter ;





drop procedure if exists pro3;
delimiter $
create procedure pro3(p1 int, p2 varchar(20), p3 varchar(20))
BEGIN
declare exit handler for 1062 select "Data Present" as "Error Window";
	
	if p3 = 'pune' THEN
		insert into d values(p1, p2, p3);
		select "Record Insertd suss!";
	else
		select "In-valid Location" R1;
	end if;
end $
delimiter ;


drop procedure if exists pro4;
delimiter $
create procedure pro4(_deptno int)
BEGIN
	declare flag bool;
	
	select true into flag  from dept where deptno=_deptno;
	if flag THEN
		select * from dept where deptno=_deptno;
	ELSE
		select "Record not found!" R1;
	end if;
end $
delimiter ;


drop procedure if exists pro5;
delimiter $
create procedure pro5(_deptno int, _empno int, _ename varchar(20), _city varchar(20))
BEGIN
	declare flag bool;
	select true into flag  from dept where deptno=_deptno;
	if flag THEN
		insert into e1 values(_empno, _ename, _city, _deptno);
		select "RIS" R1;
	ELSE
		select "DEPTNO not found!, in Department table" R2;
	end if;
end $
delimiter ;



drop procedure if exists pro6;
delimiter $
create procedure pro6()
BEGIN
declare exit handler for 1050 select 'Table present';
	create table c(c1 int primary key auto_increment , c2 int);
end $
delimiter ;



drop procedure if exists pro6;
delimiter $
create procedure pro6()
BEGIN
declare exit handler for 1051 select "table not found";
	drop table c;
end $
delimiter ;

drop procedure if exists pro7;
delimiter $
create procedure pro7(_start int, _end int)
BEGIN
	select row_number() over() R1, ename,job,sal from emp limit _start, _end;
end $
delimiter ;


drop procedure if exists pro8;
delimiter $
create procedure pro8(_tName varchar(20))
BEGIN
    set @x := concat( "create table ", _tName , "(c1 int, c2 int)");
	
	prepare z from @x;
	execute z;
end $
delimiter ;




drop procedure if exists pro9;
delimiter $
create procedure pro9(_tName varchar(20))
BEGIN
    set @x := concat( "select * from ", _tName);
	prepare z from @x;
	execute z;

end $
delimiter ;

drop procedure if exists pro9;
delimiter $
create procedure pro9(_tName varchar(20))
BEGIN
	set @tName := _tName;
	select @tName;
    set @x := "select * from ?";
	prepare z from @x;
	execute z using @tName;
end $
delimiter ;


drop procedure if exists pro10;
delimiter $
create procedure pro10(_cName varchar(1000),_tName varchar(2000))
BEGIN
declare exit handler for 1054 select "Invalid column name in the selection list";
    set @x := concat( "select ", _cName,  " from ", _tName);
	prepare z from @x;
	execute z;
end $
delimiter ;




drop procedure if exists pro11;
delimiter $
create procedure pro11(p1 int, p2 varchar(20), p3 varchar(20))
BEGIN
	set @x1 := p1;
	set @x2 := p2;
	set @x3 := p3;
	
	set @y := "insert into d values(?, ?, ?)";
	
	prepare z from @y;
	if 
	execute z using @x1, @x2, @x3; 
end $
delimiter ;



drop function if exists f1;
delimiter $
create function f1() returns int
deterministic
BEGIN
    return 10;
end $
delimiter ;



drop function if exists f2;
delimiter $
create function f2(x int, y int) returns int
deterministic
BEGIN
	declare z int;
	set z:= ifnull(x,0)+ifnull(y,0);
    return z;
end $
delimiter ;

drop function if exists f3;
delimiter $
create function f3() returns int
deterministic
BEGIN
	declare z int;
	select max(deptno) + 1 into z from d;
	return z;
end $
delimiter ;
 insert into d values(f3())

drop procedure if exists pro1;
delimiter $
create procedure pro1()
BEGIN
	call display('Hello World');
end $
delimiter ;

drop procedure if exists display;
delimiter $
create procedure display(msg varchar(2000))
BEGIN
	select msg as R1;
end $
delimiter ;



drop procedure if exists pro1;
delimiter $
create procedure pro1()
BEGIN
	select max(sal) into @z  from emp;
end $
delimiter ;


drop function if exists f1;
delimiter $
create function f1() returns int
deterministic
BEGIN
	call pro1();
    return @z;
	
end $
delimiter ;




drop procedure if exists pro1;
delimiter $
create procedure pro1()
BEGIN
	select max(sal) into @z  from emp; 
	select * from dept;
end $
delimiter ;


drop trigger if exists tr1;
delimiter $
create trigger tr1 before insert on d for each ROW
BEGIN
	call pro1();
end  $
delimiter ;



drop trigger if exists tr1;
delimiter $
create trigger tr1 before insert on d for each ROW
BEGIN
	insert into d1 values(NEW.DEPTNO, NEW.DNAME, NEW.LOC, current_date(), current_time(), user());
end  $
delimiter ;


drop trigger if exists tr2;
delimiter $
create trigger tr2 before delete on d for each ROW
BEGIN
	insert into d2 values(OLD.DEPTNO, OLD.DNAME, OLD.LOC, current_date(), current_time(), user());
end  $
delimiter ;


drop trigger if exists tr1;
delimiter $
create trigger tr1 before insert on d for each ROW
BEGIN
	if dayname(now()) = 'Monday' THEN
		signal sqlstate '42000' set message_text='Invalid transaction, because to is Monday';
	end if;
end  $
delimiter ;


drop trigger if exists tr1;
delimiter $
create trigger tr1 before insert on d for each ROW
BEGIN
	declare z int;
	select max(deptno) + 1 into z from d;
	set new.deptno = z;
	if z > 56 THEN
		signal sqlstate '42000' set message_text="Department number is more than 56...";
	end if;
end  $
delimiter ;

drop trigger if exists tr1;
delimiter $
create trigger tr1 after insert on a for each ROW
BEGIN
	insert into b values(new.c1);
end  $
delimiter ;

*/

drop trigger if exists tr1;
delimiter $
create trigger tr1 before insert on a for each ROW
BEGIN
	set new.c2 = upper(new.c2);
end  $
delimiter ;