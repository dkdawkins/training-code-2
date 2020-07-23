-- data manipulation language

use AdventureWorks2017;
go

-- SELECT (select, from, where, group, having, order by)
select 'hello'; -- horizontal filter
select 1 + 1;

-- collation = character set is case insensitive, accent sensitive
-- A == a, ă != a
select firstname, lastname
from Person.Person;

select firstname, lastname
from Person.Person
where firstname = 'john' or lastname = 'john';  -- vertical filter of records

select firstname, lastname
from Person.Person
where firstname <> 'john' and lastname <> 'john';

select firstname, lastname
from Person.Person
where (firstname >= 'k' and firstname < 'l') or (lastname >= 'k' and lastname < 'l');
--SAME STATEMENT
select firstname, lastname
from Person.Person
where (firstname like 'k%') or (lastname like 'k%');

select firstname, lastname
from Person.Person
where (firstname like '%k') or (lastname like '%k%');

select firstname, lastname
from Person.Person
where (firstname like 'k__') or (lastname like '__k');

select firstname, lastname
from Person.Person
where (firstname like '[k,z]%') or (lastname like '[a-d]_k');

select firstname, lastname
from Person.Person
where firstname = 'john'
group by firstname, lastname;

select firstname, lastname, count(*) as count -- aggregate count, average, sum
from Person.Person
where firstname = 'john'
group by firstname, lastname;

select firstname, lastname, count(*) as count
from Person.Person
where firstname = 'john'
group by firstname, lastname
having count(*) > 1;  -- Vertical filter for groups

select firstname, lastname, count(*) as count
from Person.Person
where firstname = 'john'
group by firstname, lastname
having count(*) > 1
order by lastname desc, count desc;

-- ORDER OF EXECUTION
--from
--where
--group by
--having
--select
--order by

-- INSERT
select *
from Person.Address
where AddressLine1 like '123 elm%';

insert into Person.Address(AddressLine1, AddressLine2, City, StateProvinceID, PostalCode, SpatialLocation, rowguid, ModifiedDate)
values 
('123 elm street', null,	'dallas',	14,	75200, 0xE6100000010C72C2B2242FE04A4016902E7EB1B7F8BF,	'fd069aaa-ad12-4a4c-a548-23b35dfeb242',	'2020-07-22')
,('123 elm street', null,	'dallas',	14,	75200, 0xE6100000010C72C2B2242FE04A4016902E7EB1B7F8BF,	'fd069aaa-ad12-4a4c-a548-23b35dfeb242',	'2020-07-22');

-- UPDATE
update pa
set addressline1 = 'suite 200', addressline2 = '123 elm st'
from Person.Address as pa
where AddressLine2 = 'suite 200';

-- DELETE
delete pa
from Person.Address as pa
where AddressLine1 = '123 elm street'
go

-- VIEW
create view vw_getpersons with schemabinding -- firstname and lastname cannot change for the lifetime of this view
as
select firstname, lastname
from Person.Person
go

select * from vw_getpersons;  --read-only access to Person.Person
go

alter view vw_getpersons with schemabinding
as
select firstname, middlename, lastname
from Person.Person
go

-- FUNCTION

-- STORED PROCEDURE

-- JOIN

-- UNION

-- TRIGGER

-- TRANSACTION