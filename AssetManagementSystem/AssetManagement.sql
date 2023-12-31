USE [master]
GO
/****** Object:  Database [AssetManagement]    Script Date: 24-03-2023 16:58:59 ******/
CREATE DATABASE [AssetManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AssetManagement', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\AssetManagement.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AssetManagement_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\AssetManagement_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [AssetManagement] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AssetManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AssetManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AssetManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AssetManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AssetManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AssetManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [AssetManagement] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AssetManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AssetManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AssetManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AssetManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AssetManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AssetManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AssetManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AssetManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AssetManagement] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AssetManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AssetManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AssetManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AssetManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AssetManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AssetManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AssetManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AssetManagement] SET RECOVERY FULL 
GO
ALTER DATABASE [AssetManagement] SET  MULTI_USER 
GO
ALTER DATABASE [AssetManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AssetManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AssetManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AssetManagement] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AssetManagement] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AssetManagement] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'AssetManagement', N'ON'
GO
ALTER DATABASE [AssetManagement] SET QUERY_STORE = OFF
GO
USE [AssetManagement]
GO
/****** Object:  Table [dbo].[Asset]    Script Date: 24-03-2023 16:58:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Asset](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AssetName] [nchar](100) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[BrandId] [int] NOT NULL,
	[AvailableCount] [int] NOT NULL,
	[TotalCount] [int] NOT NULL,
	[WarrentyEndDate] [datetime] NULL,
	[CreatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_Asset] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AssetUserMapping]    Script Date: 24-03-2023 16:58:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssetUserMapping](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[AssetId] [int] NOT NULL,
 CONSTRAINT [PK_AssetUserMapping] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 24-03-2023 16:58:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brand](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](25) NOT NULL,
 CONSTRAINT [PK_Brand] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 24-03-2023 16:58:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](25) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 24-03-2023 16:58:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nchar](50) NOT NULL,
	[LastName] [nchar](50) NOT NULL,
	[Email] [nchar](255) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Asset] ON 

INSERT [dbo].[Asset] ([Id], [AssetName], [CategoryId], [BrandId], [AvailableCount], [TotalCount], [WarrentyEndDate], [CreatedOn]) VALUES (1, N'XPS Laptop                                                                                          ', 1, 1, 20, 72, CAST(N'2025-01-01T00:00:00.000' AS DateTime), CAST(N'2023-01-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Asset] ([Id], [AssetName], [CategoryId], [BrandId], [AvailableCount], [TotalCount], [WarrentyEndDate], [CreatedOn]) VALUES (2, N'Lattitude                                                                                           ', 1, 1, 12, 32, CAST(N'2025-03-03T00:00:00.000' AS DateTime), CAST(N'2022-03-03T00:00:00.000' AS DateTime))
INSERT [dbo].[Asset] ([Id], [AssetName], [CategoryId], [BrandId], [AvailableCount], [TotalCount], [WarrentyEndDate], [CreatedOn]) VALUES (3, N'Mouse                                                                                               ', 1, 1, 30, 47, CAST(N'2025-03-03T00:00:00.000' AS DateTime), CAST(N'2021-03-03T00:00:00.000' AS DateTime))
INSERT [dbo].[Asset] ([Id], [AssetName], [CategoryId], [BrandId], [AvailableCount], [TotalCount], [WarrentyEndDate], [CreatedOn]) VALUES (4, N'Laptop Bag                                                                                          ', 2, 1, 5, 10, CAST(N'2025-03-03T00:00:00.000' AS DateTime), CAST(N'2020-03-03T00:00:00.000' AS DateTime))
INSERT [dbo].[Asset] ([Id], [AssetName], [CategoryId], [BrandId], [AvailableCount], [TotalCount], [WarrentyEndDate], [CreatedOn]) VALUES (5, N'Wired Headphone                                                                                     ', 1, 1, 10, 20, CAST(N'2025-03-09T00:00:00.000' AS DateTime), CAST(N'2022-10-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Asset] ([Id], [AssetName], [CategoryId], [BrandId], [AvailableCount], [TotalCount], [WarrentyEndDate], [CreatedOn]) VALUES (8, N'headset                                                                                             ', 2, 1, 199, 199, CAST(N'2023-01-05T00:00:00.000' AS DateTime), CAST(N'2023-01-05T00:00:00.000' AS DateTime))
INSERT [dbo].[Asset] ([Id], [AssetName], [CategoryId], [BrandId], [AvailableCount], [TotalCount], [WarrentyEndDate], [CreatedOn]) VALUES (10, N'fgfd                                                                                                ', 1, 1, 43, 45, CAST(N'2023-01-11T00:00:00.000' AS DateTime), CAST(N'2023-01-03T15:22:22.363' AS DateTime))
INSERT [dbo].[Asset] ([Id], [AssetName], [CategoryId], [BrandId], [AvailableCount], [TotalCount], [WarrentyEndDate], [CreatedOn]) VALUES (11, N'fgfd                                                                                                ', 1, 1, 43, 52, CAST(N'2023-01-11T00:00:00.000' AS DateTime), CAST(N'2023-01-03T15:23:05.077' AS DateTime))
INSERT [dbo].[Asset] ([Id], [AssetName], [CategoryId], [BrandId], [AvailableCount], [TotalCount], [WarrentyEndDate], [CreatedOn]) VALUES (15, N're                                                                                                  ', 1, 1, 2, 3, CAST(N'2023-01-05T00:00:00.000' AS DateTime), CAST(N'2023-01-05T00:00:00.000' AS DateTime))
INSERT [dbo].[Asset] ([Id], [AssetName], [CategoryId], [BrandId], [AvailableCount], [TotalCount], [WarrentyEndDate], [CreatedOn]) VALUES (17, N'ree                                                                                                 ', 2, 1, 21, 34, CAST(N'2023-01-12T00:00:00.000' AS DateTime), CAST(N'2023-01-05T14:01:07.383' AS DateTime))
INSERT [dbo].[Asset] ([Id], [AssetName], [CategoryId], [BrandId], [AvailableCount], [TotalCount], [WarrentyEndDate], [CreatedOn]) VALUES (18, N'yu4                                                                                                 ', 2, 1, 32, 33, CAST(N'2023-01-07T00:00:00.000' AS DateTime), CAST(N'2023-01-05T14:01:49.823' AS DateTime))
SET IDENTITY_INSERT [dbo].[Asset] OFF
GO
SET IDENTITY_INSERT [dbo].[AssetUserMapping] ON 

INSERT [dbo].[AssetUserMapping] ([Id], [UserId], [AssetId]) VALUES (1, 1, 1)
INSERT [dbo].[AssetUserMapping] ([Id], [UserId], [AssetId]) VALUES (2, 2, 2)
INSERT [dbo].[AssetUserMapping] ([Id], [UserId], [AssetId]) VALUES (3, 1, 2)
INSERT [dbo].[AssetUserMapping] ([Id], [UserId], [AssetId]) VALUES (4, 2, 1)
INSERT [dbo].[AssetUserMapping] ([Id], [UserId], [AssetId]) VALUES (5, 3, 4)
INSERT [dbo].[AssetUserMapping] ([Id], [UserId], [AssetId]) VALUES (6, 1, 11)
INSERT [dbo].[AssetUserMapping] ([Id], [UserId], [AssetId]) VALUES (37, 2, 4)
INSERT [dbo].[AssetUserMapping] ([Id], [UserId], [AssetId]) VALUES (38, 4, 1)
INSERT [dbo].[AssetUserMapping] ([Id], [UserId], [AssetId]) VALUES (39, 5, 1)
INSERT [dbo].[AssetUserMapping] ([Id], [UserId], [AssetId]) VALUES (40, 4, 10)
INSERT [dbo].[AssetUserMapping] ([Id], [UserId], [AssetId]) VALUES (41, 1, 10)
INSERT [dbo].[AssetUserMapping] ([Id], [UserId], [AssetId]) VALUES (42, 2, 10)
INSERT [dbo].[AssetUserMapping] ([Id], [UserId], [AssetId]) VALUES (43, 3, 10)
INSERT [dbo].[AssetUserMapping] ([Id], [UserId], [AssetId]) VALUES (44, 5, 10)
INSERT [dbo].[AssetUserMapping] ([Id], [UserId], [AssetId]) VALUES (45, 2, 3)
INSERT [dbo].[AssetUserMapping] ([Id], [UserId], [AssetId]) VALUES (46, 2, 8)
INSERT [dbo].[AssetUserMapping] ([Id], [UserId], [AssetId]) VALUES (47, 3, 2)
INSERT [dbo].[AssetUserMapping] ([Id], [UserId], [AssetId]) VALUES (48, 4, 2)
INSERT [dbo].[AssetUserMapping] ([Id], [UserId], [AssetId]) VALUES (49, 5, 2)
INSERT [dbo].[AssetUserMapping] ([Id], [UserId], [AssetId]) VALUES (50, 3, 1)
INSERT [dbo].[AssetUserMapping] ([Id], [UserId], [AssetId]) VALUES (51, 6, 2)
INSERT [dbo].[AssetUserMapping] ([Id], [UserId], [AssetId]) VALUES (52, 6, 1)
SET IDENTITY_INSERT [dbo].[AssetUserMapping] OFF
GO
SET IDENTITY_INSERT [dbo].[Brand] ON 

INSERT [dbo].[Brand] ([Id], [Name]) VALUES (1, N'Dell                     ')
INSERT [dbo].[Brand] ([Id], [Name]) VALUES (2, N'Apple                    ')
INSERT [dbo].[Brand] ([Id], [Name]) VALUES (3, N'Boult                    ')
INSERT [dbo].[Brand] ([Id], [Name]) VALUES (4, N'Samsung                  ')
SET IDENTITY_INSERT [dbo].[Brand] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [Name]) VALUES (1, N'Electronics              ')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (2, N'Stationary               ')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email]) VALUES (1, N'John                                              ', N'Doe                                               ', N'johndoe@jnmail.com                                                                                                                                                                                                                                             ')
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email]) VALUES (2, N'Avi                                               ', N'Don                                               ', N'avindon@avmail.com                                                                                                                                                                                                                                             ')
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email]) VALUES (3, N'Jane                                              ', N'Maro                                              ', N'jane@maro.com                                                                                                                                                                                                                                                  ')
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email]) VALUES (4, N'Klen                                              ', N'Nerrn                                             ', N'klen@nerrn.com                                                                                                                                                                                                                                                 ')
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email]) VALUES (5, N'Louis                                             ', N'Philpe                                            ', N'lp@louis.con                                                                                                                                                                                                                                                   ')
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email]) VALUES (6, N'Mac                                               ', N'Manil                                             ', N'mac@manil.con                                                                                                                                                                                                                                                  ')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Asset]  WITH CHECK ADD  CONSTRAINT [FK_Asset_BrandId_Brand_Id] FOREIGN KEY([BrandId])
REFERENCES [dbo].[Brand] ([Id])
GO
ALTER TABLE [dbo].[Asset] CHECK CONSTRAINT [FK_Asset_BrandId_Brand_Id]
GO
ALTER TABLE [dbo].[Asset]  WITH NOCHECK ADD  CONSTRAINT [FK_Asset_CategoryId_Category_Id] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Asset] CHECK CONSTRAINT [FK_Asset_CategoryId_Category_Id]
GO
ALTER TABLE [dbo].[AssetUserMapping]  WITH CHECK ADD  CONSTRAINT [FK_AssetUserMapping_AssetId_Asset_Id] FOREIGN KEY([AssetId])
REFERENCES [dbo].[Asset] ([Id])
GO
ALTER TABLE [dbo].[AssetUserMapping] CHECK CONSTRAINT [FK_AssetUserMapping_AssetId_Asset_Id]
GO
ALTER TABLE [dbo].[AssetUserMapping]  WITH CHECK ADD  CONSTRAINT [FK_AssetUserMapping_UserId_User_Id] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[AssetUserMapping] CHECK CONSTRAINT [FK_AssetUserMapping_UserId_User_Id]
GO
USE [master]
GO
ALTER DATABASE [AssetManagement] SET  READ_WRITE 
GO
