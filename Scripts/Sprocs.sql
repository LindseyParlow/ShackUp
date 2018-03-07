if exists(select * from INFORMATION_SCHEMA.ROUTINES
	where ROUTINE_NAME = 'DbReset')
		drop procedure DbReset
go

create procedure DbReset as
begin
	delete from States;

	insert into States(StateId, StateName)
	values ('OH', 'Ohio'),
	('KY', 'Kentucky'),
	('MN', 'Minnesota');
end