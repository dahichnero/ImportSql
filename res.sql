
/****** Object:  Table [dbo].[AttachedProduct]    Script Date: 12/2/2019 10:23:09 PM ******/

use SalonB;
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 12/2/2019 10:23:09 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientService]    Script Date: 12/2/2019 10:23:09 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DocumentByService]    Script Date: 12/2/2019 10:23:09 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gender]    Script Date: 12/2/2019 10:23:09 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manufacturer]    Script Date: 12/2/2019 10:23:09 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 12/2/2019 10:23:09 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductPhoto]    Script Date: 12/2/2019 10:23:09 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductSale]    Script Date: 12/2/2019 10:23:10 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 12/2/2019 10:23:10 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServicePhoto]    Script Date: 12/2/2019 10:23:10 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tag]    Script Date: 12/2/2019 10:23:10 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TagOfClient]    Script Date: 12/2/2019 10:23:10 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
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

INSERT INTO Gender(Code, Name)
VALUES (1,'мужской'),
(2,'женский');

use SalonB;
INSERT INTO Manufacturer (Name, StartDate)
VALUES ('WB','2000.03.30'), ('Green Dolphin','2008.02.17'), ('Proiettile','2004.10.03'), ('Roki','2010.05.16'), ('Namida','2015.08.20');

use SalonB;
INSERT INTO Tag (Title, Color)
VALUES ('New Client','CD5C5C'), ('Nice Client','32CD32'), ('Rude Client','8B0000'), ('Tip Client','B0E0E6'), ('Latecomer','9370DB');

use SalonB;
INSERT INTO TagOfClient (ClientID, TagID)
VALUES (1,3), (2,4), (3,3), (4,1), (5,2),(6,5),(7,1),(8,2), (9,2), (10,1),
(11,3), (12,5), (13,5), (14,1), (15,2), (16,2), (17,2), (18,1),(19,1), (20,3),
(21,5), (22,2), (23,5), (24,2), (25,5), (26,1), (27,4), (28,5),(29,1), (30,4),
(31,2), (32,2), (33,3), (34,2), (35,1), (36,5), (37,5), (38,1),(39,2), (40,2),
(41,5), (42,1), (43,2), (44,5), (45,5), (46,5), (47,1), (48,1),(49,4), (50,4);

use SalonB;
INSERT INTO Product (Title,Cost, Description, MainImagePath,IsActive,ManufacturerID)
VALUES ('Крем для рук',700, 'Увлажняет кожу рук','Продукты\CreamHand.png',1,2),
('Крем для лица',800, 'Увлажняет кожу лица','Продукты\CreamFace.png',1,2),
('Маска для лица',1000, 'Надолго увлажняет кожу лица','Продукты\MaskFace.png',1,2),
('Шампунь для волос',500, 'Для ломких и поврежденных волос','Продукты\Shamp.png',0,1),
('Кондиционер для волос',550, 'Питает волосы','Продукты\Con.png',0,1),
('Бальзам для волос',300, 'Питает волосы','Продукты\Bal.png',1,1),
('Расческа для волос',200, 'Не спутывает волосы','Продукты\Brush.png',1,1),
('Масло для тела',300, 'Многофункциональное','Продукты\Oil.png',1,4),
('Скраб для тела',200, 'Убирает шелушения','Продукты\Scr.png',0,4),
('Пилинг',300, 'Удаление омертвевшей кожи','Продукты\Pil.png',0,4),
('Маникюрный набор',500, 'Домашний уход','Продукты\Manik.png',1,3),
('Лак для ногтей',100, 'Для нанесения на ногти','Продукты\ManikLak.png',1,3),
('Маска для волос',700, 'Питание для волос','Продукты\MaskHair.png',1,2),
('Краска для волос',500, 'Для окрашивания волос','Продукты\ColorHair.png',0,1),
('Порошок для обесвечивания',1000, 'Для осветления волос','Продукты\BleachHair.png',0,1),
('Оксид для обесвечивания',1000, 'Для осветления волос','Продукты\BleachHairOx.png',0,1),
('Массажная щетка',600, 'Для массажа','Продукты\MassBrush.png',1,4),
('Парфюм',5000, 'Свежесть и аромат','Продукты\Parfum.png',1,5),
('Пробники',500, 'Свежесть и аромат','Продукты\ParfumProb.png',1,5),
('Масляные духи',300, 'Свежесть и аромат','Продукты\ParfumOil.png',1,5);

update Product set MainImagePath='Продукты\Hair.png' where ID in (4,5,6,7,13,14,15,16);
update Product set MainImagePath='Продукты\CreamMask.png' where ID in (1,2,3);
update Product set MainImagePath='Продукты\Nail.png' where ID in (11,12);
update Product set MainImagePath='Продукты\Duhi.png' where ID in (18,19,20);
update Product set MainImagePath='Продукты\Body.png' where ID in (8,9,10,17);

INSERT INTO ProductPhoto(ProductID,PhotoPath)
VALUES (1,'Ассортимент\CreamHand.png'),(2,'Ассортимент\CreamFace.png'),(3,'Ассортимент\MaskFace.png'),
(4,'Ассортимент\Shamp.png'), (5,'Ассортимент\Con.png'),(6,'Ассортимент\Bal.png'),(7,'Ассортимент\Brush.png'),
(8,'Ассортимент\Oil.png'), (9,'Ассортимент\Scr.png'),(10,'Ассортимент\Pil.png'),
(11,'Ассортимент\Manik.png'),(12,'Ассортимент\ManikLak.png'),(13,'Ассортимент\MaskHair.png'),
(14,'Ассортимент\ColorHair.png'),(15,'Ассортимент\BleachHair.png'),(16,'Ассортимент\BleachHairOx.png'),(17,'Ассортимент\MassBrush.png'),
(18,'Ассортимент\Parfum.png'),(19,'Ассортимент\ParfumProb.png'),(20,'Ассортимент\ParfumOil.png');

INSERT INTO AttachedProduct (MainProductID, AttachedProductID)
VALUES (1,2),(1,3),(4,5),(4,6), (4,7), (8,9),(8,10),(8,17),(11,12),(14,13),(14,15),(14,16),(18,19),(18,20);

INSERT INTO ProductSale (SaleDate,ProductID,Quantity,ClientServiceID)
VALUES ('20190531 13:10:22',8,1,2),('20191215 15:20:45',8,1,50),('20190914 13:10:22',17,2,52),('20190907 11:10:23',3,1,16),('20190907 16:53:12',1,2,16),('20190920 18:44:21',6,4,3),
('20190321 23:14:43',3,1,32),('20190104 12:27:56',7,1,38),('20190721 14:35:24',7,1,79),('20190721 11:10:56',3,2,79),('20190723 12:45:13',12,5,37),('20190617 16:19:27',11,1,90);



INSERT INTO ServicePhoto(ServiceID,PhotoPath)
VALUES (1,'Сервис\NarRes.png'),(2,'Сервис\ModRes.png'),(3,'Сервис\LamRes.png'),(4,'Сервис\RusSpa.png'),(5,'Сервис\Mezoterapia.png'),
(6,'Сервис\PoluPer.png'),(7,'Сервис\ExSpa.png'),(8,'Сервис\Pirs.png'),(9,'Сервис\MasOil.png'),(10,'Сервис\Press.png'),
(11,'Сервис\EuMan.png'),(12,'Сервис\DelSkin.png'),(13,'Сервис\SpainMas.png'),(14,'Сервис\DollRes.png'),(15,'Сервис\ColorHairStyle.png'),
(16,'Сервис\Detox.png'),(17,'Сервис\StoneTer.png'),(18,'Сервис\RadioLif.png'),(19,'Сервис\HimStyle.png'),(20,'Сервис\AlMask.png'),
(21,'Сервис\SportMas.png'),(22,'Сервис\HealthNails.png'),(23,'Сервис\Rekonst.png'),(24,'Сервис\ClassicMan.png'),(25,'Сервис\DoctorKons.png'),
(26,'Сервис\FoxRes.png'),(27,'Сервис\Pedikur.png'),(28,'Сервис\GrechaMas.png'),(29,'Сервис\ComboManik.png'),(30,'Сервис\Fonorez.png'),
(31,'Сервис\Tatuazh.png'),(32,'Сервис\HimPil.png'),(33,'Сервис\PlazmLift.png'),(34,'Сервис\CryoLift.png'),(35,'Сервис\BasePil.png'),
(36,'Сервис\ColorRes.png'),(37,'Сервис\CorrRes.png'),(38,'Сервис\Young.png'),(39,'Сервис\ArtistRes.png'),(40,'Сервис\EstFace.png'),
(41,'Сервис\ZHIVA.png'),(42,'Сервис\Makeup.png'),(43,'Сервис\Timeto.png'),(44,'Сервис\ResOut.png'),(45,'Сервис\Eyebrows.png'),
(46,'Сервис\Beard.png'),(47,'Сервис\MaskFaceService.png'),(48,'Сервис\TatuazhService.png'),(49,'Сервис\CareFace.png'),(50,'Сервис\EarsProkol.png'),
(51,'Сервис\RemontNail.png'),(52,'Сервис\PolOil.png'),(53,'Сервис\YoungerEyes.png'),(54,'Сервис\Cosmetologia.png'),(55,'Сервис\CosmetologKons.png'),
(56,'Сервис\Vizazh.png'),(57,'Сервис\DeMakeUp.png'),(58,'Сервис\CorrectRes.png'),(59,'Сервис\KidsHairCut.png'),(60,'Сервис\MansHairCut.png'),
(61,'Сервис\EveningHairStyle.png'),(62,'Сервис\BelichEff.png'),(63,'Сервис\Mezoniti.png'),(64,'Сервис\PokNail.png'),(65,'Сервис\HawaiiMas.png'),
(66,'Сервис\Paraphin.png'),(67,'Сервис\Ozon.png'),(68,'Сервис\Mindal.png'),(69,'Сервис\GelLak.png'),(70,'Сервис\StrazRes.png'),
(71,'Сервис\MicroTok.png'),(72,'Сервис\FrontHairCut.png'),(73,'Сервис\LazerPil.png'),(74,'Сервис\MasFace.png'),(75,'Сервис\SnyatieLaka.png'),
(76,'Сервис\ClassicPedikur.png'),(77,'Сервис\ClassicMass.png'),(78,'Сервис\ColorEyebrows.png'),(79,'Сервис\NarashGel.png'),(80,'Сервис\Botox.png'),
(81,'Сервис\InekTech.png'),(82,'Сервис\ColorRes.png'),(83,'Сервис\WeddingHairStyle.png'),(84,'Сервис\ModRes.png'),(85,'Сервис\MioStim.png'),
(86,'Сервис\Sugaring.png'),(87,'Сервис\UkrenNail.png'),(88,'Сервис\Solyari.png'),(89,'Сервис\MomentLift.png'),(90,'Сервис\KidsMan.png'),
(91,'Сервис\UltraSound.png'),(92,'Сервис\Ik.png'),(93,'Сервис\ConturPlast.png'),(94,'Сервис\DecorResStr.png'),(95,'Сервис\Wax.png'),
(96,'Сервис\PolyNail.png'),(97,'Сервис\FrakLazer.png'),(98,'Сервис\Collagen.png'),(99,'Сервис\HealthMas.png'),(100,'Сервис\CommonMas.png');


INSERT INTO DocumentByService (ClientServiceID, DocumentPath)
VALUES (1,'Отчет\Отчёт о выполнении косметических услуг.doc'),(2,'Отчет\Отчёт о выполнении оздоровительных услуг.doc'),
(3,'Отчет\Отчёт о выполнении парикмахерских услуг.doc'),(4,'Отчет\Отчёт о выполнении услуг маникюра.doc'),
(5,'Отчет\Отчёт о выполнении косметических услуг.doc'),(6,'Отчет\Отчёт о выполнении косметических услуг.doc'),
(7,'Отчет\Отчёт о выполнении косметических услуг.doc'),(8,'Отчет\Отчёт о выполнении оздоровительных услуг.doc'),
(9,'Отчет\Отчёт о выполнении косметических услуг.doc'),(10,'Отчет\Отчёт о выполнении услуг маникюра.doc'),
(11,'Отчет\Отчёт о выполнении оздоровительных услуг.doc'),(12,'Отчет\Отчёт о выполнении услуг маникюра.doc'),
(13,'Отчет\Отчёт о выполнении косметических услуг.doc'),(14,'Отчет\Отчёт о выполнении косметических услуг.doc'),
(15,'Отчет\Отчёт о выполнении услуг маникюра.doc'),(16,'Отчет\Отчёт о выполнении оздоровительных услуг.doc'),
(17,'Отчет\Отчёт о выполнении услуг прокола.doc'),(18,'Отчет\Отчёт о выполнении косметических услуг.doc'),
(19,'Отчет\Отчёт о выполнении косметических услуг.doc'),(20,'Отчет\Отчёт о выполнении косметических услуг.doc'),
(21,'Отчет\Отчёт о выполнении оздоровительных услуг.doc'),(22,'Отчет\Отчёт о выполнении услуг по удалению волос.doc'),
(23,'Отчет\Отчёт о выполнении оздоровительных услуг.doc'),(24,'Отчет\Отчёт о выполнении оздоровительных услуг.doc'),
(25,'Отчет\Отчёт о выполнении услуг маникюра.doc'),(26,'Отчет\Отчёт о выполнении косметических услуг.doc'),
(27,'Отчет\Отчёт о выполнении оздоровительных услуг.doc'),(28,'Отчет\Отчёт о выполнении косметических услуг.doc'),
(29,'Отчет\Отчёт о выполнении услуг маникюра.doc'),(30,'Отчет\Отчёт о выполнении оздоровительных услуг.doc'),
(31,'Отчет\Отчёт о выполнении оздоровительных услуг.doc'),(32,'Отчет\Отчёт о выполнении парикмахерских услуг.doc'),
(33,'Отчет\Отчёт о выполнении услуг по удалению волос.doc'),(34,'Отчет\Отчёт о выполнении услуг маникюра.doc'),
(35,'Отчет\Отчёт о выполнении оздоровительных услуг.doc'),(36,'Отчет\Отчёт о выполнении услуг маникюра.doc'),
(37,'Отчет\Отчёт о выполнении услуг маникюра.doc'),(38,'Отчет\Отчёт о выполнении парикмахерских услуг.doc'),
(39,'Отчет\Отчёт о выполнении косметических услуг.doc'),(40,'Отчет\Отчёт о выполнении косметических услуг.doc'),
(41,'Отчет\Отчёт о выполнении услуг маникюра.doc'),(42,'Отчет\Отчёт о выполнении косметических услуг.doc'),
(43,'Отчет\Отчёт о выполнении косметических услуг.doc'),(44,'Отчет\Отчёт о выполнении косметических услуг.doc'),
(45,'Отчет\Отчёт о выполнении услуг маникюра.doc'),(46,'Отчет\Отчёт о выполнении услуг по удалению волос.doc'),
(47,'Отчет\Отчёт о выполнении услуг маникюра.doc'),(48,'Отчет\Отчёт о выполнении косметических услуг.doc'),
(49,'Отчет\Отчёт о выполнении косметических услуг.doc'),(50,'Отчет\Отчёт о выполнении оздоровительных услуг.doc'),


(51,'Отчет\Отчёт о выполнении оздоровительных услуг.doc'),(52,'Отчет\Отчёт о выполнении услуг маникюра.doc'),
(53,'Отчет\Отчёт о выполнении оздоровительных услуг.doc'),(54,'Отчет\Отчёт о выполнении косметических услуг.doc'),
(55,'Отчет\Отчёт о выполнении косметических услуг.doc'),(56,'Отчет\Отчёт о выполнении услуг по удалению волос.doc'),
(57,'Отчет\Отчёт о выполнении косметических услуг.doc'),(58,'Отчет\Отчёт о выполнении оздоровительных услуг.doc'),
(59,'Отчет\Отчёт о выполнении оздоровительных услуг.doc'),(60,'Отчет\Отчёт о выполнении косметических услуг.doc'),
(61,'Отчет\Отчёт о выполнении оздоровительных услуг.doc'),(62,'Отчет\Отчёт о выполнении оздоровительных услуг.doc'),
(63,'Отчет\Отчёт о выполнении косметических услуг.doc'),(64,'Отчет\Отчёт о выполнении косметических услуг.doc'),
(65,'Отчет\Отчёт о выполнении косметических услуг.doc'),(66,'Отчет\Отчёт о выполнении косметических услуг.doc'),
(67,'Отчет\Отчёт о выполнении оздоровительных услуг.doc'),(68,'Отчет\Отчёт о выполнении косметических услуг.doc'),
(69,'Отчет\Отчёт о выполнении косметических услуг.doc'),(70,'Отчет\Отчёт о выполнении косметических услуг.doc'),
(71,'Отчет\Отчёт о выполнении косметических услуг.doc'),(72,'Отчет\Отчёт о выполнении косметических услуг.doc'),
(73,'Отчет\Отчёт о выполнении оздоровительных услуг.doc'),(74,'Отчет\Отчёт о выполнении косметических услуг.doc'),
(75,'Отчет\Отчёт о выполнении услуг по удалению волос.doc'),(76,'Отчет\Отчёт о выполнении оздоровительных услуг.doc'),
(77,'Отчет\Отчёт о выполнении косметических услуг.doc'),(78,'Отчет\Отчёт о выполнении косметических услуг.doc'),
(79,'Отчет\Отчёт о выполнении парикмахерских услуг.doc'),(80,'Отчет\Отчёт о выполнении косметических услуг.doc'),
(81,'Отчет\Отчёт о выполнении оздоровительных услуг.doc'),(82,'Отчет\Отчёт о выполнении оздоровительных услуг.doc'),
(83,'Отчет\Отчёт о выполнении косметических услуг.doc'),(84,'Отчет\Отчёт о выполнении оздоровительных услуг.doc'),
(85,'Отчет\Отчёт о выполнении услуг прокола.doc'),(86,'Отчет\Отчёт о выполнении услуг маникюра.doc'),
(87,'Отчет\Отчёт о выполнении оздоровительных услуг.doc'),(88,'Отчет\Отчёт о выполнении косметических услуг.doc'),
(89,'Отчет\Отчёт о выполнении оздоровительных услуг.doc'),(90,'Отчет\Отчёт о выполнении услуг маникюра.doc'),

(91,'Отчет\Отчёт о выполнении оздоровительных услуг.doc'),(92,'Отчет\Отчёт о выполнении услуг маникюра.doc'),
(93,'Отчет\Отчёт о выполнении косметических услуг.doc'),(94,'Отчет\Отчёт о выполнении косметических услуг.doc'),
(95,'Отчет\Отчёт о выполнении косметических услуг.doc'),(96,'Отчет\Отчёт о выполнении косметических услуг.doc'),
(97,'Отчет\Отчёт о выполнении услуг прокола.doc'),(98,'Отчет\Отчёт о выполнении косметических услуг.doc'),
(99,'Отчет\Отчёт о выполнении косметических услуг.doc'),(100,'Отчет\Отчёт о выполнении услуг маникюра.doc');
