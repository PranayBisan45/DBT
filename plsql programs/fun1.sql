create or replace function getMultiple(num1 in number, num2 in number)    
return number    
is     
  num3 number(8);    
begin    
  num3 :=num1*num2;    
  return num3;    
end; 