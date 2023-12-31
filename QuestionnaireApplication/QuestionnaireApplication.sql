USE [master]
GO
/****** Object:  Database [QuestionnaireApplication]    Script Date: 24-03-2023 17:18:59 ******/
CREATE DATABASE [QuestionnaireApplication]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QuestionnaireApplication', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\QuestionnaireApplication.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QuestionnaireApplication_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\QuestionnaireApplication_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [QuestionnaireApplication] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuestionnaireApplication].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuestionnaireApplication] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuestionnaireApplication] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuestionnaireApplication] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuestionnaireApplication] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuestionnaireApplication] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuestionnaireApplication] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QuestionnaireApplication] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuestionnaireApplication] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuestionnaireApplication] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuestionnaireApplication] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuestionnaireApplication] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuestionnaireApplication] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuestionnaireApplication] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuestionnaireApplication] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuestionnaireApplication] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QuestionnaireApplication] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuestionnaireApplication] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuestionnaireApplication] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuestionnaireApplication] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuestionnaireApplication] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuestionnaireApplication] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuestionnaireApplication] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuestionnaireApplication] SET RECOVERY FULL 
GO
ALTER DATABASE [QuestionnaireApplication] SET  MULTI_USER 
GO
ALTER DATABASE [QuestionnaireApplication] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuestionnaireApplication] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuestionnaireApplication] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuestionnaireApplication] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QuestionnaireApplication] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QuestionnaireApplication] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'QuestionnaireApplication', N'ON'
GO
ALTER DATABASE [QuestionnaireApplication] SET QUERY_STORE = OFF
GO
USE [QuestionnaireApplication]
GO
/****** Object:  Table [dbo].[AnswerDetail]    Script Date: 24-03-2023 17:18:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AnswerDetail](
	[AnswerId] [int] IDENTITY(1,1) NOT NULL,
	[UserAnswer] [varchar](200) NULL,
	[QuestionId] [int] NULL,
	[UserId] [int] NULL,
	[Mark] [int] NULL,
	[Time] [time](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[AnswerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Question]    Script Date: 24-03-2023 17:18:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question](
	[QuestionId] [int] IDENTITY(1,1) NOT NULL,
	[QuestionText] [varchar](250) NULL,
	[AnswerText] [varchar](250) NULL,
	[Option1] [varchar](250) NULL,
	[Option2] [varchar](50) NULL,
	[Option3] [varchar](250) NULL,
	[Option4] [varchar](250) NULL,
 CONSTRAINT [PK_Question] PRIMARY KEY CLUSTERED 
(
	[QuestionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ResultDetail]    Script Date: 24-03-2023 17:18:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ResultDetail](
	[ResultId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[Score] [int] NULL,
	[TimeTaken] [time](7) NULL,
 CONSTRAINT [PK_ResultDetail] PRIMARY KEY CLUSTERED 
(
	[ResultId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserDetail]    Script Date: 24-03-2023 17:18:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserDetail](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Role] [varchar](50) NOT NULL,
 CONSTRAINT [PK_UserDetail] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AnswerDetail] ON 

INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (11, N'a', 4, 4, NULL, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (12, N'a', 5, 4, NULL, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (13, N'b', 3, 4, NULL, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (14, N'b', 2, 4, NULL, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (15, N'd', 1, 4, NULL, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (16, N'b', 3, 5, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (17, N'b', 2, 5, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (18, N'a', 5, 5, 10, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (19, N'b', 1, 5, 10, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (20, N'b', 4, 5, 10, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (21, N'c', 3, 8, 10, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (22, N'c', 4, 8, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (23, N'b', 1, 8, 10, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (24, N'd', 2, 8, 10, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (25, N'a', 5, 8, 10, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (26, N'b', 3, 10, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (27, N'b', 4, 10, 10, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (28, N'b', 1, 10, 10, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (29, N'd', 2, 10, 10, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (30, N'a', 5, 10, 10, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (31, N'b', 1, 11, 10, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (32, N'b', 3, 11, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (33, N'b', 4, 11, 10, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (34, N'a', 5, 11, 10, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (35, N'd', 2, 11, 10, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (36, NULL, 5, 13, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (37, NULL, 2, 13, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (38, NULL, 1, 13, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (39, NULL, 3, 13, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (40, NULL, 4, 13, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (52, NULL, 3, 15, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (53, NULL, 2, 15, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (54, NULL, 5, 15, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (55, NULL, 4, 15, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (56, NULL, 1, 15, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (57, NULL, 2, 16, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (58, NULL, 1, 16, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (82, NULL, 2, 18, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (83, NULL, 1, 18, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (84, N'b', 4, 18, 10, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (85, N'c', 5, 18, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (86, N'c', 3, 18, 10, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (87, N'd', 4, 20, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (88, N'd', 2, 20, 10, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (89, NULL, 5, 20, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (90, N'c', 3, 20, 10, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (91, N'b', 1, 20, 10, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (92, NULL, 3, 21, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (93, NULL, 4, 21, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (94, N'a', 5, 21, 10, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (95, NULL, 1, 21, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (96, N'c', 2, 21, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (97, NULL, 1, 3, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (98, NULL, 3, 3, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (99, N'b', 4, 3, 10, CAST(N'00:00:04' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (100, N'b', 4, 3, 10, CAST(N'00:00:04' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (101, N'b', 4, 3, 10, CAST(N'00:00:04' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (102, N'b', 4, 3, 10, CAST(N'00:00:04' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (103, N'b', 4, 3, 10, CAST(N'00:00:04' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (104, N'b', 4, 3, 10, CAST(N'00:00:04' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (105, N'b', 4, 3, 10, CAST(N'00:00:04' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (106, N'a', 5, 3, 10, CAST(N'00:00:04' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (107, NULL, 2, 3, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (108, NULL, 3, 23, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (109, N'a', 5, 23, 10, CAST(N'00:00:04' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (110, N'b', 4, 23, 10, CAST(N'00:00:06' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (111, N'c', 1, 23, 0, CAST(N'00:08:06' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (112, N'd', 2, 23, 10, CAST(N'00:02:01' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (113, NULL, 5, 22, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (114, NULL, 4, 22, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (115, NULL, 1, 22, 0, CAST(N'00:00:08' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (116, N'b', 1, 25, 10, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (117, N'd', 4, 25, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (118, NULL, 2, 25, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (119, N'a', 5, 25, 10, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (120, N'c', 3, 25, 10, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (121, NULL, 3, 26, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (122, N'b', 1, 26, 10, CAST(N'00:00:57' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (123, N'c', 2, 26, 0, CAST(N'00:00:58' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (124, N'b', 4, 26, 10, CAST(N'00:00:57' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (125, N'a', 5, 26, 10, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (126, N'a', 5, 27, 10, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (127, N'a', 5, 27, 10, CAST(N'00:00:59' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (128, N'c', 3, 27, 10, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (129, N'c', 3, 27, 10, CAST(N'00:00:59' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (130, NULL, 2, 27, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (131, NULL, 3, 1, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (132, N'd', 2, 1, 10, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (133, N'b', 4, 1, 10, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (134, N'a', 5, 1, 10, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (135, N'b', 1, 1, 10, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (136, NULL, 3, 28, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (137, N'a', 5, 28, 10, CAST(N'00:00:57' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (138, NULL, 1, 28, 0, CAST(N'00:00:56' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (139, N'b', 4, 28, 10, CAST(N'00:00:58' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (140, N'b', 4, 28, 10, CAST(N'00:00:58' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (141, NULL, 4, 29, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (142, N'c', 3, 29, 10, CAST(N'00:00:58' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (143, N'b', 1, 29, 10, CAST(N'00:00:56' AS Time))
GO
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (144, N'a', 5, 29, 10, CAST(N'00:00:56' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (145, N'd', 2, 29, 10, CAST(N'00:00:56' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (146, NULL, 5, 30, 0, CAST(N'00:00:56' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (147, NULL, 1, 30, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (148, NULL, 3, 30, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (149, NULL, 4, 30, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (150, NULL, 2, 30, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (151, NULL, 5, 31, 0, CAST(N'00:00:56' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (152, NULL, 3, 31, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (153, NULL, 1, 31, 0, CAST(N'00:00:55' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (154, NULL, 2, 31, 0, CAST(N'00:00:57' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (155, NULL, 4, 31, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (156, N'b', 4, 33, 10, CAST(N'00:00:57' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (157, NULL, 5, 33, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (158, NULL, 1, 33, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (159, NULL, 2, 33, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (160, NULL, 3, 33, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (161, N'd', 2, 32, 10, CAST(N'00:00:57' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (162, NULL, 3, 32, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (163, N'b', 1, 32, 10, CAST(N'00:00:56' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (164, NULL, 5, 32, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (165, NULL, 4, 32, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (166, N'd', 2, 34, 10, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (167, NULL, 1, 34, 0, CAST(N'00:00:56' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (168, N'b', 5, 34, 0, CAST(N'00:00:57' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (169, NULL, 3, 34, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (170, N'd', 4, 34, 0, CAST(N'00:00:56' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (171, NULL, 4, 35, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (172, NULL, 2, 35, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (173, NULL, 5, 35, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (174, NULL, 1, 35, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (175, NULL, 3, 35, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (176, NULL, 3, 36, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (177, NULL, 4, 36, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (178, NULL, 2, 37, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (179, NULL, 2, 38, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (180, N'b', 4, 38, 10, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (181, N'd', 3, 38, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (182, N'b', 1, 38, 10, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (183, N'a', 5, 38, 10, CAST(N'00:00:57' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (184, N'a', 5, 38, 10, CAST(N'00:00:57' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (185, N'b', 1, 38, 10, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (186, N'd', 3, 38, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (187, N'b', 4, 38, 10, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (188, NULL, 3, 39, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (189, NULL, 1, 39, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (190, NULL, 5, 39, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (191, NULL, 4, 39, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (192, NULL, 2, 39, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (193, NULL, 4, 40, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (194, NULL, 3, 40, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (195, NULL, 2, 40, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (196, NULL, 5, 40, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (197, NULL, 1, 40, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (198, NULL, 5, 41, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (199, NULL, 3, 41, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (200, NULL, 2, 41, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (201, NULL, 4, 41, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (202, NULL, 1, 41, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (203, N'b', 1, 41, 10, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (204, N'b', 1, 41, 10, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (205, N'b', 1, 41, 10, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (206, N'b', 1, 41, 10, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (207, N'a', 5, 42, 10, CAST(N'00:00:58' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (208, NULL, 3, 42, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (209, N'b', 4, 42, 10, CAST(N'00:00:57' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (210, N'd', 1, 42, 0, CAST(N'00:00:57' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (211, N'c', 2, 42, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (212, N'c', 2, 42, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (213, N'd', 1, 42, 0, CAST(N'00:00:57' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (214, N'b', 4, 42, 10, CAST(N'00:00:57' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (215, N'a', 5, 42, 10, CAST(N'00:00:58' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (216, N'a', 5, 42, 10, CAST(N'00:00:58' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (217, N'a', 5, 43, 10, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (218, NULL, 2, 43, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (219, NULL, 4, 43, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (220, N'b', 1, 43, 10, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (221, NULL, 3, 43, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (222, N'a', 5, 44, 10, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (223, N'c', 3, 44, 10, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (224, N'b', 1, 44, 10, CAST(N'00:00:56' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (225, N'b', 4, 44, 10, CAST(N'00:00:56' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (226, N'd', 2, 44, 10, CAST(N'00:00:57' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (227, N'd', 2, 45, 10, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (228, N'b', 4, 45, 10, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (229, N'c', 3, 45, 10, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (230, N'b', 1, 45, 10, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (231, N'a', 5, 45, 10, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (232, N'c', 3, 46, 10, CAST(N'00:00:59' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (233, N'a', 5, 46, 10, CAST(N'00:00:59' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (234, N'b', 4, 46, 10, CAST(N'00:00:59' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (235, N'd', 2, 46, 10, CAST(N'00:00:59' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (236, N'b', 1, 46, 10, CAST(N'00:00:59' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (237, N'd', 2, 47, 10, CAST(N'00:00:59' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (238, N'b', 4, 47, 10, CAST(N'00:00:59' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (239, N'c', 3, 47, 10, CAST(N'00:00:59' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (240, NULL, 1, 47, 0, CAST(N'00:00:59' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (241, NULL, 5, 47, 0, CAST(N'00:00:59' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (242, N'd', 2, 48, 10, CAST(N'00:00:08' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (243, N'a', 5, 48, 10, CAST(N'00:00:10' AS Time))
GO
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (244, N'c', 1, 48, 0, CAST(N'00:00:03' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (245, N'b', 4, 48, 10, CAST(N'00:00:15' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (246, N'c', 3, 48, 10, CAST(N'00:00:05' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (247, NULL, 3, 49, 0, CAST(N'00:00:09' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (248, N'a', 5, 49, 10, CAST(N'00:00:04' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (249, N'c', 4, 49, 0, CAST(N'00:00:03' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (250, N'b', 1, 49, 10, CAST(N'00:00:04' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (251, N'd', 2, 49, 10, CAST(N'00:00:04' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (252, NULL, 2, 50, 0, CAST(N'00:00:59' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (253, N'a', 5, 50, 10, CAST(N'00:00:08' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (254, N'c', 3, 50, 10, CAST(N'00:00:11' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (255, N'b', 1, 50, 10, CAST(N'00:00:04' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (256, N'b', 4, 50, 10, CAST(N'00:00:06' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (257, NULL, 1, 51, 0, CAST(N'00:00:59' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (258, N'd', 2, 52, 10, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (259, N'c', 3, 52, 10, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (260, N'b', 4, 52, 10, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (261, N'a', 5, 52, 10, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (262, N'b', 1, 52, 10, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (263, NULL, 4, 52, 0, CAST(N'00:00:59' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (264, N'a', 5, 53, 10, CAST(N'00:00:03' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (265, N'b', 1, 53, 10, CAST(N'00:00:12' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (266, N'c', 4, 53, 0, CAST(N'00:00:05' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (267, N'c', 3, 53, 10, CAST(N'00:00:03' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (268, N'd', 2, 53, 10, CAST(N'00:00:05' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (269, N'd', 2, 53, 10, CAST(N'00:00:59' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (270, NULL, 4, 54, 0, CAST(N'00:00:59' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (271, NULL, 4, 54, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (272, NULL, 2, 54, 0, CAST(N'00:00:59' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (273, NULL, 2, 54, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (275, NULL, 5, 54, 0, CAST(N'00:00:59' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (276, N'd', 2, 55, 10, CAST(N'00:00:34' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (277, N'b', 4, 55, 10, CAST(N'00:00:03' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (278, N'a', 5, 55, 10, CAST(N'00:00:03' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (279, N'c', 1, 55, 0, CAST(N'00:00:03' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (280, N'c', 3, 55, 10, CAST(N'00:00:03' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (281, N'b', 4, 56, 10, CAST(N'00:00:21' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (282, NULL, 3, 56, 0, CAST(N'00:00:59' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (283, N'b', 1, 56, 10, CAST(N'00:00:22' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (284, N'a', 5, 56, 10, CAST(N'00:00:03' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (285, N'd', 2, 56, 10, CAST(N'00:00:06' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (286, N'b', 1, 57, 10, CAST(N'00:00:04' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (287, N'd', 4, 57, 0, CAST(N'00:00:04' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (288, N'c', 3, 57, 10, CAST(N'00:00:04' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (289, N'c', 2, 57, 0, CAST(N'00:00:04' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (290, N'b', 5, 57, 0, CAST(N'00:00:03' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (291, N'b', 1, 58, 10, CAST(N'00:00:04' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (292, N'a', 5, 58, 10, CAST(N'00:00:04' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (293, N'c', 3, 58, 10, CAST(N'00:00:04' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (294, N'd', 2, 58, 10, CAST(N'00:00:04' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (295, N'c', 4, 58, 0, CAST(N'00:00:12' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (296, N'b', 1, 59, 10, CAST(N'00:00:09' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (297, N'a', 5, 59, 10, CAST(N'00:00:03' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (298, N'c', 4, 59, 0, CAST(N'00:00:04' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (299, N'd', 2, 59, 10, CAST(N'00:00:03' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (300, N'c', 3, 59, 10, CAST(N'00:00:12' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (301, N'a', 5, 60, 10, CAST(N'00:00:28' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (302, N'b', 1, 60, 10, CAST(N'00:00:04' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (303, N'b', 4, 60, 10, CAST(N'00:00:03' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (304, N'c', 3, 60, 10, CAST(N'00:00:03' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (305, N'd', 2, 60, 10, CAST(N'00:00:04' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (306, N'b', 4, 61, 10, CAST(N'00:00:15' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (307, N'c', 3, 61, 10, CAST(N'00:00:04' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (308, N'b', 5, 61, 0, CAST(N'00:00:03' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (309, N'd', 2, 61, 10, CAST(N'00:00:08' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (310, N'b', 1, 61, 10, CAST(N'00:00:04' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (311, NULL, 3, 63, 0, CAST(N'00:00:11' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (312, NULL, 1, 63, 0, CAST(N'00:00:11' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (313, NULL, 4, 63, 0, CAST(N'00:00:11' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (314, NULL, 5, 63, 0, CAST(N'00:00:11' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (315, NULL, 2, 63, 0, CAST(N'00:00:11' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (316, NULL, 1, 64, 0, CAST(N'00:00:11' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (317, NULL, 3, 64, 0, CAST(N'00:00:11' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (318, NULL, 4, 64, 0, CAST(N'00:00:11' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (319, NULL, 2, 64, 0, CAST(N'00:00:11' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (320, NULL, 5, 64, 0, CAST(N'00:00:11' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (321, NULL, 4, 65, 0, CAST(N'00:00:59' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (322, N'c', 3, 65, 10, CAST(N'00:00:10' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (323, NULL, 5, 65, 0, CAST(N'00:00:11' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (324, NULL, 1, 65, 0, CAST(N'00:00:11' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (325, NULL, 2, 65, 0, CAST(N'00:00:11' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (326, NULL, 3, 66, 0, CAST(N'00:00:59' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (327, NULL, 2, 66, 0, CAST(N'00:00:11' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (328, NULL, 4, 66, 0, CAST(N'00:00:59' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (329, NULL, 4, 68, 0, CAST(N'00:00:06' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (330, NULL, 4, 69, 0, CAST(N'00:00:33' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (331, NULL, 5, 69, 0, CAST(N'00:00:39' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (332, NULL, 3, 69, 0, CAST(N'00:00:51' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (333, NULL, 1, 69, 0, CAST(N'00:00:55' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (334, NULL, 2, 69, 0, CAST(N'00:00:55' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (335, NULL, 2, 71, 0, CAST(N'00:00:55' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (336, NULL, 3, 71, 0, CAST(N'00:00:55' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (337, NULL, 5, 71, 0, CAST(N'00:00:55' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (338, NULL, 4, 71, 0, CAST(N'00:00:55' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (339, NULL, 1, 71, 0, CAST(N'00:00:55' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (340, NULL, 5, 72, 0, CAST(N'00:00:59' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (341, NULL, 4, 73, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (342, NULL, 2, 73, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (343, NULL, 5, 73, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (344, NULL, 3, 73, 0, NULL)
GO
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (345, NULL, 1, 73, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (346, N'b', 4, 77, 10, CAST(N'00:00:07' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (347, N'd', 2, 77, 10, CAST(N'00:00:05' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (348, N'c', 3, 77, 10, CAST(N'00:00:14' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (349, NULL, 5, 77, 0, CAST(N'00:00:24' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (350, NULL, 1, 77, 0, CAST(N'00:00:11' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (351, NULL, 1, 78, 0, CAST(N'00:00:07' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (352, NULL, 3, 78, 0, CAST(N'00:00:59' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (353, NULL, 2, 78, 0, CAST(N'00:00:39' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (354, NULL, 5, 78, 0, CAST(N'00:00:05' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (355, NULL, 1, 79, 0, CAST(N'00:00:04' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (356, NULL, 5, 79, 0, CAST(N'00:00:59' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (357, NULL, 4, 78, 0, CAST(N'00:00:06' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (358, NULL, 4, 80, 0, CAST(N'00:00:04' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (359, NULL, 2, 80, 0, CAST(N'00:00:05' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (360, NULL, 3, 80, 0, CAST(N'00:00:06' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (361, NULL, 5, 80, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (362, NULL, 1, 80, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (363, NULL, 2, 81, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (364, NULL, 5, 81, 0, CAST(N'00:00:05' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (365, NULL, 1, 81, 0, CAST(N'00:00:59' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (366, NULL, 1, 81, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (367, NULL, 1, 81, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (368, NULL, 1, 81, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (369, NULL, 1, 81, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (370, NULL, 1, 81, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (371, NULL, 1, 81, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (372, NULL, 1, 81, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (373, NULL, 1, 81, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (374, NULL, 1, 81, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (375, NULL, 1, 81, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (376, NULL, 1, 81, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (377, NULL, 1, 81, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (378, NULL, 1, 81, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (379, NULL, 1, 81, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (380, NULL, 1, 81, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (381, NULL, 1, 81, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (382, NULL, 1, 81, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (383, NULL, 1, 81, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (384, NULL, 1, 81, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (385, NULL, 1, 81, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (386, NULL, 1, 81, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (387, NULL, 1, 81, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (388, NULL, 1, 81, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (389, NULL, 1, 81, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (390, NULL, 1, 81, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (391, NULL, 1, 81, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (392, NULL, 1, 81, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (393, NULL, 1, 81, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (394, NULL, 1, 81, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (395, NULL, 1, 81, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (396, NULL, 1, 81, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (397, NULL, 1, 81, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (398, NULL, 1, 81, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (399, NULL, 1, 81, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (400, NULL, 1, 81, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (401, NULL, 1, 81, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (402, NULL, 1, 81, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (403, NULL, 1, 81, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (404, NULL, 1, 81, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (405, NULL, 1, 81, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (406, NULL, 1, 81, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (407, NULL, 1, 81, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (408, NULL, 1, 81, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (409, NULL, 1, 81, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (410, NULL, 1, 81, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (411, NULL, 1, 81, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (412, NULL, 1, 81, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (413, NULL, 1, 81, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (414, NULL, 1, 81, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (415, NULL, 1, 81, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (416, NULL, 1, 81, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (417, NULL, 1, 81, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (418, NULL, 1, 81, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (419, NULL, 1, 81, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (420, NULL, 1, 81, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (421, NULL, 1, 81, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (422, NULL, 1, 81, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (423, NULL, 1, 81, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (424, NULL, 1, 81, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (425, NULL, 1, 81, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (426, NULL, 1, 81, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (427, NULL, 1, 81, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (428, NULL, 1, 81, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (429, NULL, 1, 81, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (430, NULL, 1, 81, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (431, NULL, 1, 81, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (432, NULL, 1, 81, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (433, NULL, 1, 81, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (434, NULL, 1, 81, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (435, NULL, 1, 81, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (436, NULL, 1, 81, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (437, NULL, 1, 81, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (438, NULL, 1, 81, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (439, NULL, 1, 81, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (440, NULL, 1, 81, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (441, NULL, 1, 81, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (442, NULL, 1, 81, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (443, NULL, 1, 81, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (444, NULL, 1, 81, 0, NULL)
GO
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (445, NULL, 1, 81, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (446, NULL, 1, 81, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (447, NULL, 1, 81, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (448, NULL, 1, 81, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (449, NULL, 1, 81, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (450, NULL, 1, 81, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (451, NULL, 1, 81, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (452, NULL, 1, 81, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (453, NULL, 1, 81, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (454, NULL, 1, 81, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (455, NULL, 1, 81, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (456, NULL, 1, 81, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (457, NULL, 1, 81, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (458, NULL, 1, 81, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (459, NULL, 1, 81, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (460, NULL, 1, 81, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (461, NULL, 1, 81, 0, NULL)
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (463, NULL, 3, 81, 0, CAST(N'00:00:04' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (464, NULL, 3, 81, 0, CAST(N'00:00:59' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (465, NULL, 4, 81, 0, CAST(N'00:00:22' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (466, NULL, 1, 84, 0, CAST(N'00:00:09' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (467, NULL, 2, 84, 0, CAST(N'00:00:05' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (468, NULL, 5, 84, 0, CAST(N'00:00:59' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (556, N'c', 3, 86, 10, CAST(N'00:00:09' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (557, N'a', 5, 86, 10, CAST(N'00:00:37' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (558, N'd', 2, 86, 10, CAST(N'00:00:03' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (559, N'b', 4, 86, 10, CAST(N'00:00:03' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (560, N'b', 1, 86, 10, CAST(N'00:00:02' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (561, N'a', 5, 87, 10, CAST(N'00:00:07' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (562, N'b', 4, 87, 10, CAST(N'00:00:15' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (563, N'd', 2, 87, 10, CAST(N'00:00:20' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (564, N'b', 1, 87, 10, CAST(N'00:00:06' AS Time))
INSERT [dbo].[AnswerDetail] ([AnswerId], [UserAnswer], [QuestionId], [UserId], [Mark], [Time]) VALUES (565, N'c', 3, 87, 10, CAST(N'00:00:03' AS Time))
SET IDENTITY_INSERT [dbo].[AnswerDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Question] ON 

INSERT [dbo].[Question] ([QuestionId], [QuestionText], [AnswerText], [Option1], [Option2], [Option3], [Option4]) VALUES (1, N'JavaScript written under which of the following tag?', N'b', N'<JavaScript></JavaScript>', N'<script></script>', N'<code></code>', N'<head></head>')
INSERT [dbo].[Question] ([QuestionId], [QuestionText], [AnswerText], [Option1], [Option2], [Option3], [Option4]) VALUES (2, N'A variable in JavaScript declared with which of the following keyword?', N'd', N'new', N'int', N'string', N'var')
INSERT [dbo].[Question] ([QuestionId], [QuestionText], [AnswerText], [Option1], [Option2], [Option3], [Option4]) VALUES (3, N'Which of the following is NOT a JavaScript object?', N'c', N'var obj = {};', N'var obj = { name: "Steve"};', N'var obj = { name = "Steve"};', N'var obj = new Object();')
INSERT [dbo].[Question] ([QuestionId], [QuestionText], [AnswerText], [Option1], [Option2], [Option3], [Option4]) VALUES (4, N'Which of the following is a valid JavaScript function?', N'b', N'var myFunc = function myFunc{ }; ', N'function myFunc(){ }; ', N'myFunc function(){ }; ', N'function myFunc = { }; ')
INSERT [dbo].[Question] ([QuestionId], [QuestionText], [AnswerText], [Option1], [Option2], [Option3], [Option4]) VALUES (5, N'What will 1 == "1" return?', N'a', N'True', N'False', N'0', N'1')
SET IDENTITY_INSERT [dbo].[Question] OFF
GO
SET IDENTITY_INSERT [dbo].[ResultDetail] ON 

INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (1, 1, 50, CAST(N'00:05:00' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (2, 10, 40, NULL)
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (3, 11, 40, NULL)
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (4, 8, 40, NULL)
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (5, 1, NULL, NULL)
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (6, 1, NULL, NULL)
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (7, 1, NULL, NULL)
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (8, 13, 0, NULL)
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (9, 1, 50, NULL)
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (10, 3, 50, NULL)
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (11, 15, 0, NULL)
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (12, 18, 40, NULL)
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (13, 18, 10, NULL)
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (14, 18, 10, NULL)
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (15, 18, 10, NULL)
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (16, 1, 0, NULL)
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (17, 18, 20, NULL)
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (18, 18, 20, NULL)
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (19, 20, 30, NULL)
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (20, 10, 40, NULL)
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (21, 21, 10, NULL)
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (22, 18, 20, NULL)
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (23, 23, 30, NULL)
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (24, 23, 30, NULL)
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (25, 25, 30, NULL)
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (26, 26, 30, NULL)
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (27, 23, 30, CAST(N'00:10:17' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (28, 23, 30, CAST(N'00:10:17' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (29, 23, 30, CAST(N'00:10:17' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (30, 27, 40, CAST(N'00:00:00' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (31, 27, 40, CAST(N'00:00:00' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (32, 23, 30, CAST(N'00:10:17' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (33, 27, 40, CAST(N'00:00:00' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (34, 18, 20, CAST(N'00:00:00' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (35, 27, 40, CAST(N'00:00:00' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (36, 1, 40, CAST(N'00:00:00' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (37, 28, 30, CAST(N'00:02:51' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (38, 29, 40, CAST(N'00:03:46' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (39, 27, 40, CAST(N'00:00:00' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (40, 30, 0, CAST(N'00:00:56' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (41, 31, 0, CAST(N'00:02:48' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (42, 33, 10, CAST(N'00:00:57' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (43, 33, 10, CAST(N'00:00:57' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (44, 32, 20, CAST(N'00:01:53' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (45, 27, 40, CAST(N'00:00:00' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (46, 27, 40, CAST(N'00:00:00' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (47, 34, 10, CAST(N'00:02:49' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (48, 35, 0, CAST(N'00:00:00' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (49, 35, 0, CAST(N'00:00:00' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (50, 35, 0, CAST(N'00:00:00' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (51, 28, 30, CAST(N'00:02:51' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (52, 18, 20, CAST(N'00:00:00' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (53, 1, 40, CAST(N'00:00:00' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (54, 38, 30, CAST(N'00:00:57' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (55, 18, 20, CAST(N'00:00:00' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (56, 39, 0, CAST(N'00:00:00' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (57, 40, 0, CAST(N'00:00:00' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (58, 40, 0, CAST(N'00:00:00' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (59, 1, 40, CAST(N'00:00:00' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (60, 1, 40, CAST(N'00:00:00' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (61, 1, 40, CAST(N'00:00:00' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (62, 1, 40, CAST(N'00:00:00' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (63, 1, 40, CAST(N'00:00:00' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (64, 1, 40, CAST(N'00:00:00' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (65, 21, 10, CAST(N'00:00:00' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (66, 1, 40, CAST(N'00:00:00' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (67, 1, 40, CAST(N'00:00:00' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (68, 1, 40, CAST(N'00:00:00' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (69, 1, 40, CAST(N'00:00:00' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (70, 1, 40, CAST(N'00:00:00' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (71, 41, 0, CAST(N'00:00:00' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (72, 42, 20, CAST(N'00:02:52' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (73, 1, 40, CAST(N'00:00:00' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (74, 43, 20, CAST(N'00:00:00' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (75, 44, 50, CAST(N'00:02:49' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (76, 45, 50, CAST(N'00:00:00' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (77, 46, 50, CAST(N'00:04:55' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (78, 47, 30, CAST(N'00:04:55' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (79, 18, 20, CAST(N'00:00:00' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (80, 48, 40, CAST(N'00:00:41' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (81, 49, 30, CAST(N'00:00:24' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (82, 50, 40, CAST(N'00:01:28' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (83, 52, 50, CAST(N'00:00:00' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (84, 53, 40, CAST(N'00:00:28' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (85, 54, 0, CAST(N'00:02:57' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (86, 54, 0, CAST(N'00:02:57' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (87, 55, 40, CAST(N'00:00:46' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (88, 54, 0, CAST(N'00:02:57' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (89, 56, 40, CAST(N'00:01:51' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (90, 55, 40, CAST(N'00:00:46' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (91, 57, 20, CAST(N'00:00:19' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (92, 18, 20, CAST(N'00:00:00' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (93, 18, 20, CAST(N'00:00:00' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (94, 58, 40, CAST(N'00:00:28' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (95, 59, 40, CAST(N'00:00:31' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (96, 60, 50, CAST(N'00:00:42' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (97, 1, 40, CAST(N'00:00:00' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (98, 61, 40, CAST(N'00:00:34' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (99, 63, 0, CAST(N'00:00:55' AS Time))
GO
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (100, 63, 0, CAST(N'00:00:55' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (101, 64, 0, CAST(N'00:00:55' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (102, 65, 10, CAST(N'00:01:42' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (103, 1, 40, CAST(N'00:00:00' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (104, 69, 0, CAST(N'00:03:53' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (105, 71, 0, CAST(N'00:04:35' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (106, 71, 0, CAST(N'00:04:35' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (107, 18, 20, CAST(N'00:00:00' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (108, 18, 20, CAST(N'00:00:00' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (109, 73, 0, CAST(N'00:00:00' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (110, 77, 30, CAST(N'00:01:01' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (111, 1, 40, CAST(N'00:00:00' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (112, 78, 0, CAST(N'00:01:56' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (113, 78, 0, CAST(N'00:01:56' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (114, 80, 0, CAST(N'00:00:15' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (115, 80, 0, CAST(N'00:00:15' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (116, 81, 0, CAST(N'00:01:04' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (117, 18, 20, CAST(N'00:00:00' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (118, 65, 10, CAST(N'00:01:42' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (119, 85, 0, CAST(N'00:00:00' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (120, 85, 10, CAST(N'00:00:19' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (121, 85, 10, CAST(N'00:00:19' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (122, 85, 10, CAST(N'00:00:19' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (123, 86, 0, CAST(N'00:00:00' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (124, 86, 0, CAST(N'00:00:00' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (125, 86, 0, CAST(N'00:00:00' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (126, 86, 0, CAST(N'00:00:00' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (127, 86, 0, CAST(N'00:00:00' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (128, 86, 0, CAST(N'00:00:00' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (129, 86, 0, CAST(N'00:00:00' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (130, 86, 0, CAST(N'00:00:00' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (131, 86, 0, CAST(N'00:00:00' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (132, 86, 0, CAST(N'00:00:00' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (133, 86, 0, CAST(N'00:00:00' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (134, 86, 0, CAST(N'00:00:00' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (135, 86, 0, CAST(N'00:00:00' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (136, 86, 0, CAST(N'00:00:00' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (137, 86, 0, CAST(N'00:00:00' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (138, 86, 0, CAST(N'00:00:00' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (139, 86, 0, CAST(N'00:00:00' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (140, 86, 0, CAST(N'00:00:00' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (141, 86, 0, CAST(N'00:00:00' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (142, 86, 0, CAST(N'00:00:00' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (143, 86, 0, CAST(N'00:00:00' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (144, 86, 0, CAST(N'00:00:00' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (145, 86, 30, CAST(N'00:00:00' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (146, 86, 60, CAST(N'00:00:00' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (147, 86, 70, CAST(N'00:00:00' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (148, 86, 70, CAST(N'00:00:00' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (149, 86, 60, CAST(N'00:00:00' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (150, 86, 60, CAST(N'00:00:00' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (151, 86, 60, CAST(N'00:00:00' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (152, 86, 60, CAST(N'00:00:00' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (153, 86, 60, CAST(N'00:00:00' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (154, 86, 60, CAST(N'00:00:00' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (155, 86, 60, CAST(N'00:00:00' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (156, 86, 60, CAST(N'00:00:00' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (157, 86, 60, CAST(N'00:00:00' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (158, 86, 60, CAST(N'00:00:00' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (159, 86, 60, CAST(N'00:00:00' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (160, 86, 60, CAST(N'00:00:00' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (161, 1, 40, CAST(N'00:00:00' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (162, 1, 40, CAST(N'00:00:00' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (163, 1, 40, CAST(N'00:00:00' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (164, 1, 40, CAST(N'00:00:00' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (165, 1, 40, CAST(N'00:00:00' AS Time))
INSERT [dbo].[ResultDetail] ([ResultId], [UserId], [Score], [TimeTaken]) VALUES (166, 1, 40, CAST(N'00:00:00' AS Time))
SET IDENTITY_INSERT [dbo].[ResultDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[UserDetail] ON 

INSERT [dbo].[UserDetail] ([UserId], [Email], [Name], [Role]) VALUES (1, N'atchaya@gmail.com', N'Atchaya', N'Student')
INSERT [dbo].[UserDetail] ([UserId], [Email], [Name], [Role]) VALUES (2, N'nivi@gmail.com', N'Nivetha', N'Admin')
INSERT [dbo].[UserDetail] ([UserId], [Email], [Name], [Role]) VALUES (3, N'ish@gmail.com', N'Ishwarya', N'Student')
INSERT [dbo].[UserDetail] ([UserId], [Email], [Name], [Role]) VALUES (4, N'vasuki@gmail.com', N'Vasuki', N'Student')
INSERT [dbo].[UserDetail] ([UserId], [Email], [Name], [Role]) VALUES (5, N'susi@gmail.com', N'susi', N'Student')
INSERT [dbo].[UserDetail] ([UserId], [Email], [Name], [Role]) VALUES (8, N'a@gmail.com', N'a', N'Student')
INSERT [dbo].[UserDetail] ([UserId], [Email], [Name], [Role]) VALUES (10, N'b@gmail.com', N'b', N'Student')
INSERT [dbo].[UserDetail] ([UserId], [Email], [Name], [Role]) VALUES (11, N'c@gmail.com', N'c', N'Student')
INSERT [dbo].[UserDetail] ([UserId], [Email], [Name], [Role]) VALUES (12, N'd@gmail.com', N'd', N'Student')
INSERT [dbo].[UserDetail] ([UserId], [Email], [Name], [Role]) VALUES (13, N'e@gmail.com', N'e', N'Student')
INSERT [dbo].[UserDetail] ([UserId], [Email], [Name], [Role]) VALUES (14, N'sathis@gmail.com', N'Sathis', N'Student')
INSERT [dbo].[UserDetail] ([UserId], [Email], [Name], [Role]) VALUES (15, N'babu@gmail.com', N'Babu', N'Student')
INSERT [dbo].[UserDetail] ([UserId], [Email], [Name], [Role]) VALUES (16, N'hari@gmail.com', N'Hari', N'Student')
INSERT [dbo].[UserDetail] ([UserId], [Email], [Name], [Role]) VALUES (18, N'karthik@gmail.com', N'Karthik', N'Student')
INSERT [dbo].[UserDetail] ([UserId], [Email], [Name], [Role]) VALUES (20, N'fazil@gmail.com', N'Fazil', N'Student')
INSERT [dbo].[UserDetail] ([UserId], [Email], [Name], [Role]) VALUES (21, N'vini@gmail.com', N'Vinitha', N'Student')
INSERT [dbo].[UserDetail] ([UserId], [Email], [Name], [Role]) VALUES (22, N'devi@gmail.com', N'Devi', N'Student')
INSERT [dbo].[UserDetail] ([UserId], [Email], [Name], [Role]) VALUES (23, N'sutha@gmail.com', N'Sutha', N'Student')
INSERT [dbo].[UserDetail] ([UserId], [Email], [Name], [Role]) VALUES (24, N'raji@gmail.com', N'Raji', N'Student')
INSERT [dbo].[UserDetail] ([UserId], [Email], [Name], [Role]) VALUES (25, N'jaya@gmail.com', N'Jaya', N'Student')
INSERT [dbo].[UserDetail] ([UserId], [Email], [Name], [Role]) VALUES (26, N'ram@gmail.com', N'Ram', N'Student')
INSERT [dbo].[UserDetail] ([UserId], [Email], [Name], [Role]) VALUES (27, N'rani@gmail.com', N'Rani', N'Student')
INSERT [dbo].[UserDetail] ([UserId], [Email], [Name], [Role]) VALUES (28, N'ranjith@gmail.com', N'Ranjith', N'Student')
INSERT [dbo].[UserDetail] ([UserId], [Email], [Name], [Role]) VALUES (29, N'ramki@gmail.com', N'ramki', N'Student')
INSERT [dbo].[UserDetail] ([UserId], [Email], [Name], [Role]) VALUES (30, N'janu@gmail.com', N'Janu', N'Student')
INSERT [dbo].[UserDetail] ([UserId], [Email], [Name], [Role]) VALUES (31, N'lossliya@gmail.com', N'Lossliya', N'Student')
INSERT [dbo].[UserDetail] ([UserId], [Email], [Name], [Role]) VALUES (32, N'suzi@gmail.com', N'Suzi', N'Student')
INSERT [dbo].[UserDetail] ([UserId], [Email], [Name], [Role]) VALUES (33, N'pathma@gmail.com', N'Pathma', N'Student')
INSERT [dbo].[UserDetail] ([UserId], [Email], [Name], [Role]) VALUES (34, N'sruthi@gmail.com', N'Sruthi', N'Student')
INSERT [dbo].[UserDetail] ([UserId], [Email], [Name], [Role]) VALUES (35, N'sri@gmail.com', N'Sri', N'Student')
INSERT [dbo].[UserDetail] ([UserId], [Email], [Name], [Role]) VALUES (36, N'dhina@gmail.com', N'dhina', N'Student')
INSERT [dbo].[UserDetail] ([UserId], [Email], [Name], [Role]) VALUES (37, N'rajesh@gmail.com', N'Rajesh', N'Student')
INSERT [dbo].[UserDetail] ([UserId], [Email], [Name], [Role]) VALUES (38, N's@gmail.com', N'S', N'Student')
INSERT [dbo].[UserDetail] ([UserId], [Email], [Name], [Role]) VALUES (39, N'bbb@gmail.com', N'bbb', N'Student')
INSERT [dbo].[UserDetail] ([UserId], [Email], [Name], [Role]) VALUES (40, N'aki@gmail.com', N'aki', N'Student')
INSERT [dbo].[UserDetail] ([UserId], [Email], [Name], [Role]) VALUES (41, N'j@gmail.com', N'jayam', N'Student')
INSERT [dbo].[UserDetail] ([UserId], [Email], [Name], [Role]) VALUES (42, N'r@gmail.com', N'Ram', N'Student')
INSERT [dbo].[UserDetail] ([UserId], [Email], [Name], [Role]) VALUES (43, N'suba@gmail.com', N'suba', N'Student')
INSERT [dbo].[UserDetail] ([UserId], [Email], [Name], [Role]) VALUES (44, N'arjun@gmail.com', N'Arjun', N'Student')
INSERT [dbo].[UserDetail] ([UserId], [Email], [Name], [Role]) VALUES (45, N'q@gmail.com', N'Q', N'Student')
INSERT [dbo].[UserDetail] ([UserId], [Email], [Name], [Role]) VALUES (46, N'k@gmail.com', N'K', N'Student')
INSERT [dbo].[UserDetail] ([UserId], [Email], [Name], [Role]) VALUES (47, N'hidi@gmail.com', N'Hidi', N'Student')
INSERT [dbo].[UserDetail] ([UserId], [Email], [Name], [Role]) VALUES (48, N'peter@gmail.com', N'Peter', N'Student')
INSERT [dbo].[UserDetail] ([UserId], [Email], [Name], [Role]) VALUES (49, N'july@gmail.com', N'July', N'Student')
INSERT [dbo].[UserDetail] ([UserId], [Email], [Name], [Role]) VALUES (50, N'vikram@gmail.com', N'Vikram', N'Student')
INSERT [dbo].[UserDetail] ([UserId], [Email], [Name], [Role]) VALUES (51, N'h@gmail.com', N'h', N'Student')
INSERT [dbo].[UserDetail] ([UserId], [Email], [Name], [Role]) VALUES (52, N'hhh@gmail.com', N'HHH', N'Student')
INSERT [dbo].[UserDetail] ([UserId], [Email], [Name], [Role]) VALUES (53, N'jesu@gmail.com', N'Jesu', N'Student')
INSERT [dbo].[UserDetail] ([UserId], [Email], [Name], [Role]) VALUES (54, N'kumar@gmail.com', N'Kumar', N'Student')
INSERT [dbo].[UserDetail] ([UserId], [Email], [Name], [Role]) VALUES (55, N'raja@gmail.com', N'raja', N'Student')
INSERT [dbo].[UserDetail] ([UserId], [Email], [Name], [Role]) VALUES (56, N'ra@gmail.com', N'Eswar', N'Student')
INSERT [dbo].[UserDetail] ([UserId], [Email], [Name], [Role]) VALUES (57, N'w@gmail.com', N'W', N'Student')
INSERT [dbo].[UserDetail] ([UserId], [Email], [Name], [Role]) VALUES (58, N'1@gmail.com', N'hjbhj', N'Student')
INSERT [dbo].[UserDetail] ([UserId], [Email], [Name], [Role]) VALUES (59, N'prabha@gmail.com', N'Prabha', N'Student')
INSERT [dbo].[UserDetail] ([UserId], [Email], [Name], [Role]) VALUES (60, N'user1@gmail.com', N'User1', N'Student')
INSERT [dbo].[UserDetail] ([UserId], [Email], [Name], [Role]) VALUES (61, N'user2@gmail.com', N'User2', N'Student')
INSERT [dbo].[UserDetail] ([UserId], [Email], [Name], [Role]) VALUES (62, N'user3@gmail.com', N'User3', N'Student')
INSERT [dbo].[UserDetail] ([UserId], [Email], [Name], [Role]) VALUES (63, N'user4@gmail.com', N'User4', N'Student')
INSERT [dbo].[UserDetail] ([UserId], [Email], [Name], [Role]) VALUES (64, N'rin@gmail.com', N'User', N'Student')
INSERT [dbo].[UserDetail] ([UserId], [Email], [Name], [Role]) VALUES (65, N'kiran@gmail.com', N'kiran', N'Student')
INSERT [dbo].[UserDetail] ([UserId], [Email], [Name], [Role]) VALUES (66, N'dharma@gmail.com', N'Dharma', N'Student')
INSERT [dbo].[UserDetail] ([UserId], [Email], [Name], [Role]) VALUES (67, N'ajay@gmail.com', N'Ajay', N'Student')
INSERT [dbo].[UserDetail] ([UserId], [Email], [Name], [Role]) VALUES (68, N'kkk@gmail.com', N'KKK', N'Student')
INSERT [dbo].[UserDetail] ([UserId], [Email], [Name], [Role]) VALUES (69, N'kuyil@gmail.com', N'Kuyil', N'Student')
INSERT [dbo].[UserDetail] ([UserId], [Email], [Name], [Role]) VALUES (71, N'deni@gmail.com', N'Deni', N'Student')
INSERT [dbo].[UserDetail] ([UserId], [Email], [Name], [Role]) VALUES (72, N'jacky@gmail.com', N'Jacky', N'Student')
INSERT [dbo].[UserDetail] ([UserId], [Email], [Name], [Role]) VALUES (73, N'janani@gmail.com', N'Janani', N'Student')
INSERT [dbo].[UserDetail] ([UserId], [Email], [Name], [Role]) VALUES (74, N'azeem@gmail.com', N'Azeem', N'Student')
INSERT [dbo].[UserDetail] ([UserId], [Email], [Name], [Role]) VALUES (75, N'raj@gmail.com', N'Raj', N'Student')
INSERT [dbo].[UserDetail] ([UserId], [Email], [Name], [Role]) VALUES (76, N'mani@gmail.com', N'Mani', N'Student')
INSERT [dbo].[UserDetail] ([UserId], [Email], [Name], [Role]) VALUES (77, N'g@gmail.com', N'g', N'Student')
INSERT [dbo].[UserDetail] ([UserId], [Email], [Name], [Role]) VALUES (78, N'o@gmail.com', N'o', N'Student')
INSERT [dbo].[UserDetail] ([UserId], [Email], [Name], [Role]) VALUES (79, N'harini@gmail.com', N'Harini', N'Student')
INSERT [dbo].[UserDetail] ([UserId], [Email], [Name], [Role]) VALUES (80, N'tino@gmail.com', N'Tino', N'Student')
INSERT [dbo].[UserDetail] ([UserId], [Email], [Name], [Role]) VALUES (81, N'kisa@gmail.com', N'Kisa', N'Student')
INSERT [dbo].[UserDetail] ([UserId], [Email], [Name], [Role]) VALUES (83, N'kiran@gmail.com', N'Kiran', N'Student')
INSERT [dbo].[UserDetail] ([UserId], [Email], [Name], [Role]) VALUES (84, N'ss@gmail.com', N'SS', N'Student')
INSERT [dbo].[UserDetail] ([UserId], [Email], [Name], [Role]) VALUES (85, N'vasu@gmail.com', N'Vasu', N'Student')
INSERT [dbo].[UserDetail] ([UserId], [Email], [Name], [Role]) VALUES (86, N'vivek@gmail.com', N'Vivek', N'Student')
INSERT [dbo].[UserDetail] ([UserId], [Email], [Name], [Role]) VALUES (87, N'push@gmail.com', N'Pushpa', N'Student')
SET IDENTITY_INSERT [dbo].[UserDetail] OFF
GO
ALTER TABLE [dbo].[AnswerDetail]  WITH CHECK ADD FOREIGN KEY([QuestionId])
REFERENCES [dbo].[Question] ([QuestionId])
GO
ALTER TABLE [dbo].[AnswerDetail]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[UserDetail] ([UserId])
GO
ALTER TABLE [dbo].[ResultDetail]  WITH CHECK ADD  CONSTRAINT [FK_ResultDetail_UserDetail] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserDetail] ([UserId])
GO
ALTER TABLE [dbo].[ResultDetail] CHECK CONSTRAINT [FK_ResultDetail_UserDetail]
GO
USE [master]
GO
ALTER DATABASE [QuestionnaireApplication] SET  READ_WRITE 
GO
