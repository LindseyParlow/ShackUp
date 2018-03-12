if exists(select * from INFORMATION_SCHEMA.ROUTINES
	where ROUTINE_NAME = 'StatesSelectAll')
		drop procedure StatesSelectAll
go

create procedure StatesSelectAll as
begin
	select StateId, StateName
	from States
end

go

if exists(select * from INFORMATION_SCHEMA.ROUTINES
	where ROUTINE_NAME = 'BathroomTypesSelectAll')
		drop procedure BathroomTypesSelectAll
go

create procedure BathroomTypesSelectAll as
begin
	select BathroomTypeId, BathroomTypeName
	from BathroomTypes
	order by BathroomTypeName

end

go