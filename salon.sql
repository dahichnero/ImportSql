USE [master]
GO
/****** Object:  Database [SalonB]    Script Date: 19.12.2022 19:06:42 ******/
CREATE DATABASE [SalonB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SalonB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\SalonB.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SalonB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\SalonB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [SalonB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SalonB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SalonB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SalonB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SalonB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SalonB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SalonB] SET ARITHABORT OFF 
GO
ALTER DATABASE [SalonB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SalonB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SalonB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SalonB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SalonB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SalonB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SalonB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SalonB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SalonB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SalonB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SalonB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SalonB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SalonB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SalonB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SalonB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SalonB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SalonB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SalonB] SET RECOVERY FULL 
GO
ALTER DATABASE [SalonB] SET  MULTI_USER 
GO
ALTER DATABASE [SalonB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SalonB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SalonB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SalonB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SalonB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SalonB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'SalonB', N'ON'
GO
ALTER DATABASE [SalonB] SET QUERY_STORE = ON
GO
ALTER DATABASE [SalonB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [SalonB]
GO
/****** Object:  Table [dbo].[AttachedProduct]    Script Date: 19.12.2022 19:06:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AttachedProduct](
	[MainProductID] [int] NOT NULL,
	[AttachedProductID] [int] NOT NULL,
 CONSTRAINT [PK_AttachedProduct] PRIMARY KEY CLUSTERED 
(
	[MainProductID] ASC,
	[AttachedProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 19.12.2022 19:06:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Patronymic] [nvarchar](50) NULL,
	[Birthday] [date] NULL,
	[RegistrationDate] [datetime] NOT NULL,
	[Email] [nvarchar](255) NULL,
	[Phone] [nvarchar](20) NOT NULL,
	[GenderCode] [nchar](1) NOT NULL,
	[PhotoPath] [nvarchar](1000) NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientService]    Script Date: 19.12.2022 19:06:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientService](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ClientID] [int] NOT NULL,
	[ServiceID] [int] NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[Comment] [nvarchar](max) NULL,
 CONSTRAINT [PK_ClientService] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DocumentByService]    Script Date: 19.12.2022 19:06:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocumentByService](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ClientServiceID] [int] NOT NULL,
	[DocumentPath] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_DocumentByService] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gender]    Script Date: 19.12.2022 19:06:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gender](
	[Code] [nchar](1) NOT NULL,
	[Name] [nvarchar](10) NULL,
 CONSTRAINT [PK_Gender] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manufacturer]    Script Date: 19.12.2022 19:06:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufacturer](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[StartDate] [date] NULL,
 CONSTRAINT [PK_Manufacturer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 19.12.2022 19:06:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Cost] [money] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[MainImagePath] [nvarchar](1000) NULL,
	[IsActive] [bit] NOT NULL,
	[ManufacturerID] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductPhoto]    Script Date: 19.12.2022 19:06:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductPhoto](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[PhotoPath] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_ProductPhoto] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductSale]    Script Date: 19.12.2022 19:06:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductSale](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SaleDate] [datetime] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[ClientServiceID] [int] NULL,
 CONSTRAINT [PK_ProductSale] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 19.12.2022 19:06:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[Cost] [money] NOT NULL,
	[DurationInSeconds] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Discount] [float] NULL,
	[MainImagePath] [nvarchar](max) NULL,
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServicePhoto]    Script Date: 19.12.2022 19:06:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServicePhoto](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ServiceID] [int] NOT NULL,
	[PhotoPath] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_ServicePhoto] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tag]    Script Date: 19.12.2022 19:06:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tag](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](30) NOT NULL,
	[Color] [nchar](6) NOT NULL,
 CONSTRAINT [PK_Tag] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TagOfClient]    Script Date: 19.12.2022 19:06:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TagOfClient](
	[ClientID] [int] NOT NULL,
	[TagID] [int] NOT NULL,
 CONSTRAINT [PK_TagOfClient] PRIMARY KEY CLUSTERED 
(
	[ClientID] ASC,
	[TagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[AttachedProduct] ([MainProductID], [AttachedProductID]) VALUES (1, 2)
INSERT [dbo].[AttachedProduct] ([MainProductID], [AttachedProductID]) VALUES (1, 3)
INSERT [dbo].[AttachedProduct] ([MainProductID], [AttachedProductID]) VALUES (4, 5)
INSERT [dbo].[AttachedProduct] ([MainProductID], [AttachedProductID]) VALUES (4, 6)
INSERT [dbo].[AttachedProduct] ([MainProductID], [AttachedProductID]) VALUES (4, 7)
INSERT [dbo].[AttachedProduct] ([MainProductID], [AttachedProductID]) VALUES (8, 9)
INSERT [dbo].[AttachedProduct] ([MainProductID], [AttachedProductID]) VALUES (8, 10)
INSERT [dbo].[AttachedProduct] ([MainProductID], [AttachedProductID]) VALUES (8, 17)
INSERT [dbo].[AttachedProduct] ([MainProductID], [AttachedProductID]) VALUES (11, 12)
INSERT [dbo].[AttachedProduct] ([MainProductID], [AttachedProductID]) VALUES (14, 13)
INSERT [dbo].[AttachedProduct] ([MainProductID], [AttachedProductID]) VALUES (14, 15)
INSERT [dbo].[AttachedProduct] ([MainProductID], [AttachedProductID]) VALUES (14, 16)
INSERT [dbo].[AttachedProduct] ([MainProductID], [AttachedProductID]) VALUES (18, 19)
INSERT [dbo].[AttachedProduct] ([MainProductID], [AttachedProductID]) VALUES (18, 20)
GO
SET IDENTITY_INSERT [dbo].[Client] ON 

INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (1, N'Кузьмина', N'Дэнна', N'Витальевна', CAST(N'1993-08-24' AS Date), CAST(N'2016-03-27T00:00:00.000' AS DateTime), N'nichoj@mac.com', N'7(9940)977-45-73 ', N'2', N'Паспорта\passport1.png')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (2, N'Мамонтова', N'Марфа', N'Мироновна', CAST(N'1984-10-19' AS Date), CAST(N'2018-02-27T00:00:00.000' AS DateTime), N'rfoley@verizon.net', N'7(38)095-64-18 ', N'2', N'Паспорта\passport2.png')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (3, N'Степанова', N'Амелия', N'Робертовна', CAST(N'1970-06-06' AS Date), CAST(N'2017-09-27T00:00:00.000' AS DateTime), N'rasca@hotmail.com', N'7(1217)441-28-42 ', N'2', N'Паспорта\passport3.png')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (4, N'Колесникова', N'Алина', N'Еремеевна', CAST(N'2001-04-19' AS Date), CAST(N'2017-01-18T00:00:00.000' AS DateTime), N'gfxguy@outlook.com', N'7(74)977-39-71 ', N'2', N'Паспорта\passport4.png')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (5, N'Морозов', N'Наум', N'Валерьянович', CAST(N'1985-07-04' AS Date), CAST(N'2016-05-02T00:00:00.000' AS DateTime), N'salesgeek@mac.com', N'7(636)050-96-13 ', N'1', N'Паспорта\passport5.png')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (6, N'Сысоева', N'Дарина', N'Ярославовна', CAST(N'1982-02-03' AS Date), CAST(N'2016-05-13T00:00:00.000' AS DateTime), N'treit@verizon.net', N'7(0698)387-96-04 ', N'2', N'Паспорта\passport6.png')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (7, N'Горбачёва', N'Никки', N'Еремеевна', CAST(N'1987-04-21' AS Date), CAST(N'2018-08-16T00:00:00.000' AS DateTime), N'chinthaka@att.net', N'7(94)789-69-20 ', N'2', N'Паспорта\passport7.png')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (8, N'Бирюкова', N'Инара', N'Улебовна', CAST(N'1978-07-21' AS Date), CAST(N'2017-10-01T00:00:00.000' AS DateTime), N'smpeters@hotmail.com', N'7(098)346-50-58 ', N'2', N'Паспорта\passport8.png')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (9, N'Киселёв', N'Устин', N'Яковлевич', CAST(N'1985-01-08' AS Date), CAST(N'2018-06-21T00:00:00.000' AS DateTime), N'dalamb@verizon.net', N'7(83)334-52-76 ', N'1', N'Паспорта\passport9.png')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (10, N'Крюкова', N'Авигея', N'Святославовна', CAST(N'2000-08-10' AS Date), CAST(N'2018-01-03T00:00:00.000' AS DateTime), N'simone@gmail.com', N'7(499)318-88-53 ', N'2', N'Паспорта\passport10.png')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (11, N'Костина', N'Любава', N'Авксентьевна', CAST(N'1972-07-13' AS Date), CAST(N'2016-02-26T00:00:00.000' AS DateTime), N'gordonjcp@hotmail.com', N'7(6419)959-21-87 ', N'2', N'Паспорта\passport11.png')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (12, N'Попова', N'Харита', N'Якуновна', CAST(N'1997-12-16' AS Date), CAST(N'2016-07-05T00:00:00.000' AS DateTime), N'firstpr@verizon.net', N'7(335)386-81-06 ', N'2', N'Паспорта\passport12.png')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (13, N'Андреева', N'Патрисия', N'Валерьевна', CAST(N'1993-11-18' AS Date), CAST(N'2016-07-17T00:00:00.000' AS DateTime), N'jigsaw@aol.com', N'7(9648)953-81-26 ', N'2', N'Паспорта\passport13.png')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (14, N'Гусева', N'Роза', N'Дмитриевна', CAST(N'1999-02-13' AS Date), CAST(N'2017-12-12T00:00:00.000' AS DateTime), N'martyloo@live.com', N'7(23)064-51-84 ', N'2', N'Паспорта\passport14.png')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (15, N'Быков', N'Трофим', N'Константинович', CAST(N'1994-12-20' AS Date), CAST(N'2016-04-17T00:00:00.000' AS DateTime), N'jguyer@aol.com', N'7(3414)460-12-05 ', N'1', N'Паспорта\passport15.png')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (16, N'Гусев', N'Яков', N'Авксентьевич', CAST(N'1995-12-10' AS Date), CAST(N'2017-11-20T00:00:00.000' AS DateTime), N'jdhedden@icloud.com', N'7(0972)781-11-37 ', N'1', N'Паспорта\passport16.png')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (17, N'Турова', N'Георгина', N'Семёновна', CAST(N'1974-05-28' AS Date), CAST(N'2018-02-22T00:00:00.000' AS DateTime), N'yruan@optonline.net', N'7(555)321-42-99 ', N'2', N'Паспорта\passport17.png')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (18, N'Трофимова', N'Альжбета', N'Якововна', CAST(N'1988-10-22' AS Date), CAST(N'2017-09-21T00:00:00.000' AS DateTime), N'gbacon@mac.com', N'7(1084)658-92-95 ', N'2', N'Паспорта\passport18.png')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (19, N'Баранова', N'Эльмира', N'Дмитриевна', CAST(N'1977-01-15' AS Date), CAST(N'2016-07-08T00:00:00.000' AS DateTime), N'jgmyers@comcast.net', N'7(9240)643-15-50 ', N'2', N'Паспорта\passport19.png')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (20, N'Федотов', N'Осип', N'Анатольевич', CAST(N'1971-04-13' AS Date), CAST(N'2018-07-23T00:00:00.000' AS DateTime), N'breegster@hotmail.com', N'7(590)702-33-06 ', N'1', N'Паспорта\passport20.png')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (21, N'Борисов', N'Аввакум', N'Артемович', CAST(N'1974-04-25' AS Date), CAST(N'2017-03-11T00:00:00.000' AS DateTime), N'chlim@live.com', N'7(2296)930-08-88 ', N'1', N'Паспорта\passport21.png')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (22, N'Артемьева', N'Лиза', N'Максимовна', CAST(N'1996-05-17' AS Date), CAST(N'2018-10-07T00:00:00.000' AS DateTime), N'snunez@yahoo.ca', N'7(696)972-70-21 ', N'2', N'Паспорта\passport22.png')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (23, N'Воронова', N'Изабелла', N'Вячеславовна', CAST(N'1999-09-24' AS Date), CAST(N'2017-12-21T00:00:00.000' AS DateTime), N'kildjean@sbcglobal.net', N'7(17)433-44-98 ', N'2', N'Паспорта\passport23.png')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (24, N'Федотова', N'Сандра', N'Владленовна', CAST(N'1985-03-29' AS Date), CAST(N'2016-11-08T00:00:00.000' AS DateTime), N'penna@verizon.net', N'7(126)195-25-86 ', N'2', N'Паспорта\passport24.png')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (25, N'Ефремов', N'Витольд', N'Авксентьевич', CAST(N'1975-12-02' AS Date), CAST(N'2018-04-09T00:00:00.000' AS DateTime), N'kwilliams@yahoo.ca', N'7(93)922-14-03 ', N'1', N'Паспорта\passport25.png')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (26, N'Ермакова', N'Алла', N'Мироновна', CAST(N'1976-01-22' AS Date), CAST(N'2017-02-09T00:00:00.000' AS DateTime), N'whimsy@aol.com', N'7(06)437-13-73 ', N'2', N'Паспорта\passport26.png')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (27, N'Шашкова', N'Гелла', N'Эдуардовна', CAST(N'1979-02-24' AS Date), CAST(N'2016-11-16T00:00:00.000' AS DateTime), N'jadavis@mac.com', N'7(57)446-21-04 ', N'2', N'Паспорта\passport27.png')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (28, N'Быкова', N'Тала', N'Георгьевна', CAST(N'2000-02-22' AS Date), CAST(N'2016-08-13T00:00:00.000' AS DateTime), N'ganter@optonline.net', N'7(13)915-53-53 ', N'2', N'Паспорта\passport28.png')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (29, N'Орлова', N'Влада', N'Мартыновна', CAST(N'1990-06-26' AS Date), CAST(N'2016-03-21T00:00:00.000' AS DateTime), N'rnelson@yahoo.ca', N'7(2506)433-38-35 ', N'2', N'Паспорта\passport29.png')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (30, N'Анисимова', N'Тамара', N'Витальевна', CAST(N'1988-06-16' AS Date), CAST(N'2016-02-25T00:00:00.000' AS DateTime), N'schwaang@mac.com', N'7(66)128-04-10 ', N'2', N'Паспорта\passport30.png')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (31, N'Архипова', N'Прасковья', N'Валерьевна', CAST(N'1979-01-09' AS Date), CAST(N'2018-07-23T00:00:00.000' AS DateTime), N'cgcra@live.com', N'7(86)540-10-21 ', N'2', N'Паспорта\passport31.png')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (32, N'Новиков', N'Адриан', N'Аркадьевич', CAST(N'1974-01-15' AS Date), CAST(N'2018-11-23T00:00:00.000' AS DateTime), N'multiplx@verizon.net', N'7(70)572-33-62 ', N'1', N'Паспорта\passport32.png')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (33, N'Лазарева', N'Эльвина', N'Робертовна', CAST(N'1996-02-16' AS Date), CAST(N'2018-04-11T00:00:00.000' AS DateTime), N'ahuillet@comcast.net', N'7(5564)609-81-37 ', N'2', N'Паспорта\passport33.png')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (34, N'Афанасьева', N'Розалия', N'Макаровна', CAST(N'1977-05-01' AS Date), CAST(N'2017-09-06T00:00:00.000' AS DateTime), N'malattia@hotmail.com', N'7(0661)413-23-32 ', N'2', N'Паспорта\passport34.png')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (35, N'Устинова', N'Юнона', N'Валентиновна', CAST(N'1982-08-08' AS Date), CAST(N'2017-05-28T00:00:00.000' AS DateTime), N'kempsonc@live.com', N'7(33)367-13-07', N'2', N'Паспорта\passport35.png')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (36, N'Алексеева', N'Элина', N'Матвеевна', CAST(N'2002-05-07' AS Date), CAST(N'2018-03-28T00:00:00.000' AS DateTime), N'pthomsen@verizon.net', N'7(8086)245-64-81 ', N'2', N'Паспорта\passport36.png')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (37, N'Гущина', N'Янита', N'Федоровна', CAST(N'1999-03-02' AS Date), CAST(N'2018-02-01T00:00:00.000' AS DateTime), N'lishoy@att.net', N'7(4544)716-68-96 ', N'2', N'Паспорта\passport37.png')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (38, N'Суворова', N'Божена', N'Анатольевна', CAST(N'1981-03-09' AS Date), CAST(N'2016-01-28T00:00:00.000' AS DateTime), N'attwood@aol.com', N'7(347)895-86-57 ', N'2', N'Паспорта\passport38.png')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (39, N'Горшкова', N'Марта', N'Иосифовна', CAST(N'2001-02-13' AS Date), CAST(N'2016-08-04T00:00:00.000' AS DateTime), N'gbacon@mac.com', N'7(544)650-59-03', N'2', N'Паспорта\passport39.png')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (40, N'Смирнов', N'Мартын', N'Арсеньевич', CAST(N'1996-06-25' AS Date), CAST(N'2017-02-07T00:00:00.000' AS DateTime), N'haddawy@live.com', N'7(6251)589-02-43 ', N'1', N'Паспорта\passport40.png')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (41, N'Корнилова', N'Анэля', N'Михайловна', CAST(N'1973-04-02' AS Date), CAST(N'2016-05-22T00:00:00.000' AS DateTime), N'jonathan@aol.com', N'7(20)980-01-60 ', N'2', N'Паспорта\passport41.png')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (42, N'Ефимова', N'Магда', N'Платоновна', CAST(N'1995-08-16' AS Date), CAST(N'2017-08-01T00:00:00.000' AS DateTime), N'rbarreira@me.com', N'7(9261)386-15-92 ', N'2', N'Паспорта\passport42.png')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (43, N'Бурова', N'Светлана', N'Лукьевна', CAST(N'1979-01-04' AS Date), CAST(N'2016-10-13T00:00:00.000' AS DateTime), N'wsnyder@aol.com', N'7(358)173-82-21 ', N'2', N'Паспорта\passport43.png')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (44, N'Сидорова', N'Татьяна', N'Михайловна', CAST(N'1974-04-24' AS Date), CAST(N'2018-10-03T00:00:00.000' AS DateTime), N'tbeck@mac.com', N'7(51)732-91-79 ', N'2', N'Паспорта\passport44.png')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (45, N'Ершова', N'Номи', N'Андреевна', CAST(N'2001-09-13' AS Date), CAST(N'2016-06-30T00:00:00.000' AS DateTime), N'miltchev@mac.com', N'7(7757)315-90-99 ', N'2', N'Паспорта\passport45.png')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (46, N'Овчинникова', N'Лаура', N'Еремеевна', CAST(N'1992-04-03' AS Date), CAST(N'2018-11-24T00:00:00.000' AS DateTime), N'carcus@yahoo.ca', N'7(85)829-33-79 ', N'2', N'Паспорта\passport46.png')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (47, N'Мишина', N'Иветта', N'Андреевна', CAST(N'2002-10-05' AS Date), CAST(N'2016-01-24T00:00:00.000' AS DateTime), N'aukjan@yahoo.com', N'7(3926)244-81-96 ', N'2', N'Паспорта\passport47.png')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (48, N'Колобова', N'Злата', N'Романовна', CAST(N'1994-08-25' AS Date), CAST(N'2016-12-03T00:00:00.000' AS DateTime), N'sinkou@aol.com', N'7(50)884-07-35 ', N'2', N'Паспорта\passport48.png')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (49, N'Селиверстов', N'Глеб', N'Максимович', CAST(N'1999-06-20' AS Date), CAST(N'2016-01-07T00:00:00.000' AS DateTime), N'jigsaw@sbcglobal.net', N'7(20)554-28-68 ', N'1', N'Паспорта\passport49.png')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (50, N'Дмитриева', N'Элина', N'Даниловна', CAST(N'1988-12-10' AS Date), CAST(N'2017-02-11T00:00:00.000' AS DateTime), N'vmalik@live.com', N'7(787)140-48-84 ', N'2', N'Паспорта\passport50.png')
SET IDENTITY_INSERT [dbo].[Client] OFF
GO
SET IDENTITY_INSERT [dbo].[ClientService] ON 

INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (1, 29, 45, CAST(N'2019-04-27T13:50:00.000' AS DateTime), N'Одобрено')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (2, 38, 41, CAST(N'2019-05-31T08:20:00.000' AS DateTime), N'Одобрено')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (3, 18, 59, CAST(N'2019-09-20T17:30:00.000' AS DateTime), N'Одобрено')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (4, 34, 75, CAST(N'2019-10-17T17:50:00.000' AS DateTime), N'Огорчило')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (5, 7, 26, CAST(N'2019-07-12T16:30:00.000' AS DateTime), N'Огорчило')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (6, 6, 39, CAST(N'2019-09-06T12:40:00.000' AS DateTime), N'Одобрено')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (7, 31, 89, CAST(N'2019-09-28T18:40:00.000' AS DateTime), N'Огорчило')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (8, 19, 67, CAST(N'2019-09-11T13:10:00.000' AS DateTime), N'Одобрено')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (9, 10, 40, CAST(N'2019-06-21T11:40:00.000' AS DateTime), N'Огорчило')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (10, 4, 29, CAST(N'2019-12-20T13:30:00.000' AS DateTime), N'Одобрено')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (11, 19, 71, CAST(N'2019-03-19T12:30:00.000' AS DateTime), N'Огорчило')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (12, 18, 79, CAST(N'2019-12-23T17:00:00.000' AS DateTime), N'Огорчило')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (13, 34, 55, CAST(N'2019-01-17T16:00:00.000' AS DateTime), N'Одобрено')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (14, 44, 1, CAST(N'2019-12-18T16:30:00.000' AS DateTime), N'Одобрено')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (15, 14, 75, CAST(N'2019-01-22T14:40:00.000' AS DateTime), N'Огорчило')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (16, 31, 12, CAST(N'2019-09-07T18:10:00.000' AS DateTime), N'Одобрено')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (17, 34, 8, CAST(N'2019-01-01T08:50:00.000' AS DateTime), N'Огорчило')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (18, 30, 39, CAST(N'2019-06-24T16:40:00.000' AS DateTime), N'Одобрено')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (19, 1, 89, CAST(N'2019-04-28T08:30:00.000' AS DateTime), N'Огорчило')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (20, 4, 55, CAST(N'2019-06-13T15:40:00.000' AS DateTime), N'Огорчило')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (21, 45, 67, CAST(N'2019-12-25T08:00:00.000' AS DateTime), N'Одобрено')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (22, 44, 86, CAST(N'2019-10-07T14:00:00.000' AS DateTime), N'Одобрено')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (23, 50, 40, CAST(N'2019-05-22T15:50:00.000' AS DateTime), N'Одобрено')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (24, 33, 71, CAST(N'2019-10-05T13:30:00.000' AS DateTime), N'Одобрено')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (25, 22, 87, CAST(N'2019-01-27T08:10:00.000' AS DateTime), N'Огорчило')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (26, 30, 30, CAST(N'2019-11-15T17:30:00.000' AS DateTime), N'Огорчило')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (27, 19, 23, CAST(N'2019-05-06T16:40:00.000' AS DateTime), N'Одобрено')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (28, 4, 37, CAST(N'2019-02-13T09:00:00.000' AS DateTime), N'Одобрено')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (29, 13, 64, CAST(N'2019-05-20T14:40:00.000' AS DateTime), N'Огорчило')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (30, 36, 5, CAST(N'2019-01-19T13:50:00.000' AS DateTime), N'Огорчило')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (31, 28, 92, CAST(N'2019-06-07T08:50:00.000' AS DateTime), N'Одобрено')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (32, 1, 59, CAST(N'2019-03-21T11:50:00.000' AS DateTime), N'Одобрено')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (33, 29, 95, CAST(N'2019-08-04T12:30:00.000' AS DateTime), N'Одобрено')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (34, 3, 24, CAST(N'2019-01-11T19:10:00.000' AS DateTime), N'Огорчило')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (35, 6, 92, CAST(N'2019-05-26T08:20:00.000' AS DateTime), N'Одобрено')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (36, 1, 29, CAST(N'2019-05-04T16:00:00.000' AS DateTime), N'Одобрено')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (37, 24, 11, CAST(N'2019-07-23T13:30:00.000' AS DateTime), N'Одобрено')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (38, 34, 72, CAST(N'2019-01-04T18:40:00.000' AS DateTime), N'Одобрено')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (39, 2, 39, CAST(N'2019-10-12T19:10:00.000' AS DateTime), N'Одобрено')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (40, 4, 30, CAST(N'2019-10-24T15:00:00.000' AS DateTime), N'Одобрено')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (41, 34, 22, CAST(N'2019-05-29T14:00:00.000' AS DateTime), N'Одобрено')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (42, 1, 78, CAST(N'2019-09-20T11:20:00.000' AS DateTime), N'Одобрено')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (43, 2, 81, CAST(N'2019-05-07T15:10:00.000' AS DateTime), N'Огорчило')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (44, 22, 70, CAST(N'2019-09-11T14:40:00.000' AS DateTime), N'Огорчило')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (45, 41, 96, CAST(N'2019-11-26T11:30:00.000' AS DateTime), N'Огорчило')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (46, 2, 86, CAST(N'2019-03-28T09:20:00.000' AS DateTime), N'Одобрено')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (47, 3, 29, CAST(N'2019-01-17T18:00:00.000' AS DateTime), N'Одобрено')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (48, 50, 26, CAST(N'2019-01-28T15:20:00.000' AS DateTime), N'Одобрено')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (49, 17, 40, CAST(N'2019-06-22T16:10:00.000' AS DateTime), N'Одобрено')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (50, 47, 21, CAST(N'2019-12-15T10:10:00.000' AS DateTime), N'Одобрено')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (51, 41, 41, CAST(N'2019-06-07T12:40:00.000' AS DateTime), N'Огорчило')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (52, 17, 96, CAST(N'2019-09-14T16:20:00.000' AS DateTime), N'Огорчило')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (53, 11, 10, CAST(N'2019-11-04T12:30:00.000' AS DateTime), N'Одобрено')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (54, 42, 91, CAST(N'2019-02-26T15:40:00.000' AS DateTime), N'Одобрено')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (55, 37, 82, CAST(N'2019-09-13T11:50:00.000' AS DateTime), N'Одобрено')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (56, 12, 86, CAST(N'2019-11-22T10:40:00.000' AS DateTime), N'Огорчило')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (57, 38, 78, CAST(N'2019-12-09T09:00:00.000' AS DateTime), N'Огорчило')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (58, 50, 5, CAST(N'2019-10-31T08:40:00.000' AS DateTime), N'Одобрено')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (59, 7, 10, CAST(N'2019-08-31T11:40:00.000' AS DateTime), N'Одобрено')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (60, 36, 37, CAST(N'2019-06-24T17:40:00.000' AS DateTime), N'Огорчило')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (61, 35, 23, CAST(N'2019-11-29T14:00:00.000' AS DateTime), N'Огорчило')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (62, 46, 10, CAST(N'2019-08-25T19:50:00.000' AS DateTime), N'Одобрено')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (63, 22, 92, CAST(N'2019-11-13T11:00:00.000' AS DateTime), N'Одобрено')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (64, 38, 26, CAST(N'2019-07-30T11:20:00.000' AS DateTime), N'Одобрено')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (65, 45, 26, CAST(N'2019-05-25T19:00:00.000' AS DateTime), N'Одобрено')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (66, 28, 55, CAST(N'2019-06-26T19:30:00.000' AS DateTime), N'Одобрено')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (67, 48, 10, CAST(N'2019-11-06T11:20:00.000' AS DateTime), N'Одобрено')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (68, 4, 37, CAST(N'2019-04-29T16:10:00.000' AS DateTime), N'Одобрено')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (69, 46, 45, CAST(N'2019-10-21T19:10:00.000' AS DateTime), N'Одобрено')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (70, 13, 14, CAST(N'2019-06-23T09:40:00.000' AS DateTime), N'Одобрено')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (71, 26, 32, CAST(N'2019-11-09T11:40:00.000' AS DateTime), N'Огорчило')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (72, 42, 42, CAST(N'2019-10-02T19:10:00.000' AS DateTime), N'Огорчило')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (73, 18, 92, CAST(N'2019-06-07T19:40:00.000' AS DateTime), N'Огорчило')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (74, 37, 82, CAST(N'2019-01-17T11:00:00.000' AS DateTime), N'Одобрено')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (75, 50, 95, CAST(N'2019-01-11T16:40:00.000' AS DateTime), N'Одобрено')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (76, 38, 71, CAST(N'2019-11-13T09:00:00.000' AS DateTime), N'Одобрено')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (77, 35, 78, CAST(N'2019-10-10T08:10:00.000' AS DateTime), N'Одобрено')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (78, 6, 40, CAST(N'2019-03-01T16:00:00.000' AS DateTime), N'Одобрено')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (79, 28, 15, CAST(N'2019-07-21T14:30:00.000' AS DateTime), N'Одобрено')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (80, 39, 30, CAST(N'2019-12-21T13:40:00.000' AS DateTime), N'Одобрено')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (81, 41, 92, CAST(N'2019-10-01T12:20:00.000' AS DateTime), N'Огорчило')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (82, 47, 67, CAST(N'2019-08-19T17:10:00.000' AS DateTime), N'Одобрено')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (83, 11, 89, CAST(N'2019-03-01T15:00:00.000' AS DateTime), N'Одобрено')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (84, 39, 23, CAST(N'2019-05-11T14:50:00.000' AS DateTime), N'Одобрено')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (85, 4, 8, CAST(N'2019-12-21T19:00:00.000' AS DateTime), N'Огорчило')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (86, 28, 64, CAST(N'2019-01-30T10:50:00.000' AS DateTime), N'Огорчило')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (87, 23, 65, CAST(N'2019-03-09T16:30:00.000' AS DateTime), N'Огорчило')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (88, 22, 37, CAST(N'2019-08-08T18:20:00.000' AS DateTime), N'Одобрено')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (89, 38, 92, CAST(N'2019-03-04T14:20:00.000' AS DateTime), N'Одобрено')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (90, 42, 79, CAST(N'2019-06-17T10:20:00.000' AS DateTime), N'Одобрено')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (91, 13, 52, CAST(N'2019-02-11T09:10:00.000' AS DateTime), N'Одобрено')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (92, 42, 79, CAST(N'2019-02-01T12:20:00.000' AS DateTime), N'Одобрено')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (93, 46, 81, CAST(N'2019-12-11T09:50:00.000' AS DateTime), N'Одобрено')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (94, 27, 81, CAST(N'2019-01-13T18:10:00.000' AS DateTime), N'Одобрено')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (95, 14, 82, CAST(N'2019-03-23T08:30:00.000' AS DateTime), N'Одобрено')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (96, 11, 14, CAST(N'2019-10-02T14:10:00.000' AS DateTime), N'Одобрено')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (97, 30, 8, CAST(N'2019-01-20T09:20:00.000' AS DateTime), N'Одобрено')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (98, 12, 82, CAST(N'2019-01-27T12:50:00.000' AS DateTime), N'Одобрено')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (99, 46, 48, CAST(N'2019-05-19T08:00:00.000' AS DateTime), N'Одобрено')
GO
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (100, 8, 75, CAST(N'2019-11-30T19:10:00.000' AS DateTime), N'Одобрено')
SET IDENTITY_INSERT [dbo].[ClientService] OFF
GO
SET IDENTITY_INSERT [dbo].[DocumentByService] ON 

INSERT [dbo].[DocumentByService] ([ID], [ClientServiceID], [DocumentPath]) VALUES (1, 1, N'Отчет\Отчёт о выполнении косметических услуг.doc')
INSERT [dbo].[DocumentByService] ([ID], [ClientServiceID], [DocumentPath]) VALUES (2, 2, N'Отчет\Отчёт о выполнении оздоровительных услуг.doc')
INSERT [dbo].[DocumentByService] ([ID], [ClientServiceID], [DocumentPath]) VALUES (3, 3, N'Отчет\Отчёт о выполнении парикмахерских услуг.doc')
INSERT [dbo].[DocumentByService] ([ID], [ClientServiceID], [DocumentPath]) VALUES (4, 4, N'Отчет\Отчёт о выполнении услуг маникюра.doc')
INSERT [dbo].[DocumentByService] ([ID], [ClientServiceID], [DocumentPath]) VALUES (5, 5, N'Отчет\Отчёт о выполнении косметических услуг.doc')
INSERT [dbo].[DocumentByService] ([ID], [ClientServiceID], [DocumentPath]) VALUES (6, 6, N'Отчет\Отчёт о выполнении косметических услуг.doc')
INSERT [dbo].[DocumentByService] ([ID], [ClientServiceID], [DocumentPath]) VALUES (7, 7, N'Отчет\Отчёт о выполнении косметических услуг.doc')
INSERT [dbo].[DocumentByService] ([ID], [ClientServiceID], [DocumentPath]) VALUES (8, 8, N'Отчет\Отчёт о выполнении оздоровительных услуг.doc')
INSERT [dbo].[DocumentByService] ([ID], [ClientServiceID], [DocumentPath]) VALUES (9, 9, N'Отчет\Отчёт о выполнении косметических услуг.doc')
INSERT [dbo].[DocumentByService] ([ID], [ClientServiceID], [DocumentPath]) VALUES (10, 10, N'Отчет\Отчёт о выполнении услуг маникюра.doc')
INSERT [dbo].[DocumentByService] ([ID], [ClientServiceID], [DocumentPath]) VALUES (11, 11, N'Отчет\Отчёт о выполнении оздоровительных услуг.doc')
INSERT [dbo].[DocumentByService] ([ID], [ClientServiceID], [DocumentPath]) VALUES (12, 12, N'Отчет\Отчёт о выполнении услуг маникюра.doc')
INSERT [dbo].[DocumentByService] ([ID], [ClientServiceID], [DocumentPath]) VALUES (13, 13, N'Отчет\Отчёт о выполнении косметических услуг.doc')
INSERT [dbo].[DocumentByService] ([ID], [ClientServiceID], [DocumentPath]) VALUES (14, 14, N'Отчет\Отчёт о выполнении косметических услуг.doc')
INSERT [dbo].[DocumentByService] ([ID], [ClientServiceID], [DocumentPath]) VALUES (15, 15, N'Отчет\Отчёт о выполнении услуг маникюра.doc')
INSERT [dbo].[DocumentByService] ([ID], [ClientServiceID], [DocumentPath]) VALUES (16, 16, N'Отчет\Отчёт о выполнении оздоровительных услуг.doc')
INSERT [dbo].[DocumentByService] ([ID], [ClientServiceID], [DocumentPath]) VALUES (17, 17, N'Отчет\Отчёт о выполнении услуг прокола.doc')
INSERT [dbo].[DocumentByService] ([ID], [ClientServiceID], [DocumentPath]) VALUES (18, 18, N'Отчет\Отчёт о выполнении косметических услуг.doc')
INSERT [dbo].[DocumentByService] ([ID], [ClientServiceID], [DocumentPath]) VALUES (19, 19, N'Отчет\Отчёт о выполнении косметических услуг.doc')
INSERT [dbo].[DocumentByService] ([ID], [ClientServiceID], [DocumentPath]) VALUES (20, 20, N'Отчет\Отчёт о выполнении косметических услуг.doc')
INSERT [dbo].[DocumentByService] ([ID], [ClientServiceID], [DocumentPath]) VALUES (21, 21, N'Отчет\Отчёт о выполнении оздоровительных услуг.doc')
INSERT [dbo].[DocumentByService] ([ID], [ClientServiceID], [DocumentPath]) VALUES (22, 22, N'Отчет\Отчёт о выполнении услуг по удалению волос.doc')
INSERT [dbo].[DocumentByService] ([ID], [ClientServiceID], [DocumentPath]) VALUES (23, 23, N'Отчет\Отчёт о выполнении оздоровительных услуг.doc')
INSERT [dbo].[DocumentByService] ([ID], [ClientServiceID], [DocumentPath]) VALUES (24, 24, N'Отчет\Отчёт о выполнении оздоровительных услуг.doc')
INSERT [dbo].[DocumentByService] ([ID], [ClientServiceID], [DocumentPath]) VALUES (25, 25, N'Отчет\Отчёт о выполнении услуг маникюра.doc')
INSERT [dbo].[DocumentByService] ([ID], [ClientServiceID], [DocumentPath]) VALUES (26, 26, N'Отчет\Отчёт о выполнении косметических услуг.doc')
INSERT [dbo].[DocumentByService] ([ID], [ClientServiceID], [DocumentPath]) VALUES (27, 27, N'Отчет\Отчёт о выполнении оздоровительных услуг.doc')
INSERT [dbo].[DocumentByService] ([ID], [ClientServiceID], [DocumentPath]) VALUES (28, 28, N'Отчет\Отчёт о выполнении косметических услуг.doc')
INSERT [dbo].[DocumentByService] ([ID], [ClientServiceID], [DocumentPath]) VALUES (29, 29, N'Отчет\Отчёт о выполнении услуг маникюра.doc')
INSERT [dbo].[DocumentByService] ([ID], [ClientServiceID], [DocumentPath]) VALUES (30, 30, N'Отчет\Отчёт о выполнении оздоровительных услуг.doc')
INSERT [dbo].[DocumentByService] ([ID], [ClientServiceID], [DocumentPath]) VALUES (31, 31, N'Отчет\Отчёт о выполнении оздоровительных услуг.doc')
INSERT [dbo].[DocumentByService] ([ID], [ClientServiceID], [DocumentPath]) VALUES (32, 32, N'Отчет\Отчёт о выполнении парикмахерских услуг.doc')
INSERT [dbo].[DocumentByService] ([ID], [ClientServiceID], [DocumentPath]) VALUES (33, 33, N'Отчет\Отчёт о выполнении услуг по удалению волос.doc')
INSERT [dbo].[DocumentByService] ([ID], [ClientServiceID], [DocumentPath]) VALUES (34, 34, N'Отчет\Отчёт о выполнении услуг маникюра.doc')
INSERT [dbo].[DocumentByService] ([ID], [ClientServiceID], [DocumentPath]) VALUES (35, 35, N'Отчет\Отчёт о выполнении оздоровительных услуг.doc')
INSERT [dbo].[DocumentByService] ([ID], [ClientServiceID], [DocumentPath]) VALUES (36, 36, N'Отчет\Отчёт о выполнении услуг маникюра.doc')
INSERT [dbo].[DocumentByService] ([ID], [ClientServiceID], [DocumentPath]) VALUES (37, 37, N'Отчет\Отчёт о выполнении услуг маникюра.doc')
INSERT [dbo].[DocumentByService] ([ID], [ClientServiceID], [DocumentPath]) VALUES (38, 38, N'Отчет\Отчёт о выполнении парикмахерских услуг.doc')
INSERT [dbo].[DocumentByService] ([ID], [ClientServiceID], [DocumentPath]) VALUES (39, 39, N'Отчет\Отчёт о выполнении косметических услуг.doc')
INSERT [dbo].[DocumentByService] ([ID], [ClientServiceID], [DocumentPath]) VALUES (40, 40, N'Отчет\Отчёт о выполнении косметических услуг.doc')
INSERT [dbo].[DocumentByService] ([ID], [ClientServiceID], [DocumentPath]) VALUES (41, 41, N'Отчет\Отчёт о выполнении услуг маникюра.doc')
INSERT [dbo].[DocumentByService] ([ID], [ClientServiceID], [DocumentPath]) VALUES (42, 42, N'Отчет\Отчёт о выполнении косметических услуг.doc')
INSERT [dbo].[DocumentByService] ([ID], [ClientServiceID], [DocumentPath]) VALUES (43, 43, N'Отчет\Отчёт о выполнении косметических услуг.doc')
INSERT [dbo].[DocumentByService] ([ID], [ClientServiceID], [DocumentPath]) VALUES (44, 44, N'Отчет\Отчёт о выполнении косметических услуг.doc')
INSERT [dbo].[DocumentByService] ([ID], [ClientServiceID], [DocumentPath]) VALUES (45, 45, N'Отчет\Отчёт о выполнении услуг маникюра.doc')
INSERT [dbo].[DocumentByService] ([ID], [ClientServiceID], [DocumentPath]) VALUES (46, 46, N'Отчет\Отчёт о выполнении услуг по удалению волос.doc')
INSERT [dbo].[DocumentByService] ([ID], [ClientServiceID], [DocumentPath]) VALUES (47, 47, N'Отчет\Отчёт о выполнении услуг маникюра.doc')
INSERT [dbo].[DocumentByService] ([ID], [ClientServiceID], [DocumentPath]) VALUES (48, 48, N'Отчет\Отчёт о выполнении косметических услуг.doc')
INSERT [dbo].[DocumentByService] ([ID], [ClientServiceID], [DocumentPath]) VALUES (49, 49, N'Отчет\Отчёт о выполнении косметических услуг.doc')
INSERT [dbo].[DocumentByService] ([ID], [ClientServiceID], [DocumentPath]) VALUES (50, 50, N'Отчет\Отчёт о выполнении оздоровительных услуг.doc')
INSERT [dbo].[DocumentByService] ([ID], [ClientServiceID], [DocumentPath]) VALUES (51, 51, N'Отчет\Отчёт о выполнении оздоровительных услуг.doc')
INSERT [dbo].[DocumentByService] ([ID], [ClientServiceID], [DocumentPath]) VALUES (52, 52, N'Отчет\Отчёт о выполнении услуг маникюра.doc')
INSERT [dbo].[DocumentByService] ([ID], [ClientServiceID], [DocumentPath]) VALUES (53, 53, N'Отчет\Отчёт о выполнении оздоровительных услуг.doc')
INSERT [dbo].[DocumentByService] ([ID], [ClientServiceID], [DocumentPath]) VALUES (54, 54, N'Отчет\Отчёт о выполнении косметических услуг.doc')
INSERT [dbo].[DocumentByService] ([ID], [ClientServiceID], [DocumentPath]) VALUES (55, 55, N'Отчет\Отчёт о выполнении косметических услуг.doc')
INSERT [dbo].[DocumentByService] ([ID], [ClientServiceID], [DocumentPath]) VALUES (56, 56, N'Отчет\Отчёт о выполнении услуг по удалению волос.doc')
INSERT [dbo].[DocumentByService] ([ID], [ClientServiceID], [DocumentPath]) VALUES (57, 57, N'Отчет\Отчёт о выполнении косметических услуг.doc')
INSERT [dbo].[DocumentByService] ([ID], [ClientServiceID], [DocumentPath]) VALUES (58, 58, N'Отчет\Отчёт о выполнении оздоровительных услуг.doc')
INSERT [dbo].[DocumentByService] ([ID], [ClientServiceID], [DocumentPath]) VALUES (59, 59, N'Отчет\Отчёт о выполнении оздоровительных услуг.doc')
INSERT [dbo].[DocumentByService] ([ID], [ClientServiceID], [DocumentPath]) VALUES (60, 60, N'Отчет\Отчёт о выполнении косметических услуг.doc')
INSERT [dbo].[DocumentByService] ([ID], [ClientServiceID], [DocumentPath]) VALUES (61, 61, N'Отчет\Отчёт о выполнении оздоровительных услуг.doc')
INSERT [dbo].[DocumentByService] ([ID], [ClientServiceID], [DocumentPath]) VALUES (62, 62, N'Отчет\Отчёт о выполнении оздоровительных услуг.doc')
INSERT [dbo].[DocumentByService] ([ID], [ClientServiceID], [DocumentPath]) VALUES (63, 63, N'Отчет\Отчёт о выполнении косметических услуг.doc')
INSERT [dbo].[DocumentByService] ([ID], [ClientServiceID], [DocumentPath]) VALUES (64, 64, N'Отчет\Отчёт о выполнении косметических услуг.doc')
INSERT [dbo].[DocumentByService] ([ID], [ClientServiceID], [DocumentPath]) VALUES (65, 65, N'Отчет\Отчёт о выполнении косметических услуг.doc')
INSERT [dbo].[DocumentByService] ([ID], [ClientServiceID], [DocumentPath]) VALUES (66, 66, N'Отчет\Отчёт о выполнении косметических услуг.doc')
INSERT [dbo].[DocumentByService] ([ID], [ClientServiceID], [DocumentPath]) VALUES (67, 67, N'Отчет\Отчёт о выполнении оздоровительных услуг.doc')
INSERT [dbo].[DocumentByService] ([ID], [ClientServiceID], [DocumentPath]) VALUES (68, 68, N'Отчет\Отчёт о выполнении косметических услуг.doc')
INSERT [dbo].[DocumentByService] ([ID], [ClientServiceID], [DocumentPath]) VALUES (69, 69, N'Отчет\Отчёт о выполнении косметических услуг.doc')
INSERT [dbo].[DocumentByService] ([ID], [ClientServiceID], [DocumentPath]) VALUES (70, 70, N'Отчет\Отчёт о выполнении косметических услуг.doc')
INSERT [dbo].[DocumentByService] ([ID], [ClientServiceID], [DocumentPath]) VALUES (71, 71, N'Отчет\Отчёт о выполнении косметических услуг.doc')
INSERT [dbo].[DocumentByService] ([ID], [ClientServiceID], [DocumentPath]) VALUES (72, 72, N'Отчет\Отчёт о выполнении косметических услуг.doc')
INSERT [dbo].[DocumentByService] ([ID], [ClientServiceID], [DocumentPath]) VALUES (73, 73, N'Отчет\Отчёт о выполнении оздоровительных услуг.doc')
INSERT [dbo].[DocumentByService] ([ID], [ClientServiceID], [DocumentPath]) VALUES (74, 74, N'Отчет\Отчёт о выполнении косметических услуг.doc')
INSERT [dbo].[DocumentByService] ([ID], [ClientServiceID], [DocumentPath]) VALUES (75, 75, N'Отчет\Отчёт о выполнении услуг по удалению волос.doc')
INSERT [dbo].[DocumentByService] ([ID], [ClientServiceID], [DocumentPath]) VALUES (76, 76, N'Отчет\Отчёт о выполнении оздоровительных услуг.doc')
INSERT [dbo].[DocumentByService] ([ID], [ClientServiceID], [DocumentPath]) VALUES (77, 77, N'Отчет\Отчёт о выполнении косметических услуг.doc')
INSERT [dbo].[DocumentByService] ([ID], [ClientServiceID], [DocumentPath]) VALUES (78, 78, N'Отчет\Отчёт о выполнении косметических услуг.doc')
INSERT [dbo].[DocumentByService] ([ID], [ClientServiceID], [DocumentPath]) VALUES (79, 79, N'Отчет\Отчёт о выполнении парикмахерских услуг.doc')
INSERT [dbo].[DocumentByService] ([ID], [ClientServiceID], [DocumentPath]) VALUES (80, 80, N'Отчет\Отчёт о выполнении косметических услуг.doc')
INSERT [dbo].[DocumentByService] ([ID], [ClientServiceID], [DocumentPath]) VALUES (81, 81, N'Отчет\Отчёт о выполнении оздоровительных услуг.doc')
INSERT [dbo].[DocumentByService] ([ID], [ClientServiceID], [DocumentPath]) VALUES (82, 82, N'Отчет\Отчёт о выполнении оздоровительных услуг.doc')
INSERT [dbo].[DocumentByService] ([ID], [ClientServiceID], [DocumentPath]) VALUES (83, 83, N'Отчет\Отчёт о выполнении косметических услуг.doc')
INSERT [dbo].[DocumentByService] ([ID], [ClientServiceID], [DocumentPath]) VALUES (84, 84, N'Отчет\Отчёт о выполнении оздоровительных услуг.doc')
INSERT [dbo].[DocumentByService] ([ID], [ClientServiceID], [DocumentPath]) VALUES (85, 85, N'Отчет\Отчёт о выполнении услуг прокола.doc')
INSERT [dbo].[DocumentByService] ([ID], [ClientServiceID], [DocumentPath]) VALUES (86, 86, N'Отчет\Отчёт о выполнении услуг маникюра.doc')
INSERT [dbo].[DocumentByService] ([ID], [ClientServiceID], [DocumentPath]) VALUES (87, 87, N'Отчет\Отчёт о выполнении оздоровительных услуг.doc')
INSERT [dbo].[DocumentByService] ([ID], [ClientServiceID], [DocumentPath]) VALUES (88, 88, N'Отчет\Отчёт о выполнении косметических услуг.doc')
INSERT [dbo].[DocumentByService] ([ID], [ClientServiceID], [DocumentPath]) VALUES (89, 89, N'Отчет\Отчёт о выполнении оздоровительных услуг.doc')
INSERT [dbo].[DocumentByService] ([ID], [ClientServiceID], [DocumentPath]) VALUES (90, 90, N'Отчет\Отчёт о выполнении услуг маникюра.doc')
INSERT [dbo].[DocumentByService] ([ID], [ClientServiceID], [DocumentPath]) VALUES (91, 91, N'Отчет\Отчёт о выполнении оздоровительных услуг.doc')
INSERT [dbo].[DocumentByService] ([ID], [ClientServiceID], [DocumentPath]) VALUES (92, 92, N'Отчет\Отчёт о выполнении услуг маникюра.doc')
INSERT [dbo].[DocumentByService] ([ID], [ClientServiceID], [DocumentPath]) VALUES (93, 93, N'Отчет\Отчёт о выполнении косметических услуг.doc')
INSERT [dbo].[DocumentByService] ([ID], [ClientServiceID], [DocumentPath]) VALUES (94, 94, N'Отчет\Отчёт о выполнении косметических услуг.doc')
INSERT [dbo].[DocumentByService] ([ID], [ClientServiceID], [DocumentPath]) VALUES (95, 95, N'Отчет\Отчёт о выполнении косметических услуг.doc')
INSERT [dbo].[DocumentByService] ([ID], [ClientServiceID], [DocumentPath]) VALUES (96, 96, N'Отчет\Отчёт о выполнении косметических услуг.doc')
INSERT [dbo].[DocumentByService] ([ID], [ClientServiceID], [DocumentPath]) VALUES (97, 97, N'Отчет\Отчёт о выполнении услуг прокола.doc')
INSERT [dbo].[DocumentByService] ([ID], [ClientServiceID], [DocumentPath]) VALUES (98, 98, N'Отчет\Отчёт о выполнении косметических услуг.doc')
INSERT [dbo].[DocumentByService] ([ID], [ClientServiceID], [DocumentPath]) VALUES (99, 99, N'Отчет\Отчёт о выполнении косметических услуг.doc')
GO
INSERT [dbo].[DocumentByService] ([ID], [ClientServiceID], [DocumentPath]) VALUES (100, 100, N'Отчет\Отчёт о выполнении услуг маникюра.doc')
SET IDENTITY_INSERT [dbo].[DocumentByService] OFF
GO
INSERT [dbo].[Gender] ([Code], [Name]) VALUES (N'1', N'мужской')
INSERT [dbo].[Gender] ([Code], [Name]) VALUES (N'2', N'женский')
GO
SET IDENTITY_INSERT [dbo].[Manufacturer] ON 

INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (1, N'WB', CAST(N'2000-03-30' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (2, N'Green Dolphin', CAST(N'2008-02-17' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (3, N'Proiettile', CAST(N'2004-10-03' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (4, N'Roki', CAST(N'2010-05-16' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (5, N'Namida', CAST(N'2015-08-20' AS Date))
SET IDENTITY_INSERT [dbo].[Manufacturer] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (1, N'Крем для рук', 700.0000, N'Увлажняет кожу рук', N'Продукты\CreamMask.png', 1, 2)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (2, N'Крем для лица', 800.0000, N'Увлажняет кожу лица', N'Продукты\CreamMask.png', 1, 2)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (3, N'Маска для лица', 1000.0000, N'Надолго увлажняет кожу лица', N'Продукты\CreamMask.png', 1, 2)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (4, N'Шампунь для волос', 500.0000, N'Для ломких и поврежденных волос', N'Продукты\Hair.png', 0, 1)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (5, N'Кондиционер для волос', 550.0000, N'Питает волосы', N'Продукты\Hair.png', 0, 1)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (6, N'Бальзам для волос', 300.0000, N'Питает волосы', N'Продукты\Hair.png', 1, 1)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (7, N'Расческа для волос', 200.0000, N'Не спутывает волосы', N'Продукты\Hair.png', 1, 1)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (8, N'Масло для тела', 300.0000, N'Многофункциональное', N'Продукты\Body.png', 1, 4)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (9, N'Скраб для тела', 200.0000, N'Убирает шелушения', N'Продукты\Body.png', 0, 4)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (10, N'Пилинг', 300.0000, N'Удаление омертвевшей кожи', N'Продукты\Body.png', 0, 4)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (11, N'Маникюрный набор', 500.0000, N'Домашний уход', N'Продукты\Nail.png', 1, 3)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (12, N'Лак для ногтей', 100.0000, N'Для нанесения на ногти', N'Продукты\Nail.png', 1, 3)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (13, N'Маска для волос', 700.0000, N'Питание для волос', N'Продукты\Hair.png', 1, 2)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (14, N'Краска для волос', 500.0000, N'Для окрашивания волос', N'Продукты\Hair.png', 0, 1)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (15, N'Порошок для обесвечивания', 1000.0000, N'Для осветления волос', N'Продукты\Hair.png', 0, 1)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (16, N'Оксид для обесвечивания', 1000.0000, N'Для осветления волос', N'Продукты\Hair.png', 0, 1)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (17, N'Массажная щетка', 600.0000, N'Для массажа', N'Продукты\Body.png', 1, 4)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (18, N'Парфюм', 5000.0000, N'Свежесть и аромат', N'Продукты\Duhi.png', 1, 5)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (19, N'Пробники', 500.0000, N'Свежесть и аромат', N'Продукты\Duhi.png', 1, 5)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (20, N'Масляные духи', 300.0000, N'Свежесть и аромат', N'Продукты\Duhi.png', 1, 5)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductPhoto] ON 

INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (1, 1, N'Ассортимент\CreamHand.png')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (2, 2, N'Ассортимент\CreamFace.png')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (3, 3, N'Ассортимент\MaskFace.png')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (4, 4, N'Ассортимент\Shamp.png')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (5, 5, N'Ассортимент\Con.png')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (6, 6, N'Ассортимент\Bal.png')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (7, 7, N'Ассортимент\Brush.png')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (8, 8, N'Ассортимент\Oil.png')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (9, 9, N'Ассортимент\Scr.png')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (10, 10, N'Ассортимент\Pil.png')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (11, 11, N'Ассортимент\Manik.png')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (12, 12, N'Ассортимент\ManikLak.png')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (13, 13, N'Ассортимент\MaskHair.png')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (14, 14, N'Ассортимент\ColorHair.png')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (15, 15, N'Ассортимент\BleachHair.png')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (16, 16, N'Ассортимент\BleachHairOx.png')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (17, 17, N'Ассортимент\MassBrush.png')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (18, 18, N'Ассортимент\Parfum.png')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (19, 19, N'Ассортимент\ParfumProb.png')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (20, 20, N'Ассортимент\ParfumOil.png')
SET IDENTITY_INSERT [dbo].[ProductPhoto] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductSale] ON 

INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (1, CAST(N'2019-05-31T13:10:22.000' AS DateTime), 8, 1, 2)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (2, CAST(N'2019-12-15T15:20:45.000' AS DateTime), 8, 1, 50)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (3, CAST(N'2019-09-14T13:10:22.000' AS DateTime), 17, 2, 52)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (4, CAST(N'2019-09-07T11:10:23.000' AS DateTime), 3, 1, 16)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (5, CAST(N'2019-09-07T16:53:12.000' AS DateTime), 1, 2, 16)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (6, CAST(N'2019-09-20T18:44:21.000' AS DateTime), 6, 4, 3)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (7, CAST(N'2019-03-21T23:14:43.000' AS DateTime), 3, 1, 32)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (8, CAST(N'2019-01-04T12:27:56.000' AS DateTime), 7, 1, 38)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (9, CAST(N'2019-07-21T14:35:24.000' AS DateTime), 7, 1, 79)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (10, CAST(N'2019-07-21T11:10:56.000' AS DateTime), 3, 2, 79)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (11, CAST(N'2019-07-23T12:45:13.000' AS DateTime), 12, 5, 37)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (12, CAST(N'2019-06-17T16:19:27.000' AS DateTime), 11, 1, 90)
SET IDENTITY_INSERT [dbo].[ProductSale] OFF
GO
SET IDENTITY_INSERT [dbo].[Service] ON 

INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (1, N'Наращивание ресниц', 1430.0000, 2400, N'Лицо', 0.05, N'Услуги салона красоты\Ресницы.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (2, N'Моделирование ресниц+тушь', 1390.0000, 2100, N'Лицо', 0.1, N'Услуги салона красоты\Ресницы.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (3, N'Ламинирование ресниц', 1740.0000, 3300, N'Лицо', 0.25, N'Услуги салона красоты\Ресницы.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (4, N'Русский спа массаж', 2540.0000, 3000, N'Тело', 0.2, N'Услуги салона красоты\массаж.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (5, N'Мезотерапия', 2040.0000, 2400, N'Процедура', 0.2, N'Услуги салона красоты\Мезотерапия.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (6, N'Полуперманентная тушь', 2340.0000, 1800, N'Лицо', 0, N'Услуги салона красоты\Ресницы.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (7, N'Экспресс SPA', 2420.0000, 900, N'Тело', 0, N'Услуги салона красоты\Экспресс SPA.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (8, N'Пирсинг', 1330.0000, 3300, N'Лицо', 0, N'Услуги салона красоты\Прокол ушей пистолетом.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (9, N'Массаж масляный', 1090.0000, 3000, N'Тело', 0, N'Услуги салона красоты\массаж.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (10, N'Прессотерапия', 2350.0000, 2400, N'Тело', 0, N'Услуги салона красоты\Прессотерапия.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (11, N'Европейский маникюр', 1990.0000, 3600, N'Руки', 0.05, N'Услуги салона красоты\Европейский маникюр.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (12, N'Удаление доброкачественных образований кожи', 1910.0000, 900, N'Процедура', 0, N'Услуги салона красоты\face.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (13, N'Испанский массаж', 2190.0000, 2400, N'Тело', 0.25, N'Услуги салона красоты\массаж.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (14, N'Наращивание ресниц кукольного эффекта', 2120.0000, 2100, N'Лицо', 0, N'Услуги салона красоты\Ресницы.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (15, N'Стрижка с покраской', 2300.0000, 1500, N'Волосы', 0.1, N'Услуги салона красоты\стрижка.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (16, N'Детокс спа', 1330.0000, 1800, N'Процедура', 0, N'Услуги салона красоты\face.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (17, N'Стоун-терапия', 2100.0000, 3000, N'Процедура', 0.25, N'Услуги салона красоты\Стоун-терапия.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (18, N'Радиоволновой лифтинг', 1590.0000, 3000, N'Процедура', 0.15, N'Услуги салона красоты\face.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (19, N'Химические завивки', 1090.0000, 3000, N'Волосы', 0.2, N'Услуги салона красоты\стрижка.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (20, N'Альгинатные маски', 2370.0000, 3300, N'Лицо', 0, N'Услуги салона красоты\mask.jpeg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (21, N'Спортивный массаж', 1650.0000, 1800, N'Процедура', 0.15, N'Услуги салона красоты\массаж.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (22, N'Лечебное покрытие ногтей', 1220.0000, 1800, N'Процедура', 0, N'Услуги салона красоты\ногти.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (23, N'Реконструкция и лечение волос и кожи головы', 2360.0000, 3300, N'Процедура', 0.15, N'Услуги салона красоты\face.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (24, N'Классический маникюр', 1680.0000, 3300, N'Руки', 0.2, N'Услуги салона красоты\Классический маникюр.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (25, N'Консультация врача', 2120.0000, 1800, N'Процедура', 0, N'Услуги салона красоты\122454.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (26, N'Наращивание ресниц лисьего эффекта', 1370.0000, 1800, N'Лицо', 0.25, N'Услуги салона красоты\Ресницы.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (27, N'Экспресс-педикюр', 2170.0000, 1200, N'Процедура', 0.2, N'Услуги салона красоты\Экспресс-педикюр.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (28, N'Гречишный массаж', 1520.0000, 2400, N'Процедура', 0.15, N'Услуги салона красоты\Гречишный массаж.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (29, N'Комбинированный маникюр', 2390.0000, 3600, N'Руки', 0, N'Услуги салона красоты\Комбинированный маникюр.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (30, N'Фонофорез лица', 1120.0000, 1200, N'Лицо', 0.05, N'Услуги салона красоты\face.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (31, N'Перманентный макияж (татуаж)', 1270.0000, 2400, N'Лицо', 0.25, N'Услуги салона красоты\брови.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (32, N'Химический пилинг', 1880.0000, 1500, N'Лицо', 0.15, N'Услуги салона красоты\piling.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (33, N'Плазмолифтинг', 2450.0000, 900, N'Лицо', 0.2, N'Услуги салона красоты\face.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (34, N'Криолифтинг', 1090.0000, 900, N'Лицо', 0, N'Услуги салона красоты\face.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (35, N'Гликолевый поверхностный базовый пилинг', 2230.0000, 2100, N'Лицо', 0.1, N'Услуги салона красоты\piling.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (36, N'Окрашивание ресниц', 1100.0000, 2100, N'Лицо', 0, N'Услуги салона красоты\Ресницы.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (37, N'Коррекция нарощенных ресниц', 1310.0000, 2700, N'Лицо', 0.05, N'Услуги салона красоты\Ресницы.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (38, N'Фракционное омоложение лазерной системой Palomar', 1140.0000, 2700, N'Лицо', 0.05, N'Услуги салона красоты\face.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (39, N'Художественное оформление ресниц', 2040.0000, 3000, N'Лицо', 0, N'Услуги салона красоты\Ресницы.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (40, N'Эстетическая лазерная шлифовка кожи', 1750.0000, 2400, N'Процедура', 0.25, N'Услуги салона красоты\piling.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (41, N'Массаж ЖИВА', 2330.0000, 3300, N'Процедура', 0.25, N'Услуги салона красоты\массаж.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (42, N'Макияж', 2470.0000, 1800, N'Процедура', 0.2, N'Услуги салона красоты\makeup.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (43, N'Время вспять с коллагеном', 1850.0000, 2400, N'Процедура', 0.1, N'Услуги салона красоты\96.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (44, N'Снятие ресниц', 1680.0000, 2700, N'Лицо', 0.25, N'Услуги салона красоты\Снятие ресниц.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (45, N'Оформление бровей', 2280.0000, 2100, N'Лицо', 0, N'Услуги салона красоты\брови.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (46, N'Стрижка бороды машинкой', 1750.0000, 2700, N'Лицо', 0.1, N'Услуги салона красоты\man.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (47, N'Маски для лица', 2250.0000, 1200, N'Лицо', 0.1, N'Услуги салона красоты\mask.jpeg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (48, N'Татуаж', 1330.0000, 3600, N'Лицо', 0.2, N'Услуги салона красоты\брови.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (49, N'Уход для проблемной и комбинированной кожи', 2440.0000, 3600, N'Лицо', 0.15, N'Услуги салона красоты\face.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (50, N'Прокол ушей пистолетом', 2040.0000, 1500, N'Процедура', 0.05, N'Услуги салона красоты\Прокол ушей пистолетом.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (51, N'Ремонт одного ногтя', 2340.0000, 1800, N'Руки', 0.25, N'Услуги салона красоты\ногти.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (52, N'Полировка с маслом', 1280.0000, 1200, N'Руки', 0, N'Услуги салона красоты\piling.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (53, N'Омоложение зоны вокруг глаз', 2540.0000, 1800, N'Лицо', 0.15, N'Услуги салона красоты\брови.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (54, N'Аппаратная косметология', 1180.0000, 3300, N'Процедура', 0, N'Услуги салона красоты\96.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (55, N'Консультация врача-косметолога', 2350.0000, 3600, N'Процедура', 0.05, N'Услуги салона красоты\122454.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (56, N'Визаж', 1260.0000, 3000, N'Лицо', 0, N'Услуги салона красоты\makeup.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (57, N'Демакияж', 1470.0000, 1200, N'Лицо', 0.15, N'Услуги салона красоты\Демакияж.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (58, N'Коррекция ресниц', 2010.0000, 1200, N'Лицо', 0.1, N'Услуги салона красоты\Ресницы.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (59, N'Детская стрижка', 2330.0000, 2100, N'Волосы', 0.2, N'Услуги салона красоты\стрижка.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (60, N'Мужская стрижка', 1690.0000, 3000, N'Волосы', 0, N'Услуги салона красоты\man.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (61, N'Вечерняя прическа', 2020.0000, 900, N'Волосы', 0.25, N'Услуги салона красоты\стрижка.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (62, N'Наращивание ресниц беличьего эффекта', 1010.0000, 1800, N'Лицо', 0, N'Услуги салона красоты\Ресницы.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (63, N'Мезонити (Тредлифтинг)', 2140.0000, 1500, N'Процедура', 0, N'Услуги салона красоты\96.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (64, N'Покрытие ногтей', 2410.0000, 2400, N'Руки', 0.15, N'Услуги салона красоты\ногти.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (65, N'Гавайский массаж Ломи-Ломи', 1040.0000, 2100, N'Тело', 0.15, N'Услуги салона красоты\массаж.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (66, N'Парафинотерапия', 1180.0000, 2100, N'Процедура', 0.05, N'Услуги салона красоты\Парафинотерапия.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (67, N'Озонотерапия', 1740.0000, 2100, N'Процедура', 0.2, N'Услуги салона красоты\face.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (68, N'Миндальный пилинг', 2430.0000, 2700, N'Процедура', 0.15, N'Услуги салона красоты\piling.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (69, N'Покрытие ногтей гель-лаком', 2100.0000, 900, N'Руки', 0.2, N'Услуги салона красоты\Покрытие ногтей гель-лаком.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (70, N'Декорирование ресниц стразами', 1920.0000, 3000, N'Лицо', 0.15, N'Услуги салона красоты\Ресницы.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (71, N'Микротоковая терапия', 2410.0000, 2700, N'Процедура', 0.05, N'Услуги салона красоты\face.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (72, N'Стрижка челки', 1930.0000, 2100, N'Волосы', 0.1, N'Услуги салона красоты\стрижка.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (73, N'Лазерный пилинг', 1650.0000, 1200, N'Процедура', 0.25, N'Услуги салона красоты\piling.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (74, N'Массаж лица', 2370.0000, 3600, N'Лицо', 0, N'Услуги салона красоты\массаж.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (75, N'Снятие лака', 1240.0000, 2100, N'Руки', 0, N'Услуги салона красоты\ногти.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (76, N'Классический педикюр', 2040.0000, 2100, N'Процедура', 0.25, N'Услуги салона красоты\Экспресс-педикюр.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (77, N'Классический массаж', 1120.0000, 2700, N'Тело', 0.15, N'Услуги салона красоты\массаж.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (78, N'Окрашивание бровей', 1120.0000, 3600, N'Лицо', 0.1, N'Услуги салона красоты\Окрашивание бровей.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (79, N'Наращивание ногтей гелем', 1540.0000, 2400, N'Руки', 0.1, N'Услуги салона красоты\ногти.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (80, N'Ботокс', 1820.0000, 3000, N'Процедура', 0.15, N'Услуги салона красоты\96.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (81, N'Инъекционные методики', 1660.0000, 2400, N'Процедура', 0, N'Услуги салона красоты\96.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (82, N'Покраска ресниц', 2400.0000, 1800, N'Лицо', 0, N'Услуги салона красоты\Ресницы.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (83, N'Свадебная прическа', 2070.0000, 2700, N'Волосы', 0, N'Услуги салона красоты\стрижка.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (84, N'Моделирование ресниц', 2140.0000, 2700, N'Лицо', 0, N'Услуги салона красоты\Моделирование ресниц.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (85, N'Миостимуляция', 2380.0000, 3600, N'Процедура', 0, N'Услуги салона красоты\face.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (86, N'Шугаринг', 1400.0000, 1800, N'Процедура', 0, N'Услуги салона красоты\Шугаринг.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (87, N'Укрепление ногтей гелем', 1260.0000, 2700, N'Руки', 0, N'Услуги салона красоты\Укрепление ногтей гелем.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (88, N'Солярий', 1790.0000, 3000, N'Тело', 0.1, N'Услуги салона красоты\soliarij.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (89, N'Моментальный лифтинг', 2020.0000, 3000, N'Лицо', 0, N'Услуги салона красоты\face.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (90, N'Детский маникюр', 1900.0000, 2100, N'Руки', 0, N'Услуги салона красоты\ногти.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (91, N'Ультразвуковой пилинг', 1440.0000, 2700, N'Лицо', 0.2, N'Услуги салона красоты\piling.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (92, N'ИК-сауна', 1160.0000, 2700, N'Процедура', 0.2, N'Услуги салона красоты\ИК-сауна.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (93, N'Контурная пластика', 1550.0000, 2100, N'Процедура', 0.2, N'Услуги салона красоты\Контурная пластика.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (94, N'Декорирование нарощенных ресниц стразами', 1130.0000, 2700, N'Лицо', 0, N'Услуги салона красоты\Декорирование нарощенных ресниц стразами.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (95, N'Депиляция воском', 2330.0000, 1800, N'Тело', 0.15, N'Услуги салона красоты\Депиляция воском.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (96, N'Полировка ногтей', 2310.0000, 3000, N'Руки', 0.15, N'Услуги салона красоты\Полировка ногтей.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (97, N'Фракционный лазер Palomar Emerge', 1720.0000, 1500, N'Процедура', 0.25, N'Услуги салона красоты\face.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (98, N'Увлажнение с коллагеном', 2490.0000, 3300, N'Процедура', 0, N'Услуги салона красоты\96.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (99, N'Массаж оздоровительный', 1440.0000, 1200, N'Процедура', 0, N'Услуги салона красоты\массаж.jpg')
GO
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (100, N'Общий массаж', 1970.0000, 2700, N'Процедура', 0.25, N'Услуги салона красоты\массаж.jpg')
SET IDENTITY_INSERT [dbo].[Service] OFF
GO
SET IDENTITY_INSERT [dbo].[ServicePhoto] ON 

INSERT [dbo].[ServicePhoto] ([ID], [ServiceID], [PhotoPath]) VALUES (1, 1, N'Сервис\NarRes.png')
INSERT [dbo].[ServicePhoto] ([ID], [ServiceID], [PhotoPath]) VALUES (2, 2, N'Сервис\ModRes.png')
INSERT [dbo].[ServicePhoto] ([ID], [ServiceID], [PhotoPath]) VALUES (3, 3, N'Сервис\LamRes.png')
INSERT [dbo].[ServicePhoto] ([ID], [ServiceID], [PhotoPath]) VALUES (4, 4, N'Сервис\RusSpa.png')
INSERT [dbo].[ServicePhoto] ([ID], [ServiceID], [PhotoPath]) VALUES (5, 5, N'Сервис\Mezoterapia.png')
INSERT [dbo].[ServicePhoto] ([ID], [ServiceID], [PhotoPath]) VALUES (6, 6, N'Сервис\PoluPer.png')
INSERT [dbo].[ServicePhoto] ([ID], [ServiceID], [PhotoPath]) VALUES (7, 7, N'Сервис\ExSpa.png')
INSERT [dbo].[ServicePhoto] ([ID], [ServiceID], [PhotoPath]) VALUES (8, 8, N'Сервис\Pirs.png')
INSERT [dbo].[ServicePhoto] ([ID], [ServiceID], [PhotoPath]) VALUES (9, 9, N'Сервис\MasOil.png')
INSERT [dbo].[ServicePhoto] ([ID], [ServiceID], [PhotoPath]) VALUES (10, 10, N'Сервис\Press.png')
INSERT [dbo].[ServicePhoto] ([ID], [ServiceID], [PhotoPath]) VALUES (11, 11, N'Сервис\EuMan.png')
INSERT [dbo].[ServicePhoto] ([ID], [ServiceID], [PhotoPath]) VALUES (12, 12, N'Сервис\DelSkin.png')
INSERT [dbo].[ServicePhoto] ([ID], [ServiceID], [PhotoPath]) VALUES (13, 13, N'Сервис\SpainMas.png')
INSERT [dbo].[ServicePhoto] ([ID], [ServiceID], [PhotoPath]) VALUES (14, 14, N'Сервис\DollRes.png')
INSERT [dbo].[ServicePhoto] ([ID], [ServiceID], [PhotoPath]) VALUES (15, 15, N'Сервис\ColorHairStyle.png')
INSERT [dbo].[ServicePhoto] ([ID], [ServiceID], [PhotoPath]) VALUES (16, 16, N'Сервис\Detox.png')
INSERT [dbo].[ServicePhoto] ([ID], [ServiceID], [PhotoPath]) VALUES (17, 17, N'Сервис\StoneTer.png')
INSERT [dbo].[ServicePhoto] ([ID], [ServiceID], [PhotoPath]) VALUES (18, 18, N'Сервис\RadioLif.png')
INSERT [dbo].[ServicePhoto] ([ID], [ServiceID], [PhotoPath]) VALUES (19, 19, N'Сервис\HimStyle.png')
INSERT [dbo].[ServicePhoto] ([ID], [ServiceID], [PhotoPath]) VALUES (20, 20, N'Сервис\AlMask.png')
INSERT [dbo].[ServicePhoto] ([ID], [ServiceID], [PhotoPath]) VALUES (21, 21, N'Сервис\SportMas.png')
INSERT [dbo].[ServicePhoto] ([ID], [ServiceID], [PhotoPath]) VALUES (22, 22, N'Сервис\HealthNails.png')
INSERT [dbo].[ServicePhoto] ([ID], [ServiceID], [PhotoPath]) VALUES (23, 23, N'Сервис\Rekonst.png')
INSERT [dbo].[ServicePhoto] ([ID], [ServiceID], [PhotoPath]) VALUES (24, 24, N'Сервис\ClassicMan.png')
INSERT [dbo].[ServicePhoto] ([ID], [ServiceID], [PhotoPath]) VALUES (25, 25, N'Сервис\DoctorKons.png')
INSERT [dbo].[ServicePhoto] ([ID], [ServiceID], [PhotoPath]) VALUES (26, 26, N'Сервис\FoxRes.png')
INSERT [dbo].[ServicePhoto] ([ID], [ServiceID], [PhotoPath]) VALUES (27, 27, N'Сервис\Pedikur.png')
INSERT [dbo].[ServicePhoto] ([ID], [ServiceID], [PhotoPath]) VALUES (28, 28, N'Сервис\GrechaMas.png')
INSERT [dbo].[ServicePhoto] ([ID], [ServiceID], [PhotoPath]) VALUES (29, 29, N'Сервис\ComboManik.png')
INSERT [dbo].[ServicePhoto] ([ID], [ServiceID], [PhotoPath]) VALUES (30, 30, N'Сервис\Fonorez.png')
INSERT [dbo].[ServicePhoto] ([ID], [ServiceID], [PhotoPath]) VALUES (31, 31, N'Сервис\Tatuazh.png')
INSERT [dbo].[ServicePhoto] ([ID], [ServiceID], [PhotoPath]) VALUES (32, 32, N'Сервис\HimPil.png')
INSERT [dbo].[ServicePhoto] ([ID], [ServiceID], [PhotoPath]) VALUES (33, 33, N'Сервис\PlazmLift.png')
INSERT [dbo].[ServicePhoto] ([ID], [ServiceID], [PhotoPath]) VALUES (34, 34, N'Сервис\CryoLift.png')
INSERT [dbo].[ServicePhoto] ([ID], [ServiceID], [PhotoPath]) VALUES (35, 35, N'Сервис\BasePil.png')
INSERT [dbo].[ServicePhoto] ([ID], [ServiceID], [PhotoPath]) VALUES (36, 36, N'Сервис\ColorRes.png')
INSERT [dbo].[ServicePhoto] ([ID], [ServiceID], [PhotoPath]) VALUES (37, 37, N'Сервис\CorrRes.png')
INSERT [dbo].[ServicePhoto] ([ID], [ServiceID], [PhotoPath]) VALUES (38, 38, N'Сервис\Young.png')
INSERT [dbo].[ServicePhoto] ([ID], [ServiceID], [PhotoPath]) VALUES (39, 39, N'Сервис\ArtistRes.png')
INSERT [dbo].[ServicePhoto] ([ID], [ServiceID], [PhotoPath]) VALUES (40, 40, N'Сервис\EstFace.png')
INSERT [dbo].[ServicePhoto] ([ID], [ServiceID], [PhotoPath]) VALUES (41, 41, N'Сервис\ZHIVA.png')
INSERT [dbo].[ServicePhoto] ([ID], [ServiceID], [PhotoPath]) VALUES (42, 42, N'Сервис\Makeup.png')
INSERT [dbo].[ServicePhoto] ([ID], [ServiceID], [PhotoPath]) VALUES (43, 43, N'Сервис\Timeto.png')
INSERT [dbo].[ServicePhoto] ([ID], [ServiceID], [PhotoPath]) VALUES (44, 44, N'Сервис\ResOut.png')
INSERT [dbo].[ServicePhoto] ([ID], [ServiceID], [PhotoPath]) VALUES (45, 45, N'Сервис\Eyebrows.png')
INSERT [dbo].[ServicePhoto] ([ID], [ServiceID], [PhotoPath]) VALUES (46, 46, N'Сервис\Beard.png')
INSERT [dbo].[ServicePhoto] ([ID], [ServiceID], [PhotoPath]) VALUES (47, 47, N'Сервис\MaskFaceService.png')
INSERT [dbo].[ServicePhoto] ([ID], [ServiceID], [PhotoPath]) VALUES (48, 48, N'Сервис\TatuazhService.png')
INSERT [dbo].[ServicePhoto] ([ID], [ServiceID], [PhotoPath]) VALUES (49, 49, N'Сервис\CareFace.png')
INSERT [dbo].[ServicePhoto] ([ID], [ServiceID], [PhotoPath]) VALUES (50, 50, N'Сервис\EarsProkol.png')
INSERT [dbo].[ServicePhoto] ([ID], [ServiceID], [PhotoPath]) VALUES (51, 51, N'Сервис\RemontNail.png')
INSERT [dbo].[ServicePhoto] ([ID], [ServiceID], [PhotoPath]) VALUES (52, 52, N'Сервис\PolOil.png')
INSERT [dbo].[ServicePhoto] ([ID], [ServiceID], [PhotoPath]) VALUES (53, 53, N'Сервис\YoungerEyes.png')
INSERT [dbo].[ServicePhoto] ([ID], [ServiceID], [PhotoPath]) VALUES (54, 54, N'Сервис\Cosmetologia.png')
INSERT [dbo].[ServicePhoto] ([ID], [ServiceID], [PhotoPath]) VALUES (55, 55, N'Сервис\CosmetologKons.png')
INSERT [dbo].[ServicePhoto] ([ID], [ServiceID], [PhotoPath]) VALUES (56, 56, N'Сервис\Vizazh.png')
INSERT [dbo].[ServicePhoto] ([ID], [ServiceID], [PhotoPath]) VALUES (57, 57, N'Сервис\DeMakeUp.png')
INSERT [dbo].[ServicePhoto] ([ID], [ServiceID], [PhotoPath]) VALUES (58, 58, N'Сервис\CorrectRes.png')
INSERT [dbo].[ServicePhoto] ([ID], [ServiceID], [PhotoPath]) VALUES (59, 59, N'Сервис\KidsHairCut.png')
INSERT [dbo].[ServicePhoto] ([ID], [ServiceID], [PhotoPath]) VALUES (60, 60, N'Сервис\MansHairCut.png')
INSERT [dbo].[ServicePhoto] ([ID], [ServiceID], [PhotoPath]) VALUES (61, 61, N'Сервис\EveningHairStyle.png')
INSERT [dbo].[ServicePhoto] ([ID], [ServiceID], [PhotoPath]) VALUES (62, 62, N'Сервис\BelichEff.png')
INSERT [dbo].[ServicePhoto] ([ID], [ServiceID], [PhotoPath]) VALUES (63, 63, N'Сервис\Mezoniti.png')
INSERT [dbo].[ServicePhoto] ([ID], [ServiceID], [PhotoPath]) VALUES (64, 64, N'Сервис\PokNail.png')
INSERT [dbo].[ServicePhoto] ([ID], [ServiceID], [PhotoPath]) VALUES (65, 65, N'Сервис\HawaiiMas.png')
INSERT [dbo].[ServicePhoto] ([ID], [ServiceID], [PhotoPath]) VALUES (66, 66, N'Сервис\Paraphin.png')
INSERT [dbo].[ServicePhoto] ([ID], [ServiceID], [PhotoPath]) VALUES (67, 67, N'Сервис\Ozon.png')
INSERT [dbo].[ServicePhoto] ([ID], [ServiceID], [PhotoPath]) VALUES (68, 68, N'Сервис\Mindal.png')
INSERT [dbo].[ServicePhoto] ([ID], [ServiceID], [PhotoPath]) VALUES (69, 69, N'Сервис\GelLak.png')
INSERT [dbo].[ServicePhoto] ([ID], [ServiceID], [PhotoPath]) VALUES (70, 70, N'Сервис\StrazRes.png')
INSERT [dbo].[ServicePhoto] ([ID], [ServiceID], [PhotoPath]) VALUES (71, 71, N'Сервис\MicroTok.png')
INSERT [dbo].[ServicePhoto] ([ID], [ServiceID], [PhotoPath]) VALUES (72, 72, N'Сервис\FrontHairCut.png')
INSERT [dbo].[ServicePhoto] ([ID], [ServiceID], [PhotoPath]) VALUES (73, 73, N'Сервис\LazerPil.png')
INSERT [dbo].[ServicePhoto] ([ID], [ServiceID], [PhotoPath]) VALUES (74, 74, N'Сервис\MasFace.png')
INSERT [dbo].[ServicePhoto] ([ID], [ServiceID], [PhotoPath]) VALUES (75, 75, N'Сервис\SnyatieLaka.png')
INSERT [dbo].[ServicePhoto] ([ID], [ServiceID], [PhotoPath]) VALUES (76, 76, N'Сервис\ClassicPedikur.png')
INSERT [dbo].[ServicePhoto] ([ID], [ServiceID], [PhotoPath]) VALUES (77, 77, N'Сервис\ClassicMass.png')
INSERT [dbo].[ServicePhoto] ([ID], [ServiceID], [PhotoPath]) VALUES (78, 78, N'Сервис\ColorEyebrows.png')
INSERT [dbo].[ServicePhoto] ([ID], [ServiceID], [PhotoPath]) VALUES (79, 79, N'Сервис\NarashGel.png')
INSERT [dbo].[ServicePhoto] ([ID], [ServiceID], [PhotoPath]) VALUES (80, 80, N'Сервис\Botox.png')
INSERT [dbo].[ServicePhoto] ([ID], [ServiceID], [PhotoPath]) VALUES (81, 81, N'Сервис\InekTech.png')
INSERT [dbo].[ServicePhoto] ([ID], [ServiceID], [PhotoPath]) VALUES (82, 82, N'Сервис\ColorRes.png')
INSERT [dbo].[ServicePhoto] ([ID], [ServiceID], [PhotoPath]) VALUES (83, 83, N'Сервис\WeddingHairStyle.png')
INSERT [dbo].[ServicePhoto] ([ID], [ServiceID], [PhotoPath]) VALUES (84, 84, N'Сервис\ModRes.png')
INSERT [dbo].[ServicePhoto] ([ID], [ServiceID], [PhotoPath]) VALUES (85, 85, N'Сервис\MioStim.png')
INSERT [dbo].[ServicePhoto] ([ID], [ServiceID], [PhotoPath]) VALUES (86, 86, N'Сервис\Sugaring.png')
INSERT [dbo].[ServicePhoto] ([ID], [ServiceID], [PhotoPath]) VALUES (87, 87, N'Сервис\UkrenNail.png')
INSERT [dbo].[ServicePhoto] ([ID], [ServiceID], [PhotoPath]) VALUES (88, 88, N'Сервис\Solyari.png')
INSERT [dbo].[ServicePhoto] ([ID], [ServiceID], [PhotoPath]) VALUES (89, 89, N'Сервис\MomentLift.png')
INSERT [dbo].[ServicePhoto] ([ID], [ServiceID], [PhotoPath]) VALUES (90, 90, N'Сервис\KidsMan.png')
INSERT [dbo].[ServicePhoto] ([ID], [ServiceID], [PhotoPath]) VALUES (91, 91, N'Сервис\UltraSound.png')
INSERT [dbo].[ServicePhoto] ([ID], [ServiceID], [PhotoPath]) VALUES (92, 92, N'Сервис\Ik.png')
INSERT [dbo].[ServicePhoto] ([ID], [ServiceID], [PhotoPath]) VALUES (93, 93, N'Сервис\ConturPlast.png')
INSERT [dbo].[ServicePhoto] ([ID], [ServiceID], [PhotoPath]) VALUES (94, 94, N'Сервис\DecorResStr.png')
INSERT [dbo].[ServicePhoto] ([ID], [ServiceID], [PhotoPath]) VALUES (95, 95, N'Сервис\Wax.png')
INSERT [dbo].[ServicePhoto] ([ID], [ServiceID], [PhotoPath]) VALUES (96, 96, N'Сервис\PolyNail.png')
INSERT [dbo].[ServicePhoto] ([ID], [ServiceID], [PhotoPath]) VALUES (97, 97, N'Сервис\FrakLazer.png')
INSERT [dbo].[ServicePhoto] ([ID], [ServiceID], [PhotoPath]) VALUES (98, 98, N'Сервис\Collagen.png')
INSERT [dbo].[ServicePhoto] ([ID], [ServiceID], [PhotoPath]) VALUES (99, 99, N'Сервис\HealthMas.png')
GO
INSERT [dbo].[ServicePhoto] ([ID], [ServiceID], [PhotoPath]) VALUES (100, 100, N'Сервис\CommonMas.png')
SET IDENTITY_INSERT [dbo].[ServicePhoto] OFF
GO
SET IDENTITY_INSERT [dbo].[Tag] ON 

INSERT [dbo].[Tag] ([ID], [Title], [Color]) VALUES (1, N'New Client', N'CD5C5C')
INSERT [dbo].[Tag] ([ID], [Title], [Color]) VALUES (2, N'Nice Client', N'32CD32')
INSERT [dbo].[Tag] ([ID], [Title], [Color]) VALUES (3, N'Rude Client', N'8B0000')
INSERT [dbo].[Tag] ([ID], [Title], [Color]) VALUES (4, N'Tip Client', N'B0E0E6')
INSERT [dbo].[Tag] ([ID], [Title], [Color]) VALUES (5, N'Latecomer', N'9370DB')
SET IDENTITY_INSERT [dbo].[Tag] OFF
GO
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (1, 3)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (2, 4)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (3, 3)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (4, 1)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (5, 2)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (6, 5)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (7, 1)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (8, 2)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (9, 2)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (10, 1)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (11, 3)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (12, 5)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (13, 5)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (14, 1)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (15, 2)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (16, 2)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (17, 2)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (18, 1)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (19, 1)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (20, 3)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (21, 5)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (22, 2)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (23, 5)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (24, 2)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (25, 5)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (26, 1)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (27, 4)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (28, 5)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (29, 1)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (30, 4)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (31, 2)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (32, 2)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (33, 3)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (34, 2)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (35, 1)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (36, 5)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (37, 5)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (38, 1)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (39, 2)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (40, 2)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (41, 5)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (42, 1)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (43, 2)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (44, 5)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (45, 5)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (46, 5)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (47, 1)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (48, 1)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (49, 4)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (50, 4)
GO
ALTER TABLE [dbo].[AttachedProduct]  WITH CHECK ADD  CONSTRAINT [FK_AttachedProduct_Product] FOREIGN KEY([MainProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[AttachedProduct] CHECK CONSTRAINT [FK_AttachedProduct_Product]
GO
ALTER TABLE [dbo].[AttachedProduct]  WITH CHECK ADD  CONSTRAINT [FK_AttachedProduct_Product1] FOREIGN KEY([AttachedProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[AttachedProduct] CHECK CONSTRAINT [FK_AttachedProduct_Product1]
GO
ALTER TABLE [dbo].[Client]  WITH CHECK ADD  CONSTRAINT [FK_Client_Gender] FOREIGN KEY([GenderCode])
REFERENCES [dbo].[Gender] ([Code])
GO
ALTER TABLE [dbo].[Client] CHECK CONSTRAINT [FK_Client_Gender]
GO
ALTER TABLE [dbo].[ClientService]  WITH CHECK ADD  CONSTRAINT [FK_ClientService_Client] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Client] ([ID])
GO
ALTER TABLE [dbo].[ClientService] CHECK CONSTRAINT [FK_ClientService_Client]
GO
ALTER TABLE [dbo].[ClientService]  WITH CHECK ADD  CONSTRAINT [FK_ClientService_Service] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Service] ([ID])
GO
ALTER TABLE [dbo].[ClientService] CHECK CONSTRAINT [FK_ClientService_Service]
GO
ALTER TABLE [dbo].[DocumentByService]  WITH CHECK ADD  CONSTRAINT [FK_DocumentByService_ClientService] FOREIGN KEY([ClientServiceID])
REFERENCES [dbo].[ClientService] ([ID])
GO
ALTER TABLE [dbo].[DocumentByService] CHECK CONSTRAINT [FK_DocumentByService_ClientService]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Manufacturer] FOREIGN KEY([ManufacturerID])
REFERENCES [dbo].[Manufacturer] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Manufacturer]
GO
ALTER TABLE [dbo].[ProductPhoto]  WITH CHECK ADD  CONSTRAINT [FK_ProductPhoto_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductPhoto] CHECK CONSTRAINT [FK_ProductPhoto_Product]
GO
ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD  CONSTRAINT [FK_ProductSale_ClientService] FOREIGN KEY([ClientServiceID])
REFERENCES [dbo].[ClientService] ([ID])
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_ClientService]
GO
ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD  CONSTRAINT [FK_ProductSale_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_Product]
GO
ALTER TABLE [dbo].[ServicePhoto]  WITH CHECK ADD  CONSTRAINT [FK_ServicePhoto_Service] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Service] ([ID])
GO
ALTER TABLE [dbo].[ServicePhoto] CHECK CONSTRAINT [FK_ServicePhoto_Service]
GO
ALTER TABLE [dbo].[TagOfClient]  WITH CHECK ADD  CONSTRAINT [FK_TagOfClient_Client] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Client] ([ID])
GO
ALTER TABLE [dbo].[TagOfClient] CHECK CONSTRAINT [FK_TagOfClient_Client]
GO
ALTER TABLE [dbo].[TagOfClient]  WITH CHECK ADD  CONSTRAINT [FK_TagOfClient_Tag] FOREIGN KEY([TagID])
REFERENCES [dbo].[Tag] ([ID])
GO
ALTER TABLE [dbo].[TagOfClient] CHECK CONSTRAINT [FK_TagOfClient_Tag]
GO
USE [master]
GO
ALTER DATABASE [SalonB] SET  READ_WRITE 
GO
