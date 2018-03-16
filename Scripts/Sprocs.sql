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

if exists(select * from INFORMATION_SCHEMA.ROUTINES
	where ROUTINE_NAME = 'ListingsInsert')
		drop procedure ListingsInsert
go

create procedure ListingsInsert (
	@ListingId int output,
	@UserId nvarchar(128),
	@StateId char(2),
	@BathroomTypeId int,
	@Nickname nvarchar(50),
	@City nvarchar(50),
	@Rate decimal(7,2),
	@SquareFootage decimal(7,2),
	@HasElectric bit,
	@HasHeat bit,
	@ImageFileName varchar(50)
) as
begin
	insert into Listings(UserId, StateId, BathroomTypeId, Nickname, City, Rate, SquareFootage, HasElectric, 
		HasHeat, ImageFileName)
	values (@UserId, @StateId, @BathroomTypeId, @Nickname, @City, @Rate, @SquareFootage, @HasElectric, @HasHeat, @ImageFileName);

	set @ListingId = SCOPE_IDENTITY();

end
go

if exists(select * from INFORMATION_SCHEMA.ROUTINES
	where ROUTINE_NAME = 'ListingsUpdate')
		drop procedure ListingsUpdate
go

create procedure ListingsUpdate (
	@ListingId int,
	@UserId nvarchar(128),
	@StateId char(2),
	@BathroomTypeId int,
	@Nickname nvarchar(50),
	@City nvarchar(50),
	@Rate decimal(7,2),
	@SquareFootage decimal(7,2),
	@HasElectric bit,
	@HasHeat bit,
	@ImageFileName varchar(50)
) as
begin
	update Listings set 
		UserId = @UserId, 
		StateId = @StateId, 
		BathroomTypeId = @BathroomTypeId, 
		Nickname = @Nickname, 
		City = @City, 
		Rate = @Rate, 
		SquareFootage = @SquareFootage, 
		HasElectric = @HasElectric, 
		HasHeat = @HasHeat, 
		ImageFileName = @ImageFileName
	where ListingId = @ListingId

end
go

if exists(select * from INFORMATION_SCHEMA.ROUTINES
	where ROUTINE_NAME = 'ListingsDelete')
		drop procedure ListingsDelete
go

create procedure ListingsDelete (
	@ListingsId int
)as 
begin
	begin transaction

	delete from Contacts where ListingId = @ListingsId;
	delete from Favorites where ListingId = @ListingsId;
	delete from Listings where ListingId = @ListingsId;

	commit transaction
end
go


if exists(select * from INFORMATION_SCHEMA.ROUTINES
	where ROUTINE_NAME = 'ListingsSelect')
		drop procedure ListingsSelect
go

create procedure ListingsSelect (
	@ListingId int
)as 
begin
	select ListingId, UserId, StateId, BathroomTypeId, Nickname, City, Rate, SquareFootage, HasElectric, HasHeat, ImageFileName
	from Listings
	where ListingId = @ListingId
end
go