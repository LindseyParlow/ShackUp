use ShackUp
go

if exists(select * from INFORMATION_SCHEMA.ROUTINES
	where ROUTINE_NAME = 'DbReset')
		drop procedure DbReset
go

create procedure DbReset as
begin
	delete from Listings
	delete from States;
	delete from BathroomTypes;
	delete from AspNetUsers where id = '00000000-0000-0000-0000-000000000000';


	insert into States(StateId, StateName)
	values ('OH', 'Ohio'),
	('KY', 'Kentucky'),
	('MN', 'Minnesota');

	set identity_insert BathroomTypes on;

	insert into BathroomTypes (BathroomTypeId, BathroomTypeName)
	values (1, 'Indoor'),
	(2, 'Outdoor'),
	(3, 'None')

	set identity_insert BathroomTypes off;

	insert into AspNetUsers(Id, EmailConfirmed, PhoneNumberConfirmed, Email, StateId, TwoFactorEnabled, LockoutEnabled, AccessFailedCount, UserName)
	values('00000000-0000-0000-0000-000000000000', 0, 0, 'test@test.com', 'OH', 0, 0, 0, 'test');

	set identity_insert Listings on;

	insert into Listings(ListingId, UserId, StateId, BathroomTypeId, Nickname, City, Rate, SquareFootage, HasElectric, HasHeat, ImageFileName)
	values(1, '00000000-0000-0000-0000-000000000000', 'OH', 3, 'Test shack 1', 'Cleveland', 120, 400, 0, 1, 'placeholder.png')

	set identity_insert Listings off;

end
