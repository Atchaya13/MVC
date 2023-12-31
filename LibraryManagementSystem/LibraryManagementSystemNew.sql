USE [master]
GO
/****** Object:  Database [LibraryManagementSystemNew]    Script Date: 24-03-2023 17:12:18 ******/
CREATE DATABASE [LibraryManagementSystemNew]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LibraryManagementSystemNew', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\LibraryManagementSystemNew.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'LibraryManagementSystemNew_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\LibraryManagementSystemNew_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [LibraryManagementSystemNew] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LibraryManagementSystemNew].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LibraryManagementSystemNew] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LibraryManagementSystemNew] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LibraryManagementSystemNew] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LibraryManagementSystemNew] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LibraryManagementSystemNew] SET ARITHABORT OFF 
GO
ALTER DATABASE [LibraryManagementSystemNew] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LibraryManagementSystemNew] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LibraryManagementSystemNew] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LibraryManagementSystemNew] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LibraryManagementSystemNew] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LibraryManagementSystemNew] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LibraryManagementSystemNew] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LibraryManagementSystemNew] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LibraryManagementSystemNew] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LibraryManagementSystemNew] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LibraryManagementSystemNew] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LibraryManagementSystemNew] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LibraryManagementSystemNew] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LibraryManagementSystemNew] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LibraryManagementSystemNew] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LibraryManagementSystemNew] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LibraryManagementSystemNew] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LibraryManagementSystemNew] SET RECOVERY FULL 
GO
ALTER DATABASE [LibraryManagementSystemNew] SET  MULTI_USER 
GO
ALTER DATABASE [LibraryManagementSystemNew] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LibraryManagementSystemNew] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LibraryManagementSystemNew] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LibraryManagementSystemNew] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [LibraryManagementSystemNew] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [LibraryManagementSystemNew] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'LibraryManagementSystemNew', N'ON'
GO
ALTER DATABASE [LibraryManagementSystemNew] SET QUERY_STORE = OFF
GO
USE [LibraryManagementSystemNew]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 24-03-2023 17:12:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[BookId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Author] [varchar](50) NOT NULL,
	[Price] [float] NOT NULL,
 CONSTRAINT [PK_Book] PRIMARY KEY CLUSTERED 
(
	[BookId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [LibraryManagementSystemNew] SET  READ_WRITE 
GO
