USE [master]
GO
/****** Object:  Database [DogSalon_AR]    
CREATE DATABASE [DogSalon_AR]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DogSalon_ARK', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\DogSalon_AR.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DogSalon_ARK_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\DogSalon_AR_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [DogSalon_AR] ADD FILEGROUP [Optimized_FG] CONTAINS MEMORY_OPTIMIZED_DATA 
GO
ALTER DATABASE [DogSalon_AR] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DogSalon_AR].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DogSalon_AR] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DogSalon_AR] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DogSalon_AR] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DogSalon_AR] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DogSalon_AR] SET ARITHABORT OFF 
GO
ALTER DATABASE [DogSalon_AR] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [DogSalon_AR] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DogSalon_AR] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DogSalon_AR] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DogSalon_AR] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DogSalon_AR] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DogSalon_AR] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DogSalon_AR] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DogSalon_AR] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DogSalon_AR] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DogSalon_AR] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DogSalon_AR] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DogSalon_AR] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DogSalon_AR] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DogSalon_AR] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DogSalon_AR] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DogSalon_AR] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DogSalon_AR] SET RECOVERY FULL 
GO
ALTER DATABASE [DogSalon_AR] SET  MULTI_USER 
GO
ALTER DATABASE [DogSalon_AR] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DogSalon_AR] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DogSalon_AR] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DogSalon_AR] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DogSalon_AR] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DogSalon_AR] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [DogSalon_AR] SET QUERY_STORE = OFF
GO
USE [DogSalon_AR]
GO
/****** Object:  Table [dbo].[Customer3History]   
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer3History](
	[CustomerId] [int] NOT NULL,
	[FirstName] [varchar](30) NOT NULL,
	[LastName] [varchar](30) NOT NULL,
	[AmountPurchased] [decimal](18, 0) NOT NULL,
	[StartDate] [datetime2](7) NOT NULL,
	[EndDate] [datetime2](7) NOT NULL
) ON [PRIMARY]
WITH
(
DATA_COMPRESSION = PAGE
)
GO
/****** Object:  Index [ix_Customer3History]    Script Date: 6/15/2023 7:27:28 PM ******
CREATE CLUSTERED INDEX [ix_Customer3History] ON [dbo].[Customer3History]
(
	[EndDate] ASC,
	[StartDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF, DATA_COMPRESSION = PAGE) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer_2]    ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer_2](
	[CustomerId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](30) NOT NULL,
	[LastName] [varchar](30) NOT NULL,
	[AmountPurchased] [decimal](18, 0) NOT NULL,
	[StartDate] [datetime2](7) GENERATED ALWAYS AS ROW START NOT NULL,
	[EndDate] [datetime2](7) GENERATED ALWAYS AS ROW END NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
	PERIOD FOR SYSTEM_TIME ([StartDate], [EndDate])
) ON [PRIMARY]
WITH
(
SYSTEM_VERSIONING = ON (HISTORY_TABLE = [dbo].[Customer3History])
)
GO
/****** Object:  Table [dbo].[Customer]     ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustID] [int] NOT NULL,
	[FirstName] [varchar](30) NULL,
	[LastName] [varchar](30) NULL,
	[Street] [varchar](50) NULL,
	[City] [varchar](30) NULL,
	[State] [char](2) NULL,
	[Zip] [char](5) NULL,
	[Phone] [char](14) NULL,
	[Email] [varchar](50) NULL,
 CONSTRAINT [PK__Customer__049E3A897B9914D6] PRIMARY KEY CLUSTERED 
(
	[CustID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dog]     ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dog](
	[DogID] [int] NOT NULL,
	[Name] [varchar](30) NULL,
	[Breed] [varchar](30) NULL,
	[Temper] [varchar](30) NULL,
	[DOB] [date] NULL,
	[CustID] [int] NULL,
	[Age]  AS (datediff(year,[DOB],getdate())),
 CONSTRAINT [PK__Dog__46F46EC9495EF1E8] PRIMARY KEY CLUSTERED 
(
	[DogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeID] [int] NOT NULL,
	[FirstName] [varchar](20) NULL,
	[LastName] [varchar](30) NULL,
	[Street] [varchar](50) NULL,
	[City] [varchar](30) NULL,
	[State] [char](2) NULL,
	[Zip] [char](5) NULL,
	[Phone] [char](14) NULL,
	[Email] [varchar](60) NULL,
 CONSTRAINT [PK__Employee__7AD04FF12462C205] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FamilyMember]   ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FamilyMember](
	[FamID] [int] NOT NULL,
	[Name] [varchar](30) NULL,
	[CustID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[FamID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ImportedCustomer]  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImportedCustomer](
	[CustID] [nvarchar](50) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Street] [nvarchar](50) NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[State] [nvarchar](50) NOT NULL,
	[Zip] [int] NOT NULL,
	[Phone] [float] NOT NULL,
	[Email] [nvarchar](100) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ImportedDog]   ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImportedDog](
	[DogID] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Breed] [nvarchar](50) NOT NULL,
	[Temper] [nvarchar](50) NOT NULL,
	[DOB] [nvarchar](50) NOT NULL,
	[CustID] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ImportedEmployee]    ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImportedEmployee](
	[EmployeeID] [nvarchar](50) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Street] [nvarchar](50) NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[State] [nvarchar](50) NOT NULL,
	[Zip] [int] NOT NULL,
	[Phone] [float] NOT NULL,
	[Email] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ImportedFamMember]   ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImportedFamMember](
	[FamID] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[CustID] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ImportedPrevServ]     ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImportedPrevServ](
	[DogID] [nvarchar](50) NOT NULL,
	[PrefServ] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ImportedProduct]   ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImportedProduct](
	[ProductID] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Descrip] [nvarchar](50) NOT NULL,
	[UnitsOnHand] [nvarchar](50) NOT NULL,
	[CostPerUnit] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ImportedService]    ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImportedService](
	[ServiceID] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[Price] [money] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ImportedServiceProduct]  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImportedServiceProduct](
	[ServiceID] [nvarchar](50) NOT NULL,
	[ProductID] [nvarchar](50) NOT NULL,
	[Quantity] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ImportedServiceProvided]   ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImportedServiceProvided](
	[TransactionID] [nvarchar](50) NOT NULL,
	[Date] [nvarchar](50) NOT NULL,
	[DogID] [nvarchar](50) NOT NULL,
	[EmployeeID] [nvarchar](50) NOT NULL,
	[ServiceID] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ImportedSupplier]     ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImportedSupplier](
	[SupplierID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Street] [nvarchar](50) NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[State] [nvarchar](50) NOT NULL,
	[Zip] [int] NOT NULL,
	[Phone] [float] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ImportedSupplierProduct]     ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImportedSupplierProduct](
	[OrderID] [nvarchar](50) NOT NULL,
	[DateOrdered] [nvarchar](50) NOT NULL,
	[Quantity] [int] NOT NULL,
	[SupplierID] [int] NOT NULL,
	[ProductID] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PreferredService]     ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PreferredService](
	[DogID] [int] NOT NULL,
	[PrefServ] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DogID] ASC,
	[PrefServ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]   ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [int] NOT NULL,
	[Name] [varchar](20) NULL,
	[Descrip] [varchar](30) NULL,
	[UnitsOnHand] [int] NULL,
	[CostPerUnit] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[ServiceID] [int] NOT NULL,
	[Description] [nvarchar](100) NULL,
	[Price] [money] NULL,
	[Discount] [money] NULL,
 CONSTRAINT [PK__Service__C51BB0EA962CB0F1] PRIMARY KEY CLUSTERED 
(
	[ServiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServiceProduct]  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceProduct](
	[ServiceID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Units] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ServiceID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServiceProvided]   ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceProvided](
	[TransactionID] [int] NOT NULL,
	[Date] [date] NULL,
	[DogID] [int] NULL,
	[EmployeeID] [int] NULL,
	[ServiceID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[TransactionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]   ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[SupplierID] [int] NOT NULL,
	[Name] [varchar](20) NULL,
	[Street] [varchar](60) NULL,
	[City] [varchar](25) NULL,
	[State] [char](2) NULL,
	[Zip] [char](5) NULL,
	[Phone] [char](14) NULL,
 CONSTRAINT [PK__Supplier__4BE666948F0713AD] PRIMARY KEY CLUSTERED 
(
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SupplierProduct]  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SupplierProduct](
	[OrderID] [int] NOT NULL,
	[DateOrdered] [date] NULL,
	[Quantity] [int] NULL,
	[SupplierID] [int] NULL,
	[ProductID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Dog]  WITH CHECK ADD  CONSTRAINT [FK__Dog__CustID__267ABA7A] FOREIGN KEY([CustID])
REFERENCES [dbo].[Customer] ([CustID])
GO
ALTER TABLE [dbo].[Dog] CHECK CONSTRAINT [FK__Dog__CustID__267ABA7A]
GO
ALTER TABLE [dbo].[FamilyMember]  WITH CHECK ADD  CONSTRAINT [FK__FamilyMem__CustI__300424B4] FOREIGN KEY([CustID])
REFERENCES [dbo].[Customer] ([CustID])
GO
ALTER TABLE [dbo].[FamilyMember] CHECK CONSTRAINT [FK__FamilyMem__CustI__300424B4]
GO
ALTER TABLE [dbo].[PreferredService]  WITH CHECK ADD  CONSTRAINT [FK__Preferred__DogID__4F7CD00D] FOREIGN KEY([DogID])
REFERENCES [dbo].[Dog] ([DogID])
GO
ALTER TABLE [dbo].[PreferredService] CHECK CONSTRAINT [FK__Preferred__DogID__4F7CD00D]
GO
ALTER TABLE [dbo].[PreferredService]  WITH CHECK ADD  CONSTRAINT [FK__Preferred__PrefS__5070F446] FOREIGN KEY([PrefServ])
REFERENCES [dbo].[Service] ([ServiceID])
GO
ALTER TABLE [dbo].[PreferredService] CHECK CONSTRAINT [FK__Preferred__PrefS__5070F446]
GO
ALTER TABLE [dbo].[ServiceProduct]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[ServiceProduct]  WITH CHECK ADD  CONSTRAINT [FK__ServicePr__Servi__3B75D760] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Service] ([ServiceID])
GO
ALTER TABLE [dbo].[ServiceProduct] CHECK CONSTRAINT [FK__ServicePr__Servi__3B75D760]
GO
ALTER TABLE [dbo].[ServiceProvided]  WITH CHECK ADD  CONSTRAINT [FK__ServicePr__DogID__34C8D9D1] FOREIGN KEY([DogID])
REFERENCES [dbo].[Dog] ([DogID])
GO
ALTER TABLE [dbo].[ServiceProvided] CHECK CONSTRAINT [FK__ServicePr__DogID__34C8D9D1]
GO
ALTER TABLE [dbo].[ServiceProvided]  WITH CHECK ADD  CONSTRAINT [FK__ServicePr__Emplo__35BCFE0A] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[ServiceProvided] CHECK CONSTRAINT [FK__ServicePr__Emplo__35BCFE0A]
GO
ALTER TABLE [dbo].[ServiceProvided]  WITH CHECK ADD  CONSTRAINT [FK__ServicePr__Servi__36B12243] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Service] ([ServiceID])
GO
ALTER TABLE [dbo].[ServiceProvided] CHECK CONSTRAINT [FK__ServicePr__Servi__36B12243]
GO
ALTER TABLE [dbo].[SupplierProduct]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[SupplierProduct]  WITH CHECK ADD  CONSTRAINT [FK__SupplierP__Suppl__412EB0B6] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Supplier] ([SupplierID])
GO
ALTER TABLE [dbo].[SupplierProduct] CHECK CONSTRAINT [FK__SupplierP__Suppl__412EB0B6]
GO
ALTER TABLE [dbo].[Service]  WITH CHECK ADD  CONSTRAINT [CK_Service_Description] CHECK  (([Description]='washes' OR [Description]='haircuts' OR [Description]='hairstyles' OR [Description]='nailtrimming' OR [Description]='nailpainting' OR [Description]='fleatreatments'))
GO
ALTER TABLE [dbo].[Service] CHECK CONSTRAINT [CK_Service_Description]
GO
/****** Object:  StoredProcedure [dbo].[CostOfServices] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[CostOfServices]
as
begin
select sp.dogID, sum(s.price) as 'Tot Cost'
from Service s
join ServiceProvided sp
on s.ServiceID=sp.ServiceID
group by sp.dogID
order by 'Tot Cost' desc;
end
GO
/****** Object:  StoredProcedure [dbo].[LoopHint]  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[LoopHint]
as
begin
--LOOP
select b.bedID, w.wardID
from bed b
left LOOP join Ward w
on b.WardID = w.WardID
end;
GO
/****** Object:  StoredProcedure [dbo].[procServicesForDog]  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[procServicesForDog]
as
begin
select sp.dogID, avg(s.price) as 'Avg Cost'
from Service s
join ServiceProvided sp
on s.ServiceID=sp.ServiceID
group by sp.dogID
end;
GO
/****** Object:  StoredProcedure [dbo].[ServiceByEmployee] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ServiceByEmployee]
as
begin
Select count(s.ServiceID) as TotalServices, sp.EmployeeID, sp.DogID
from Service s
join ServiceProvided sp
on sp.ServiceID=s.ServiceID
where date between '2020-01-01' and '2021-10-10'
group by sp.DogID,sp.EmployeeID
end;
GO
/****** Object:  StoredProcedure [dbo].[ServiceProductsDog]   ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ServiceProductsDog]
as
begin
select s.dogID,s.ServiceId,p.productID
from ServiceProvided s
join ServiceProduct p
on s.ServiceID=p.ServiceID
order by s.DogID
end;
GO
/****** Object:  StoredProcedure [dbo].[ServicesForDog]  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ServicesForDog]
as
begin
select sp.dogID, avg(s.price) as 'Avg Cost'
from Service s
join ServiceProvided sp
on s.ServiceID=sp.ServiceID
group by sp.dogID
end;
GO
/****** Object:  StoredProcedure [dbo].[SumOfCosts]  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SumOfCosts]
as
begin
select sp.EmployeeID, sum(s.Price) as 'Total Cost'
from ServiceProvided sp
join Service s
on sp.ServiceID=s.ServiceID
where sp.Date between '2020-01-01' and '2022-12-30'
group by sp.EmployeeID
order by [Total Cost] desc
end;
GO
/****** Object:  StoredProcedure [dbo].[TotalCostServices]  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[TotalCostServices]
as
begin
Select d.CustID, sp.DogID, sum(s.Price) as TotalCost, count(s.ServiceID) as TotalServices
from Service s
Join ServiceProvided sp
on sp.ServiceID = s.ServiceID
join Dog d
on sp.DogID=d.DogID
group by CustID, sp.DogID
order by TotalCost desc, TotalServices desc
end;
GO
USE [master]
GO
ALTER DATABASE [DogSalon_AR] SET  READ_WRITE 
GO
