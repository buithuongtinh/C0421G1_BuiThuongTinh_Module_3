drop database if exists quan_ly_ban_hang;
create database quan_ly_ban_hang;
use quan_ly_ban_hang;

create table customer(
	c_id int primary key,
    c_name varchar(50),
    c_age int
);
create table `order`(
	o_id int primary key,
    c_id int,
    o_date date,
    o_total_price varchar(50),
    
    foreign key (c_id) references customer(c_id)
);

create table product(
	p_id int primary key,
    p_name varchar(50),
    p_pice varchar(50)
);

create table oder_detail(
	o_id int,
    p_id int,
    od_qty varchar(50),
    
    foreign key(o_id) references `order`(o_id),
    
    foreign key(p_id) references product(p_id)
    
);