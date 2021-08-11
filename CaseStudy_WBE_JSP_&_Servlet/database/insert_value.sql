use jsp_servlet;

insert into customer_type(customer_type_name) value
('Diamond'), ('Platinium'), ('Gold'), ('Silver'),('Member');
insert into customer(customer_code,customer_type_id,customer_name,customer_birthday,customer_gender,customer_id_card,customer_phone,customer_email,
customer_address)value 
('KH-0001',1,'tinh1','2000-01-01',1,'123123123','1111111','tinh1@code.gym','da nang'),
('KH-0002',3,'tinh2','2000-28-02',0,'123123123','2222222','tinh2@code.gym','quang binh');