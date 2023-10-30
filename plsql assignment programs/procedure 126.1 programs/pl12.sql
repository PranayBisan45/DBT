
drop procedure if exists Print1;
delimiter $
CREATE  PROCEDURE Print1(customerID int) 
BEGIN
	
   select * from customers join orders where orders.cnum=customers.cnum and orders.cnum=customerID;
   
END $
delimiter ;


