use ShackUp
go

if exists(select * from sys.tables where name= 'Contacts')
	drop table Contacts
go

if exists(select * from sys.tables where name= 'Favorites')
	drop table Favorites
go

if exists(select * from sys.tables where name= 'Listings')
	drop table Listings
go

if exists(select * from sys.tables where name= 'States')
	drop table States
go

if exists(select * from sys.tables where name= 'BathroomTypes')
	drop table BathroomTypes
go

create table BathroomTypes (
	BathroomTypeId int identity(1,1) not null primary key,
	BathroomTypeName varchar(15) not null
)

create table States (
	StateId char(2) not null primary key,
	StateName varchar(15) not null
)

create table Listings (
	ListingId int identity(1,1) not null primary key,
	UserId nvarchar(128) not null,
	StateId char(2) not null foreign key references States(StateId),
	BathroomTypeId int null foreign key references BathroomTypes(BathroomTypeId),
	Nickname nvarchar(50) not null,
	City nvarchar(50) not null,
	Rate decimal(7,2) not null,
	SquareFootage decimal(7,2) not null,
	HasElectric bit not null,
	HasHeat bit not null,
	ImageFileName varchar(50),
	CreatedDate datetime2 not null default(getdate())
)

create table Favorites (
	ListingId int not null foreign key references Listings(ListingId),
	UserId nvarchar(128) not null,
	primary key (ListingID, UserId)
)

create table Contacts (
	ListingId int not null foreign key references Listings(ListingId),
	UserId nvarchar(128) not null,
	primary key (ListingID, UserId)
)















