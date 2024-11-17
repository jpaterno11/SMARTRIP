@ -1,1675 +0,0 @@
USE [master]
GO
/****** Object:  Database [SMARTRIP]    Script Date: 14/11/2024 11:18:32 ******/
CREATE DATABASE [SMARTRIP]
 CONTAINMENT = NONE
 
USE [SMARTRIP]
GO
/****** Object:  User [alumno]    Script Date: 14/11/2024 11:18:33 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[AUTOS]    Script Date: 14/11/2024 11:18:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AUTOS](
	[Patente] [varchar](50) NOT NULL,
	[Conductor] [varchar](50) NOT NULL,
	[IDEmpresa] [int] NOT NULL,
	[Disponible] [bit] NOT NULL,
	[Modelo] [varchar](50) NOT NULL,
 CONSTRAINT [PK_AUTOS] PRIMARY KEY CLUSTERED 
(
	[Patente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EMPRESA]    Script Date: 14/11/2024 11:18:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EMPRESA](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[CantidadAutos] [int] NOT NULL,
 CONSTRAINT [PK_EMPRESA] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PAGOS]    Script Date: 14/11/2024 11:18:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PAGOS](
	[IDPago] [int] IDENTITY(1,1) NOT NULL,
	[IDViaje] [int] NOT NULL,
	[Costo] [decimal](10, 2) NOT NULL,
	[FechaPago] [date] NOT NULL,
	[MetodoPago] [varchar](50) NOT NULL,
 CONSTRAINT [PK_PAGOS] PRIMARY KEY CLUSTERED 
(
	[IDPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RESEÑAS]    Script Date: 14/11/2024 11:18:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RESEÑAS](
	[IDReseña] [int] IDENTITY(1,1) NOT NULL,
	[IDUsuario] [int] NOT NULL,
	[IDViaje] [int] NOT NULL,
	[CalificacionAuto] [int] NOT NULL,
	[Mensaje] [varchar](300) NULL,
	[CalificacionConductor] [int] NOT NULL,
	[Fecha] [date] NOT NULL,
 CONSTRAINT [PK_RESEÑAS] PRIMARY KEY CLUSTERED 
(
	[IDReseña] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USUARIO]    Script Date: 14/11/2024 11:18:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USUARIO](
	[nombre] [varchar](50) NOT NULL,
	[apellido] [varchar](50) NOT NULL,
	[fechaNacimiento] [date] NOT NULL,
	[genero] [varchar](10) NOT NULL,
	[email] [varchar](50) NULL,
	[telefono] [int] NULL,
	[contraseña] [varchar](50) NOT NULL,
	[idUsuario] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_USUARIO] PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VIAJES]    Script Date: 14/11/2024 11:18:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VIAJES](
	[Fecha] [date] NOT NULL,
	[UbicacionInicial] [varchar](100) NOT NULL,
	[UbicacionFinal] [varchar](100) NOT NULL,
	[IDUsuario] [int] NOT NULL,
	[Costo] [decimal](10, 2) NOT NULL,
	[IDViaje] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_VIAJES_1] PRIMARY KEY CLUSTERED 
(
	[IDViaje] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VIAJESxAUTOS]    Script Date: 14/11/2024 11:18:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VIAJESxAUTOS](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Patente] [varchar](50) NOT NULL,
	[Fecha] [date] NOT NULL,
	[IDViaje] [int] NOT NULL,
 CONSTRAINT [PK_VIAJESxAUTOS] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ZONA]    Script Date: 14/11/2024 11:18:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ZONA](
	[IDZona] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ZONA] PRIMARY KEY CLUSTERED 
(
	[IDZona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ZONAxAUTOS]    Script Date: 14/11/2024 11:18:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ZONAxAUTOS](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Patente] [varchar](50) NOT NULL,
	[IDZona] [int] NOT NULL,
	[Cercanía] [bit] NOT NULL,
 CONSTRAINT [PK_ZonaXAutos] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'19UUA9F50CA638268', N'Brooke Possell', 2, 0, N'Chevrolet')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'19UUA9F76CA626224', N'Anna Jurasz', 1, 1, N'Audi')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'19UYA42453A715556', N'Morgen Grendon', 3, 0, N'Suzuki')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'19UYA42543A391606', N'Elyssa Bathoe', 1, 0, N'Toyota')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'1B3CB5HAXAD072787', N'Sherline Abrahamsohn', 2, 1, N'Chevrolet')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'1C3CCBBB7DN155432', N'Eda Onge', 3, 1, N'Mercedes-Benz')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'1C4AJWAG2CL144586', N'Brynna Stanyan', 1, 1, N'Maybach')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'1C4RJEAG6FC834939', N'Kippie Sharnock', 3, 1, N'GMC')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'1FBSS3BL7AD967471', N'Juanita Waterhouse', 1, 1, N'Chevrolet')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'1FTEW1CM4CK696019', N'Jaymee Nussgen', 3, 1, N'Buick')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'1FTEX1C85AF533952', N'Bealle Carpenter', 2, 0, N'Buick')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'1FTEX1CW6AK798711', N'Tonie Bernardini', 2, 1, N'Toyota')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'1FTFW1E8XAK852517', N'Coop Joseph', 2, 1, N'Chevrolet')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'1FTSW3B54AE254278', N'Tamera Bohman', 3, 0, N'Ford')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'1FTSX2B50AE020131', N'Katherine Obell', 2, 1, N'Ford')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'1G4HP57248U909636', N'Neal Hassent', 2, 0, N'Dodge')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'1G6AL1R33F0801516', N'Gallard Call', 1, 1, N'Mercury')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'1G6AL5S36E0437267', N'Renard Float', 1, 0, N'Volvo')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'1G6AU5S88E0714929', N'Raviv Haeslier', 3, 1, N'Ford')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'1G6AZ5S33E0223951', N'Ericha McCartan', 1, 0, N'Ford')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'1G6DH8E38E0275072', N'Laurianne Abbotts', 3, 1, N'Nissan')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'1G6DL67A180335079', N'Alecia Lamba', 1, 1, N'Toyota')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'1GD02ZCG5CZ106382', N'Tracee Instrell', 3, 1, N'Cadillac')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'1GD12YEG3FF361615', N'Elyssa Denslow', 1, 1, N'BMW')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'1GD312CG3DF126429', N'Cobb Welsby', 3, 0, N'Acura')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'1GYEK63N86R937896', N'Trula Lucken', 1, 0, N'Audi')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'1GYUKEEJ9AR892394', N'Rusty Daybell', 3, 1, N'GMC')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'1HGCR6F54FA708099', N'Denna Conboy', 3, 0, N'Buick')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'1J4RG4GK5AC799561', N'Annie Lilly', 3, 0, N'Infiniti')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'1N4AL3AP7EC501763', N'Dewain Madine', 1, 1, N'Mercury')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'1N4CL2AP2BC798438', N'Clem Gulk', 2, 1, N'Volvo')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'1N4CL2AP5AC355439', N'Sigismundo Keir', 2, 1, N'Lexus')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'1N6AA0CC1FN651315', N'Chelsie Purdy', 3, 0, N'BMW')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'1N6AF0KX1EN432231', N'Marchelle Lupson', 3, 0, N'Volkswagen')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'1ZVBP8AM7E5690809', N'Jonathan Breinlein', 2, 0, N'GMC')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'2B3CJ7DW4AH378614', N'Billi Vigar', 2, 1, N'Toyota')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'2C4RDGBG8FR331308', N'Georgine Lyburn', 3, 1, N'Chevrolet')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'2D4RN1AG3BR822247', N'Alwin Perello', 3, 1, N'Pontiac')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'2HNYD18875H420973', N'Cliff Jest', 1, 0, N'Pontiac')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'2HNYD18904H733273', N'Creight Bescoby', 2, 1, N'Toyota')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'3C3CFFAR3FT615590', N'Cleopatra Sebastian', 2, 0, N'Chevrolet')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'3C4PDDGG0FT515671', N'Salvatore Perford', 2, 0, N'Suzuki')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'3C63DPGLXCG549951', N'Werner Antoniou', 3, 0, N'Audi')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'3C6JD7AP9CG364373', N'Hinda Turbill', 2, 0, N'BMW')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'3FADP0L37AR565064', N'Vale MacKenney', 1, 0, N'Mazda')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'3FADP4AJ1CM827119', N'Michaelina Van Der Weedenburg', 3, 0, N'Mazda')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'3FAHP0JA4AR054317', N'Rafael Gittis', 2, 0, N'BMW')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'3LNHL2GC1AR052580', N'Ferd Weafer', 2, 1, N'Lexus')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'3N1AB6AP2CL778162', N'Andreas Fideler', 3, 0, N'Volkswagen')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'3N1CN7AP7EK131531', N'Taite Campbell', 1, 1, N'Land Rover')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'3VWJP7AT4CM967646', N'Andre Gasgarth', 1, 1, N'Porsche')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'4T1BF1FK5EU505534', N'Hal Acutt', 1, 0, N'Chevrolet')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'4T1BF3EK4BU329603', N'Hervey Ludlem', 1, 0, N'Mercury')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'5J8TB4H32GL178340', N'Tabitha Delia', 3, 1, N'Porsche')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'5N1AR2MM1FC085999', N'Griffy Piris', 3, 0, N'Lotus')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'5N1AZ2MG1FN766100', N'Ailina Dumbreck', 3, 0, N'Toyota')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'5N1CR2MN3EC636949', N'Veronique Bartolini', 3, 1, N'Honda')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'5NPDH4AE2FH016403', N'Roderich Schulke', 2, 0, N'Audi')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'5UXWX5C53BL568768', N'Aila Grayson', 2, 0, N'Toyota')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'5UXZV4C57DL639938', N'Kyle Sabater', 3, 0, N'Toyota')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'JHMZF1C45BS957823', N'Loree Rannie', 3, 1, N'Audi')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'JHMZF1D49ES268984', N'Cherise Grigoryev', 1, 0, N'Cadillac')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'JM3TB2CV3F0393499', N'Hussein Zanussii', 2, 1, N'Chrysler')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'JN1AZ4EH2BM561881', N'Kate Robinette', 3, 1, N'Ford')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'JN1AZ4EH4EM349875', N'Robina Guymer', 1, 0, N'Acura')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'JN8AE2KP2F9061127', N'Robers von Nassau', 1, 0, N'Saab')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'JN8AS5MT5AW705038', N'Camey Gubbins', 2, 0, N'Cadillac')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'JTDKTUD34DD512032', N'Chadwick Copyn', 3, 0, N'Audi')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'JTHFE2C26C2236549', N'Christophe Feaveryear', 3, 0, N'Pontiac')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'KMHTC6AD5DU686815', N'Amelina Klemmt', 2, 0, N'Mitsubishi')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'SAJWA4EC0CM624512', N'Selestina Karlik', 2, 1, N'Ford')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'SAJWA6E75E8515621', N'Allene Prime', 1, 0, N'Suzuki')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'SCBBB7ZH8EC209189', N'Andros Knoller', 2, 0, N'Mitsubishi')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'SCBBP9ZA8BC364904', N'Nonna Messenbird', 3, 1, N'Plymouth')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'SCBCU8ZA0AC129001', N'Rodolfo Speke', 3, 1, N'Porsche')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'SCBDR3ZAXAC070905', N'Sallie Kolinsky', 3, 1, N'Volvo')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'WA1CKAFPXAA701314', N'Bonnee Petrelli', 2, 1, N'Ford')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'WA1VFAFL3DA718468', N'Asia Febre', 1, 0, N'Ford')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'WA1VKBFP2AA649689', N'Steffane Pates', 1, 1, N'Ford')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'WAU4GBFB9BN856496', N'Vittorio Knotte', 3, 0, N'Cadillac')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'WAUBF78EX8A428452', N'Adara Shovel', 1, 1, N'Isuzu')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'WAUBFBFL9AN369560', N'Paddie Junkinson', 1, 1, N'Toyota')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'WAUDH94F57N943461', N'Bertram Jone', 2, 1, N'Saab')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'WAUDK78T68A714267', N'Janeen Drummond', 1, 1, N'Lincoln')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'WAUDT94F75N436928', N'Mata Wilkerson', 1, 0, N'Hyundai')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'WAUEFBFL6EN354145', N'Cynthea Boone', 2, 1, N'Toyota')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'WAUFFAFM7CA177150', N'Skell Sliney', 3, 0, N'Mercedes-Benz')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'WAUHF98P28A203031', N'Stesha Paoloni', 1, 0, N'GMC')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'WAUJT54B52N363353', N'Philis Harriot', 2, 0, N'Volvo')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'WAUKG58E15A437120', N'Norby Perle', 2, 0, N'Subaru')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'WAUMFAFR6EA604274', N'Lisetta Stockley', 3, 0, N'Maybach')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'WAUMK78K69A019599', N'Gilli Moral', 3, 1, N'Oldsmobile')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'WAUML44E04N649521', N'Audrey Roblou', 2, 1, N'Dodge')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'WAUNF68P46A817206', N'Ambros Arsey', 1, 0, N'Hyundai')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'WAUNF98P26A381182', N'Brennen Truss', 3, 1, N'Mitsubishi')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'WAUTFAFH9CN511807', N'Hall Reddington', 3, 1, N'Infiniti')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'WAUUL78E97A635768', N'Shem Derill', 1, 0, N'Lexus')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'WAUVT64B34N042602', N'Inna Lippitt', 3, 0, N'Lexus')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'WAUWFAFR4CA723575', N'Susanna Hoonahan', 1, 1, N'Volvo')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'WAUXD68D02A450853', N'Corry Pyser', 3, 1, N'Buick')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'WBA3A5C55EF881780', N'Gypsy Lutton', 2, 0, N'Mitsubishi')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'WBA3A5G50EN355363', N'Wendy Whitlock', 3, 1, N'Suzuki')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'WBA3A5G5XCN962710', N'Patty Traill', 2, 0, N'Chrysler')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'WBAEV33403K807633', N'Cleopatra Rappa', 1, 0, N'Ford')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'WBAKE5C53DJ414448', N'Carson Loudiane', 2, 1, N'Volvo')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'WBAKF9C55DE148105', N'Ellie Traske', 2, 1, N'Ford')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'WBALW7C52CD296550', N'Fernando Obeney', 2, 1, N'Volkswagen')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'WBAPH7G5XAN846042', N'Hurleigh Olyfant', 3, 0, N'Suzuki')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'WBAUP93568V268975', N'Son Cockshtt', 1, 0, N'Honda')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'WBAYA8C51FG804486', N'Rebekah Mawman', 3, 1, N'Toyota')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'WBAYB6C50FG257776', N'Theda Giraldon', 1, 1, N'Mazda')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'WBAYP5C55ED154591', N'Pete Jancy', 3, 0, N'Dodge')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'WBS3C9C58FP936828', N'Layne Bock', 1, 1, N'Ford')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'WBSBL93412J077369', N'Ilene Heading', 3, 1, N'Land Rover')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'WUADNAFG5AN274976', N'Forest Jarrel', 1, 0, N'Mazda')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'WVGAV7AX4AW009756', N'Margaret Bellis', 1, 0, N'Land Rover')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'WVGAV7AX5CW970286', N'Nona Etheridge', 2, 1, N'Chevrolet')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'YV140MAM3F1922351', N'Koressa Pencot', 2, 0, N'Porsche')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'YV1902FH6D1387955', N'Evania Dozdill', 1, 1, N'Jaguar')
GO
INSERT [dbo].[AUTOS] ([Patente], [Conductor], [IDEmpresa], [Disponible], [Modelo]) VALUES (N'ZFBCFACH2FZ082596', N'Analise Blofeld', 2, 1, N'Audi')
GO
SET IDENTITY_INSERT [dbo].[EMPRESA] ON 
GO
INSERT [dbo].[EMPRESA] ([ID], [Nombre], [CantidadAutos]) VALUES (1, N'Uber', 50)
GO
INSERT [dbo].[EMPRESA] ([ID], [Nombre], [CantidadAutos]) VALUES (2, N'Cabify', 40)
GO
INSERT [dbo].[EMPRESA] ([ID], [Nombre], [CantidadAutos]) VALUES (3, N'DiDi', 30)
GO
SET IDENTITY_INSERT [dbo].[EMPRESA] OFF
GO
SET IDENTITY_INSERT [dbo].[PAGOS] ON 
GO
INSERT [dbo].[PAGOS] ([IDPago], [IDViaje], [Costo], [FechaPago], [MetodoPago]) VALUES (1, 1, CAST(5000.00 AS Decimal(10, 2)), CAST(N'2023-01-15' AS Date), N'Efectivo')
GO
INSERT [dbo].[PAGOS] ([IDPago], [IDViaje], [Costo], [FechaPago], [MetodoPago]) VALUES (2, 2, CAST(6000.00 AS Decimal(10, 2)), CAST(N'2023-02-20' AS Date), N'Débito')
GO
INSERT [dbo].[PAGOS] ([IDPago], [IDViaje], [Costo], [FechaPago], [MetodoPago]) VALUES (3, 3, CAST(4500.00 AS Decimal(10, 2)), CAST(N'2023-03-10' AS Date), N'Crédito')
GO
INSERT [dbo].[PAGOS] ([IDPago], [IDViaje], [Costo], [FechaPago], [MetodoPago]) VALUES (4, 4, CAST(7000.00 AS Decimal(10, 2)), CAST(N'2023-04-05' AS Date), N'Mercado Pago')
GO
INSERT [dbo].[PAGOS] ([IDPago], [IDViaje], [Costo], [FechaPago], [MetodoPago]) VALUES (5, 5, CAST(5500.00 AS Decimal(10, 2)), CAST(N'2023-05-25' AS Date), N'Efectivo')
GO
INSERT [dbo].[PAGOS] ([IDPago], [IDViaje], [Costo], [FechaPago], [MetodoPago]) VALUES (6, 6, CAST(6200.00 AS Decimal(10, 2)), CAST(N'2023-06-30' AS Date), N'Débito')
GO
INSERT [dbo].[PAGOS] ([IDPago], [IDViaje], [Costo], [FechaPago], [MetodoPago]) VALUES (7, 7, CAST(4800.00 AS Decimal(10, 2)), CAST(N'2023-07-15' AS Date), N'Crédito')
GO
INSERT [dbo].[PAGOS] ([IDPago], [IDViaje], [Costo], [FechaPago], [MetodoPago]) VALUES (8, 8, CAST(7200.00 AS Decimal(10, 2)), CAST(N'2023-08-20' AS Date), N'Mercado Pago')
GO
INSERT [dbo].[PAGOS] ([IDPago], [IDViaje], [Costo], [FechaPago], [MetodoPago]) VALUES (9, 9, CAST(5100.00 AS Decimal(10, 2)), CAST(N'2023-09-10' AS Date), N'Efectivo')
GO
INSERT [dbo].[PAGOS] ([IDPago], [IDViaje], [Costo], [FechaPago], [MetodoPago]) VALUES (10, 10, CAST(6700.00 AS Decimal(10, 2)), CAST(N'2023-10-05' AS Date), N'Débito')
GO
INSERT [dbo].[PAGOS] ([IDPago], [IDViaje], [Costo], [FechaPago], [MetodoPago]) VALUES (11, 11, CAST(5800.00 AS Decimal(10, 2)), CAST(N'2023-01-20' AS Date), N'Crédito')
GO
INSERT [dbo].[PAGOS] ([IDPago], [IDViaje], [Costo], [FechaPago], [MetodoPago]) VALUES (12, 12, CAST(7500.00 AS Decimal(10, 2)), CAST(N'2023-02-25' AS Date), N'Mercado Pago')
GO
INSERT [dbo].[PAGOS] ([IDPago], [IDViaje], [Costo], [FechaPago], [MetodoPago]) VALUES (13, 13, CAST(4900.00 AS Decimal(10, 2)), CAST(N'2023-03-15' AS Date), N'Efectivo')
GO
INSERT [dbo].[PAGOS] ([IDPago], [IDViaje], [Costo], [FechaPago], [MetodoPago]) VALUES (14, 14, CAST(6200.00 AS Decimal(10, 2)), CAST(N'2023-04-10' AS Date), N'Débito')
GO
INSERT [dbo].[PAGOS] ([IDPago], [IDViaje], [Costo], [FechaPago], [MetodoPago]) VALUES (15, 15, CAST(5300.00 AS Decimal(10, 2)), CAST(N'2023-05-30' AS Date), N'Crédito')
GO
INSERT [dbo].[PAGOS] ([IDPago], [IDViaje], [Costo], [FechaPago], [MetodoPago]) VALUES (16, 16, CAST(7100.00 AS Decimal(10, 2)), CAST(N'2023-06-25' AS Date), N'Mercado Pago')
GO
INSERT [dbo].[PAGOS] ([IDPago], [IDViaje], [Costo], [FechaPago], [MetodoPago]) VALUES (17, 17, CAST(5600.00 AS Decimal(10, 2)), CAST(N'2023-07-20' AS Date), N'Efectivo')
GO
INSERT [dbo].[PAGOS] ([IDPago], [IDViaje], [Costo], [FechaPago], [MetodoPago]) VALUES (18, 18, CAST(6800.00 AS Decimal(10, 2)), CAST(N'2023-08-15' AS Date), N'Débito')
GO
INSERT [dbo].[PAGOS] ([IDPago], [IDViaje], [Costo], [FechaPago], [MetodoPago]) VALUES (19, 19, CAST(4900.00 AS Decimal(10, 2)), CAST(N'2023-09-05' AS Date), N'Crédito')
GO
INSERT [dbo].[PAGOS] ([IDPago], [IDViaje], [Costo], [FechaPago], [MetodoPago]) VALUES (20, 20, CAST(7400.00 AS Decimal(10, 2)), CAST(N'2023-10-10' AS Date), N'Mercado Pago')
GO
INSERT [dbo].[PAGOS] ([IDPago], [IDViaje], [Costo], [FechaPago], [MetodoPago]) VALUES (21, 21, CAST(6000.00 AS Decimal(10, 2)), CAST(N'2023-01-30' AS Date), N'Efectivo')
GO
INSERT [dbo].[PAGOS] ([IDPago], [IDViaje], [Costo], [FechaPago], [MetodoPago]) VALUES (22, 22, CAST(6500.00 AS Decimal(10, 2)), CAST(N'2023-02-28' AS Date), N'Débito')
GO
INSERT [dbo].[PAGOS] ([IDPago], [IDViaje], [Costo], [FechaPago], [MetodoPago]) VALUES (23, 23, CAST(4700.00 AS Decimal(10, 2)), CAST(N'2023-03-20' AS Date), N'Crédito')
GO
INSERT [dbo].[PAGOS] ([IDPago], [IDViaje], [Costo], [FechaPago], [MetodoPago]) VALUES (24, 24, CAST(7100.00 AS Decimal(10, 2)), CAST(N'2023-04-15' AS Date), N'Mercado Pago')
GO
INSERT [dbo].[PAGOS] ([IDPago], [IDViaje], [Costo], [FechaPago], [MetodoPago]) VALUES (25, 25, CAST(5200.00 AS Decimal(10, 2)), CAST(N'2023-05-25' AS Date), N'Efectivo')
GO
INSERT [dbo].[PAGOS] ([IDPago], [IDViaje], [Costo], [FechaPago], [MetodoPago]) VALUES (26, 26, CAST(6300.00 AS Decimal(10, 2)), CAST(N'2023-06-20' AS Date), N'Débito')
GO
INSERT [dbo].[PAGOS] ([IDPago], [IDViaje], [Costo], [FechaPago], [MetodoPago]) VALUES (27, 27, CAST(4900.00 AS Decimal(10, 2)), CAST(N'2023-07-10' AS Date), N'Crédito')
GO
INSERT [dbo].[PAGOS] ([IDPago], [IDViaje], [Costo], [FechaPago], [MetodoPago]) VALUES (28, 28, CAST(7300.00 AS Decimal(10, 2)), CAST(N'2023-08-05' AS Date), N'Mercado Pago')
GO
INSERT [dbo].[PAGOS] ([IDPago], [IDViaje], [Costo], [FechaPago], [MetodoPago]) VALUES (29, 29, CAST(5400.00 AS Decimal(10, 2)), CAST(N'2023-09-15' AS Date), N'Efectivo')
GO
INSERT [dbo].[PAGOS] ([IDPago], [IDViaje], [Costo], [FechaPago], [MetodoPago]) VALUES (30, 30, CAST(6900.00 AS Decimal(10, 2)), CAST(N'2023-10-20' AS Date), N'Débito')
GO
INSERT [dbo].[PAGOS] ([IDPago], [IDViaje], [Costo], [FechaPago], [MetodoPago]) VALUES (31, 31, CAST(5800.00 AS Decimal(10, 2)), CAST(N'2023-01-12' AS Date), N'Crédito')
GO
INSERT [dbo].[PAGOS] ([IDPago], [IDViaje], [Costo], [FechaPago], [MetodoPago]) VALUES (32, 32, CAST(7600.00 AS Decimal(10, 2)), CAST(N'2023-02-18' AS Date), N'Mercado Pago')
GO
INSERT [dbo].[PAGOS] ([IDPago], [IDViaje], [Costo], [FechaPago], [MetodoPago]) VALUES (33, 33, CAST(4700.00 AS Decimal(10, 2)), CAST(N'2023-03-25' AS Date), N'Efectivo')
GO
INSERT [dbo].[PAGOS] ([IDPago], [IDViaje], [Costo], [FechaPago], [MetodoPago]) VALUES (34, 34, CAST(6400.00 AS Decimal(10, 2)), CAST(N'2023-04-08' AS Date), N'Débito')
GO
INSERT [dbo].[PAGOS] ([IDPago], [IDViaje], [Costo], [FechaPago], [MetodoPago]) VALUES (35, 35, CAST(5500.00 AS Decimal(10, 2)), CAST(N'2023-05-18' AS Date), N'Crédito')
GO
INSERT [dbo].[PAGOS] ([IDPago], [IDViaje], [Costo], [FechaPago], [MetodoPago]) VALUES (36, 36, CAST(7200.00 AS Decimal(10, 2)), CAST(N'2023-06-28' AS Date), N'Mercado Pago')
GO
INSERT [dbo].[PAGOS] ([IDPago], [IDViaje], [Costo], [FechaPago], [MetodoPago]) VALUES (37, 37, CAST(5000.00 AS Decimal(10, 2)), CAST(N'2023-07-18' AS Date), N'Efectivo')
GO
INSERT [dbo].[PAGOS] ([IDPago], [IDViaje], [Costo], [FechaPago], [MetodoPago]) VALUES (38, 38, CAST(6800.00 AS Decimal(10, 2)), CAST(N'2023-08-12' AS Date), N'Débito')
GO
INSERT [dbo].[PAGOS] ([IDPago], [IDViaje], [Costo], [FechaPago], [MetodoPago]) VALUES (39, 39, CAST(4900.00 AS Decimal(10, 2)), CAST(N'2023-09-08' AS Date), N'Crédito')
GO
INSERT [dbo].[PAGOS] ([IDPago], [IDViaje], [Costo], [FechaPago], [MetodoPago]) VALUES (40, 40, CAST(7400.00 AS Decimal(10, 2)), CAST(N'2023-10-15' AS Date), N'Mercado Pago')
GO
INSERT [dbo].[PAGOS] ([IDPago], [IDViaje], [Costo], [FechaPago], [MetodoPago]) VALUES (41, 41, CAST(6100.00 AS Decimal(10, 2)), CAST(N'2023-01-25' AS Date), N'Efectivo')
GO
INSERT [dbo].[PAGOS] ([IDPago], [IDViaje], [Costo], [FechaPago], [MetodoPago]) VALUES (42, 42, CAST(6700.00 AS Decimal(10, 2)), CAST(N'2023-02-22' AS Date), N'Débito')
GO
INSERT [dbo].[PAGOS] ([IDPago], [IDViaje], [Costo], [FechaPago], [MetodoPago]) VALUES (43, 43, CAST(4800.00 AS Decimal(10, 2)), CAST(N'2023-03-30' AS Date), N'Crédito')
GO
INSERT [dbo].[PAGOS] ([IDPago], [IDViaje], [Costo], [FechaPago], [MetodoPago]) VALUES (44, 44, CAST(7100.00 AS Decimal(10, 2)), CAST(N'2023-04-12' AS Date), N'Mercado Pago')
GO
INSERT [dbo].[PAGOS] ([IDPago], [IDViaje], [Costo], [FechaPago], [MetodoPago]) VALUES (45, 45, CAST(5300.00 AS Decimal(10, 2)), CAST(N'2023-05-05' AS Date), N'Efectivo')
GO
INSERT [dbo].[PAGOS] ([IDPago], [IDViaje], [Costo], [FechaPago], [MetodoPago]) VALUES (46, 46, CAST(6400.00 AS Decimal(10, 2)), CAST(N'2023-06-15' AS Date), N'Débito')
GO
INSERT [dbo].[PAGOS] ([IDPago], [IDViaje], [Costo], [FechaPago], [MetodoPago]) VALUES (47, 47, CAST(4900.00 AS Decimal(10, 2)), CAST(N'2023-07-25' AS Date), N'Crédito')
GO
INSERT [dbo].[PAGOS] ([IDPago], [IDViaje], [Costo], [FechaPago], [MetodoPago]) VALUES (48, 48, CAST(7300.00 AS Decimal(10, 2)), CAST(N'2023-08-10' AS Date), N'Mercado Pago')
GO
INSERT [dbo].[PAGOS] ([IDPago], [IDViaje], [Costo], [FechaPago], [MetodoPago]) VALUES (49, 49, CAST(5400.00 AS Decimal(10, 2)), CAST(N'2023-09-20' AS Date), N'Efectivo')
GO
INSERT [dbo].[PAGOS] ([IDPago], [IDViaje], [Costo], [FechaPago], [MetodoPago]) VALUES (50, 50, CAST(6900.00 AS Decimal(10, 2)), CAST(N'2023-10-30' AS Date), N'Débito')
GO
INSERT [dbo].[PAGOS] ([IDPago], [IDViaje], [Costo], [FechaPago], [MetodoPago]) VALUES (51, 51, CAST(5800.00 AS Decimal(10, 2)), CAST(N'2023-01-14' AS Date), N'Crédito')
GO
INSERT [dbo].[PAGOS] ([IDPago], [IDViaje], [Costo], [FechaPago], [MetodoPago]) VALUES (52, 52, CAST(7600.00 AS Decimal(10, 2)), CAST(N'2023-02-16' AS Date), N'Mercado Pago')
GO
INSERT [dbo].[PAGOS] ([IDPago], [IDViaje], [Costo], [FechaPago], [MetodoPago]) VALUES (53, 53, CAST(4700.00 AS Decimal(10, 2)), CAST(N'2023-03-22' AS Date), N'Efectivo')
GO
INSERT [dbo].[PAGOS] ([IDPago], [IDViaje], [Costo], [FechaPago], [MetodoPago]) VALUES (54, 54, CAST(6400.00 AS Decimal(10, 2)), CAST(N'2023-04-26' AS Date), N'Débito')
GO
INSERT [dbo].[PAGOS] ([IDPago], [IDViaje], [Costo], [FechaPago], [MetodoPago]) VALUES (55, 55, CAST(5500.00 AS Decimal(10, 2)), CAST(N'2023-05-14' AS Date), N'Crédito')
GO
INSERT [dbo].[PAGOS] ([IDPago], [IDViaje], [Costo], [FechaPago], [MetodoPago]) VALUES (56, 56, CAST(7200.00 AS Decimal(10, 2)), CAST(N'2023-06-24' AS Date), N'Mercado Pago')
GO
INSERT [dbo].[PAGOS] ([IDPago], [IDViaje], [Costo], [FechaPago], [MetodoPago]) VALUES (57, 57, CAST(5000.00 AS Decimal(10, 2)), CAST(N'2023-07-11' AS Date), N'Efectivo')
GO
INSERT [dbo].[PAGOS] ([IDPago], [IDViaje], [Costo], [FechaPago], [MetodoPago]) VALUES (58, 58, CAST(6800.00 AS Decimal(10, 2)), CAST(N'2023-08-17' AS Date), N'Débito')
GO
INSERT [dbo].[PAGOS] ([IDPago], [IDViaje], [Costo], [FechaPago], [MetodoPago]) VALUES (59, 59, CAST(4900.00 AS Decimal(10, 2)), CAST(N'2023-09-05' AS Date), N'Crédito')
GO
INSERT [dbo].[PAGOS] ([IDPago], [IDViaje], [Costo], [FechaPago], [MetodoPago]) VALUES (60, 60, CAST(7400.00 AS Decimal(10, 2)), CAST(N'2023-10-25' AS Date), N'Mercado Pago')
GO
INSERT [dbo].[PAGOS] ([IDPago], [IDViaje], [Costo], [FechaPago], [MetodoPago]) VALUES (61, 61, CAST(6100.00 AS Decimal(10, 2)), CAST(N'2023-01-29' AS Date), N'Efectivo')
GO
INSERT [dbo].[PAGOS] ([IDPago], [IDViaje], [Costo], [FechaPago], [MetodoPago]) VALUES (62, 62, CAST(6700.00 AS Decimal(10, 2)), CAST(N'2023-02-12' AS Date), N'Débito')
GO
INSERT [dbo].[PAGOS] ([IDPago], [IDViaje], [Costo], [FechaPago], [MetodoPago]) VALUES (63, 63, CAST(4800.00 AS Decimal(10, 2)), CAST(N'2023-03-18' AS Date), N'Crédito')
GO
INSERT [dbo].[PAGOS] ([IDPago], [IDViaje], [Costo], [FechaPago], [MetodoPago]) VALUES (64, 64, CAST(7100.00 AS Decimal(10, 2)), CAST(N'2023-04-21' AS Date), N'Mercado Pago')
GO
INSERT [dbo].[PAGOS] ([IDPago], [IDViaje], [Costo], [FechaPago], [MetodoPago]) VALUES (65, 65, CAST(5300.00 AS Decimal(10, 2)), CAST(N'2023-05-07' AS Date), N'Efectivo')
GO
INSERT [dbo].[PAGOS] ([IDPago], [IDViaje], [Costo], [FechaPago], [MetodoPago]) VALUES (66, 66, CAST(6400.00 AS Decimal(10, 2)), CAST(N'2023-06-19' AS Date), N'Débito')
GO
INSERT [dbo].[PAGOS] ([IDPago], [IDViaje], [Costo], [FechaPago], [MetodoPago]) VALUES (67, 67, CAST(4900.00 AS Decimal(10, 2)), CAST(N'2023-07-27' AS Date), N'Crédito')
GO
INSERT [dbo].[PAGOS] ([IDPago], [IDViaje], [Costo], [FechaPago], [MetodoPago]) VALUES (68, 68, CAST(7300.00 AS Decimal(10, 2)), CAST(N'2023-08-03' AS Date), N'Mercado Pago')
GO
INSERT [dbo].[PAGOS] ([IDPago], [IDViaje], [Costo], [FechaPago], [MetodoPago]) VALUES (69, 69, CAST(5400.00 AS Decimal(10, 2)), CAST(N'2023-09-21' AS Date), N'Efectivo')
GO
INSERT [dbo].[PAGOS] ([IDPago], [IDViaje], [Costo], [FechaPago], [MetodoPago]) VALUES (70, 70, CAST(6900.00 AS Decimal(10, 2)), CAST(N'2023-10-18' AS Date), N'Débito')
GO
INSERT [dbo].[PAGOS] ([IDPago], [IDViaje], [Costo], [FechaPago], [MetodoPago]) VALUES (71, 71, CAST(5800.00 AS Decimal(10, 2)), CAST(N'2023-01-10' AS Date), N'Crédito')
GO
INSERT [dbo].[PAGOS] ([IDPago], [IDViaje], [Costo], [FechaPago], [MetodoPago]) VALUES (72, 72, CAST(7600.00 AS Decimal(10, 2)), CAST(N'2023-02-26' AS Date), N'Mercado Pago')
GO
INSERT [dbo].[PAGOS] ([IDPago], [IDViaje], [Costo], [FechaPago], [MetodoPago]) VALUES (73, 73, CAST(4700.00 AS Decimal(10, 2)), CAST(N'2023-03-14' AS Date), N'Efectivo')
GO
INSERT [dbo].[PAGOS] ([IDPago], [IDViaje], [Costo], [FechaPago], [MetodoPago]) VALUES (74, 74, CAST(6400.00 AS Decimal(10, 2)), CAST(N'2023-04-30' AS Date), N'Débito')
GO
INSERT [dbo].[PAGOS] ([IDPago], [IDViaje], [Costo], [FechaPago], [MetodoPago]) VALUES (75, 75, CAST(5500.00 AS Decimal(10, 2)), CAST(N'2023-05-22' AS Date), N'Crédito')
GO
INSERT [dbo].[PAGOS] ([IDPago], [IDViaje], [Costo], [FechaPago], [MetodoPago]) VALUES (76, 76, CAST(7200.00 AS Decimal(10, 2)), CAST(N'2023-06-11' AS Date), N'Mercado Pago')
GO
INSERT [dbo].[PAGOS] ([IDPago], [IDViaje], [Costo], [FechaPago], [MetodoPago]) VALUES (77, 77, CAST(5000.00 AS Decimal(10, 2)), CAST(N'2023-07-29' AS Date), N'Efectivo')
GO
INSERT [dbo].[PAGOS] ([IDPago], [IDViaje], [Costo], [FechaPago], [MetodoPago]) VALUES (78, 78, CAST(6800.00 AS Decimal(10, 2)), CAST(N'2023-08-26' AS Date), N'Débito')
GO
INSERT [dbo].[PAGOS] ([IDPago], [IDViaje], [Costo], [FechaPago], [MetodoPago]) VALUES (79, 79, CAST(4900.00 AS Decimal(10, 2)), CAST(N'2023-09-13' AS Date), N'Crédito')
GO
INSERT [dbo].[PAGOS] ([IDPago], [IDViaje], [Costo], [FechaPago], [MetodoPago]) VALUES (80, 80, CAST(7400.00 AS Decimal(10, 2)), CAST(N'2023-10-09' AS Date), N'Mercado Pago')
GO
INSERT [dbo].[PAGOS] ([IDPago], [IDViaje], [Costo], [FechaPago], [MetodoPago]) VALUES (81, 81, CAST(6100.00 AS Decimal(10, 2)), CAST(N'2023-01-19' AS Date), N'Efectivo')
GO
INSERT [dbo].[PAGOS] ([IDPago], [IDViaje], [Costo], [FechaPago], [MetodoPago]) VALUES (82, 82, CAST(6700.00 AS Decimal(10, 2)), CAST(N'2023-02-14' AS Date), N'Débito')
GO
INSERT [dbo].[PAGOS] ([IDPago], [IDViaje], [Costo], [FechaPago], [MetodoPago]) VALUES (83, 83, CAST(4800.00 AS Decimal(10, 2)), CAST(N'2023-03-12' AS Date), N'Crédito')
GO
INSERT [dbo].[PAGOS] ([IDPago], [IDViaje], [Costo], [FechaPago], [MetodoPago]) VALUES (84, 84, CAST(7100.00 AS Decimal(10, 2)), CAST(N'2023-04-18' AS Date), N'Mercado Pago')
GO
INSERT [dbo].[PAGOS] ([IDPago], [IDViaje], [Costo], [FechaPago], [MetodoPago]) VALUES (85, 85, CAST(5300.00 AS Decimal(10, 2)), CAST(N'2023-05-15' AS Date), N'Efectivo')
GO
INSERT [dbo].[PAGOS] ([IDPago], [IDViaje], [Costo], [FechaPago], [MetodoPago]) VALUES (86, 86, CAST(6400.00 AS Decimal(10, 2)), CAST(N'2023-06-22' AS Date), N'Débito')
GO
INSERT [dbo].[PAGOS] ([IDPago], [IDViaje], [Costo], [FechaPago], [MetodoPago]) VALUES (87, 87, CAST(4900.00 AS Decimal(10, 2)), CAST(N'2023-07-14' AS Date), N'Crédito')
GO
INSERT [dbo].[PAGOS] ([IDPago], [IDViaje], [Costo], [FechaPago], [MetodoPago]) VALUES (88, 88, CAST(7300.00 AS Decimal(10, 2)), CAST(N'2023-08-30' AS Date), N'Mercado Pago')
GO
INSERT [dbo].[PAGOS] ([IDPago], [IDViaje], [Costo], [FechaPago], [MetodoPago]) VALUES (89, 89, CAST(5400.00 AS Decimal(10, 2)), CAST(N'2023-09-07' AS Date), N'Efectivo')
GO
INSERT [dbo].[PAGOS] ([IDPago], [IDViaje], [Costo], [FechaPago], [MetodoPago]) VALUES (90, 90, CAST(6900.00 AS Decimal(10, 2)), CAST(N'2023-10-28' AS Date), N'Débito')
GO
INSERT [dbo].[PAGOS] ([IDPago], [IDViaje], [Costo], [FechaPago], [MetodoPago]) VALUES (91, 91, CAST(5800.00 AS Decimal(10, 2)), CAST(N'2023-01-16' AS Date), N'Crédito')
GO
INSERT [dbo].[PAGOS] ([IDPago], [IDViaje], [Costo], [FechaPago], [MetodoPago]) VALUES (92, 92, CAST(7600.00 AS Decimal(10, 2)), CAST(N'2023-02-19' AS Date), N'Mercado Pago')
GO
INSERT [dbo].[PAGOS] ([IDPago], [IDViaje], [Costo], [FechaPago], [MetodoPago]) VALUES (93, 93, CAST(4700.00 AS Decimal(10, 2)), CAST(N'2023-03-29' AS Date), N'Efectivo')
GO
INSERT [dbo].[PAGOS] ([IDPago], [IDViaje], [Costo], [FechaPago], [MetodoPago]) VALUES (94, 94, CAST(6400.00 AS Decimal(10, 2)), CAST(N'2023-04-20' AS Date), N'Débito')
GO
INSERT [dbo].[PAGOS] ([IDPago], [IDViaje], [Costo], [FechaPago], [MetodoPago]) VALUES (95, 95, CAST(5500.00 AS Decimal(10, 2)), CAST(N'2023-05-10' AS Date), N'Crédito')
GO
INSERT [dbo].[PAGOS] ([IDPago], [IDViaje], [Costo], [FechaPago], [MetodoPago]) VALUES (96, 96, CAST(7200.00 AS Decimal(10, 2)), CAST(N'2023-06-15' AS Date), N'Mercado Pago')
GO
SET IDENTITY_INSERT [dbo].[PAGOS] OFF
GO
SET IDENTITY_INSERT [dbo].[RESEÑAS] ON 
GO
INSERT [dbo].[RESEÑAS] ([IDReseña], [IDUsuario], [IDViaje], [CalificacionAuto], [Mensaje], [CalificacionConductor], [Fecha]) VALUES (25, 11, 1, 4, N'Excelente servicio', 5, CAST(N'2023-01-15' AS Date))
GO
INSERT [dbo].[RESEÑAS] ([IDReseña], [IDUsuario], [IDViaje], [CalificacionAuto], [Mensaje], [CalificacionConductor], [Fecha]) VALUES (26, 12, 2, 5, N'Muy cómodo y limpio', 4, CAST(N'2023-02-20' AS Date))
GO
INSERT [dbo].[RESEÑAS] ([IDReseña], [IDUsuario], [IDViaje], [CalificacionAuto], [Mensaje], [CalificacionConductor], [Fecha]) VALUES (27, 13, 3, 3, NULL, 3, CAST(N'2023-03-10' AS Date))
GO
INSERT [dbo].[RESEÑAS] ([IDReseña], [IDUsuario], [IDViaje], [CalificacionAuto], [Mensaje], [CalificacionConductor], [Fecha]) VALUES (28, 14, 4, 4, N'Buen viaje', 5, CAST(N'2023-04-05' AS Date))
GO
INSERT [dbo].[RESEÑAS] ([IDReseña], [IDUsuario], [IDViaje], [CalificacionAuto], [Mensaje], [CalificacionConductor], [Fecha]) VALUES (29, 15, 5, 2, N'Auto un poco viejo', 3, CAST(N'2023-05-25' AS Date))
GO
INSERT [dbo].[RESEÑAS] ([IDReseña], [IDUsuario], [IDViaje], [CalificacionAuto], [Mensaje], [CalificacionConductor], [Fecha]) VALUES (30, 16, 6, 5, N'Todo perfecto', 5, CAST(N'2023-06-30' AS Date))
GO
INSERT [dbo].[RESEÑAS] ([IDReseña], [IDUsuario], [IDViaje], [CalificacionAuto], [Mensaje], [CalificacionConductor], [Fecha]) VALUES (31, 17, 7, 4, N'Me gustó el servicio', 4, CAST(N'2023-07-15' AS Date))
GO
INSERT [dbo].[RESEÑAS] ([IDReseña], [IDUsuario], [IDViaje], [CalificacionAuto], [Mensaje], [CalificacionConductor], [Fecha]) VALUES (32, 18, 8, 5, N'Excelente conductor', 5, CAST(N'2023-08-20' AS Date))
GO
INSERT [dbo].[RESEÑAS] ([IDReseña], [IDUsuario], [IDViaje], [CalificacionAuto], [Mensaje], [CalificacionConductor], [Fecha]) VALUES (33, 19, 9, 3, N'Viaje normal', 2, CAST(N'2023-09-10' AS Date))
GO
INSERT [dbo].[RESEÑAS] ([IDReseña], [IDUsuario], [IDViaje], [CalificacionAuto], [Mensaje], [CalificacionConductor], [Fecha]) VALUES (34, 20, 10, 4, NULL, 4, CAST(N'2023-10-05' AS Date))
GO
INSERT [dbo].[RESEÑAS] ([IDReseña], [IDUsuario], [IDViaje], [CalificacionAuto], [Mensaje], [CalificacionConductor], [Fecha]) VALUES (35, 21, 11, 5, N'Recomiendo este servicio', 5, CAST(N'2023-11-25' AS Date))
GO
INSERT [dbo].[RESEÑAS] ([IDReseña], [IDUsuario], [IDViaje], [CalificacionAuto], [Mensaje], [CalificacionConductor], [Fecha]) VALUES (36, 22, 12, 4, N'Viaje agradable', 4, CAST(N'2023-12-30' AS Date))
GO
INSERT [dbo].[RESEÑAS] ([IDReseña], [IDUsuario], [IDViaje], [CalificacionAuto], [Mensaje], [CalificacionConductor], [Fecha]) VALUES (37, 23, 13, 2, N'El auto no estaba limpio', 3, CAST(N'2023-01-20' AS Date))
GO
INSERT [dbo].[RESEÑAS] ([IDReseña], [IDUsuario], [IDViaje], [CalificacionAuto], [Mensaje], [CalificacionConductor], [Fecha]) VALUES (38, 24, 14, 5, N'Muy buena experiencia', 5, CAST(N'2023-02-18' AS Date))
GO
INSERT [dbo].[RESEÑAS] ([IDReseña], [IDUsuario], [IDViaje], [CalificacionAuto], [Mensaje], [CalificacionConductor], [Fecha]) VALUES (39, 25, 15, 3, N'Podría mejorar', 2, CAST(N'2023-03-15' AS Date))
GO
INSERT [dbo].[RESEÑAS] ([IDReseña], [IDUsuario], [IDViaje], [CalificacionAuto], [Mensaje], [CalificacionConductor], [Fecha]) VALUES (40, 26, 16, 4, N'Buen viaje', 4, CAST(N'2023-04-22' AS Date))
GO
INSERT [dbo].[RESEÑAS] ([IDReseña], [IDUsuario], [IDViaje], [CalificacionAuto], [Mensaje], [CalificacionConductor], [Fecha]) VALUES (41, 27, 17, 5, N'Todo excelente', 5, CAST(N'2023-05-24' AS Date))
GO
INSERT [dbo].[RESEÑAS] ([IDReseña], [IDUsuario], [IDViaje], [CalificacionAuto], [Mensaje], [CalificacionConductor], [Fecha]) VALUES (42, 28, 18, 4, NULL, 4, CAST(N'2023-06-19' AS Date))
GO
INSERT [dbo].[RESEÑAS] ([IDReseña], [IDUsuario], [IDViaje], [CalificacionAuto], [Mensaje], [CalificacionConductor], [Fecha]) VALUES (43, 29, 19, 3, N'Viaje promedio', 3, CAST(N'2023-07-11' AS Date))
GO
INSERT [dbo].[RESEÑAS] ([IDReseña], [IDUsuario], [IDViaje], [CalificacionAuto], [Mensaje], [CalificacionConductor], [Fecha]) VALUES (44, 30, 20, 5, N'Fantástico', 5, CAST(N'2023-08-30' AS Date))
GO
INSERT [dbo].[RESEÑAS] ([IDReseña], [IDUsuario], [IDViaje], [CalificacionAuto], [Mensaje], [CalificacionConductor], [Fecha]) VALUES (45, 31, 21, 4, N'Muy bien', 4, CAST(N'2023-09-25' AS Date))
GO
INSERT [dbo].[RESEÑAS] ([IDReseña], [IDUsuario], [IDViaje], [CalificacionAuto], [Mensaje], [CalificacionConductor], [Fecha]) VALUES (46, 32, 22, 2, N'Auto incómodo', 2, CAST(N'2023-10-15' AS Date))
GO
INSERT [dbo].[RESEÑAS] ([IDReseña], [IDUsuario], [IDViaje], [CalificacionAuto], [Mensaje], [CalificacionConductor], [Fecha]) VALUES (47, 33, 23, 4, N'Recomendable', 4, CAST(N'2023-11-05' AS Date))
GO
INSERT [dbo].[RESEÑAS] ([IDReseña], [IDUsuario], [IDViaje], [CalificacionAuto], [Mensaje], [CalificacionConductor], [Fecha]) VALUES (48, 34, 24, 5, N'Excelente experiencia', 5, CAST(N'2023-12-20' AS Date))
GO
INSERT [dbo].[RESEÑAS] ([IDReseña], [IDUsuario], [IDViaje], [CalificacionAuto], [Mensaje], [CalificacionConductor], [Fecha]) VALUES (49, 35, 25, 3, N'No fue lo que esperaba', 3, CAST(N'2023-01-30' AS Date))
GO
INSERT [dbo].[RESEÑAS] ([IDReseña], [IDUsuario], [IDViaje], [CalificacionAuto], [Mensaje], [CalificacionConductor], [Fecha]) VALUES (50, 36, 26, 4, N'Viaje agradable', 4, CAST(N'2023-02-25' AS Date))
GO
INSERT [dbo].[RESEÑAS] ([IDReseña], [IDUsuario], [IDViaje], [CalificacionAuto], [Mensaje], [CalificacionConductor], [Fecha]) VALUES (51, 37, 27, 5, N'Todo perfecto', 5, CAST(N'2023-03-20' AS Date))
GO
INSERT [dbo].[RESEÑAS] ([IDReseña], [IDUsuario], [IDViaje], [CalificacionAuto], [Mensaje], [CalificacionConductor], [Fecha]) VALUES (52, 38, 28, 2, NULL, 2, CAST(N'2023-04-10' AS Date))
GO
INSERT [dbo].[RESEÑAS] ([IDReseña], [IDUsuario], [IDViaje], [CalificacionAuto], [Mensaje], [CalificacionConductor], [Fecha]) VALUES (53, 39, 29, 4, N'Buen servicio', 4, CAST(N'2023-05-15' AS Date))
GO
INSERT [dbo].[RESEÑAS] ([IDReseña], [IDUsuario], [IDViaje], [CalificacionAuto], [Mensaje], [CalificacionConductor], [Fecha]) VALUES (54, 40, 30, 3, N'Servicio regular', 3, CAST(N'2023-06-25' AS Date))
GO
INSERT [dbo].[RESEÑAS] ([IDReseña], [IDUsuario], [IDViaje], [CalificacionAuto], [Mensaje], [CalificacionConductor], [Fecha]) VALUES (55, 41, 31, 5, N'Increíble', 5, CAST(N'2023-07-20' AS Date))
GO
INSERT [dbo].[RESEÑAS] ([IDReseña], [IDUsuario], [IDViaje], [CalificacionAuto], [Mensaje], [CalificacionConductor], [Fecha]) VALUES (56, 42, 32, 4, N'Recomendado', 4, CAST(N'2023-08-15' AS Date))
GO
INSERT [dbo].[RESEÑAS] ([IDReseña], [IDUsuario], [IDViaje], [CalificacionAuto], [Mensaje], [CalificacionConductor], [Fecha]) VALUES (57, 43, 33, 2, N'No me gustó', 2, CAST(N'2023-09-05' AS Date))
GO
INSERT [dbo].[RESEÑAS] ([IDReseña], [IDUsuario], [IDViaje], [CalificacionAuto], [Mensaje], [CalificacionConductor], [Fecha]) VALUES (58, 44, 34, 5, N'Excelente', 5, CAST(N'2023-10-30' AS Date))
GO
INSERT [dbo].[RESEÑAS] ([IDReseña], [IDUsuario], [IDViaje], [CalificacionAuto], [Mensaje], [CalificacionConductor], [Fecha]) VALUES (59, 45, 35, 4, N'Muy bien', 4, CAST(N'2023-11-10' AS Date))
GO
INSERT [dbo].[RESEÑAS] ([IDReseña], [IDUsuario], [IDViaje], [CalificacionAuto], [Mensaje], [CalificacionConductor], [Fecha]) VALUES (60, 46, 36, 3, N'Podría ser mejor', 3, CAST(N'2023-12-15' AS Date))
GO
INSERT [dbo].[RESEÑAS] ([IDReseña], [IDUsuario], [IDViaje], [CalificacionAuto], [Mensaje], [CalificacionConductor], [Fecha]) VALUES (61, 47, 37, 5, N'Gran servicio', 5, CAST(N'2023-01-05' AS Date))
GO
INSERT [dbo].[RESEÑAS] ([IDReseña], [IDUsuario], [IDViaje], [CalificacionAuto], [Mensaje], [CalificacionConductor], [Fecha]) VALUES (62, 48, 38, 4, NULL, 4, CAST(N'2023-02-10' AS Date))
GO
INSERT [dbo].[RESEÑAS] ([IDReseña], [IDUsuario], [IDViaje], [CalificacionAuto], [Mensaje], [CalificacionConductor], [Fecha]) VALUES (63, 49, 39, 3, N'Viaje aceptable', 3, CAST(N'2023-03-30' AS Date))
GO
INSERT [dbo].[RESEÑAS] ([IDReseña], [IDUsuario], [IDViaje], [CalificacionAuto], [Mensaje], [CalificacionConductor], [Fecha]) VALUES (64, 50, 40, 5, N'Maravilloso', 5, CAST(N'2023-04-15' AS Date))
GO
INSERT [dbo].[RESEÑAS] ([IDReseña], [IDUsuario], [IDViaje], [CalificacionAuto], [Mensaje], [CalificacionConductor], [Fecha]) VALUES (65, 51, 41, 2, N'Auto sucio', 2, CAST(N'2023-05-05' AS Date))
GO
INSERT [dbo].[RESEÑAS] ([IDReseña], [IDUsuario], [IDViaje], [CalificacionAuto], [Mensaje], [CalificacionConductor], [Fecha]) VALUES (66, 52, 42, 4, N'Buena experiencia', 4, CAST(N'2023-06-10' AS Date))
GO
INSERT [dbo].[RESEÑAS] ([IDReseña], [IDUsuario], [IDViaje], [CalificacionAuto], [Mensaje], [CalificacionConductor], [Fecha]) VALUES (67, 53, 43, 5, N'Sin problemas', 5, CAST(N'2023-07-25' AS Date))
GO
INSERT [dbo].[RESEÑAS] ([IDReseña], [IDUsuario], [IDViaje], [CalificacionAuto], [Mensaje], [CalificacionConductor], [Fecha]) VALUES (68, 54, 44, 4, N'Todo correcto', 4, CAST(N'2023-08-05' AS Date))
GO
INSERT [dbo].[RESEÑAS] ([IDReseña], [IDUsuario], [IDViaje], [CalificacionAuto], [Mensaje], [CalificacionConductor], [Fecha]) VALUES (69, 55, 45, 3, N'Podría mejorar', 3, CAST(N'2023-09-15' AS Date))
GO
INSERT [dbo].[RESEÑAS] ([IDReseña], [IDUsuario], [IDViaje], [CalificacionAuto], [Mensaje], [CalificacionConductor], [Fecha]) VALUES (70, 56, 46, 5, N'Excelente servicio', 5, CAST(N'2023-10-25' AS Date))
GO
INSERT [dbo].[RESEÑAS] ([IDReseña], [IDUsuario], [IDViaje], [CalificacionAuto], [Mensaje], [CalificacionConductor], [Fecha]) VALUES (71, 57, 47, 4, NULL, 4, CAST(N'2023-11-30' AS Date))
GO
INSERT [dbo].[RESEÑAS] ([IDReseña], [IDUsuario], [IDViaje], [CalificacionAuto], [Mensaje], [CalificacionConductor], [Fecha]) VALUES (72, 58, 48, 2, N'No recomendable', 2, CAST(N'2023-12-10' AS Date))
GO
INSERT [dbo].[RESEÑAS] ([IDReseña], [IDUsuario], [IDViaje], [CalificacionAuto], [Mensaje], [CalificacionConductor], [Fecha]) VALUES (73, 59, 49, 5, N'Fantástico', 5, CAST(N'2023-01-18' AS Date))
GO
INSERT [dbo].[RESEÑAS] ([IDReseña], [IDUsuario], [IDViaje], [CalificacionAuto], [Mensaje], [CalificacionConductor], [Fecha]) VALUES (74, 60, 50, 4, N'Buen viaje', 4, CAST(N'2023-02-28' AS Date))
GO
INSERT [dbo].[RESEÑAS] ([IDReseña], [IDUsuario], [IDViaje], [CalificacionAuto], [Mensaje], [CalificacionConductor], [Fecha]) VALUES (75, 61, 51, 3, N'Aceptable', 3, CAST(N'2023-03-21' AS Date))
GO
INSERT [dbo].[RESEÑAS] ([IDReseña], [IDUsuario], [IDViaje], [CalificacionAuto], [Mensaje], [CalificacionConductor], [Fecha]) VALUES (76, 62, 52, 5, N'Increíble experiencia', 5, CAST(N'2023-04-17' AS Date))
GO
INSERT [dbo].[RESEÑAS] ([IDReseña], [IDUsuario], [IDViaje], [CalificacionAuto], [Mensaje], [CalificacionConductor], [Fecha]) VALUES (77, 63, 53, 4, N'Todo bien', 4, CAST(N'2023-05-09' AS Date))
GO
INSERT [dbo].[RESEÑAS] ([IDReseña], [IDUsuario], [IDViaje], [CalificacionAuto], [Mensaje], [CalificacionConductor], [Fecha]) VALUES (78, 64, 54, 2, NULL, 2, CAST(N'2023-06-15' AS Date))
GO
INSERT [dbo].[RESEÑAS] ([IDReseña], [IDUsuario], [IDViaje], [CalificacionAuto], [Mensaje], [CalificacionConductor], [Fecha]) VALUES (79, 65, 55, 5, N'Excelente servicio', 5, CAST(N'2023-07-08' AS Date))
GO
INSERT [dbo].[RESEÑAS] ([IDReseña], [IDUsuario], [IDViaje], [CalificacionAuto], [Mensaje], [CalificacionConductor], [Fecha]) VALUES (80, 66, 56, 4, N'Recomendable', 4, CAST(N'2023-08-11' AS Date))
GO
INSERT [dbo].[RESEÑAS] ([IDReseña], [IDUsuario], [IDViaje], [CalificacionAuto], [Mensaje], [CalificacionConductor], [Fecha]) VALUES (81, 67, 57, 3, N'Podría mejorar', 3, CAST(N'2023-09-14' AS Date))
GO
INSERT [dbo].[RESEÑAS] ([IDReseña], [IDUsuario], [IDViaje], [CalificacionAuto], [Mensaje], [CalificacionConductor], [Fecha]) VALUES (82, 68, 58, 5, N'Fantástico', 5, CAST(N'2023-10-21' AS Date))
GO
INSERT [dbo].[RESEÑAS] ([IDReseña], [IDUsuario], [IDViaje], [CalificacionAuto], [Mensaje], [CalificacionConductor], [Fecha]) VALUES (83, 69, 59, 4, NULL, 4, CAST(N'2023-11-12' AS Date))
GO
INSERT [dbo].[RESEÑAS] ([IDReseña], [IDUsuario], [IDViaje], [CalificacionAuto], [Mensaje], [CalificacionConductor], [Fecha]) VALUES (84, 70, 60, 2, N'No me gustó', 2, CAST(N'2023-12-01' AS Date))
GO
INSERT [dbo].[RESEÑAS] ([IDReseña], [IDUsuario], [IDViaje], [CalificacionAuto], [Mensaje], [CalificacionConductor], [Fecha]) VALUES (85, 71, 61, 5, N'Gran servicio', 5, CAST(N'2023-01-07' AS Date))
GO
INSERT [dbo].[RESEÑAS] ([IDReseña], [IDUsuario], [IDViaje], [CalificacionAuto], [Mensaje], [CalificacionConductor], [Fecha]) VALUES (86, 72, 62, 4, N'Muy cómodo', 4, CAST(N'2023-02-03' AS Date))
GO
INSERT [dbo].[RESEÑAS] ([IDReseña], [IDUsuario], [IDViaje], [CalificacionAuto], [Mensaje], [CalificacionConductor], [Fecha]) VALUES (87, 73, 63, 3, N'Viaje regular', 3, CAST(N'2023-03-07' AS Date))
GO
INSERT [dbo].[RESEÑAS] ([IDReseña], [IDUsuario], [IDViaje], [CalificacionAuto], [Mensaje], [CalificacionConductor], [Fecha]) VALUES (88, 74, 64, 5, N'Todo excelente', 5, CAST(N'2023-04-22' AS Date))
GO
INSERT [dbo].[RESEÑAS] ([IDReseña], [IDUsuario], [IDViaje], [CalificacionAuto], [Mensaje], [CalificacionConductor], [Fecha]) VALUES (89, 75, 65, 4, N'Buena experiencia', 4, CAST(N'2023-05-11' AS Date))
GO
INSERT [dbo].[RESEÑAS] ([IDReseña], [IDUsuario], [IDViaje], [CalificacionAuto], [Mensaje], [CalificacionConductor], [Fecha]) VALUES (90, 76, 66, 2, N'Auto sucio', 2, CAST(N'2023-06-30' AS Date))
GO
INSERT [dbo].[RESEÑAS] ([IDReseña], [IDUsuario], [IDViaje], [CalificacionAuto], [Mensaje], [CalificacionConductor], [Fecha]) VALUES (91, 77, 67, 5, N'Sin problemas', 5, CAST(N'2023-07-12' AS Date))
GO
INSERT [dbo].[RESEÑAS] ([IDReseña], [IDUsuario], [IDViaje], [CalificacionAuto], [Mensaje], [CalificacionConductor], [Fecha]) VALUES (92, 78, 68, 4, N'Todo correcto', 4, CAST(N'2023-08-09' AS Date))
GO
INSERT [dbo].[RESEÑAS] ([IDReseña], [IDUsuario], [IDViaje], [CalificacionAuto], [Mensaje], [CalificacionConductor], [Fecha]) VALUES (93, 79, 69, 3, N'Podría mejorar', 3, CAST(N'2023-09-18' AS Date))
GO
INSERT [dbo].[RESEÑAS] ([IDReseña], [IDUsuario], [IDViaje], [CalificacionAuto], [Mensaje], [CalificacionConductor], [Fecha]) VALUES (94, 80, 70, 5, N'Excelente experiencia', 5, CAST(N'2023-10-27' AS Date))
GO
SET IDENTITY_INSERT [dbo].[RESEÑAS] OFF
GO
SET IDENTITY_INSERT [dbo].[USUARIO] ON 
GO
INSERT [dbo].[USUARIO] ([nombre], [apellido], [fechaNacimiento], [genero], [email], [telefono], [contraseña], [idUsuario]) VALUES (N'Aaron', N'Selener', CAST(N'2008-01-01' AS Date), N'Hombre', N'aaronaxiel@gmail.com', 549117722, N'eugeTeAmo12', 3)
GO
INSERT [dbo].[USUARIO] ([nombre], [apellido], [fechaNacimiento], [genero], [email], [telefono], [contraseña], [idUsuario]) VALUES (N'Aaron', N'Selener', CAST(N'2008-01-01' AS Date), N'Hombre', N'aaronaxiel@gmail.com', 549117722, N'eugeTeAmo12', 11)
GO
INSERT [dbo].[USUARIO] ([nombre], [apellido], [fechaNacimiento], [genero], [email], [telefono], [contraseña], [idUsuario]) VALUES (N'Beatriz', N'López', CAST(N'1995-05-12' AS Date), N'Mujer', N'beatrizlopez@example.com', 549117723, N'contraseña123', 12)
GO
INSERT [dbo].[USUARIO] ([nombre], [apellido], [fechaNacimiento], [genero], [email], [telefono], [contraseña], [idUsuario]) VALUES (N'Carlos', N'Martínez', CAST(N'1988-11-23' AS Date), N'Hombre', N'carlosmartinez@example.com', 549117724, N'1234abcd', 13)
GO
INSERT [dbo].[USUARIO] ([nombre], [apellido], [fechaNacimiento], [genero], [email], [telefono], [contraseña], [idUsuario]) VALUES (N'Diana', N'García', CAST(N'1992-07-30' AS Date), N'Mujer', N'dianagarcia@example.com', 549117725, N'miContraseña!', 14)
GO
INSERT [dbo].[USUARIO] ([nombre], [apellido], [fechaNacimiento], [genero], [email], [telefono], [contraseña], [idUsuario]) VALUES (N'Eduardo', N'Fernández', CAST(N'1985-03-16' AS Date), N'Hombre', N'eduardofernandez@example.com', 549117726, N'Edu12345', 15)
GO
INSERT [dbo].[USUARIO] ([nombre], [apellido], [fechaNacimiento], [genero], [email], [telefono], [contraseña], [idUsuario]) VALUES (N'Fernanda', N'Pérez', CAST(N'1990-09-05' AS Date), N'Mujer', N'fernandaperez@example.com', 549117727, N'P@ssw0rd', 16)
GO
INSERT [dbo].[USUARIO] ([nombre], [apellido], [fechaNacimiento], [genero], [email], [telefono], [contraseña], [idUsuario]) VALUES (N'Gabriel', N'Sánchez', CAST(N'1979-12-02' AS Date), N'Hombre', N'gabrielsanchez@example.com', 549117728, N'g@briel99', 17)
GO
INSERT [dbo].[USUARIO] ([nombre], [apellido], [fechaNacimiento], [genero], [email], [telefono], [contraseña], [idUsuario]) VALUES (N'Helena', N'Ramírez', CAST(N'1998-04-18' AS Date), N'Mujer', N'helenaramirez@example.com', 549117729, N'Helena2023!', 18)
GO
INSERT [dbo].[USUARIO] ([nombre], [apellido], [fechaNacimiento], [genero], [email], [telefono], [contraseña], [idUsuario]) VALUES (N'Ignacio', N'Torres', CAST(N'1983-10-21' AS Date), N'Hombre', N'ignacioramirez@example.com', 549117730, N'Ignacio1234', 19)
GO
INSERT [dbo].[USUARIO] ([nombre], [apellido], [fechaNacimiento], [genero], [email], [telefono], [contraseña], [idUsuario]) VALUES (N'Jazmín', N'Hernández', CAST(N'1996-02-14' AS Date), N'Mujer', N'jazminhernandez@example.com', 549117731, N'Jazmin!2023', 20)
GO
INSERT [dbo].[USUARIO] ([nombre], [apellido], [fechaNacimiento], [genero], [email], [telefono], [contraseña], [idUsuario]) VALUES (N'Kevin', N'Jiménez', CAST(N'1987-08-29' AS Date), N'Hombre', N'kevinjimenez@example.com', 549117732, N'K3vin!', 21)
GO
INSERT [dbo].[USUARIO] ([nombre], [apellido], [fechaNacimiento], [genero], [email], [telefono], [contraseña], [idUsuario]) VALUES (N'Laura', N'Morales', CAST(N'1994-06-11' AS Date), N'Mujer', N'lauramorales@example.com', 549117733, N'Laura123', 22)
GO
INSERT [dbo].[USUARIO] ([nombre], [apellido], [fechaNacimiento], [genero], [email], [telefono], [contraseña], [idUsuario]) VALUES (N'Miguel', N'Cruz', CAST(N'1980-01-15' AS Date), N'Hombre', N'miguelcruz@example.com', 549117734, N'M1guel!', 23)
GO
INSERT [dbo].[USUARIO] ([nombre], [apellido], [fechaNacimiento], [genero], [email], [telefono], [contraseña], [idUsuario]) VALUES (N'Natalia', N'Vargas', CAST(N'1991-03-27' AS Date), N'Mujer', N'natialiavargas@example.com', 549117735, N'N@tal!a', 24)
GO
INSERT [dbo].[USUARIO] ([nombre], [apellido], [fechaNacimiento], [genero], [email], [telefono], [contraseña], [idUsuario]) VALUES (N'Oscar', N'Rojas', CAST(N'1986-09-09' AS Date), N'Hombre', N'oscarrojas@example.com', 549117736, N'Osc@r2023', 25)
GO
INSERT [dbo].[USUARIO] ([nombre], [apellido], [fechaNacimiento], [genero], [email], [telefono], [contraseña], [idUsuario]) VALUES (N'Paola', N'Reyes', CAST(N'1993-12-05' AS Date), N'Mujer', N'paolareyes@example.com', 549117737, N'Paola!123', 26)
GO
INSERT [dbo].[USUARIO] ([nombre], [apellido], [fechaNacimiento], [genero], [email], [telefono], [contraseña], [idUsuario]) VALUES (N'Ricardo', N'Castillo', CAST(N'1984-07-20' AS Date), N'Hombre', N'ricardocastillo@example.com', 549117738, N'R1cardo!', 27)
GO
INSERT [dbo].[USUARIO] ([nombre], [apellido], [fechaNacimiento], [genero], [email], [telefono], [contraseña], [idUsuario]) VALUES (N'Sofía', N'Mendoza', CAST(N'1997-11-11' AS Date), N'Mujer', N'sofimendoza@example.com', 549117739, N'Sofía2023!', 28)
GO
INSERT [dbo].[USUARIO] ([nombre], [apellido], [fechaNacimiento], [genero], [email], [telefono], [contraseña], [idUsuario]) VALUES (N'Tomás', N'Ponce', CAST(N'1981-05-17' AS Date), N'Hombre', N'tomponce@example.com', 549117740, N'T0m@5!', 29)
GO
INSERT [dbo].[USUARIO] ([nombre], [apellido], [fechaNacimiento], [genero], [email], [telefono], [contraseña], [idUsuario]) VALUES (N'Valentina', N'Salazar', CAST(N'1999-08-30' AS Date), N'Mujer', N'valentinasalazar@example.com', 549117741, N'Valen123!', 30)
GO
INSERT [dbo].[USUARIO] ([nombre], [apellido], [fechaNacimiento], [genero], [email], [telefono], [contraseña], [idUsuario]) VALUES (N'Ulises', N'Cordero', CAST(N'1989-02-22' AS Date), N'Hombre', N'ulisescordero@example.com', 549117742, N'Uli$es!', 31)
GO
INSERT [dbo].[USUARIO] ([nombre], [apellido], [fechaNacimiento], [genero], [email], [telefono], [contraseña], [idUsuario]) VALUES (N'Ximena', N'Vélez', CAST(N'1990-10-10' AS Date), N'Mujer', N'ximenavelez@example.com', 549117743, N'Xim3na!', 32)
GO
INSERT [dbo].[USUARIO] ([nombre], [apellido], [fechaNacimiento], [genero], [email], [telefono], [contraseña], [idUsuario]) VALUES (N'Yago', N'Lara', CAST(N'1992-04-04' AS Date), N'Hombre', N'yagolara@example.com', 549117744, N'Y@go2023', 33)
GO
INSERT [dbo].[USUARIO] ([nombre], [apellido], [fechaNacimiento], [genero], [email], [telefono], [contraseña], [idUsuario]) VALUES (N'Zoe', N'Bermúdez', CAST(N'1995-01-01' AS Date), N'Mujer', N'zoebermudez@example.com', 549117745, N'Zoe!2023', 34)
GO
INSERT [dbo].[USUARIO] ([nombre], [apellido], [fechaNacimiento], [genero], [email], [telefono], [contraseña], [idUsuario]) VALUES (N'Andrés', N'Mora', CAST(N'1980-06-06' AS Date), N'Hombre', N'andresmora@example.com', 549117746, N'Andrés123!', 35)
GO
INSERT [dbo].[USUARIO] ([nombre], [apellido], [fechaNacimiento], [genero], [email], [telefono], [contraseña], [idUsuario]) VALUES (N'Bianca', N'Paz', CAST(N'1998-07-07' AS Date), N'Mujer', N'biancapaz@example.com', 549117747, N'Bianca@2023', 36)
GO
INSERT [dbo].[USUARIO] ([nombre], [apellido], [fechaNacimiento], [genero], [email], [telefono], [contraseña], [idUsuario]) VALUES (N'Cristian', N'González', CAST(N'1982-03-03' AS Date), N'Hombre', N'cristiangonzalez@example.com', 549117748, N'Cris1234!', 37)
GO
INSERT [dbo].[USUARIO] ([nombre], [apellido], [fechaNacimiento], [genero], [email], [telefono], [contraseña], [idUsuario]) VALUES (N'Dulce', N'Núñez', CAST(N'1993-08-08' AS Date), N'Mujer', N'dulcenunez@example.com', 549117749, N'Dulce2023!', 38)
GO
INSERT [dbo].[USUARIO] ([nombre], [apellido], [fechaNacimiento], [genero], [email], [telefono], [contraseña], [idUsuario]) VALUES (N'Esteban', N'Palacios', CAST(N'1985-12-12' AS Date), N'Hombre', N'estebanpalacios@example.com', 549117750, N'Est3ban!', 39)
GO
INSERT [dbo].[USUARIO] ([nombre], [apellido], [fechaNacimiento], [genero], [email], [telefono], [contraseña], [idUsuario]) VALUES (N'Fabiola', N'Cisneros', CAST(N'1991-05-05' AS Date), N'Mujer', N'fabiolacisneros@example.com', 549117751, N'Fabiola123!', 40)
GO
INSERT [dbo].[USUARIO] ([nombre], [apellido], [fechaNacimiento], [genero], [email], [telefono], [contraseña], [idUsuario]) VALUES (N'Gustavo', N'Alvarado', CAST(N'1978-11-22' AS Date), N'Hombre', N'gustavoalvarado@example.com', 549117752, N'Gust@vo!', 41)
GO
INSERT [dbo].[USUARIO] ([nombre], [apellido], [fechaNacimiento], [genero], [email], [telefono], [contraseña], [idUsuario]) VALUES (N'Hilda', N'Soto', CAST(N'1994-09-09' AS Date), N'Mujer', N'hildasoto@example.com', 549117753, N'Hilda2023!', 42)
GO
INSERT [dbo].[USUARIO] ([nombre], [apellido], [fechaNacimiento], [genero], [email], [telefono], [contraseña], [idUsuario]) VALUES (N'Iván', N'Gutiérrez', CAST(N'1986-02-28' AS Date), N'Hombre', N'ivangutierrez@example.com', 549117754, N'Iván123!', 43)
GO
INSERT [dbo].[USUARIO] ([nombre], [apellido], [fechaNacimiento], [genero], [email], [telefono], [contraseña], [idUsuario]) VALUES (N'Julián', N'Cabrera', CAST(N'1990-10-10' AS Date), N'Hombre', N'julian@cabrera.com', 549117755, N'Julian2023!', 44)
GO
INSERT [dbo].[USUARIO] ([nombre], [apellido], [fechaNacimiento], [genero], [email], [telefono], [contraseña], [idUsuario]) VALUES (N'Karina', N'Flores', CAST(N'1995-01-01' AS Date), N'Mujer', N'karinaflores@example.com', 549117756, N'Karina@2023', 45)
GO
INSERT [dbo].[USUARIO] ([nombre], [apellido], [fechaNacimiento], [genero], [email], [telefono], [contraseña], [idUsuario]) VALUES (N'Leonardo', N'Cano', CAST(N'1984-06-06' AS Date), N'Hombre', N'leonardocano@example.com', 549117757, N'Leonardo123!', 46)
GO
INSERT [dbo].[USUARIO] ([nombre], [apellido], [fechaNacimiento], [genero], [email], [telefono], [contraseña], [idUsuario]) VALUES (N'Mariana', N'Quintero', CAST(N'1992-08-08' AS Date), N'Mujer', N'marianaquintero@example.com', 549117758, N'Mariana@2023', 47)
GO
INSERT [dbo].[USUARIO] ([nombre], [apellido], [fechaNacimiento], [genero], [email], [telefono], [contraseña], [idUsuario]) VALUES (N'Nicolás', N'Ceballos', CAST(N'1987-03-03' AS Date), N'Hombre', N'nicolaceballos@example.com', 549117759, N'Nicolás123!', 48)
GO
INSERT [dbo].[USUARIO] ([nombre], [apellido], [fechaNacimiento], [genero], [email], [telefono], [contraseña], [idUsuario]) VALUES (N'Olga', N'Martínez', CAST(N'1990-12-12' AS Date), N'Mujer', N'olgacmartinez@example.com', 549117760, N'Olga2023!', 49)
GO
INSERT [dbo].[USUARIO] ([nombre], [apellido], [fechaNacimiento], [genero], [email], [telefono], [contraseña], [idUsuario]) VALUES (N'Pablo', N'Hernández', CAST(N'1983-07-07' AS Date), N'Hombre', N'pablohernandez@example.com', 549117761, N'Pablo123!', 50)
GO
INSERT [dbo].[USUARIO] ([nombre], [apellido], [fechaNacimiento], [genero], [email], [telefono], [contraseña], [idUsuario]) VALUES (N'Quetzal', N'López', CAST(N'1996-11-11' AS Date), N'Mujer', N'quetzallopez@example.com', 549117762, N'Quetzal2023!', 51)
GO
INSERT [dbo].[USUARIO] ([nombre], [apellido], [fechaNacimiento], [genero], [email], [telefono], [contraseña], [idUsuario]) VALUES (N'Raúl', N'Salinas', CAST(N'1989-04-04' AS Date), N'Hombre', N'raulsalinas@example.com', 549117763, N'Raúl123!', 52)
GO
INSERT [dbo].[USUARIO] ([nombre], [apellido], [fechaNacimiento], [genero], [email], [telefono], [contraseña], [idUsuario]) VALUES (N'Silvia', N'Sierra', CAST(N'1991-05-05' AS Date), N'Mujer', N'silviasierra@example.com', 549117764, N'Silvia2023!', 53)
GO
INSERT [dbo].[USUARIO] ([nombre], [apellido], [fechaNacimiento], [genero], [email], [telefono], [contraseña], [idUsuario]) VALUES (N'Tobías', N'Maldonado', CAST(N'1985-09-09' AS Date), N'Hombre', N'tobiasmaldonado@example.com', 549117765, N'Tobias!123', 54)
GO
INSERT [dbo].[USUARIO] ([nombre], [apellido], [fechaNacimiento], [genero], [email], [telefono], [contraseña], [idUsuario]) VALUES (N'Verónica', N'Valenzuela', CAST(N'1993-02-02' AS Date), N'Mujer', N'veronicavalenzuela@example.com', 549117766, N'Veronica123!', 55)
GO
INSERT [dbo].[USUARIO] ([nombre], [apellido], [fechaNacimiento], [genero], [email], [telefono], [contraseña], [idUsuario]) VALUES (N'Walter', N'Vargas', CAST(N'1988-10-10' AS Date), N'Hombre', N'waltervargas@example.com', 549117767, N'Walter2023!', 56)
GO
INSERT [dbo].[USUARIO] ([nombre], [apellido], [fechaNacimiento], [genero], [email], [telefono], [contraseña], [idUsuario]) VALUES (N'Xóchitl', N'Reyes', CAST(N'1997-01-01' AS Date), N'Mujer', N'xochitlreyes@example.com', 549117768, N'Xóchitl@2023', 57)
GO
INSERT [dbo].[USUARIO] ([nombre], [apellido], [fechaNacimiento], [genero], [email], [telefono], [contraseña], [idUsuario]) VALUES (N'Yolanda', N'Cruz', CAST(N'1990-06-06' AS Date), N'Mujer', N'yolandacruz@example.com', 549117769, N'Yolanda2023!', 58)
GO
INSERT [dbo].[USUARIO] ([nombre], [apellido], [fechaNacimiento], [genero], [email], [telefono], [contraseña], [idUsuario]) VALUES (N'Zacarías', N'Ortega', CAST(N'1984-07-07' AS Date), N'Hombre', N'zacariasortega@example.com', 549117770, N'Zacarias123!', 59)
GO
INSERT [dbo].[USUARIO] ([nombre], [apellido], [fechaNacimiento], [genero], [email], [telefono], [contraseña], [idUsuario]) VALUES (N'Alfonso', N'Mendoza', CAST(N'1982-03-03' AS Date), N'Hombre', N'alfonsomendoza@example.com', 549117771, N'Alfonso@2023', 60)
GO
INSERT [dbo].[USUARIO] ([nombre], [apellido], [fechaNacimiento], [genero], [email], [telefono], [contraseña], [idUsuario]) VALUES (N'Belinda', N'González', CAST(N'1995-12-12' AS Date), N'Mujer', N'belindagonzalez@example.com', 549117772, N'Belinda123!', 61)
GO
INSERT [dbo].[USUARIO] ([nombre], [apellido], [fechaNacimiento], [genero], [email], [telefono], [contraseña], [idUsuario]) VALUES (N'César', N'Salazar', CAST(N'1983-08-08' AS Date), N'Hombre', N'cesarsalazar@example.com', 549117773, N'César2023!', 62)
GO
INSERT [dbo].[USUARIO] ([nombre], [apellido], [fechaNacimiento], [genero], [email], [telefono], [contraseña], [idUsuario]) VALUES (N'Diana', N'Alonso', CAST(N'1990-05-05' AS Date), N'Mujer', N'dianaalonso@example.com', 549117774, N'Diana123!', 63)
GO
INSERT [dbo].[USUARIO] ([nombre], [apellido], [fechaNacimiento], [genero], [email], [telefono], [contraseña], [idUsuario]) VALUES (N'Eduardo', N'Pérez', CAST(N'1985-09-09' AS Date), N'Hombre', N'eduardoperez@example.com', 549117775, N'Eduardo@2023', 64)
GO
INSERT [dbo].[USUARIO] ([nombre], [apellido], [fechaNacimiento], [genero], [email], [telefono], [contraseña], [idUsuario]) VALUES (N'Fabián', N'Morales', CAST(N'1991-11-11' AS Date), N'Hombre', N'fabianmorales@example.com', 549117776, N'Fabián2023!', 65)
GO
INSERT [dbo].[USUARIO] ([nombre], [apellido], [fechaNacimiento], [genero], [email], [telefono], [contraseña], [idUsuario]) VALUES (N'Gabriela', N'Córdova', CAST(N'1994-04-04' AS Date), N'Mujer', N'gabrielacordova@example.com', 549117777, N'Gabriela123!', 66)
GO
INSERT [dbo].[USUARIO] ([nombre], [apellido], [fechaNacimiento], [genero], [email], [telefono], [contraseña], [idUsuario]) VALUES (N'Hugo', N'Sánchez', CAST(N'1988-02-02' AS Date), N'Hombre', N'hugosanchez@example.com', 549117778, N'Hugo@2023', 67)
GO
INSERT [dbo].[USUARIO] ([nombre], [apellido], [fechaNacimiento], [genero], [email], [telefono], [contraseña], [idUsuario]) VALUES (N'Isabel', N'Pérez', CAST(N'1992-01-01' AS Date), N'Mujer', N'isabelperez@example.com', 549117779, N'Isabel2023!', 68)
GO
INSERT [dbo].[USUARIO] ([nombre], [apellido], [fechaNacimiento], [genero], [email], [telefono], [contraseña], [idUsuario]) VALUES (N'Javier', N'Ramírez', CAST(N'1985-06-06' AS Date), N'Hombre', N'javierramirez@example.com', 549117780, N'Javier123!', 69)
GO
INSERT [dbo].[USUARIO] ([nombre], [apellido], [fechaNacimiento], [genero], [email], [telefono], [contraseña], [idUsuario]) VALUES (N'Karla', N'González', CAST(N'1990-03-03' AS Date), N'Mujer', N'karlagonzalez@example.com', 549117781, N'Karla@2023', 70)
GO
INSERT [dbo].[USUARIO] ([nombre], [apellido], [fechaNacimiento], [genero], [email], [telefono], [contraseña], [idUsuario]) VALUES (N'Luis', N'Hernández', CAST(N'1994-10-10' AS Date), N'Hombre', N'luishernandez@example.com', 549117782, N'Luis2023!', 71)
GO
INSERT [dbo].[USUARIO] ([nombre], [apellido], [fechaNacimiento], [genero], [email], [telefono], [contraseña], [idUsuario]) VALUES (N'Marta', N'Torres', CAST(N'1987-12-12' AS Date), N'Mujer', N'martatorres@example.com', 549117783, N'Marta123!', 72)
GO
INSERT [dbo].[USUARIO] ([nombre], [apellido], [fechaNacimiento], [genero], [email], [telefono], [contraseña], [idUsuario]) VALUES (N'Néstor', N'Cruz', CAST(N'1983-08-08' AS Date), N'Hombre', N'nestorcruz@example.com', 549117784, N'Néstor2023!', 73)
GO
INSERT [dbo].[USUARIO] ([nombre], [apellido], [fechaNacimiento], [genero], [email], [telefono], [contraseña], [idUsuario]) VALUES (N'Olivia', N'Salas', CAST(N'1995-05-05' AS Date), N'Mujer', N'oliviasalas@example.com', 549117785, N'Olivia@2023', 74)
GO
INSERT [dbo].[USUARIO] ([nombre], [apellido], [fechaNacimiento], [genero], [email], [telefono], [contraseña], [idUsuario]) VALUES (N'Pedro', N'Soto', CAST(N'1986-11-11' AS Date), N'Hombre', N'pedrosoto@example.com', 549117786, N'Pedro123!', 75)
GO
INSERT [dbo].[USUARIO] ([nombre], [apellido], [fechaNacimiento], [genero], [email], [telefono], [contraseña], [idUsuario]) VALUES (N'Quintín', N'López', CAST(N'1991-01-01' AS Date), N'Hombre', N'quintinlopez@example.com', 549117787, N'Quintín2023!', 76)
GO
INSERT [dbo].[USUARIO] ([nombre], [apellido], [fechaNacimiento], [genero], [email], [telefono], [contraseña], [idUsuario]) VALUES (N'Rocío', N'González', CAST(N'1992-02-02' AS Date), N'Mujer', N'rociogonzalez@example.com', 549117788, N'Rocío123!', 77)
GO
INSERT [dbo].[USUARIO] ([nombre], [apellido], [fechaNacimiento], [genero], [email], [telefono], [contraseña], [idUsuario]) VALUES (N'Salvador', N'Mendoza', CAST(N'1984-09-09' AS Date), N'Hombre', N'salvadormendoza@example.com', 549117789, N'Salvador2023!', 78)
GO
INSERT [dbo].[USUARIO] ([nombre], [apellido], [fechaNacimiento], [genero], [email], [telefono], [contraseña], [idUsuario]) VALUES (N'Teresa', N'Ceballos', CAST(N'1995-07-07' AS Date), N'Mujer', N'teresaceballos@example.com', 549117790, N'Teresa123!', 79)
GO
INSERT [dbo].[USUARIO] ([nombre], [apellido], [fechaNacimiento], [genero], [email], [telefono], [contraseña], [idUsuario]) VALUES (N'Ursula', N'Martínez', CAST(N'1990-01-01' AS Date), N'Mujer', N'ursulamartinez@example.com', 549117791, N'Ursula@2023', 80)
GO
INSERT [dbo].[USUARIO] ([nombre], [apellido], [fechaNacimiento], [genero], [email], [telefono], [contraseña], [idUsuario]) VALUES (N'Víctor', N'Alvarado', CAST(N'1988-10-10' AS Date), N'Hombre', N'victoralvarado@example.com', 549117792, N'Víctor2023!', 81)
GO
INSERT [dbo].[USUARIO] ([nombre], [apellido], [fechaNacimiento], [genero], [email], [telefono], [contraseña], [idUsuario]) VALUES (N'Wendy', N'Sierra', CAST(N'1993-04-04' AS Date), N'Mujer', N'wendysierra@example.com', 549117793, N'Wendy123!', 82)
GO
INSERT [dbo].[USUARIO] ([nombre], [apellido], [fechaNacimiento], [genero], [email], [telefono], [contraseña], [idUsuario]) VALUES (N'Xavier', N'Salazar', CAST(N'1985-05-05' AS Date), N'Hombre', N'xaviersalazar@example.com', 549117794, N'Xavier@2023', 83)
GO
INSERT [dbo].[USUARIO] ([nombre], [apellido], [fechaNacimiento], [genero], [email], [telefono], [contraseña], [idUsuario]) VALUES (N'Yadira', N'Morales', CAST(N'1991-06-06' AS Date), N'Mujer', N'yadiramorales@example.com', 549117795, N'Yadira2023!', 84)
GO
INSERT [dbo].[USUARIO] ([nombre], [apellido], [fechaNacimiento], [genero], [email], [telefono], [contraseña], [idUsuario]) VALUES (N'Zulema', N'Cruz', CAST(N'1994-12-12' AS Date), N'Mujer', N'zulemacruz@example.com', 549117796, N'Zulema@2023', 85)
GO
INSERT [dbo].[USUARIO] ([nombre], [apellido], [fechaNacimiento], [genero], [email], [telefono], [contraseña], [idUsuario]) VALUES (N'Alberto', N'López', CAST(N'1980-08-08' AS Date), N'Hombre', N'albertolopez@example.com', 549117797, N'Alberto2023!', 86)
GO
INSERT [dbo].[USUARIO] ([nombre], [apellido], [fechaNacimiento], [genero], [email], [telefono], [contraseña], [idUsuario]) VALUES (N'Bárbara', N'Pérez', CAST(N'1996-04-04' AS Date), N'Mujer', N'barbaraperez@example.com', 549117798, N'Bárbara123!', 87)
GO
INSERT [dbo].[USUARIO] ([nombre], [apellido], [fechaNacimiento], [genero], [email], [telefono], [contraseña], [idUsuario]) VALUES (N'Cecilia', N'González', CAST(N'1982-11-11' AS Date), N'Mujer', N'ceciagonzalez@example.com', 549117799, N'Cecilia2023!', 88)
GO
INSERT [dbo].[USUARIO] ([nombre], [apellido], [fechaNacimiento], [genero], [email], [telefono], [contraseña], [idUsuario]) VALUES (N'Diego', N'Hernández', CAST(N'1984-03-03' AS Date), N'Hombre', N'diegohernandez@example.com', 549117800, N'Diego123!', 89)
GO
INSERT [dbo].[USUARIO] ([nombre], [apellido], [fechaNacimiento], [genero], [email], [telefono], [contraseña], [idUsuario]) VALUES (N'Elena', N'Martínez', CAST(N'1989-01-01' AS Date), N'Mujer', N'elenamartinez@example.com', 549117801, N'Elena@2023', 90)
GO
INSERT [dbo].[USUARIO] ([nombre], [apellido], [fechaNacimiento], [genero], [email], [telefono], [contraseña], [idUsuario]) VALUES (N'Fernando', N'Cruz', CAST(N'1981-10-10' AS Date), N'Hombre', N'fernandocruz@example.com', 549117802, N'Fernando2023!', 91)
GO
INSERT [dbo].[USUARIO] ([nombre], [apellido], [fechaNacimiento], [genero], [email], [telefono], [contraseña], [idUsuario]) VALUES (N'Gabriela', N'Salazar', CAST(N'1993-06-06' AS Date), N'Mujer', N'gabrielasalazar@example.com', 549117803, N'Gabriela123!', 92)
GO
INSERT [dbo].[USUARIO] ([nombre], [apellido], [fechaNacimiento], [genero], [email], [telefono], [contraseña], [idUsuario]) VALUES (N'Héctor', N'López', CAST(N'1985-05-05' AS Date), N'Hombre', N'hectorlopez@example.com', 549117804, N'Héctor@2023', 93)
GO
INSERT [dbo].[USUARIO] ([nombre], [apellido], [fechaNacimiento], [genero], [email], [telefono], [contraseña], [idUsuario]) VALUES (N'Ivana', N'González', CAST(N'1994-12-12' AS Date), N'Mujer', N'ivanagonzalez@example.com', 549117805, N'Ivana2023!', 94)
GO
INSERT [dbo].[USUARIO] ([nombre], [apellido], [fechaNacimiento], [genero], [email], [telefono], [contraseña], [idUsuario]) VALUES (N'Jorge', N'Mendoza', CAST(N'1988-07-07' AS Date), N'Hombre', N'jorgemendoza@example.com', 549117806, N'Jorge123!', 95)
GO
INSERT [dbo].[USUARIO] ([nombre], [apellido], [fechaNacimiento], [genero], [email], [telefono], [contraseña], [idUsuario]) VALUES (N'Karina', N'Gutiérrez', CAST(N'1992-11-11' AS Date), N'Mujer', N'karinagutierrez@example.com', 549117807, N'Karina2023!', 96)
GO
INSERT [dbo].[USUARIO] ([nombre], [apellido], [fechaNacimiento], [genero], [email], [telefono], [contraseña], [idUsuario]) VALUES (N'Luis', N'Alvarado', CAST(N'1983-03-03' AS Date), N'Hombre', N'luisalvarado@example.com', 549117808, N'Luis@2023', 97)
GO
INSERT [dbo].[USUARIO] ([nombre], [apellido], [fechaNacimiento], [genero], [email], [telefono], [contraseña], [idUsuario]) VALUES (N'Mónica', N'Pérez', CAST(N'1990-06-06' AS Date), N'Mujer', N'monicaperez@example.com', 549117809, N'Mónica123!', 98)
GO
INSERT [dbo].[USUARIO] ([nombre], [apellido], [fechaNacimiento], [genero], [email], [telefono], [contraseña], [idUsuario]) VALUES (N'Nicolás', N'Sierra', CAST(N'1987-12-12' AS Date), N'Hombre', N'nicolassierra@example.com', 549117810, N'Nicolás@2023', 99)
GO
INSERT [dbo].[USUARIO] ([nombre], [apellido], [fechaNacimiento], [genero], [email], [telefono], [contraseña], [idUsuario]) VALUES (N'Olivia', N'Salas', CAST(N'1995-08-08' AS Date), N'Mujer', N'oliviasalas@example.com', 549117811, N'Olivia2023!', 100)
GO
INSERT [dbo].[USUARIO] ([nombre], [apellido], [fechaNacimiento], [genero], [email], [telefono], [contraseña], [idUsuario]) VALUES (N'Pablo', N'Cruz', CAST(N'1986-04-04' AS Date), N'Hombre', N'pablocruz@example.com', 549117812, N'Pablo123!', 101)
GO
INSERT [dbo].[USUARIO] ([nombre], [apellido], [fechaNacimiento], [genero], [email], [telefono], [contraseña], [idUsuario]) VALUES (N'Quimera', N'Hernández', CAST(N'1991-10-10' AS Date), N'Mujer', N'quimerahernandez@example.com', 549117813, N'Quimera2023!', 102)
GO
INSERT [dbo].[USUARIO] ([nombre], [apellido], [fechaNacimiento], [genero], [email], [telefono], [contraseña], [idUsuario]) VALUES (N'Rafael', N'López', CAST(N'1989-05-05' AS Date), N'Hombre', N'rafaellopez@example.com', 549117814, N'Rafael123!', 103)
GO
INSERT [dbo].[USUARIO] ([nombre], [apellido], [fechaNacimiento], [genero], [email], [telefono], [contraseña], [idUsuario]) VALUES (N'Sofía', N'González', CAST(N'1993-01-01' AS Date), N'Mujer', N'sofiagonzalez@example.com', 549117815, N'Sofía2023!', 104)
GO
INSERT [dbo].[USUARIO] ([nombre], [apellido], [fechaNacimiento], [genero], [email], [telefono], [contraseña], [idUsuario]) VALUES (N'Tomás', N'Maldonado', CAST(N'1984-02-02' AS Date), N'Hombre', N'tomasmaldonado@example.com', 549117816, N'Tomás123!', 105)
GO
INSERT [dbo].[USUARIO] ([nombre], [apellido], [fechaNacimiento], [genero], [email], [telefono], [contraseña], [idUsuario]) VALUES (N'Ursula', N'Martínez', CAST(N'1990-06-06' AS Date), N'Mujer', N'ursulammartinez@example.com', 549117817, N'Ursula', 106)
GO
SET IDENTITY_INSERT [dbo].[USUARIO] OFF
GO
SET IDENTITY_INSERT [dbo].[VIAJES] ON 
GO
INSERT [dbo].[VIAJES] ([Fecha], [UbicacionInicial], [UbicacionFinal], [IDUsuario], [Costo], [IDViaje]) VALUES (CAST(N'2023-01-15' AS Date), N'Comuna 1', N'Comuna 2', 11, CAST(5000.00 AS Decimal(10, 2)), 1)
GO
INSERT [dbo].[VIAJES] ([Fecha], [UbicacionInicial], [UbicacionFinal], [IDUsuario], [Costo], [IDViaje]) VALUES (CAST(N'2023-02-20' AS Date), N'Comuna 3', N'Comuna 4', 12, CAST(6000.00 AS Decimal(10, 2)), 2)
GO
INSERT [dbo].[VIAJES] ([Fecha], [UbicacionInicial], [UbicacionFinal], [IDUsuario], [Costo], [IDViaje]) VALUES (CAST(N'2023-03-10' AS Date), N'Comuna 5', N'Comuna 6', 13, CAST(7000.00 AS Decimal(10, 2)), 3)
GO
INSERT [dbo].[VIAJES] ([Fecha], [UbicacionInicial], [UbicacionFinal], [IDUsuario], [Costo], [IDViaje]) VALUES (CAST(N'2023-04-05' AS Date), N'Comuna 1', N'Comuna 3', 14, CAST(8000.00 AS Decimal(10, 2)), 4)
GO
INSERT [dbo].[VIAJES] ([Fecha], [UbicacionInicial], [UbicacionFinal], [IDUsuario], [Costo], [IDViaje]) VALUES (CAST(N'2023-05-25' AS Date), N'Comuna 2', N'Comuna 5', 15, CAST(5500.00 AS Decimal(10, 2)), 5)
GO
INSERT [dbo].[VIAJES] ([Fecha], [UbicacionInicial], [UbicacionFinal], [IDUsuario], [Costo], [IDViaje]) VALUES (CAST(N'2023-06-30' AS Date), N'Comuna 4', N'Comuna 6', 16, CAST(7500.00 AS Decimal(10, 2)), 6)
GO
INSERT [dbo].[VIAJES] ([Fecha], [UbicacionInicial], [UbicacionFinal], [IDUsuario], [Costo], [IDViaje]) VALUES (CAST(N'2023-07-15' AS Date), N'Comuna 1', N'Comuna 2', 17, CAST(5000.00 AS Decimal(10, 2)), 7)
GO
INSERT [dbo].[VIAJES] ([Fecha], [UbicacionInicial], [UbicacionFinal], [IDUsuario], [Costo], [IDViaje]) VALUES (CAST(N'2023-08-20' AS Date), N'Comuna 3', N'Comuna 4', 18, CAST(6000.00 AS Decimal(10, 2)), 8)
GO
INSERT [dbo].[VIAJES] ([Fecha], [UbicacionInicial], [UbicacionFinal], [IDUsuario], [Costo], [IDViaje]) VALUES (CAST(N'2023-09-10' AS Date), N'Comuna 5', N'Comuna 6', 19, CAST(7000.00 AS Decimal(10, 2)), 9)
GO
INSERT [dbo].[VIAJES] ([Fecha], [UbicacionInicial], [UbicacionFinal], [IDUsuario], [Costo], [IDViaje]) VALUES (CAST(N'2023-10-05' AS Date), N'Comuna 1', N'Comuna 3', 20, CAST(8000.00 AS Decimal(10, 2)), 10)
GO
INSERT [dbo].[VIAJES] ([Fecha], [UbicacionInicial], [UbicacionFinal], [IDUsuario], [Costo], [IDViaje]) VALUES (CAST(N'2023-11-25' AS Date), N'Comuna 2', N'Comuna 5', 21, CAST(5500.00 AS Decimal(10, 2)), 11)
GO
INSERT [dbo].[VIAJES] ([Fecha], [UbicacionInicial], [UbicacionFinal], [IDUsuario], [Costo], [IDViaje]) VALUES (CAST(N'2023-12-30' AS Date), N'Comuna 4', N'Comuna 6', 22, CAST(7500.00 AS Decimal(10, 2)), 12)
GO
INSERT [dbo].[VIAJES] ([Fecha], [UbicacionInicial], [UbicacionFinal], [IDUsuario], [Costo], [IDViaje]) VALUES (CAST(N'2023-01-20' AS Date), N'Comuna 1', N'Comuna 2', 23, CAST(5000.00 AS Decimal(10, 2)), 13)
GO
INSERT [dbo].[VIAJES] ([Fecha], [UbicacionInicial], [UbicacionFinal], [IDUsuario], [Costo], [IDViaje]) VALUES (CAST(N'2023-02-18' AS Date), N'Comuna 3', N'Comuna 4', 24, CAST(6000.00 AS Decimal(10, 2)), 14)
GO
INSERT [dbo].[VIAJES] ([Fecha], [UbicacionInicial], [UbicacionFinal], [IDUsuario], [Costo], [IDViaje]) VALUES (CAST(N'2023-03-15' AS Date), N'Comuna 5', N'Comuna 6', 25, CAST(7000.00 AS Decimal(10, 2)), 15)
GO
INSERT [dbo].[VIAJES] ([Fecha], [UbicacionInicial], [UbicacionFinal], [IDUsuario], [Costo], [IDViaje]) VALUES (CAST(N'2023-04-22' AS Date), N'Comuna 1', N'Comuna 3', 26, CAST(8000.00 AS Decimal(10, 2)), 16)
GO
INSERT [dbo].[VIAJES] ([Fecha], [UbicacionInicial], [UbicacionFinal], [IDUsuario], [Costo], [IDViaje]) VALUES (CAST(N'2023-05-24' AS Date), N'Comuna 2', N'Comuna 5', 27, CAST(5500.00 AS Decimal(10, 2)), 17)
GO
INSERT [dbo].[VIAJES] ([Fecha], [UbicacionInicial], [UbicacionFinal], [IDUsuario], [Costo], [IDViaje]) VALUES (CAST(N'2023-06-19' AS Date), N'Comuna 4', N'Comuna 6', 28, CAST(7500.00 AS Decimal(10, 2)), 18)
GO
INSERT [dbo].[VIAJES] ([Fecha], [UbicacionInicial], [UbicacionFinal], [IDUsuario], [Costo], [IDViaje]) VALUES (CAST(N'2023-07-11' AS Date), N'Comuna 1', N'Comuna 2', 29, CAST(5000.00 AS Decimal(10, 2)), 19)
GO
INSERT [dbo].[VIAJES] ([Fecha], [UbicacionInicial], [UbicacionFinal], [IDUsuario], [Costo], [IDViaje]) VALUES (CAST(N'2023-08-30' AS Date), N'Comuna 3', N'Comuna 4', 30, CAST(6000.00 AS Decimal(10, 2)), 20)
GO
INSERT [dbo].[VIAJES] ([Fecha], [UbicacionInicial], [UbicacionFinal], [IDUsuario], [Costo], [IDViaje]) VALUES (CAST(N'2023-09-25' AS Date), N'Comuna 5', N'Comuna 6', 31, CAST(7000.00 AS Decimal(10, 2)), 21)
GO
INSERT [dbo].[VIAJES] ([Fecha], [UbicacionInicial], [UbicacionFinal], [IDUsuario], [Costo], [IDViaje]) VALUES (CAST(N'2023-10-15' AS Date), N'Comuna 1', N'Comuna 3', 32, CAST(8000.00 AS Decimal(10, 2)), 22)
GO
INSERT [dbo].[VIAJES] ([Fecha], [UbicacionInicial], [UbicacionFinal], [IDUsuario], [Costo], [IDViaje]) VALUES (CAST(N'2023-11-05' AS Date), N'Comuna 2', N'Comuna 5', 33, CAST(5500.00 AS Decimal(10, 2)), 23)
GO
INSERT [dbo].[VIAJES] ([Fecha], [UbicacionInicial], [UbicacionFinal], [IDUsuario], [Costo], [IDViaje]) VALUES (CAST(N'2023-12-20' AS Date), N'Comuna 4', N'Comuna 6', 34, CAST(7500.00 AS Decimal(10, 2)), 24)
GO
INSERT [dbo].[VIAJES] ([Fecha], [UbicacionInicial], [UbicacionFinal], [IDUsuario], [Costo], [IDViaje]) VALUES (CAST(N'2023-01-30' AS Date), N'Comuna 1', N'Comuna 2', 35, CAST(5000.00 AS Decimal(10, 2)), 25)
GO
INSERT [dbo].[VIAJES] ([Fecha], [UbicacionInicial], [UbicacionFinal], [IDUsuario], [Costo], [IDViaje]) VALUES (CAST(N'2023-02-25' AS Date), N'Comuna 3', N'Comuna 4', 36, CAST(6000.00 AS Decimal(10, 2)), 26)
GO
INSERT [dbo].[VIAJES] ([Fecha], [UbicacionInicial], [UbicacionFinal], [IDUsuario], [Costo], [IDViaje]) VALUES (CAST(N'2023-03-20' AS Date), N'Comuna 5', N'Comuna 6', 37, CAST(7000.00 AS Decimal(10, 2)), 27)
GO
INSERT [dbo].[VIAJES] ([Fecha], [UbicacionInicial], [UbicacionFinal], [IDUsuario], [Costo], [IDViaje]) VALUES (CAST(N'2023-04-10' AS Date), N'Comuna 1', N'Comuna 3', 38, CAST(8000.00 AS Decimal(10, 2)), 28)
GO
INSERT [dbo].[VIAJES] ([Fecha], [UbicacionInicial], [UbicacionFinal], [IDUsuario], [Costo], [IDViaje]) VALUES (CAST(N'2023-05-15' AS Date), N'Comuna 2', N'Comuna 5', 39, CAST(5500.00 AS Decimal(10, 2)), 29)
GO
INSERT [dbo].[VIAJES] ([Fecha], [UbicacionInicial], [UbicacionFinal], [IDUsuario], [Costo], [IDViaje]) VALUES (CAST(N'2023-06-25' AS Date), N'Comuna 4', N'Comuna 6', 40, CAST(7500.00 AS Decimal(10, 2)), 30)
GO
INSERT [dbo].[VIAJES] ([Fecha], [UbicacionInicial], [UbicacionFinal], [IDUsuario], [Costo], [IDViaje]) VALUES (CAST(N'2023-07-20' AS Date), N'Comuna 1', N'Comuna 2', 41, CAST(5000.00 AS Decimal(10, 2)), 31)
GO
INSERT [dbo].[VIAJES] ([Fecha], [UbicacionInicial], [UbicacionFinal], [IDUsuario], [Costo], [IDViaje]) VALUES (CAST(N'2023-08-15' AS Date), N'Comuna 3', N'Comuna 4', 42, CAST(6000.00 AS Decimal(10, 2)), 32)
GO
INSERT [dbo].[VIAJES] ([Fecha], [UbicacionInicial], [UbicacionFinal], [IDUsuario], [Costo], [IDViaje]) VALUES (CAST(N'2023-09-05' AS Date), N'Comuna 5', N'Comuna 6', 43, CAST(7000.00 AS Decimal(10, 2)), 33)
GO
INSERT [dbo].[VIAJES] ([Fecha], [UbicacionInicial], [UbicacionFinal], [IDUsuario], [Costo], [IDViaje]) VALUES (CAST(N'2023-10-30' AS Date), N'Comuna 1', N'Comuna 3', 44, CAST(8000.00 AS Decimal(10, 2)), 34)
GO
INSERT [dbo].[VIAJES] ([Fecha], [UbicacionInicial], [UbicacionFinal], [IDUsuario], [Costo], [IDViaje]) VALUES (CAST(N'2023-11-10' AS Date), N'Comuna 2', N'Comuna 5', 45, CAST(5500.00 AS Decimal(10, 2)), 35)
GO
INSERT [dbo].[VIAJES] ([Fecha], [UbicacionInicial], [UbicacionFinal], [IDUsuario], [Costo], [IDViaje]) VALUES (CAST(N'2023-12-15' AS Date), N'Comuna 4', N'Comuna 6', 46, CAST(7500.00 AS Decimal(10, 2)), 36)
GO
INSERT [dbo].[VIAJES] ([Fecha], [UbicacionInicial], [UbicacionFinal], [IDUsuario], [Costo], [IDViaje]) VALUES (CAST(N'2023-01-05' AS Date), N'Comuna 1', N'Comuna 2', 47, CAST(5000.00 AS Decimal(10, 2)), 37)
GO
INSERT [dbo].[VIAJES] ([Fecha], [UbicacionInicial], [UbicacionFinal], [IDUsuario], [Costo], [IDViaje]) VALUES (CAST(N'2023-02-10' AS Date), N'Comuna 3', N'Comuna 4', 48, CAST(6000.00 AS Decimal(10, 2)), 38)
GO
INSERT [dbo].[VIAJES] ([Fecha], [UbicacionInicial], [UbicacionFinal], [IDUsuario], [Costo], [IDViaje]) VALUES (CAST(N'2023-03-30' AS Date), N'Comuna 5', N'Comuna 6', 49, CAST(7000.00 AS Decimal(10, 2)), 39)
GO
INSERT [dbo].[VIAJES] ([Fecha], [UbicacionInicial], [UbicacionFinal], [IDUsuario], [Costo], [IDViaje]) VALUES (CAST(N'2023-04-15' AS Date), N'Comuna 1', N'Comuna 3', 50, CAST(8000.00 AS Decimal(10, 2)), 40)
GO
INSERT [dbo].[VIAJES] ([Fecha], [UbicacionInicial], [UbicacionFinal], [IDUsuario], [Costo], [IDViaje]) VALUES (CAST(N'2023-05-05' AS Date), N'Comuna 2', N'Comuna 5', 51, CAST(5500.00 AS Decimal(10, 2)), 41)
GO
INSERT [dbo].[VIAJES] ([Fecha], [UbicacionInicial], [UbicacionFinal], [IDUsuario], [Costo], [IDViaje]) VALUES (CAST(N'2023-06-10' AS Date), N'Comuna 4', N'Comuna 6', 52, CAST(7500.00 AS Decimal(10, 2)), 42)
GO
INSERT [dbo].[VIAJES] ([Fecha], [UbicacionInicial], [UbicacionFinal], [IDUsuario], [Costo], [IDViaje]) VALUES (CAST(N'2023-07-25' AS Date), N'Comuna 1', N'Comuna 2', 53, CAST(5000.00 AS Decimal(10, 2)), 43)
GO
INSERT [dbo].[VIAJES] ([Fecha], [UbicacionInicial], [UbicacionFinal], [IDUsuario], [Costo], [IDViaje]) VALUES (CAST(N'2023-08-05' AS Date), N'Comuna 3', N'Comuna 4', 54, CAST(6000.00 AS Decimal(10, 2)), 44)
GO
INSERT [dbo].[VIAJES] ([Fecha], [UbicacionInicial], [UbicacionFinal], [IDUsuario], [Costo], [IDViaje]) VALUES (CAST(N'2023-09-15' AS Date), N'Comuna 5', N'Comuna 6', 55, CAST(7000.00 AS Decimal(10, 2)), 45)
GO
INSERT [dbo].[VIAJES] ([Fecha], [UbicacionInicial], [UbicacionFinal], [IDUsuario], [Costo], [IDViaje]) VALUES (CAST(N'2023-10-25' AS Date), N'Comuna 1', N'Comuna 3', 56, CAST(8000.00 AS Decimal(10, 2)), 46)
GO
INSERT [dbo].[VIAJES] ([Fecha], [UbicacionInicial], [UbicacionFinal], [IDUsuario], [Costo], [IDViaje]) VALUES (CAST(N'2023-11-30' AS Date), N'Comuna 2', N'Comuna 5', 57, CAST(5500.00 AS Decimal(10, 2)), 47)
GO
INSERT [dbo].[VIAJES] ([Fecha], [UbicacionInicial], [UbicacionFinal], [IDUsuario], [Costo], [IDViaje]) VALUES (CAST(N'2023-12-25' AS Date), N'Comuna 4', N'Comuna 6', 58, CAST(7500.00 AS Decimal(10, 2)), 48)
GO
INSERT [dbo].[VIAJES] ([Fecha], [UbicacionInicial], [UbicacionFinal], [IDUsuario], [Costo], [IDViaje]) VALUES (CAST(N'2023-01-12' AS Date), N'Comuna 1', N'Comuna 2', 59, CAST(5000.00 AS Decimal(10, 2)), 49)
GO
INSERT [dbo].[VIAJES] ([Fecha], [UbicacionInicial], [UbicacionFinal], [IDUsuario], [Costo], [IDViaje]) VALUES (CAST(N'2023-02-22' AS Date), N'Comuna 3', N'Comuna 4', 60, CAST(6000.00 AS Decimal(10, 2)), 50)
GO
INSERT [dbo].[VIAJES] ([Fecha], [UbicacionInicial], [UbicacionFinal], [IDUsuario], [Costo], [IDViaje]) VALUES (CAST(N'2023-03-12' AS Date), N'Comuna 5', N'Comuna 6', 61, CAST(7000.00 AS Decimal(10, 2)), 51)
GO
INSERT [dbo].[VIAJES] ([Fecha], [UbicacionInicial], [UbicacionFinal], [IDUsuario], [Costo], [IDViaje]) VALUES (CAST(N'2023-04-28' AS Date), N'Comuna 1', N'Comuna 3', 62, CAST(8000.00 AS Decimal(10, 2)), 52)
GO
INSERT [dbo].[VIAJES] ([Fecha], [UbicacionInicial], [UbicacionFinal], [IDUsuario], [Costo], [IDViaje]) VALUES (CAST(N'2023-05-18' AS Date), N'Comuna 2', N'Comuna 5', 63, CAST(5500.00 AS Decimal(10, 2)), 53)
GO
INSERT [dbo].[VIAJES] ([Fecha], [UbicacionInicial], [UbicacionFinal], [IDUsuario], [Costo], [IDViaje]) VALUES (CAST(N'2023-06-14' AS Date), N'Comuna 4', N'Comuna 6', 64, CAST(7500.00 AS Decimal(10, 2)), 54)
GO
INSERT [dbo].[VIAJES] ([Fecha], [UbicacionInicial], [UbicacionFinal], [IDUsuario], [Costo], [IDViaje]) VALUES (CAST(N'2023-07-30' AS Date), N'Comuna 1', N'Comuna 2', 65, CAST(5000.00 AS Decimal(10, 2)), 55)
GO
INSERT [dbo].[VIAJES] ([Fecha], [UbicacionInicial], [UbicacionFinal], [IDUsuario], [Costo], [IDViaje]) VALUES (CAST(N'2023-08-15' AS Date), N'Comuna 3', N'Comuna 4', 66, CAST(6000.00 AS Decimal(10, 2)), 56)
GO
INSERT [dbo].[VIAJES] ([Fecha], [UbicacionInicial], [UbicacionFinal], [IDUsuario], [Costo], [IDViaje]) VALUES (CAST(N'2023-09-20' AS Date), N'Comuna 5', N'Comuna 6', 67, CAST(7000.00 AS Decimal(10, 2)), 57)
GO
INSERT [dbo].[VIAJES] ([Fecha], [UbicacionInicial], [UbicacionFinal], [IDUsuario], [Costo], [IDViaje]) VALUES (CAST(N'2023-10-10' AS Date), N'Comuna 1', N'Comuna 3', 68, CAST(8000.00 AS Decimal(10, 2)), 58)
GO
INSERT [dbo].[VIAJES] ([Fecha], [UbicacionInicial], [UbicacionFinal], [IDUsuario], [Costo], [IDViaje]) VALUES (CAST(N'2023-11-20' AS Date), N'Comuna 2', N'Comuna 5', 69, CAST(5500.00 AS Decimal(10, 2)), 59)
GO
INSERT [dbo].[VIAJES] ([Fecha], [UbicacionInicial], [UbicacionFinal], [IDUsuario], [Costo], [IDViaje]) VALUES (CAST(N'2023-12-05' AS Date), N'Comuna 4', N'Comuna 6', 70, CAST(7500.00 AS Decimal(10, 2)), 60)
GO
INSERT [dbo].[VIAJES] ([Fecha], [UbicacionInicial], [UbicacionFinal], [IDUsuario], [Costo], [IDViaje]) VALUES (CAST(N'2023-01-07' AS Date), N'Comuna 1', N'Comuna 2', 71, CAST(5000.00 AS Decimal(10, 2)), 61)
GO
INSERT [dbo].[VIAJES] ([Fecha], [UbicacionInicial], [UbicacionFinal], [IDUsuario], [Costo], [IDViaje]) VALUES (CAST(N'2023-02-03' AS Date), N'Comuna 3', N'Comuna 4', 72, CAST(6000.00 AS Decimal(10, 2)), 62)
GO
INSERT [dbo].[VIAJES] ([Fecha], [UbicacionInicial], [UbicacionFinal], [IDUsuario], [Costo], [IDViaje]) VALUES (CAST(N'2023-03-07' AS Date), N'Comuna 5', N'Comuna 6', 73, CAST(7000.00 AS Decimal(10, 2)), 63)
GO
INSERT [dbo].[VIAJES] ([Fecha], [UbicacionInicial], [UbicacionFinal], [IDUsuario], [Costo], [IDViaje]) VALUES (CAST(N'2023-04-22' AS Date), N'Comuna 1', N'Comuna 3', 74, CAST(8000.00 AS Decimal(10, 2)), 64)
GO
INSERT [dbo].[VIAJES] ([Fecha], [UbicacionInicial], [UbicacionFinal], [IDUsuario], [Costo], [IDViaje]) VALUES (CAST(N'2023-05-11' AS Date), N'Comuna 2', N'Comuna 5', 75, CAST(5500.00 AS Decimal(10, 2)), 65)
GO
INSERT [dbo].[VIAJES] ([Fecha], [UbicacionInicial], [UbicacionFinal], [IDUsuario], [Costo], [IDViaje]) VALUES (CAST(N'2023-06-30' AS Date), N'Comuna 4', N'Comuna 6', 76, CAST(7500.00 AS Decimal(10, 2)), 66)
GO
INSERT [dbo].[VIAJES] ([Fecha], [UbicacionInicial], [UbicacionFinal], [IDUsuario], [Costo], [IDViaje]) VALUES (CAST(N'2023-07-12' AS Date), N'Comuna 1', N'Comuna 2', 77, CAST(5000.00 AS Decimal(10, 2)), 67)
GO
INSERT [dbo].[VIAJES] ([Fecha], [UbicacionInicial], [UbicacionFinal], [IDUsuario], [Costo], [IDViaje]) VALUES (CAST(N'2023-08-09' AS Date), N'Comuna 3', N'Comuna 4', 78, CAST(6000.00 AS Decimal(10, 2)), 68)
GO
INSERT [dbo].[VIAJES] ([Fecha], [UbicacionInicial], [UbicacionFinal], [IDUsuario], [Costo], [IDViaje]) VALUES (CAST(N'2023-09-18' AS Date), N'Comuna 5', N'Comuna 6', 79, CAST(7000.00 AS Decimal(10, 2)), 69)
GO
INSERT [dbo].[VIAJES] ([Fecha], [UbicacionInicial], [UbicacionFinal], [IDUsuario], [Costo], [IDViaje]) VALUES (CAST(N'2023-10-27' AS Date), N'Comuna 1', N'Comuna 3', 80, CAST(8000.00 AS Decimal(10, 2)), 70)
GO
INSERT [dbo].[VIAJES] ([Fecha], [UbicacionInicial], [UbicacionFinal], [IDUsuario], [Costo], [IDViaje]) VALUES (CAST(N'2023-11-15' AS Date), N'Comuna 2', N'Comuna 5', 81, CAST(5500.00 AS Decimal(10, 2)), 71)
GO
INSERT [dbo].[VIAJES] ([Fecha], [UbicacionInicial], [UbicacionFinal], [IDUsuario], [Costo], [IDViaje]) VALUES (CAST(N'2023-12-22' AS Date), N'Comuna 4', N'Comuna 6', 82, CAST(7500.00 AS Decimal(10, 2)), 72)
GO
INSERT [dbo].[VIAJES] ([Fecha], [UbicacionInicial], [UbicacionFinal], [IDUsuario], [Costo], [IDViaje]) VALUES (CAST(N'2023-01-28' AS Date), N'Comuna 1', N'Comuna 2', 83, CAST(5000.00 AS Decimal(10, 2)), 73)
GO
INSERT [dbo].[VIAJES] ([Fecha], [UbicacionInicial], [UbicacionFinal], [IDUsuario], [Costo], [IDViaje]) VALUES (CAST(N'2023-02-15' AS Date), N'Comuna 3', N'Comuna 4', 84, CAST(6000.00 AS Decimal(10, 2)), 74)
GO
INSERT [dbo].[VIAJES] ([Fecha], [UbicacionInicial], [UbicacionFinal], [IDUsuario], [Costo], [IDViaje]) VALUES (CAST(N'2023-03-25' AS Date), N'Comuna 5', N'Comuna 6', 85, CAST(7000.00 AS Decimal(10, 2)), 75)
GO
INSERT [dbo].[VIAJES] ([Fecha], [UbicacionInicial], [UbicacionFinal], [IDUsuario], [Costo], [IDViaje]) VALUES (CAST(N'2023-04-12' AS Date), N'Comuna 1', N'Comuna 3', 86, CAST(8000.00 AS Decimal(10, 2)), 76)
GO
INSERT [dbo].[VIAJES] ([Fecha], [UbicacionInicial], [UbicacionFinal], [IDUsuario], [Costo], [IDViaje]) VALUES (CAST(N'2023-05-30' AS Date), N'Comuna 2', N'Comuna 5', 87, CAST(5500.00 AS Decimal(10, 2)), 77)
GO
INSERT [dbo].[VIAJES] ([Fecha], [UbicacionInicial], [UbicacionFinal], [IDUsuario], [Costo], [IDViaje]) VALUES (CAST(N'2023-06-20' AS Date), N'Comuna 4', N'Comuna 6', 88, CAST(7500.00 AS Decimal(10, 2)), 78)
GO
INSERT [dbo].[VIAJES] ([Fecha], [UbicacionInicial], [UbicacionFinal], [IDUsuario], [Costo], [IDViaje]) VALUES (CAST(N'2023-07-05' AS Date), N'Comuna 1', N'Comuna 2', 89, CAST(5000.00 AS Decimal(10, 2)), 79)
GO
INSERT [dbo].[VIAJES] ([Fecha], [UbicacionInicial], [UbicacionFinal], [IDUsuario], [Costo], [IDViaje]) VALUES (CAST(N'2023-08-22' AS Date), N'Comuna 3', N'Comuna 4', 90, CAST(6000.00 AS Decimal(10, 2)), 80)
GO
INSERT [dbo].[VIAJES] ([Fecha], [UbicacionInicial], [UbicacionFinal], [IDUsuario], [Costo], [IDViaje]) VALUES (CAST(N'2023-09-30' AS Date), N'Comuna 5', N'Comuna 6', 91, CAST(7000.00 AS Decimal(10, 2)), 81)
GO
INSERT [dbo].[VIAJES] ([Fecha], [UbicacionInicial], [UbicacionFinal], [IDUsuario], [Costo], [IDViaje]) VALUES (CAST(N'2023-10-15' AS Date), N'Comuna 1', N'Comuna 3', 92, CAST(8000.00 AS Decimal(10, 2)), 82)
GO
INSERT [dbo].[VIAJES] ([Fecha], [UbicacionInicial], [UbicacionFinal], [IDUsuario], [Costo], [IDViaje]) VALUES (CAST(N'2023-11-25' AS Date), N'Comuna 2', N'Comuna 5', 93, CAST(5500.00 AS Decimal(10, 2)), 83)
GO
INSERT [dbo].[VIAJES] ([Fecha], [UbicacionInicial], [UbicacionFinal], [IDUsuario], [Costo], [IDViaje]) VALUES (CAST(N'2023-12-10' AS Date), N'Comuna 4', N'Comuna 6', 94, CAST(7500.00 AS Decimal(10, 2)), 84)
GO
INSERT [dbo].[VIAJES] ([Fecha], [UbicacionInicial], [UbicacionFinal], [IDUsuario], [Costo], [IDViaje]) VALUES (CAST(N'2023-01-18' AS Date), N'Comuna 1', N'Comuna 2', 95, CAST(5000.00 AS Decimal(10, 2)), 85)
GO
INSERT [dbo].[VIAJES] ([Fecha], [UbicacionInicial], [UbicacionFinal], [IDUsuario], [Costo], [IDViaje]) VALUES (CAST(N'2023-02-28' AS Date), N'Comuna 3', N'Comuna 4', 96, CAST(6000.00 AS Decimal(10, 2)), 86)
GO
INSERT [dbo].[VIAJES] ([Fecha], [UbicacionInicial], [UbicacionFinal], [IDUsuario], [Costo], [IDViaje]) VALUES (CAST(N'2023-03-21' AS Date), N'Comuna 5', N'Comuna 6', 97, CAST(7000.00 AS Decimal(10, 2)), 87)
GO
INSERT [dbo].[VIAJES] ([Fecha], [UbicacionInicial], [UbicacionFinal], [IDUsuario], [Costo], [IDViaje]) VALUES (CAST(N'2023-04-17' AS Date), N'Comuna 1', N'Comuna 3', 98, CAST(8000.00 AS Decimal(10, 2)), 88)
GO
INSERT [dbo].[VIAJES] ([Fecha], [UbicacionInicial], [UbicacionFinal], [IDUsuario], [Costo], [IDViaje]) VALUES (CAST(N'2023-05-09' AS Date), N'Comuna 2', N'Comuna 5', 99, CAST(5500.00 AS Decimal(10, 2)), 89)
GO
INSERT [dbo].[VIAJES] ([Fecha], [UbicacionInicial], [UbicacionFinal], [IDUsuario], [Costo], [IDViaje]) VALUES (CAST(N'2023-06-15' AS Date), N'Comuna 4', N'Comuna 6', 100, CAST(7500.00 AS Decimal(10, 2)), 90)
GO
INSERT [dbo].[VIAJES] ([Fecha], [UbicacionInicial], [UbicacionFinal], [IDUsuario], [Costo], [IDViaje]) VALUES (CAST(N'2023-07-08' AS Date), N'Comuna 1', N'Comuna 2', 101, CAST(5000.00 AS Decimal(10, 2)), 91)
GO
INSERT [dbo].[VIAJES] ([Fecha], [UbicacionInicial], [UbicacionFinal], [IDUsuario], [Costo], [IDViaje]) VALUES (CAST(N'2023-08-11' AS Date), N'Comuna 3', N'Comuna 4', 102, CAST(6000.00 AS Decimal(10, 2)), 92)
GO
INSERT [dbo].[VIAJES] ([Fecha], [UbicacionInicial], [UbicacionFinal], [IDUsuario], [Costo], [IDViaje]) VALUES (CAST(N'2023-09-14' AS Date), N'Comuna 5', N'Comuna 6', 103, CAST(7000.00 AS Decimal(10, 2)), 93)
GO
INSERT [dbo].[VIAJES] ([Fecha], [UbicacionInicial], [UbicacionFinal], [IDUsuario], [Costo], [IDViaje]) VALUES (CAST(N'2023-10-21' AS Date), N'Comuna 1', N'Comuna 3', 104, CAST(8000.00 AS Decimal(10, 2)), 94)
GO
INSERT [dbo].[VIAJES] ([Fecha], [UbicacionInicial], [UbicacionFinal], [IDUsuario], [Costo], [IDViaje]) VALUES (CAST(N'2023-11-12' AS Date), N'Comuna 2', N'Comuna 5', 105, CAST(5500.00 AS Decimal(10, 2)), 95)
GO
INSERT [dbo].[VIAJES] ([Fecha], [UbicacionInicial], [UbicacionFinal], [IDUsuario], [Costo], [IDViaje]) VALUES (CAST(N'2023-12-01' AS Date), N'Comuna 4', N'Comuna 6', 106, CAST(7500.00 AS Decimal(10, 2)), 96)
GO
SET IDENTITY_INSERT [dbo].[VIAJES] OFF
GO
SET IDENTITY_INSERT [dbo].[VIAJESxAUTOS] ON 
GO
INSERT [dbo].[VIAJESxAUTOS] ([ID], [Patente], [Fecha], [IDViaje]) VALUES (98, N'19UUA9F50CA638268', CAST(N'2023-01-15' AS Date), 1)
GO
INSERT [dbo].[VIAJESxAUTOS] ([ID], [Patente], [Fecha], [IDViaje]) VALUES (99, N'19UUA9F76CA626224', CAST(N'2023-02-20' AS Date), 2)
GO
INSERT [dbo].[VIAJESxAUTOS] ([ID], [Patente], [Fecha], [IDViaje]) VALUES (100, N'19UYA42453A715556', CAST(N'2023-03-10' AS Date), 3)
GO
INSERT [dbo].[VIAJESxAUTOS] ([ID], [Patente], [Fecha], [IDViaje]) VALUES (101, N'19UYA42543A391606', CAST(N'2023-04-05' AS Date), 4)
GO
INSERT [dbo].[VIAJESxAUTOS] ([ID], [Patente], [Fecha], [IDViaje]) VALUES (102, N'1B3CB5HAXAD072787', CAST(N'2023-05-25' AS Date), 5)
GO
INSERT [dbo].[VIAJESxAUTOS] ([ID], [Patente], [Fecha], [IDViaje]) VALUES (103, N'1C3CCBBB7DN155432', CAST(N'2023-06-30' AS Date), 6)
GO
INSERT [dbo].[VIAJESxAUTOS] ([ID], [Patente], [Fecha], [IDViaje]) VALUES (104, N'1C4AJWAG2CL144586', CAST(N'2023-07-15' AS Date), 7)
GO
INSERT [dbo].[VIAJESxAUTOS] ([ID], [Patente], [Fecha], [IDViaje]) VALUES (105, N'1C4RJEAG6FC834939', CAST(N'2023-08-20' AS Date), 8)
GO
INSERT [dbo].[VIAJESxAUTOS] ([ID], [Patente], [Fecha], [IDViaje]) VALUES (106, N'1FBSS3BL7AD967471', CAST(N'2023-09-10' AS Date), 9)
GO
INSERT [dbo].[VIAJESxAUTOS] ([ID], [Patente], [Fecha], [IDViaje]) VALUES (107, N'1FTEW1CM4CK696019', CAST(N'2023-10-05' AS Date), 10)
GO
INSERT [dbo].[VIAJESxAUTOS] ([ID], [Patente], [Fecha], [IDViaje]) VALUES (108, N'1FTEX1C85AF533952', CAST(N'2023-11-25' AS Date), 11)
GO
INSERT [dbo].[VIAJESxAUTOS] ([ID], [Patente], [Fecha], [IDViaje]) VALUES (109, N'1FTEX1CW6AK798711', CAST(N'2023-12-30' AS Date), 12)
GO
INSERT [dbo].[VIAJESxAUTOS] ([ID], [Patente], [Fecha], [IDViaje]) VALUES (110, N'1FTFW1E8XAK852517', CAST(N'2023-01-20' AS Date), 13)
GO
INSERT [dbo].[VIAJESxAUTOS] ([ID], [Patente], [Fecha], [IDViaje]) VALUES (111, N'1FTEW1CM4CK696019', CAST(N'2023-02-18' AS Date), 14)
GO
INSERT [dbo].[VIAJESxAUTOS] ([ID], [Patente], [Fecha], [IDViaje]) VALUES (112, N'1FTSW3B54AE254278', CAST(N'2023-03-15' AS Date), 15)
GO
INSERT [dbo].[VIAJESxAUTOS] ([ID], [Patente], [Fecha], [IDViaje]) VALUES (113, N'1FTSX2B50AE020131', CAST(N'2023-04-22' AS Date), 16)
GO
INSERT [dbo].[VIAJESxAUTOS] ([ID], [Patente], [Fecha], [IDViaje]) VALUES (114, N'1G4HP57248U909636', CAST(N'2023-05-24' AS Date), 17)
GO
INSERT [dbo].[VIAJESxAUTOS] ([ID], [Patente], [Fecha], [IDViaje]) VALUES (115, N'1G6AL1R33F0801516', CAST(N'2023-06-19' AS Date), 18)
GO
INSERT [dbo].[VIAJESxAUTOS] ([ID], [Patente], [Fecha], [IDViaje]) VALUES (116, N'1G6AL5S36E0437267', CAST(N'2023-07-11' AS Date), 19)
GO
INSERT [dbo].[VIAJESxAUTOS] ([ID], [Patente], [Fecha], [IDViaje]) VALUES (117, N'1G6AU5S88E0714929', CAST(N'2023-08-30' AS Date), 20)
GO
INSERT [dbo].[VIAJESxAUTOS] ([ID], [Patente], [Fecha], [IDViaje]) VALUES (118, N'1G6AZ5S33E0223951', CAST(N'2023-09-25' AS Date), 21)
GO
INSERT [dbo].[VIAJESxAUTOS] ([ID], [Patente], [Fecha], [IDViaje]) VALUES (119, N'1G6DH8E38E0275072', CAST(N'2023-10-15' AS Date), 22)
GO
INSERT [dbo].[VIAJESxAUTOS] ([ID], [Patente], [Fecha], [IDViaje]) VALUES (120, N'1G6DL67A180335079', CAST(N'2023-11-05' AS Date), 23)
GO
INSERT [dbo].[VIAJESxAUTOS] ([ID], [Patente], [Fecha], [IDViaje]) VALUES (121, N'1GD02ZCG5CZ106382', CAST(N'2023-12-20' AS Date), 24)
GO
INSERT [dbo].[VIAJESxAUTOS] ([ID], [Patente], [Fecha], [IDViaje]) VALUES (122, N'1GD12YEG3FF361615', CAST(N'2023-01-30' AS Date), 25)
GO
INSERT [dbo].[VIAJESxAUTOS] ([ID], [Patente], [Fecha], [IDViaje]) VALUES (123, N'1GD312CG3DF126429', CAST(N'2023-02-25' AS Date), 26)
GO
INSERT [dbo].[VIAJESxAUTOS] ([ID], [Patente], [Fecha], [IDViaje]) VALUES (124, N'1GYEK63N86R937896', CAST(N'2023-03-20' AS Date), 27)
GO
INSERT [dbo].[VIAJESxAUTOS] ([ID], [Patente], [Fecha], [IDViaje]) VALUES (125, N'1GYUKEEJ9AR892394', CAST(N'2023-04-10' AS Date), 28)
GO
INSERT [dbo].[VIAJESxAUTOS] ([ID], [Patente], [Fecha], [IDViaje]) VALUES (126, N'1HGCR6F54FA708099', CAST(N'2023-05-15' AS Date), 29)
GO
INSERT [dbo].[VIAJESxAUTOS] ([ID], [Patente], [Fecha], [IDViaje]) VALUES (127, N'1J4RG4GK5AC799561', CAST(N'2023-06-25' AS Date), 30)
GO
INSERT [dbo].[VIAJESxAUTOS] ([ID], [Patente], [Fecha], [IDViaje]) VALUES (128, N'1N4AL3AP7EC501763', CAST(N'2023-07-20' AS Date), 31)
GO
INSERT [dbo].[VIAJESxAUTOS] ([ID], [Patente], [Fecha], [IDViaje]) VALUES (129, N'1N4CL2AP2BC798438', CAST(N'2023-08-15' AS Date), 32)
GO
INSERT [dbo].[VIAJESxAUTOS] ([ID], [Patente], [Fecha], [IDViaje]) VALUES (130, N'1N4CL2AP5AC355439', CAST(N'2023-09-05' AS Date), 33)
GO
INSERT [dbo].[VIAJESxAUTOS] ([ID], [Patente], [Fecha], [IDViaje]) VALUES (131, N'1N6AA0CC1FN651315', CAST(N'2023-10-30' AS Date), 34)
GO
INSERT [dbo].[VIAJESxAUTOS] ([ID], [Patente], [Fecha], [IDViaje]) VALUES (132, N'1N6AF0KX1EN432231', CAST(N'2023-11-10' AS Date), 35)
GO
INSERT [dbo].[VIAJESxAUTOS] ([ID], [Patente], [Fecha], [IDViaje]) VALUES (133, N'1ZVBP8AM7E5690809', CAST(N'2023-12-15' AS Date), 36)
GO
INSERT [dbo].[VIAJESxAUTOS] ([ID], [Patente], [Fecha], [IDViaje]) VALUES (134, N'2B3CJ7DW4AH378614', CAST(N'2023-01-05' AS Date), 37)
GO
INSERT [dbo].[VIAJESxAUTOS] ([ID], [Patente], [Fecha], [IDViaje]) VALUES (135, N'2C4RDGBG8FR331308', CAST(N'2023-02-10' AS Date), 38)
GO
INSERT [dbo].[VIAJESxAUTOS] ([ID], [Patente], [Fecha], [IDViaje]) VALUES (136, N'2D4RN1AG3BR822247', CAST(N'2023-03-07' AS Date), 39)
GO
INSERT [dbo].[VIAJESxAUTOS] ([ID], [Patente], [Fecha], [IDViaje]) VALUES (137, N'2HNYD18875H420973', CAST(N'2023-04-22' AS Date), 40)
GO
INSERT [dbo].[VIAJESxAUTOS] ([ID], [Patente], [Fecha], [IDViaje]) VALUES (138, N'2HNYD18904H733273', CAST(N'2023-05-09' AS Date), 41)
GO
INSERT [dbo].[VIAJESxAUTOS] ([ID], [Patente], [Fecha], [IDViaje]) VALUES (139, N'3C3CFFAR3FT615590', CAST(N'2023-06-14' AS Date), 42)
GO
INSERT [dbo].[VIAJESxAUTOS] ([ID], [Patente], [Fecha], [IDViaje]) VALUES (140, N'3C4PDDGG0FT515671', CAST(N'2023-07-30' AS Date), 43)
GO
INSERT [dbo].[VIAJESxAUTOS] ([ID], [Patente], [Fecha], [IDViaje]) VALUES (141, N'3C63DPGLXCG549951', CAST(N'2023-08-05' AS Date), 44)
GO
INSERT [dbo].[VIAJESxAUTOS] ([ID], [Patente], [Fecha], [IDViaje]) VALUES (142, N'3C6JD7AP9CG364373', CAST(N'2023-09-14' AS Date), 45)
GO
INSERT [dbo].[VIAJESxAUTOS] ([ID], [Patente], [Fecha], [IDViaje]) VALUES (143, N'3FADP0L37AR565064', CAST(N'2023-10-25' AS Date), 46)
GO
INSERT [dbo].[VIAJESxAUTOS] ([ID], [Patente], [Fecha], [IDViaje]) VALUES (144, N'3FADP4AJ1CM827119', CAST(N'2023-11-12' AS Date), 47)
GO
INSERT [dbo].[VIAJESxAUTOS] ([ID], [Patente], [Fecha], [IDViaje]) VALUES (145, N'3FAHP0JA4AR054317', CAST(N'2023-12-01' AS Date), 48)
GO
INSERT [dbo].[VIAJESxAUTOS] ([ID], [Patente], [Fecha], [IDViaje]) VALUES (146, N'3LNHL2GC1AR052580', CAST(N'2023-01-18' AS Date), 49)
GO
INSERT [dbo].[VIAJESxAUTOS] ([ID], [Patente], [Fecha], [IDViaje]) VALUES (147, N'3N1AB6AP2CL778162', CAST(N'2023-02-28' AS Date), 50)
GO
INSERT [dbo].[VIAJESxAUTOS] ([ID], [Patente], [Fecha], [IDViaje]) VALUES (148, N'3N1CN7AP7EK131531', CAST(N'2023-03-21' AS Date), 51)
GO
INSERT [dbo].[VIAJESxAUTOS] ([ID], [Patente], [Fecha], [IDViaje]) VALUES (149, N'4T1BF1FK5EU505534', CAST(N'2023-04-17' AS Date), 52)
GO
INSERT [dbo].[VIAJESxAUTOS] ([ID], [Patente], [Fecha], [IDViaje]) VALUES (150, N'4T1BF3EK4BU329603', CAST(N'2023-05-30' AS Date), 53)
GO
INSERT [dbo].[VIAJESxAUTOS] ([ID], [Patente], [Fecha], [IDViaje]) VALUES (151, N'5J8TB4H32GL178340', CAST(N'2023-06-10' AS Date), 54)
GO
INSERT [dbo].[VIAJESxAUTOS] ([ID], [Patente], [Fecha], [IDViaje]) VALUES (152, N'5N1AR2MM1FC085999', CAST(N'2023-07-08' AS Date), 55)
GO
INSERT [dbo].[VIAJESxAUTOS] ([ID], [Patente], [Fecha], [IDViaje]) VALUES (153, N'5N1AZ2MG1FN766100', CAST(N'2023-08-11' AS Date), 56)
GO
INSERT [dbo].[VIAJESxAUTOS] ([ID], [Patente], [Fecha], [IDViaje]) VALUES (154, N'5N1CR2MN3EC636949', CAST(N'2023-09-14' AS Date), 57)
GO
INSERT [dbo].[VIAJESxAUTOS] ([ID], [Patente], [Fecha], [IDViaje]) VALUES (155, N'5NPDH4AE2FH016403', CAST(N'2023-10-21' AS Date), 58)
GO
INSERT [dbo].[VIAJESxAUTOS] ([ID], [Patente], [Fecha], [IDViaje]) VALUES (156, N'5UXWX5C53BL568768', CAST(N'2023-11-12' AS Date), 59)
GO
INSERT [dbo].[VIAJESxAUTOS] ([ID], [Patente], [Fecha], [IDViaje]) VALUES (157, N'5UXZV4C57DL639938', CAST(N'2023-12-01' AS Date), 60)
GO
INSERT [dbo].[VIAJESxAUTOS] ([ID], [Patente], [Fecha], [IDViaje]) VALUES (158, N'JHMZF1C45BS957823', CAST(N'2023-01-07' AS Date), 61)
GO
INSERT [dbo].[VIAJESxAUTOS] ([ID], [Patente], [Fecha], [IDViaje]) VALUES (159, N'JHMZF1D49ES268984', CAST(N'2023-02-03' AS Date), 62)
GO
INSERT [dbo].[VIAJESxAUTOS] ([ID], [Patente], [Fecha], [IDViaje]) VALUES (160, N'JM3TB2CV3F0393499', CAST(N'2023-03-07' AS Date), 63)
GO
INSERT [dbo].[VIAJESxAUTOS] ([ID], [Patente], [Fecha], [IDViaje]) VALUES (161, N'JN1AZ4EH2BM561881', CAST(N'2023-04-22' AS Date), 64)
GO
INSERT [dbo].[VIAJESxAUTOS] ([ID], [Patente], [Fecha], [IDViaje]) VALUES (162, N'JN1AZ4EH4EM349875', CAST(N'2023-05-11' AS Date), 65)
GO
INSERT [dbo].[VIAJESxAUTOS] ([ID], [Patente], [Fecha], [IDViaje]) VALUES (163, N'JN8AE2KP2F9061127', CAST(N'2023-06-30' AS Date), 66)
GO
INSERT [dbo].[VIAJESxAUTOS] ([ID], [Patente], [Fecha], [IDViaje]) VALUES (164, N'JN8AS5MT5AW705038', CAST(N'2023-07-12' AS Date), 67)
GO
INSERT [dbo].[VIAJESxAUTOS] ([ID], [Patente], [Fecha], [IDViaje]) VALUES (165, N'JTDKTUD34DD512032', CAST(N'2023-08-09' AS Date), 68)
GO
INSERT [dbo].[VIAJESxAUTOS] ([ID], [Patente], [Fecha], [IDViaje]) VALUES (166, N'JTHFE2C26C2236549', CAST(N'2023-09-18' AS Date), 69)
GO
INSERT [dbo].[VIAJESxAUTOS] ([ID], [Patente], [Fecha], [IDViaje]) VALUES (167, N'KMHTC6AD5DU686815', CAST(N'2023-10-27' AS Date), 70)
GO
INSERT [dbo].[VIAJESxAUTOS] ([ID], [Patente], [Fecha], [IDViaje]) VALUES (168, N'SAJWA4EC0CM624512', CAST(N'2023-11-15' AS Date), 71)
GO
INSERT [dbo].[VIAJESxAUTOS] ([ID], [Patente], [Fecha], [IDViaje]) VALUES (169, N'SAJWA6E75E8515621', CAST(N'2023-12-10' AS Date), 72)
GO
INSERT [dbo].[VIAJESxAUTOS] ([ID], [Patente], [Fecha], [IDViaje]) VALUES (170, N'SCBBB7ZH8EC209189', CAST(N'2023-01-28' AS Date), 73)
GO
INSERT [dbo].[VIAJESxAUTOS] ([ID], [Patente], [Fecha], [IDViaje]) VALUES (171, N'SCBBP9ZA8BC364904', CAST(N'2023-02-15' AS Date), 74)
GO
INSERT [dbo].[VIAJESxAUTOS] ([ID], [Patente], [Fecha], [IDViaje]) VALUES (172, N'SCBCU8ZA0AC129001', CAST(N'2023-03-25' AS Date), 75)
GO
INSERT [dbo].[VIAJESxAUTOS] ([ID], [Patente], [Fecha], [IDViaje]) VALUES (173, N'SCBDR3ZAXAC070905', CAST(N'2023-04-12' AS Date), 76)
GO
INSERT [dbo].[VIAJESxAUTOS] ([ID], [Patente], [Fecha], [IDViaje]) VALUES (174, N'WA1CKAFPXAA701314', CAST(N'2023-05-30' AS Date), 77)
GO
INSERT [dbo].[VIAJESxAUTOS] ([ID], [Patente], [Fecha], [IDViaje]) VALUES (175, N'WA1VFAFL3DA718468', CAST(N'2023-06-20' AS Date), 78)
GO
INSERT [dbo].[VIAJESxAUTOS] ([ID], [Patente], [Fecha], [IDViaje]) VALUES (176, N'WA1VKBFP2AA649689', CAST(N'2023-07-05' AS Date), 79)
GO
INSERT [dbo].[VIAJESxAUTOS] ([ID], [Patente], [Fecha], [IDViaje]) VALUES (177, N'WAU4GBFB9BN856496', CAST(N'2023-08-22' AS Date), 80)
GO
INSERT [dbo].[VIAJESxAUTOS] ([ID], [Patente], [Fecha], [IDViaje]) VALUES (178, N'WAUBF78EX8A428452', CAST(N'2023-09-30' AS Date), 81)
GO
INSERT [dbo].[VIAJESxAUTOS] ([ID], [Patente], [Fecha], [IDViaje]) VALUES (179, N'WAUBFBFL9AN369560', CAST(N'2023-10-10' AS Date), 82)
GO
INSERT [dbo].[VIAJESxAUTOS] ([ID], [Patente], [Fecha], [IDViaje]) VALUES (180, N'WAUDH94F57N943461', CAST(N'2023-11-20' AS Date), 83)
GO
INSERT [dbo].[VIAJESxAUTOS] ([ID], [Patente], [Fecha], [IDViaje]) VALUES (181, N'WAUDK78T68A714267', CAST(N'2023-12-05' AS Date), 84)
GO
INSERT [dbo].[VIAJESxAUTOS] ([ID], [Patente], [Fecha], [IDViaje]) VALUES (182, N'WAUDT94F75N436928', CAST(N'2023-01-12' AS Date), 85)
GO
INSERT [dbo].[VIAJESxAUTOS] ([ID], [Patente], [Fecha], [IDViaje]) VALUES (183, N'WAUEFBFL6EN354145', CAST(N'2023-02-22' AS Date), 86)
GO
INSERT [dbo].[VIAJESxAUTOS] ([ID], [Patente], [Fecha], [IDViaje]) VALUES (184, N'WAUFFAFM7CA177150', CAST(N'2023-03-12' AS Date), 87)
GO
INSERT [dbo].[VIAJESxAUTOS] ([ID], [Patente], [Fecha], [IDViaje]) VALUES (185, N'WAUHF98P28A203031', CAST(N'2023-04-28' AS Date), 88)
GO
INSERT [dbo].[VIAJESxAUTOS] ([ID], [Patente], [Fecha], [IDViaje]) VALUES (186, N'WAUJT54B52N363353', CAST(N'2023-05-18' AS Date), 89)
GO
INSERT [dbo].[VIAJESxAUTOS] ([ID], [Patente], [Fecha], [IDViaje]) VALUES (187, N'WAUKG58E15A437120', CAST(N'2023-06-14' AS Date), 90)
GO
INSERT [dbo].[VIAJESxAUTOS] ([ID], [Patente], [Fecha], [IDViaje]) VALUES (188, N'WAUMFAFR6EA604274', CAST(N'2023-07-30' AS Date), 91)
GO
INSERT [dbo].[VIAJESxAUTOS] ([ID], [Patente], [Fecha], [IDViaje]) VALUES (189, N'WAUMK78K69A019599', CAST(N'2023-08-05' AS Date), 92)
GO
INSERT [dbo].[VIAJESxAUTOS] ([ID], [Patente], [Fecha], [IDViaje]) VALUES (190, N'WAUML44E04N649521', CAST(N'2023-09-14' AS Date), 93)
GO
INSERT [dbo].[VIAJESxAUTOS] ([ID], [Patente], [Fecha], [IDViaje]) VALUES (191, N'WAUNF68P46A817206', CAST(N'2023-10-21' AS Date), 94)
GO
INSERT [dbo].[VIAJESxAUTOS] ([ID], [Patente], [Fecha], [IDViaje]) VALUES (192, N'WAUNF98P26A381182', CAST(N'2023-11-12' AS Date), 95)
GO
INSERT [dbo].[VIAJESxAUTOS] ([ID], [Patente], [Fecha], [IDViaje]) VALUES (193, N'WAUTFAFH9CN511807', CAST(N'2023-12-01' AS Date), 96)
GO
SET IDENTITY_INSERT [dbo].[VIAJESxAUTOS] OFF
GO
SET IDENTITY_INSERT [dbo].[ZONA] ON 
GO
INSERT [dbo].[ZONA] ([IDZona], [Nombre]) VALUES (1, N'Comuna 1')
GO
INSERT [dbo].[ZONA] ([IDZona], [Nombre]) VALUES (2, N'Comuna 2')
GO
INSERT [dbo].[ZONA] ([IDZona], [Nombre]) VALUES (3, N'Comuna 3')
GO
INSERT [dbo].[ZONA] ([IDZona], [Nombre]) VALUES (4, N'Comuna 4')
GO
INSERT [dbo].[ZONA] ([IDZona], [Nombre]) VALUES (5, N'Comuna 5')
GO
INSERT [dbo].[ZONA] ([IDZona], [Nombre]) VALUES (6, N'Comuna 6')
GO
INSERT [dbo].[ZONA] ([IDZona], [Nombre]) VALUES (7, N'Comuna 7')
GO
INSERT [dbo].[ZONA] ([IDZona], [Nombre]) VALUES (8, N'Comuna 8')
GO
INSERT [dbo].[ZONA] ([IDZona], [Nombre]) VALUES (9, N'Comuna 9')
GO
INSERT [dbo].[ZONA] ([IDZona], [Nombre]) VALUES (10, N'Comuna 10')
GO
INSERT [dbo].[ZONA] ([IDZona], [Nombre]) VALUES (11, N'Comuna 11')
GO
INSERT [dbo].[ZONA] ([IDZona], [Nombre]) VALUES (12, N'Comuna 12')
GO
INSERT [dbo].[ZONA] ([IDZona], [Nombre]) VALUES (13, N'Comuna 13')
GO
INSERT [dbo].[ZONA] ([IDZona], [Nombre]) VALUES (14, N'Comuna 14')
GO
INSERT [dbo].[ZONA] ([IDZona], [Nombre]) VALUES (15, N'Comuna 15')
GO
SET IDENTITY_INSERT [dbo].[ZONA] OFF
GO
SET IDENTITY_INSERT [dbo].[ZONAxAUTOS] ON 
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (1, N'19UUA9F50CA638268', 1, 1)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (2, N'19UUA9F76CA626224', 2, 0)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (3, N'19UYA42453A715556', 3, 1)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (4, N'19UYA42543A391606', 4, 0)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (5, N'1B3CB5HAXAD072787', 5, 1)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (6, N'1C3CCBBB7DN155432', 6, 1)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (7, N'1C4AJWAG2CL144586', 7, 1)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (8, N'1C4RJEAG6FC834939', 8, 0)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (9, N'1FBSS3BL7AD967471', 9, 1)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (10, N'1FTEW1CM4CK696019', 10, 1)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (11, N'1FTEX1C85AF533952', 11, 0)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (12, N'1FTEX1CW6AK798711', 12, 1)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (13, N'1FTFW1E8XAK852517', 13, 1)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (14, N'1FTSW3B54AE254278', 14, 0)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (15, N'1FTSX2B50AE020131', 15, 1)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (16, N'1G4HP57248U909636', 1, 0)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (17, N'1G6AL1R33F0801516', 2, 1)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (18, N'1G6AL5S36E0437267', 3, 0)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (19, N'1G6AU5S88E0714929', 4, 1)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (20, N'1G6AZ5S33E0223951', 5, 0)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (21, N'1G6DH8E38E0275072', 6, 1)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (22, N'1G6DL67A180335079', 7, 1)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (23, N'1GD02ZCG5CZ106382', 8, 1)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (24, N'1GD12YEG3FF361615', 9, 1)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (25, N'1GD312CG3DF126429', 10, 0)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (26, N'1GYEK63N86R937896', 11, 0)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (27, N'1GYUKEEJ9AR892394', 12, 1)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (28, N'1HGCR6F54FA708099', 13, 0)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (29, N'1J4RG4GK5AC799561', 14, 0)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (30, N'1N4AL3AP7EC501763', 15, 1)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (31, N'1N4CL2AP2BC798438', 1, 1)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (32, N'1N4CL2AP5AC355439', 2, 1)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (33, N'1N6AA0CC1FN651315', 3, 0)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (34, N'1N6AF0KX1EN432231', 4, 0)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (35, N'1ZVBP8AM7E5690809', 5, 0)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (36, N'2B3CJ7DW4AH378614', 6, 1)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (37, N'2C4RDGBG8FR331308', 7, 1)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (38, N'2D4RN1AG3BR822247', 8, 1)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (39, N'2HNYD18875H420973', 9, 0)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (40, N'2HNYD18904H733273', 10, 1)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (41, N'3C3CFFAR3FT615590', 11, 0)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (42, N'3C4PDDGG0FT515671', 12, 0)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (43, N'3C63DPGLXCG549951', 13, 0)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (44, N'3C6JD7AP9CG364373', 14, 0)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (45, N'3FADP0L37AR565064', 15, 0)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (46, N'3FADP4AJ1CM827119', 1, 0)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (47, N'3FAHP0JA4AR054317', 2, 0)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (48, N'3LNHL2GC1AR052580', 3, 1)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (49, N'3N1AB6AP2CL778162', 4, 0)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (50, N'3N1CN7AP7EK131531', 5, 1)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (51, N'4T1BF1FK5EU505534', 6, 0)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (52, N'4T1BF3EK4BU329603', 7, 0)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (53, N'5J8TB4H32GL178340', 8, 1)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (54, N'5N1AR2MM1FC085999', 9, 0)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (55, N'5N1AZ2MG1FN766100', 10, 0)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (56, N'5N1CR2MN3EC636949', 11, 1)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (57, N'5NPDH4AE2FH016403', 12, 0)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (58, N'5UXWX5C53BL568768', 13, 0)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (59, N'5UXZV4C57DL639938', 14, 0)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (60, N'JHMZF1C45BS957823', 15, 1)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (61, N'JHMZF1D49ES268984', 1, 0)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (62, N'JM3TB2CV3F0393499', 2, 1)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (63, N'JN1AZ4EH2BM561881', 3, 1)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (64, N'JN1AZ4EH4EM349875', 4, 0)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (65, N'JN8AE2KP2F9061127', 5, 0)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (66, N'JN8AS5MT5AW705038', 6, 0)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (67, N'JTDKTUD34DD512032', 7, 0)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (68, N'JTHFE2C26C2236549', 8, 0)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (69, N'KMHTC6AD5DU686815', 9, 0)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (70, N'SAJWA4EC0CM624512', 10, 1)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (71, N'SAJWA6E75E8515621', 11, 0)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (72, N'SCBBB7ZH8EC209189', 12, 0)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (73, N'SCBBP9ZA8BC364904', 13, 1)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (74, N'SCBCU8ZA0AC129001', 14, 1)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (75, N'SCBDR3ZAXAC070905', 15, 1)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (76, N'WA1CKAFPXAA701314', 1, 1)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (77, N'WA1VFAFL3DA718468', 2, 0)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (78, N'WA1VKBFP2AA649689', 3, 1)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (79, N'WAU4GBFB9BN856496', 4, 0)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (80, N'WAUBF78EX8A428452', 5, 1)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (81, N'WAUBFBFL9AN369560', 6, 1)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (82, N'WAUDH94F57N943461', 7, 1)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (83, N'WAUDK78T68A714267', 8, 1)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (84, N'WAUDT94F75N436928', 9, 0)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (85, N'WAUEFBFL6EN354145', 10, 1)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (86, N'WAUFFAFM7CA177150', 11, 0)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (87, N'WAUHF98P28A203031', 12, 0)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (88, N'WAUJT54B52N363353', 13, 0)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (89, N'WAUKG58E15A437120', 14, 0)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (90, N'WAUMFAFR6EA604274', 15, 0)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (91, N'WAUMK78K69A019599', 1, 1)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (92, N'WAUML44E04N649521', 2, 1)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (93, N'WAUNF68P46A817206', 3, 0)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (94, N'WAUNF98P26A381182', 4, 1)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (95, N'WAUTFAFH9CN511807', 5, 1)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (96, N'WAUUL78E97A635768', 6, 0)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (97, N'WAUVT64B34N042602', 7, 0)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (98, N'WAUWFAFR4CA723575', 8, 1)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (99, N'WAUXD68D02A450853', 9, 1)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (100, N'WBA3A5C55EF881780', 10, 0)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (101, N'WBA3A5G50EN355363', 11, 1)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (102, N'WBA3A5G5XCN962710', 12, 0)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (103, N'WBAEV33403K807633', 13, 0)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (104, N'WBAKE5C53DJ414448', 14, 1)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (105, N'WBAKF9C55DE148105', 15, 1)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (106, N'WBALW7C52CD296550', 1, 1)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (107, N'WBAPH7G5XAN846042', 2, 0)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (108, N'WBAUP93568V268975', 3, 0)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (109, N'WBAYA8C51FG804486', 4, 1)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (110, N'WBAYB6C50FG257776', 5, 1)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (111, N'WBAYP5C55ED154591', 6, 0)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (112, N'WBS3C9C58FP936828', 7, 1)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (113, N'WBSBL93412J077369', 8, 1)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (114, N'WUADNAFG5AN274976', 9, 0)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (115, N'WVGAV7AX4AW009756', 10, 0)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (116, N'WVGAV7AX5CW970286', 11, 1)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (117, N'YV140MAM3F1922351', 12, 0)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (118, N'YV1902FH6D1387955', 13, 1)
GO
INSERT [dbo].[ZONAxAUTOS] ([ID], [Patente], [IDZona], [Cercanía]) VALUES (119, N'ZFBCFACH2FZ082596', 14, 1)
GO
SET IDENTITY_INSERT [dbo].[ZONAxAUTOS] OFF
GO
ALTER TABLE [dbo].[AUTOS]  WITH CHECK ADD  CONSTRAINT [FK_AUTOS_EMPRESA] FOREIGN KEY([IDEmpresa])
REFERENCES [dbo].[EMPRESA] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AUTOS] CHECK CONSTRAINT [FK_AUTOS_EMPRESA]
GO
ALTER TABLE [dbo].[PAGOS]  WITH CHECK ADD  CONSTRAINT [FK_PAGOS_VIAJES] FOREIGN KEY([IDViaje])
REFERENCES [dbo].[VIAJES] ([IDViaje])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PAGOS] CHECK CONSTRAINT [FK_PAGOS_VIAJES]
GO
ALTER TABLE [dbo].[RESEÑAS]  WITH CHECK ADD  CONSTRAINT [FK_RESEÑAS_VIAJES] FOREIGN KEY([IDViaje])
REFERENCES [dbo].[VIAJES] ([IDViaje])
GO
ALTER TABLE [dbo].[RESEÑAS] CHECK CONSTRAINT [FK_RESEÑAS_VIAJES]
GO
ALTER TABLE [dbo].[VIAJES]  WITH CHECK ADD  CONSTRAINT [FK_VIAJES_USUARIO] FOREIGN KEY([IDUsuario])
REFERENCES [dbo].[USUARIO] ([idUsuario])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[VIAJES] CHECK CONSTRAINT [FK_VIAJES_USUARIO]
GO
ALTER TABLE [dbo].[VIAJESxAUTOS]  WITH CHECK ADD  CONSTRAINT [FK_VIAJESxAUTOS_AUTOS1] FOREIGN KEY([Patente])
REFERENCES [dbo].[AUTOS] ([Patente])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[VIAJESxAUTOS] CHECK CONSTRAINT [FK_VIAJESxAUTOS_AUTOS1]
GO
ALTER TABLE [dbo].[VIAJESxAUTOS]  WITH CHECK ADD  CONSTRAINT [FK_VIAJESxAUTOS_VIAJES1] FOREIGN KEY([IDViaje])
REFERENCES [dbo].[VIAJES] ([IDViaje])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[VIAJESxAUTOS] CHECK CONSTRAINT [FK_VIAJESxAUTOS_VIAJES1]
GO
ALTER TABLE [dbo].[ZONAxAUTOS]  WITH CHECK ADD  CONSTRAINT [FK_ZONAxAUTOS_AUTOS] FOREIGN KEY([Patente])
REFERENCES [dbo].[AUTOS] ([Patente])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ZONAxAUTOS] CHECK CONSTRAINT [FK_ZONAxAUTOS_AUTOS]
GO
ALTER TABLE [dbo].[ZONAxAUTOS]  WITH CHECK ADD  CONSTRAINT [FK_ZONAxAUTOS_ZONA] FOREIGN KEY([IDZona])
REFERENCES [dbo].[ZONA] ([IDZona])
GO
ALTER TABLE [dbo].[ZONAxAUTOS] CHECK CONSTRAINT [FK_ZONAxAUTOS_ZONA]
GO
USE [master]
GO
ALTER DATABASE [SMARTRIP] SET  READ_WRITE 
GO
