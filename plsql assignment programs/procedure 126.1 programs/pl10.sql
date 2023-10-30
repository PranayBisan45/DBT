drop procedure if exists pl10;
delimiter $
create procedure pl10()

BEGIN
	
	
	declare _ename,_job varchar(30);
	declare _sal,_deptno int;
	declare c1 cursor for select ename,job,sal,deptno from emp where deptno=10;


	drop table if exists emp10;
	open c1;
			fetch c1 into _ename,_job,_sal,_deptno;
			create table emp10 as select * from emp where deptno=10;
	close c1;

	select ename,job,sal,deptno from emp10;
	
	
	

	drop table if exists emp20;
	open c1;
			fetch c1 into _ename,_job,_sal,_deptno;
			create table emp20 as select * from emp where deptno=20;
	close c1;

	select ename,job,sal,deptno from emp20;
	
	
	
	drop table if exists emp30;
	open c1;
			fetch c1 into _ename,_job,_sal,_deptno;
			create table emp30 as select * from emp where deptno=30;
	close c1;

	select ename,job,sal,deptno from emp30;
end $
delimiter ;