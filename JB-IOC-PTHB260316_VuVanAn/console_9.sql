create table Customer(
    customer_id varchar(5) primary key ,
    customer_full_name varchar(100) not null ,
    customer_email varchar(100) not null unique ,
    customer_phone varchar(15) not null ,
    customer_address varchar(255) not null
);

create table Room(
    room_id varchar(5) primary key ,
    room_type varchar(50) not null ,
    room_price decimal(10,2) not null ,
    room_status varchar(20) not null ,
    room_area int not null
);

create table Booking(
    booking_id serial primary key,
    customer_id varchar(5) not null ,
    room_id varchar(5) not null ,
    check_in_date date not null ,
    check_out_date date not null ,
    total_amount decimal(10,2),
    foreign key (customer_id) references Customer(customer_id),
    foreign key (room_id) references Room(room_id)
);

create table Payment(
    payment_id serial primary key ,
    booking_id int not null ,
    payment_method varchar(50) not null ,
    payment_date date not null ,
    payment_amount decimal(10,2) not null ,
    foreign key (booking_id) references Booking(booking_id)
);

insert into Customer values
('C001','Nguyen Anh Tu','tu.nguyen@example.com','0912345678','Hanoi, Vietnam'),
('C002','Tran Thi Mai','mai.tran@example.com','0923456789','Ho Chi Minh, Vietnam'),
('C003','Le Minh Hoang','hoang.le@example.com','0934567890','Danang, Vietnam'),
('C004','Pham Hoang Nam','nam.pham@example.com','0945678901','Hue, Vietnam'),
('C005','Vu Minh Thu','thu.vu@example.com','0956789012','Hai Phong, Vietnam'),
('C006','Nguyen Thi Lan','lan.nguyen@example.com','0967890123','Quang Ninh, Vietnam'),
('C007','Bui Minh Tuan','tuan.bui@example.com','0978901234','Bac Giang, Vietnam'),
('C008','Pham Quang Hieu','hieu.pham@example.com','0989012345','Quang Nam, Vietnam'),
('C009','Le Thi Lan','lan.le@example.com','0990123456','Da Lat, Vietnam'),
('C010','Nguyen Thi Mai','mai.nguyen@example.com','0901234567','Can Tho, Vietnam');

insert into Room values
('R001','Single',100.0,'Available',25),
('R002','Double',150.0,'Booked',40),
('R003','Suite',250.0,'Available',60),
('R004','Single',120.0,'Booked',30),
('R005','Double',160.0,'Available',35);

insert into Booking values
(1,'C001','R001','2025-03-01','2025-03-05',400.0),
(2,'C002','R002','2025-03-02','2025-03-06',600.0),
(3,'C003','R003','2025-03-03','2025-03-07',1000.0),
(4,'C004','R004','2025-03-04','2025-03-08',480.0),
(5,'C005','R005','2025-03-05','2025-03-09',800.0),
(6,'C006','R001','2025-03-06','2025-03-10',400.0),
(7,'C007','R002','2025-03-07','2025-03-11',600.0),
(8,'C008','R003','2025-03-08','2025-03-12',1000.0),
(9,'C009','R004','2025-03-09','2025-03-13',480.0),
(10,'C010','R005','2025-03-10','2025-03-14',800.0);

insert into payment values
(1,1,'Cash','2025-03-05',400.0),
(2,2,'Credit Card','2025-03-06',600.0),
(3,3,'Bank Transfer','2025-03-07',1000.0),
(4,4,'Cash','2025-03-08',480.0),
(5,5,'Credit Card','2025-03-09',800.0),
(6,6,'Bank Transfer','2025-03-10',400.0),
(7,7,'Cash','2025-03-11',600.0),
(8,8,'Credit Card','2025-03-12',1000.0),
(9,9,'Bank Transfer','2025-03-13',480.0),
(10,10,'Cash','2025-03-14',800.0);

/*
 Cau 3
 */

DELETE from payment
where payment_method='Cash' and payment_amount<500;

select customer_id, customer_full_name, customer_email,customer_phone,customer_address
from Customer
order by customer_full_name asc;

select room_id,room_type,room_price,room_area
from Room
order by room_price desc ;

select c.customer_id,c.customer_full_name,b.room_id,b.check_in_date,b.check_out_date
from Customer c
    join Booking b on c.customer_id=b.customer_id;

select c.customer_id,c.customer_full_name,p.payment_method,p.payment_amount
from Customer c
    join Booking b on c.customer_id=b.customer_id
    join payment p on b.booking_id=p.booking_id
order by p.payment_amount desc ;

select *
from Customer
order by customer_full_name
limit 3 offset 1;

select c.customer_id,c.customer_full_name,count(b.customer_id)
from Customer c
    join Booking b on c.customer_id=b.customer_id
group by c.customer_id,c.customer_full_name
having count(b.customer_id)>=2
and sum(b.total_amount)>1000;

select r.room_id,r.room_type,r.room_price,sum(b.total_amount)
from room r
    join Booking b on r.room_id=b.room_id
group by r.room_id,r.room_type,r.room_price
having sum(b.total_amount)<1000 and count(b.customer_id)>=3;

select c.customer_id,c.customer_full_name,b.room_id,sum(b.total_amount)
from Customer c
    join Booking b on c.customer_id=b.customer_id
group by c.customer_id, c.customer_full_name, b.room_id
having sum(b.total_amount)>1000;

select customer_id, customer_full_name,customer_email,customer_phone
from Customer
where customer_full_name ilike '%Minh%' or customer_address ilike '%Hanoi%';

select room_id,room_type,room_price
from Room
order by room_price desc
limit 5 offset 5;

create view v_1 as
select r.room_id,r.room_type,c.customer_id,c.customer_full_name
from room r
    join Booking b on r.room_id=b.room_id
    join Customer c on b.customer_id=c.customer_id
where b.check_in_date<'2025-03-10';

create view v_2 as
select c.customer_id,c.customer_full_name,r.room_id,r.room_area
from room r
         join Booking b on r.room_id=b.room_id
         join Customer c on b.customer_id=c.customer_id
where r.room_area>30;

create or replace function fnc_check_insert_booking()
    returns trigger
    language plpgsql
as $$
declare check_in_date date;
        check_out_date date;
begin
    select new.check_in_date, new.check_out_date
    into check_in_date, check_out_date
    from booking;
    if check_in_date>check_out_date then
        raise exception 'Ngày đặt phòng không thể sau ngày trả phòng được !';
    end if;
end;
$$;

create or replace trigger check_insert_booking
before insert ON booking
FOR each row
execute function fnc_check_insert_booking();

create or replace function fnc_update_room_status_on_booking()
    returns trigger
    language plpgsql
as $$
declare
    room_id_check varchar(5);
begin
    select new.room_id
    into room_id_check
    from booking;

    update room
    set room_status='Booked'
    where room_id=room_id_check;

end;
$$;

create or replace trigger update_room_status_on_booking
    after insert ON booking
    FOR each row
execute function fnc_update_room_status_on_booking();

create or replace procedure sp_add_customer(customer_id varchar(5),
                                            customer_full_name varchar(100),
                                            customer_email varchar(100),
                                            customer_phone varchar(15),
                                            customer_address varchar(255))
language plpgsql
as $$
    begin
        insert into Customer values
        (customer_id,customer_full_name,customer_email,customer_phone,customer_address);
    end;
    $$;

create or replace procedure sp_add_payment(p_booking_id int,
                                           p_payment_method varchar(50),
                                           p_payment_amount decimal(10,2),
                                           p_payment_date date)
language plpgsql
as $$
begin
    insert into Payment(booking_id, payment_method, payment_amount,payment_date) values
        (p_booking_id,p_payment_method,p_payment_amount,p_payment_date);
end;
$$;



