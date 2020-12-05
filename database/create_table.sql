use housemanagement;

CREATE TABLE role(
  id bigint NOT NULL PRIMARY KEY auto_increment,
  name VARCHAR(255) NOT NULL,
  code VARCHAR(255) NOT NULL
);

create table house(
	id bigint NOT NULL PRIMARY KEY auto_increment,
    address varchar(255) NULL,
    rules text null,
    status int null
);

create table room(
	id bigint NOT NULL PRIMARY KEY auto_increment,
    houseid bigint not null,
    room_name varchar(150) not null,
    room_money int null,
    electricy_money int null,
    water_money int null,
    network_money int null,
    other_money int null,
    last_electricty_number int null,
    last_water_number int null,
    notes text null,
    status int null,
    CONSTRAINT fk_room_house FOREIGN KEY (houseid) REFERENCES house(id) on update cascade on delete cascade
);

CREATE TABLE user (
  id bigint NOT NULL PRIMARY KEY auto_increment,
  username VARCHAR(150) NOT NULL,
  password VARCHAR(150) NOT NULL,
  fullname VARCHAR(150) NULL,
  status int NOT NULL,
  gender char(5) NULL,
  address varchar(255) NULL,
  phone char(20) null,
  birth date null,
  createddate TIMESTAMP NULL,
  createdby VARCHAR(255) NULL,
  roleid bigint NOT NULL,
  roomid bigint null,
  CONSTRAINT fk_user_role FOREIGN KEY (roleid) REFERENCES role(id) on update cascade on delete cascade,
  CONSTRAINT fk_user_room FOREIGN KEY (roomid) REFERENCES room(id) on update cascade on delete cascade
);

create table manager(
	userid bigint not null,
    houseid bigint not null,
    CONSTRAINT pk_manager_user PRIMARY KEY(userid,houseid)
);

ALTER TABLE manager ADD CONSTRAINT fk_manager_user FOREIGN KEY (userid) REFERENCES user(id) on update cascade on delete cascade;
ALTER TABLE manager ADD CONSTRAINT fk_manager_house FOREIGN KEY (houseid) REFERENCES house(id) on update cascade on delete cascade;

create table feedback(
	id bigint NOT NULL PRIMARY KEY auto_increment,
    content text not null,
    createddate TIMESTAMP NOT NULL,
    userid bigint not null,
    CONSTRAINT fk_feedback_user FOREIGN KEY (userid) REFERENCES user(id) on update cascade on delete cascade
);

create table notify(
	id bigint NOT NULL PRIMARY KEY auto_increment,
    content text not null,
    createddate TIMESTAMP NOT NULL,
    roomid bigint not null,
    CONSTRAINT fk_notify_room FOREIGN KEY (roomid) REFERENCES room(id) on update cascade on delete cascade
);

create table bill(
	id bigint NOT NULL PRIMARY KEY auto_increment,
    room_money int null,
    electricy_money int null,
    water_money int null,
    network_money int null,
    other_money int null,
    electricty_number int null,
    water_number int null,
    total_money int null,
    notes text null,
    status int null,
    createddate TIMESTAMP NULL,
    createdby varchar(255) null,
    roomid bigint not null,
    CONSTRAINT fk_bill_room FOREIGN KEY (roomid) REFERENCES room(id) on update cascade on delete cascade
);


create table notifydetail(
	id bigint NOT NULL PRIMARY KEY auto_increment,
	roomid bigint not null,
    notifyid bigint not null,
	CONSTRAINT fk_room FOREIGN KEY (roomid) REFERENCES room(id) on update cascade on delete cascade,
	CONSTRAINT fk_notify FOREIGN KEY (notifyid) REFERENCES notify(id) on update cascade on delete cascade
);


ALTER TABLE house
ADD COLUMN name VARCHAR(150) AFTER id;

select * from house where id = 4;
select * from user;
select * from role;
select * from manager;
select * from room;

insert into role (name,code) values
('Quản trị','ADMIN'),('Người dùng','USER');



insert into user (username,password,fullname,status,roleid,roomid)
values ('luubaminh','123456','Lưu Bá Minh',1,1,1);

insert into user (username,password,fullname,status,roleid)
values ('luubaminh','123456','Lưu Bá Minh',1,1);

update room set member = member + 1 where id = 1;

insert into user (username,password,roleid,roomid,status)
values ( 'demo', '123456',2,1,1);

insert into manager (userid,houseid) 
values (1,2);

insert into room (houseid,room_name,room_money,electricy_money,water_money,
network_money,other_money,last_electricty_number,last_water_number,status,member)
values(1,'102',1000000,3000,70000,80000,0,10,0,0,0);

ALTER TABLE user MODIFY birth char(20);


ALTER TABLE room
ADD member int ;




create trigger tg_member_insert
after insert
on user
for each row

DELIMITER $$
create trigger insert_member_room after insert on user
for each row
begin
update room set member = member + 1 where id = NEW.roomid;
end;$$

DELIMITER $$
create trigger delete_member_room after delete on user
for each row
begin
update room set member = member - 1 where id = OLD.roomid;
end;$$

select * from room;
select * from user where roomid = 1;
insert into user(username,password,fullname,status,roleid) values('minh','sdf','Minh',1,2);
select id,member from room where id = 1;
delete from user where id = 17;
drop trigger delete_member_nclass;


select * from bill;
select * from room where id = 1;

DELIMITER $$
create trigger tg_update_bill before insert on bill
for each row
begin
	declare check_water_number int;
	declare check_electric_number int;
    
	select last_water_number INTO @check_water_number
	from room where id = NEW.roomid;
	select last_electricty_number INTO @check_electric_number
	from room where id = NEW.roomid;
    
	if (NEW.electricty_number < @check_electric_number or NEW.water_number < @check_water_number) then
		SIGNAL sqlstate '45001' set message_text = "No way ! You cannot do this !";
	else
		update room 
		set last_electricty_number = NEW.electricty_number,
		last_water_number = NEW.water_number
		where id = NEW.roomid;
	end if;
end;$$

drop trigger tg_update_bill;


select * from notify;


ALTER TABLE bill
DROP COLUMN notes;
  
  ALTER TABLE notify
DROP COLUMN roomid;
ALTER TABLE notify DROP FOREIGN KEY fk_notify_room;

select * from room where id = 1;
select * from bill;
insert into bill(electricty_number,water_number,total_money,status,roomid)
values(-1,0,1000000,0,9);

insert into bill(electricty_number,water_number,total_money,status,roomid)
values(0,0,1000000,0,9);


alter table room 
add COLUMN type_network_money int,
add COLUMN type_water_money int;

select * from room;
select * from bill;
select * from user;
select * from role;
select * from house;
select * from manager;
select * from feedback;
select * from notify;

select * from manager as m inner join house as h
on m.houseid = h.id where userid = 1;

select * from manager as m inner join user as u
on m.userid = u.id where houseid = 1;

select * from manager as m inner join room as r
on m.houseid = r.houseid where userid = 1;

select * from notifydetail;
select * from notify;
select * from room;

select * from notifydetail as nd inner join notify as n
on nd.notifyid = n.id where roomid = 9 order by createddate desc;
select * from house;

create view ViewFeedback
as
select f.id,r.houseid,h.name,u.roomid,r.room_name, f.content,f.createddate
from feedback as f inner join user as u 
on f.userid = u.id inner join room as r 
on u.roomid = r.id inner join house as h
on r.houseid = h.id;

DROP VIEW ViewFeedback;

select * from ViewFeedback where houseid=1 order by createddate desc;


select * from notifydetail;
select * from notify;

create view ViewMessageFromAddmin
as
select n.id,r.houseid, h.name,r.room_name, n.content,n.createddate
from notify as n inner join notifydetail as nd 
on n.id = nd.notifyid inner join room as r 
on r.id = nd.roomid inner join house as h
on r.houseid = h.id;

drop view ViewMessageFromAddmin;

select * from ViewMessageFromAddmin;

select count(*) from ViewFeedback where houseid = 1
select count(*) from ViewMessageFromAddmin where houseid = 1


select * from bill

select b.status,count(b.status) as number ,DATE_FORMAT(b.createddate, '%Y-%m') as date
from room r inner join house h on r.houseid = h.id
inner join bill b on r.id = b.roomid
inner join manager m on m.houseid = h.id
 where m.userid = 1 group by date,b.status order by date desc,b.status
