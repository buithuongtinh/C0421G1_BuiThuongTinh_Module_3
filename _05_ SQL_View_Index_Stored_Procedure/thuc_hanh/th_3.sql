delimiter //
drop procedure if exists get_cus_by_id;
create procedure get_cus_by_id(id int(11))
begin
	select * 
    from customers
    where customernumber = id;
end //
delimiter ;

call get_cus_by_id (175);


delimiter //
create procedure get_customer_count_by_city (in var_city varchar(50),  out total int)
begin
	select count(customernumber)
    from customers
    where city = var_city;
end //

delimiter ;

call get_customer_count_by_city ('lyon', @total);

select @total;

delimiter //
create procedure set_counter (inout counter int, in inc int)
begin
	set counter = counter + inc;
end //
delimiter ;

set @counter = 1;
call set_counter (@counter, 1);
call set_counter (@counter, 1);
call set_counter (@counter, 5);
call set_counter (@counter, 1);
select @counter;