-- data definition language

use master;
go

-- CREATE

create database PizzaStoreDb; -- project
go

create schema Pizza;  -- namespace
go

--constraints = datatype, key, default, check, null, ?
--number datatypes = tinyint, smallint, int, bigint, numeric, decimal
--text datatypes = text, ntext, varchar(ascii), nvarchar(utf-8), char(ascii), nchar(utf-8)
--datetime datatypes = date, time, datetime, datetime2
--boolean datatypes = bit

create table Pizza.Pizza
(
  PizzaId int not null primary key, --DONT DO CONSTRAINTS THIS WAY
  Name nvarchar(250) not null,
  DateModified datetime2(0) not null,
  IsValid bit not null,
  --constraint PK_PizzaId (PizzaId) primary key
);

create table Pizza.Crust
(
  CrustId tinyint not null primary key,
  Name nvarchar(250) not null,
  DateModified datetime2(0) not null,
  IsValid bit not null,
  --constraint PK_CrustId (CrustId) primary key
);

create table Pizza.Size
(
  SizeId tinyint not null primary key,
  Name nvarchar(250) not null,
  DateModified datetime2(0) not null,
  IsValid bit not null,
  --constraint PK_SizeId (SizeId) primary key
);

create table Pizza.Topping
(
  ToppingId tinyint not null primary key,
  Name nvarchar(250) not null,
  DateModified datetime2(0) not null,
  IsValid bit not null,
  --constraint PK_ToppingId (ToppingId) primary key
);

-- ALTER

-- DROP

-- TRUNCATE