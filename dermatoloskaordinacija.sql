USE [master]
GO
/****** Object:  Database [DermatoloskaOrdinacija]    Script Date: 05-Dec-20 14:52:23 ******/
CREATE DATABASE [DermatoloskaOrdinacija]

GO
ALTER DATABASE [DermatoloskaOrdinacija] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DermatoloskaOrdinacija] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DermatoloskaOrdinacija] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DermatoloskaOrdinacija] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DermatoloskaOrdinacija] SET ARITHABORT OFF 
GO
ALTER DATABASE [DermatoloskaOrdinacija] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DermatoloskaOrdinacija] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DermatoloskaOrdinacija] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DermatoloskaOrdinacija] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DermatoloskaOrdinacija] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DermatoloskaOrdinacija] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DermatoloskaOrdinacija] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DermatoloskaOrdinacija] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DermatoloskaOrdinacija] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DermatoloskaOrdinacija] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DermatoloskaOrdinacija] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DermatoloskaOrdinacija] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DermatoloskaOrdinacija] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DermatoloskaOrdinacija] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DermatoloskaOrdinacija] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DermatoloskaOrdinacija] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DermatoloskaOrdinacija] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DermatoloskaOrdinacija] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DermatoloskaOrdinacija] SET  MULTI_USER 
GO
ALTER DATABASE [DermatoloskaOrdinacija] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DermatoloskaOrdinacija] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DermatoloskaOrdinacija] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DermatoloskaOrdinacija] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DermatoloskaOrdinacija] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DermatoloskaOrdinacija] SET QUERY_STORE = OFF
GO
USE [DermatoloskaOrdinacija]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [DermatoloskaOrdinacija]
GO
/****** Object:  Table [dbo].[Korisnik]    Script Date: 05-Dec-20 14:52:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Korisnik](
	[IDKorisnika] [int] IDENTITY(1,1) NOT NULL,
	[ImePrezime] [varchar](50) NULL,
	[BrojTelefona] [varchar](50) NULL,
	[Adresa] [varchar](50) NULL,
 CONSTRAINT [PK_Korisnici] PRIMARY KEY CLUSTERED 
(
	[IDKorisnika] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Termin]    Script Date: 05-Dec-20 14:52:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Termin](
	[IDTermina] [int] IDENTITY(1,1) NOT NULL,
	[DatumZakazivanja] [date] NULL,
	[DatumTermina] [date] NULL,
	[IDZaposlenog] [int] NULL,
	[IDKorisnika] [int] NULL,
 CONSTRAINT [PK_Termin] PRIMARY KEY CLUSTERED 
(
	[IDTermina] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipUsluge]    Script Date: 05-Dec-20 14:52:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipUsluge](
	[IDTipaUsluge] [int] IDENTITY(1,1) NOT NULL,
	[NazivTipaUsluge] [varchar](50) NULL,
 CONSTRAINT [PK_TipUsluge] PRIMARY KEY CLUSTERED 
(
	[IDTipaUsluge] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usluga]    Script Date: 05-Dec-20 14:52:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usluga](
	[IDUsluge] [int] IDENTITY(1,1) NOT NULL,
	[NazivUsluge] [varchar](50) NULL,
	[OpisUsluge] [varchar](500) NULL,
	[CenaUsluge] [int] NULL,
	[IDTipaUsluge] [int] NULL,
 CONSTRAINT [PK_Usluga] PRIMARY KEY CLUSTERED 
(
	[IDUsluge] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Zaduzenja]    Script Date: 05-Dec-20 14:52:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Zaduzenja](
	[IDUsluge] [int] NOT NULL,
	[IDZaposlenog] [int] NOT NULL,
 CONSTRAINT [PK_Zaduzenja] PRIMARY KEY CLUSTERED 
(
	[IDUsluge] ASC,
	[IDZaposlenog] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Zakazivanje]    Script Date: 05-Dec-20 14:52:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Zakazivanje](
	[IDUsluge] [int] NOT NULL,
	[IDTermina] [int] NOT NULL,
 CONSTRAINT [PK_Zakazivanje] PRIMARY KEY CLUSTERED 
(
	[IDUsluge] ASC,
	[IDTermina] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Zaposleni]    Script Date: 05-Dec-20 14:52:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Zaposleni](
	[IDZaposlenog] [int] NOT NULL,
	[KorisnickoIme] [varchar](50) NULL,
	[Sifra] [varchar](50) NULL,
	[ImePrezime] [varchar](50) NULL,
	[BrojTelefona] [varchar](50) NULL,
	[Adresa] [varchar](50) NULL,
 CONSTRAINT [PK_Zaposleni] PRIMARY KEY CLUSTERED 
(
	[IDZaposlenog] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Korisnik] ON 

INSERT [dbo].[Korisnik] ([IDKorisnika], [ImePrezime], [BrojTelefona], [Adresa]) VALUES (1002, N'Miloš Majkovic', N'065442526', N'Bulevar kralja Aleksandra 31')
INSERT [dbo].[Korisnik] ([IDKorisnika], [ImePrezime], [BrojTelefona], [Adresa]) VALUES (1003, N'Sonja Markovic', N'065222213', N'Novosadska 1')
INSERT [dbo].[Korisnik] ([IDKorisnika], [ImePrezime], [BrojTelefona], [Adresa]) VALUES (1004, N'Jelena Petrovic', N'0638778066', N'Sokolska 33')
INSERT [dbo].[Korisnik] ([IDKorisnika], [ImePrezime], [BrojTelefona], [Adresa]) VALUES (2004, N'Sasa Matic', N'065544445', N'Bogoljubska 12')
INSERT [dbo].[Korisnik] ([IDKorisnika], [ImePrezime], [BrojTelefona], [Adresa]) VALUES (2005, N'Marijana Popovic', N'0653345667', N'Prvomajska 12')
SET IDENTITY_INSERT [dbo].[Korisnik] OFF
GO
SET IDENTITY_INSERT [dbo].[Termin] ON 

INSERT [dbo].[Termin] ([IDTermina], [DatumZakazivanja], [DatumTermina], [IDZaposlenog], [IDKorisnika]) VALUES (2, CAST(N'2020-04-05' AS Date), CAST(N'2020-07-10' AS Date), 3, 1003)
INSERT [dbo].[Termin] ([IDTermina], [DatumZakazivanja], [DatumTermina], [IDZaposlenog], [IDKorisnika]) VALUES (6, CAST(N'2020-12-05' AS Date), CAST(N'2020-12-12' AS Date), 2, 1002)
INSERT [dbo].[Termin] ([IDTermina], [DatumZakazivanja], [DatumTermina], [IDZaposlenog], [IDKorisnika]) VALUES (7, CAST(N'2020-12-05' AS Date), CAST(N'2020-03-12' AS Date), 3, 1003)
INSERT [dbo].[Termin] ([IDTermina], [DatumZakazivanja], [DatumTermina], [IDZaposlenog], [IDKorisnika]) VALUES (8, CAST(N'2020-12-05' AS Date), CAST(N'2020-05-05' AS Date), 3, 1002)
INSERT [dbo].[Termin] ([IDTermina], [DatumZakazivanja], [DatumTermina], [IDZaposlenog], [IDKorisnika]) VALUES (9, CAST(N'2020-12-05' AS Date), CAST(N'2020-11-11' AS Date), 1, 2005)
SET IDENTITY_INSERT [dbo].[Termin] OFF
GO
SET IDENTITY_INSERT [dbo].[TipUsluge] ON 

INSERT [dbo].[TipUsluge] ([IDTipaUsluge], [NazivTipaUsluge]) VALUES (1, N'Podmladjivanje')
INSERT [dbo].[TipUsluge] ([IDTipaUsluge], [NazivTipaUsluge]) VALUES (2, N'Problemi koze')
INSERT [dbo].[TipUsluge] ([IDTipaUsluge], [NazivTipaUsluge]) VALUES (3, N'Tretmani lica')
INSERT [dbo].[TipUsluge] ([IDTipaUsluge], [NazivTipaUsluge]) VALUES (4, N'Tretmani tela')
INSERT [dbo].[TipUsluge] ([IDTipaUsluge], [NazivTipaUsluge]) VALUES (5, N'Lepota i stil')
SET IDENTITY_INSERT [dbo].[TipUsluge] OFF
GO
SET IDENTITY_INSERT [dbo].[Usluga] ON 

INSERT [dbo].[Usluga] ([IDUsluge], [NazivUsluge], [OpisUsluge], [CenaUsluge], [IDTipaUsluge]) VALUES (28, N'Usluga 3', N'Opis3', 12000, 2)
INSERT [dbo].[Usluga] ([IDUsluge], [NazivUsluge], [OpisUsluge], [CenaUsluge], [IDTipaUsluge]) VALUES (29, N'Profesionalno sminkanje', N'Ukoliko vas uskoro ocekuje važan dogadaj kao što je vencanje, matura ili neka druga vrsta proslave, a želite da izgledate kao poznate dame sa crvenog tepiha – prepustite svoje lice profesionalcu. ', 3000, 5)
INSERT [dbo].[Usluga] ([IDUsluge], [NazivUsluge], [OpisUsluge], [CenaUsluge], [IDTipaUsluge]) VALUES (30, N'Dermatoloski pregled dece i odraslih', N'Iako izdvojen kao posebna usluga, dermatološki pregled sastavni je deo vecine usluga u našoj ordinaciji. U zavisnosti od prirode problema ili željenog tretmana zbog kog ste nam se obratili, potrebno nam je odredeno vreme, krace ili duže, da se „upoznamo“ s vašom kožom, kako bismo joj pružili ono što joj je potrebno.', 2000, 2)
INSERT [dbo].[Usluga] ([IDUsluge], [NazivUsluge], [OpisUsluge], [CenaUsluge], [IDTipaUsluge]) VALUES (31, N'Anticelulit masaza', N'U ordinaciji  anticelulit masažu obavljaju profesionalni terapeuti, što je veoma važno za rezultate masaže. Prema iskustvu naših pacijenata efekti anticelulit masaže su veoma dobri, a posebno kada se kombinuju sa adekvatnom ishranom i vežbama.', 1000, 4)
SET IDENTITY_INSERT [dbo].[Usluga] OFF
GO
INSERT [dbo].[Zaduzenja] ([IDUsluge], [IDZaposlenog]) VALUES (28, 2)
INSERT [dbo].[Zaduzenja] ([IDUsluge], [IDZaposlenog]) VALUES (28, 3)
INSERT [dbo].[Zaduzenja] ([IDUsluge], [IDZaposlenog]) VALUES (29, 1)
INSERT [dbo].[Zaduzenja] ([IDUsluge], [IDZaposlenog]) VALUES (29, 2)
INSERT [dbo].[Zaduzenja] ([IDUsluge], [IDZaposlenog]) VALUES (30, 1)
INSERT [dbo].[Zaduzenja] ([IDUsluge], [IDZaposlenog]) VALUES (31, 3)
GO
INSERT [dbo].[Zakazivanje] ([IDUsluge], [IDTermina]) VALUES (28, 6)
INSERT [dbo].[Zakazivanje] ([IDUsluge], [IDTermina]) VALUES (29, 7)
INSERT [dbo].[Zakazivanje] ([IDUsluge], [IDTermina]) VALUES (30, 8)
GO
INSERT [dbo].[Zaposleni] ([IDZaposlenog], [KorisnickoIme], [Sifra], [ImePrezime], [BrojTelefona], [Adresa]) VALUES (1, N'luka', N'luka', N'Luka Lukic', N'065563556', N'Jove Ilica33')
INSERT [dbo].[Zaposleni] ([IDZaposlenog], [KorisnickoIme], [Sifra], [ImePrezime], [BrojTelefona], [Adresa]) VALUES (2, N'sara', N'sara', N'Sara Nikolic', N'069466728', N'Vuka Karadžica 24')
INSERT [dbo].[Zaposleni] ([IDZaposlenog], [KorisnickoIme], [Sifra], [ImePrezime], [BrojTelefona], [Adresa]) VALUES (3, N'daria', N'daria', N'Daria Petrovic', N'065557899', N'Milutina Milankovica 17')
GO
ALTER TABLE [dbo].[Termin]  WITH CHECK ADD  CONSTRAINT [FK_Termin_Korisnik] FOREIGN KEY([IDKorisnika])
REFERENCES [dbo].[Korisnik] ([IDKorisnika])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Termin] CHECK CONSTRAINT [FK_Termin_Korisnik]
GO
ALTER TABLE [dbo].[Termin]  WITH CHECK ADD  CONSTRAINT [FK_Termin_Zaposleni] FOREIGN KEY([IDZaposlenog])
REFERENCES [dbo].[Zaposleni] ([IDZaposlenog])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Termin] CHECK CONSTRAINT [FK_Termin_Zaposleni]
GO
ALTER TABLE [dbo].[Usluga]  WITH CHECK ADD  CONSTRAINT [FK_Usluga_TipUsluge] FOREIGN KEY([IDTipaUsluge])
REFERENCES [dbo].[TipUsluge] ([IDTipaUsluge])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Usluga] CHECK CONSTRAINT [FK_Usluga_TipUsluge]
GO
ALTER TABLE [dbo].[Zaduzenja]  WITH CHECK ADD  CONSTRAINT [FK_Zaduzenja_Usluga] FOREIGN KEY([IDUsluge])
REFERENCES [dbo].[Usluga] ([IDUsluge])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Zaduzenja] CHECK CONSTRAINT [FK_Zaduzenja_Usluga]
GO
ALTER TABLE [dbo].[Zaduzenja]  WITH CHECK ADD  CONSTRAINT [FK_Zaduzenja_Zaposleni] FOREIGN KEY([IDZaposlenog])
REFERENCES [dbo].[Zaposleni] ([IDZaposlenog])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Zaduzenja] CHECK CONSTRAINT [FK_Zaduzenja_Zaposleni]
GO
ALTER TABLE [dbo].[Zakazivanje]  WITH CHECK ADD  CONSTRAINT [FK_Zakazivanje_Termin] FOREIGN KEY([IDTermina])
REFERENCES [dbo].[Termin] ([IDTermina])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Zakazivanje] CHECK CONSTRAINT [FK_Zakazivanje_Termin]
GO
ALTER TABLE [dbo].[Zakazivanje]  WITH CHECK ADD  CONSTRAINT [FK_Zakazivanje_Usluga] FOREIGN KEY([IDUsluge])
REFERENCES [dbo].[Usluga] ([IDUsluge])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Zakazivanje] CHECK CONSTRAINT [FK_Zakazivanje_Usluga]
GO
USE [master]
GO
ALTER DATABASE [DermatoloskaOrdinacija] SET  READ_WRITE 
GO
