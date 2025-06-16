--PROPERTY ANALYSIS--
--Loading Tables

--Load_Crime Table
Create Table Load_Crime (
State nvarchar(50),
Suburb nvarchar(50),
Postcode int,
Offence_Category nvarchar(150),
Offence_Subcategory nvarchar(150),
Recorded_Incidents int 
);

--Load_AUS_Suburb Table
Create Table Load_AUS_Suburb (
State nvarchar(50),
State_Code nvarchar (50),
Suburb nvarchar(50),
City nvarchar(50),
lat Float,
Lon Float, 
);

--Load_HouseValue 
Create Table Load_Housevalue (
State_Code nvarchar (25),
Suburb nvarchar(50),
Postcode int,
Housevalue int
);

--Load_Rentalvalue
Create Table Load_Rentalvalue (
State_Code nvarchar (25),
Suburb nvarchar(50),
Rental_Housetype nvarchar(100),
Rental_Amount int
);

--Load_School
Create Table Load_School (
State_Code nvarchar (50),
Suburb nvarchar(200),
Postcode int,
Schoolcode int,
School_Name nvarchar(100),
School_Type nvarchar(100),
School_Address nvarchar(100)
);

--Load_Transport
Create Table Load_Transport (
State_Code nvarchar (50),
Suburb nvarchar(50),
Stop_Name nvarchar(100),
Mode nvarchar(25),
Stop_Lat float,
Stop_Lon float
);

--Dimensional Tables
DROP Table [dbo].[Dim_Location]
-- Dim_Location
create Table Dim_Location(
Location_Key int PRIMARY KEY IDENTITY(1,1),
State_code nvarchar (50),
State nvarchar(50),
City nvarchar(50),
Suburb nvarchar(50),
Postcode int,
lat Float,
Lon Float, 
);

--Dim_School
Create Table Dim_School (
School_Key int PRIMARY KEY IDENTITY(1,1),
Location_Key int,
Schoolcode int,
School_Name nvarchar(100),
School_Type nvarchar(100),
School_Address nvarchar(100)
);

--Dim_Transport
Create Table Dim_Transport (
Transport_Key int PRIMARY KEY IDENTITY(1,1),
Location_Key int,
Stop_Name nvarchar(100),
Mode nvarchar(25),
Stop_Lat float,
Stop_Lon float
);

-- Fact_HouseValue
Create Table Fact_HouseValue(
House_Key int PRIMARY KEY IDENTITY(1,1),
Location_Key int,
Housevalue int
);

-- Fact_Rentalvalue
Create Table Fact_Rentalvalue (
Rental_Key int PRIMARY KEY IDENTITY(1,1),
Location_Key int,
Rental_Housetype nvarchar(100),
Rental_Amount int
);


--Fact_Crime
Create Table Fact_Crime (
Crime_key int PRIMARY KEY IDENTITY(1,1),
Location_Key int,
Offence_Category nvarchar(150),
Offence_Subcategory nvarchar(150),
Recorded_Incidents int 
);

Drop Table [dbo].[Dim_Location];
Drop Table [dbo].[Dim_School];
Drop Table [dbo].[Dim_Transport];
Drop Table [dbo].[Fact_Crime];
Drop Table [dbo].[Fact_HouseValue];
Drop Table [dbo].[Fact_Rentalvalue];


DELETE FROM [dbo].[Dim_Location]
WHERE [State] IS NULL
  AND [City]  IS NULL
  AND [Postcode] IS NULL
   AND [lat] IS NULL
  AND [Lon] IS NULL
  AND [Postcode] IS NULL;

DELETE FROM [dbo].[Dim_Location]
WHERE [State] IS NULL
  AND [City]  IS NULL
  AND [lat] IS NULL
  AND [Lon] IS NULL;

DELETE FROM [dbo].[Dim_Location]
WHERE [State] IS NULL
  
DELETE FROM [dbo].[Dim_Location]
WHERE [Postcode] IS NULL;