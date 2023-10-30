DECLARE
mark NUMBER :=55;
BEGIN
dbms_output.put_line(‘Program started.’ );
IF( mark >= 70) THEN 
dbms_output.put_line(‘Grade A’);
ELSIF(mark >= 40 AND mark < 70) THEN
dbms_output.put_line(‘Grade B'); 
ELSIF(mark >=35 AND mark < 40) THEN
dbms_output.put_line(‘Grade C’);
END IF;
dbms_output.put_line(‘Program completed.’); 
END;