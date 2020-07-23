-- data definition language

use master;
go

-- CREATE

create database PizzaStoreDb; -- project
go

create schema Pizza;  -- namespace
go

--constraints = datatype, key, default, check, null, computed
--number datatypes = tinyint, smallint, int, bigint, numeric, decimal
--text datatypes = text, ntext, varchar(ascii), nvarchar(utf-8), char(ascii), nchar(utf-8)
--datetime datatypes = date, time, datetime, datetime2
--boolean datatypes = bit

create table Pizza.Pizza
(
  PizzaId int not null primary key, -- identity(seed, step)
  CrustId int null foreign key references Pizza.Crust(CrustId), --Least likely to use
  SizeId int null,
  [Name] nvarchar(250) not null,
  DateModified datetime2(0) not null,
  Active bit not null default 1,
  constraint SizeId foreign key references Pizza.Size(SizeId),  --Preferred Form
  --constraint PK_PizzaId (PizzaId) primary key
);

create table Pizza.Crust
(
  CrustId tinyint not null,
  [Name] nvarchar(100) not null,
  --DateModified datetime2(0) not null,
  Active bit not null,
  constraint CrustId primary key,
  constraint Active default 1
);

create table Pizza.Size
(
  SizeId tinyint not null,
  [Name] nvarchar(100) not null,
  --DateModified datetime2(0) not null,
  Active bit not null,
  --constraint PK_SizeId (SizeId) primary key
);

create table Pizza.Topping
(
  ToppingId tinyint not null,
  --PizzaId int not null,
  [Name] nvarchar(100) not null,
  --DateModified datetime2(0) not null,
  Active bit not null,
  --constraint PK_ToppingId (ToppingId) primary key
);

create table Pizza.PizzaTopping
(
  PizzaToppingId int not null,
  PizzaId int not null,
  ToppingId int not null,
  Active bit not null
)
go

-- ALTER
alter table Pizza.Size
  add constraint PK_Size_SizeId SizeId primary key  --another preferred form

alter table Pizza.Topping
  add constraint PK_Topping_ToppingId ToppingId primary key

alter table Pizza.PizzaTopping
  add constraint PK_PizzaTopping_PizzaToppingId PizzaToppingId primary key

alter table Pizza.PizzaTopping
  add constraint PK_PizzaTopping_PizzaId PizzaId foreign key references Pizza.Pizza(PizzaId)

alter table Pizza.PizzaTopping
  add constraint PK_PizzaTopping_ToppingId ToppingId foreign key references Pizza.Topping(ToppingId)

-- DROP
-- replication, backup(full, differential, incremental), failover
drop table Pizza.Pizza;
drop schema Pizza;
drop database PizzaStoreDb; -- development

-- TRUNCATE
truncate table Pizza.Pizza; 
truncate schema Pizzza;
truncate database PizzaStoreDb;