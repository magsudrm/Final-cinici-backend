USE [master]
GO
/****** Object:  Database [CiniciDb]    Script Date: 7/28/2023 7:10:45 PM ******/
CREATE DATABASE [CiniciDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CiniciDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\CiniciDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CiniciDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\CiniciDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [CiniciDb] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CiniciDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CiniciDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CiniciDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CiniciDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CiniciDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CiniciDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [CiniciDb] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [CiniciDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CiniciDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CiniciDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CiniciDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CiniciDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CiniciDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CiniciDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CiniciDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CiniciDb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [CiniciDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CiniciDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CiniciDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CiniciDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CiniciDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CiniciDb] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [CiniciDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CiniciDb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CiniciDb] SET  MULTI_USER 
GO
ALTER DATABASE [CiniciDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CiniciDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CiniciDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CiniciDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CiniciDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CiniciDb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [CiniciDb] SET QUERY_STORE = ON
GO
ALTER DATABASE [CiniciDb] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [CiniciDb]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 7/28/2023 7:10:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 7/28/2023 7:10:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 7/28/2023 7:10:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 7/28/2023 7:10:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 7/28/2023 7:10:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 7/28/2023 7:10:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 7/28/2023 7:10:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[Discriminator] [nvarchar](max) NOT NULL,
	[FullName] [nvarchar](max) NULL,
	[IsAdmin] [bit] NULL,
	[IsSuperAdmin] [bit] NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 7/28/2023 7:10:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BasketItems]    Script Date: 7/28/2023 7:10:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BasketItems](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[AppUserId] [nvarchar](450) NULL,
	[Count] [int] NOT NULL,
	[Size] [nvarchar](max) NULL,
 CONSTRAINT [PK_BasketItems] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brands]    Script Date: 7/28/2023 7:10:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brands](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_Brands] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 7/28/2023 7:10:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Collections]    Script Date: 7/28/2023 7:10:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Collections](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NULL,
	[ButtonUrl] [nvarchar](max) NULL,
	[Image] [nvarchar](max) NULL,
 CONSTRAINT [PK_Collections] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contacts]    Script Date: 7/28/2023 7:10:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contacts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[Comment] [nvarchar](max) NULL,
	[SendTime] [datetime2](7) NOT NULL,
	[IsReply] [bit] NOT NULL,
 CONSTRAINT [PK_Contacts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Focuses]    Script Date: 7/28/2023 7:10:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Focuses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NULL,
	[ButtonText] [nvarchar](max) NULL,
	[ButtonUrl] [nvarchar](max) NULL,
	[Image] [nvarchar](max) NULL,
 CONSTRAINT [PK_Focuses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderItems]    Script Date: 7/28/2023 7:10:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItems](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Price] [float] NOT NULL,
	[ProductId] [int] NULL,
	[Quantity] [int] NOT NULL,
	[OrderId] [int] NOT NULL,
	[Size] [nvarchar](max) NULL,
 CONSTRAINT [PK_OrderItems] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 7/28/2023 7:10:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[City] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[TotalPrice] [float] NOT NULL,
	[Status] [bit] NULL,
	[Message] [nvarchar](max) NULL,
	[Number] [int] NOT NULL,
	[Date] [datetime2](7) NOT NULL,
	[AppUserId] [nvarchar](450) NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductImages]    Script Date: 7/28/2023 7:10:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductImages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[Image] [nvarchar](max) NULL,
	[PosterStatus] [bit] NULL,
 CONSTRAINT [PK_ProductImages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 7/28/2023 7:10:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[Color] [nvarchar](max) NULL,
	[Age] [decimal](18, 2) NOT NULL,
	[IsDiscounted] [bit] NOT NULL,
	[DiscountPercent] [decimal](18, 2) NOT NULL,
	[Size] [nvarchar](max) NULL,
	[Gender] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[BrandId] [int] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Settings]    Script Date: 7/28/2023 7:10:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Settings](
	[Key] [nvarchar](50) NOT NULL,
	[Value] [nvarchar](1000) NULL,
 CONSTRAINT [PK_Settings] PRIMARY KEY CLUSTERED 
(
	[Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sliders]    Script Date: 7/28/2023 7:10:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sliders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Order] [int] NOT NULL,
	[Title1] [nvarchar](30) NULL,
	[Title2] [nvarchar](30) NULL,
	[Image] [nvarchar](150) NULL,
	[ButtonText] [nvarchar](max) NULL,
	[ButtonUrl] [nvarchar](220) NULL,
 CONSTRAINT [PK_Sliders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subscribes]    Script Date: 7/28/2023 7:10:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subscribes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](max) NULL,
 CONSTRAINT [PK_Subscribes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230715114734_DbContextCreated', N'6.0.19')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230718142204_DbStructureCreated', N'6.0.19')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230719192845_SomeDbProblemsSolved', N'6.0.19')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230721121516_CreateUser', N'6.0.19')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230721124704_CreateUsersadasd', N'6.0.19')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230721125510_CreateUsersadasdsasdasd', N'6.0.19')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230721224850_CreateContact', N'6.0.19')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230721225750_CreateContactsdasd', N'6.0.19')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230721234454_CreateContactsdasdasdasd', N'6.0.19')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'25573ab3-7e30-4e25-8d5e-f5313debe165', N'Admin', N'ADMIN', N'9eded880-95d6-4fdf-a89d-2e901e9e82bd')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'9ad195b1-4e09-4ad3-8476-2cb1f9828fe3', N'Superadmin', N'SUPERADMIN', N'a26c2e21-3d81-49e4-a3e1-ccf1b232beb6')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'a01aee4e-44c7-4faa-bc3b-f705772d6014', N'User', N'USER', N'723819a8-1030-4bf8-9162-d3db91c33fca')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'b43bd276-8493-4fe0-a7db-62894b34cc22', N'25573ab3-7e30-4e25-8d5e-f5313debe165')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'dfe590ef-e1cf-4f50-849e-d80c782e7aff', N'25573ab3-7e30-4e25-8d5e-f5313debe165')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'a12e0a60-34dd-4f38-b32c-64a86540bea5', N'9ad195b1-4e09-4ad3-8476-2cb1f9828fe3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'bf9525a0-f9ee-4287-af78-f42cbd39857e', N'a01aee4e-44c7-4faa-bc3b-f705772d6014')
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Discriminator], [FullName], [IsAdmin], [IsSuperAdmin]) VALUES (N'a12e0a60-34dd-4f38-b32c-64a86540bea5', N'maqsud2023', N'MAQSUD2023', N'maqsud@gmail.com', N'MAQSUD@GMAIL.COM', 1, N'AQAAAAEAACcQAAAAEAwJZ5UqOoKA2u1Uq1d6EBMCj9ECamFiAGu7osa8TA0DLMTYYPlQbS+ejogtATiHIw==', N'YNFGJG7E6CLNOZTRPU6YCQ3PIEOGH6P5', N'1dd9f48f-674c-4a51-bc7e-25d04f4f4f69', NULL, 0, 0, NULL, 1, 0, N'AppUser', N'Maqsud Muslumov', 0, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Discriminator], [FullName], [IsAdmin], [IsSuperAdmin]) VALUES (N'b43bd276-8493-4fe0-a7db-62894b34cc22', N'Maqsud1998', N'MAQSUD1998', N'maqsudmuslumov@gmail.com', N'MAQSUDMUSLUMOV@GMAIL.COM', 1, N'AQAAAAEAACcQAAAAEBrKJWd31S2tCfz0oQ30RapsjDpc3RNOPvIROTS1PvN8sH9rTF2FqbEu45pJPkzo/g==', N'QR5U2X4FB56N7MNTTWLIKJ6MD2ACRINA', N'4e030904-80e5-4244-aa1c-1496b04423a8', NULL, 0, 0, NULL, 1, 0, N'AppUser', N'Maqsud Muslumov', 0, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Discriminator], [FullName], [IsAdmin], [IsSuperAdmin]) VALUES (N'bf9525a0-f9ee-4287-af78-f42cbd39857e', N'maqsud_muslum', N'MAQSUD_MUSLUM', N'maqsudmuslumov98@gmail.com', N'MAQSUDMUSLUMOV98@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEHyQNG5KxQNqbqbtwEScLdIKtMBLHKQxEsPIgP4mTIP2VTVQqhvah1ZthJXwNFczrA==', N'ODFDIZSNGMZJL3MO7QBJFP7PZ4JUVBY3', N'e00f627f-b27a-4bd9-9fc5-99b094ec71c2', NULL, 0, 0, NULL, 1, 0, N'AppUser', N'Maqsud Muslumov', 0, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Discriminator], [FullName], [IsAdmin], [IsSuperAdmin]) VALUES (N'dfe590ef-e1cf-4f50-849e-d80c782e7aff', N'MaqsudCode', N'MAQSUDCODE', N'muslumov98@mail.ru', N'MUSLUMOV98@MAIL.RU', 1, N'AQAAAAEAACcQAAAAEE2P0OxEhFss6WDBaOXB9T6PA5PVnm4LU/ge1DJjTAUWgLNq8Cr2EW3NWlz6t+ld+A==', N'ZOWA3YZ5YCDB5PSZKYLSCV5HVBP2WLF5', N'141f1b14-8e9a-4e77-80ed-8978a3f6a1da', NULL, 0, 0, NULL, 1, 0, N'AppUser', N'Maqsud Muslumov', 0, 0)
GO
SET IDENTITY_INSERT [dbo].[BasketItems] ON 

INSERT [dbo].[BasketItems] ([Id], [ProductId], [AppUserId], [Count], [Size]) VALUES (8, 4, N'a12e0a60-34dd-4f38-b32c-64a86540bea5', 1, N'M')
SET IDENTITY_INSERT [dbo].[BasketItems] OFF
GO
SET IDENTITY_INSERT [dbo].[Brands] ON 

INSERT [dbo].[Brands] ([Id], [Name]) VALUES (1, N'Silversun')
INSERT [dbo].[Brands] ([Id], [Name]) VALUES (2, N'Blackspade')
INSERT [dbo].[Brands] ([Id], [Name]) VALUES (3, N'Step')
INSERT [dbo].[Brands] ([Id], [Name]) VALUES (4, N'Monita ')
INSERT [dbo].[Brands] ([Id], [Name]) VALUES (5, N'De Blasio')
INSERT [dbo].[Brands] ([Id], [Name]) VALUES (6, N'Denti')
INSERT [dbo].[Brands] ([Id], [Name]) VALUES (7, N'Gallus')
INSERT [dbo].[Brands] ([Id], [Name]) VALUES (9, N'Four Hands')
INSERT [dbo].[Brands] ([Id], [Name]) VALUES (10, N'London')
INSERT [dbo].[Brands] ([Id], [Name]) VALUES (11, N'Cantaş')
INSERT [dbo].[Brands] ([Id], [Name]) VALUES (12, N'as')
SET IDENTITY_INSERT [dbo].[Brands] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name]) VALUES (3, N'Gödəkçə')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (4, N'Palto və Plaş')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (5, N'Kostyum və Pencək')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (6, N'Don')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (7, N'Ətək')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (8, N'Köynək')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (9, N'Bluz')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (10, N'Sviter və Jaket')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (11, N'Şalvar')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (12, N'Jeans Şalvar')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (13, N'Dəri')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (14, N'Alt Paltarı və Ev Geyimi')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (15, N'Böyük ölçülü geyimlər')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (16, N'Digər')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (17, N'Polo və T-Shirt')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (18, N'Ev və İdman dəsti')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (19, N'Body')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (20, N'Ayaqqabı')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (21, N'Yol çantaları')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (22, N'Bel çantaları')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (23, N'Ayaqqabıya Qulluq')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (24, N'Çətir')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (25, N'a')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Collections] ON 

INSERT [dbo].[Collections] ([Id], [Title], [ButtonUrl], [Image]) VALUES (2, N'QADIN', N'bilmirem.com', N'841b3dcf-9fbc-49af-9704-7df5ced71982Qadin-kollek.png')
INSERT [dbo].[Collections] ([Id], [Title], [ButtonUrl], [Image]) VALUES (3, N'KİŞİ', N'bilmirem.com', N'c6507807-720a-47a3-a0d7-4dfdc3ce3bf4Kisi-kollek.png')
INSERT [dbo].[Collections] ([Id], [Title], [ButtonUrl], [Image]) VALUES (4, N'UŞAQ', N'bilmirem.com', N'ab7ca89e-df49-4023-96ff-7a6029a83a99Usaq-kollek.png')
SET IDENTITY_INSERT [dbo].[Collections] OFF
GO
SET IDENTITY_INSERT [dbo].[Contacts] ON 

INSERT [dbo].[Contacts] ([Id], [Name], [Email], [PhoneNumber], [Comment], [SendTime], [IsReply]) VALUES (2, N'Maqsud', N'maqsudmuslumov98@gmail.com', N'+994506988323', N'Salam Code', CAST(N'2023-07-22T15:33:35.5452594' AS DateTime2), 1)
INSERT [dbo].[Contacts] ([Id], [Name], [Email], [PhoneNumber], [Comment], [SendTime], [IsReply]) VALUES (4, N'Maqsud', N'Muslumov98@mail.ru', N'+994508338883', N'Salam Code', CAST(N'2023-07-27T10:05:24.0275613' AS DateTime2), 0)
SET IDENTITY_INSERT [dbo].[Contacts] OFF
GO
SET IDENTITY_INSERT [dbo].[Focuses] ON 

INSERT [dbo].[Focuses] ([Id], [Title], [ButtonText], [ButtonUrl], [Image]) VALUES (2, N'Kisi ÇANTALARI', N'İNDİ AL', N'bilmirem.com', N'cee78b9c-9639-4937-8c7e-f21876bb3b84bags.png')
INSERT [dbo].[Focuses] ([Id], [Title], [ButtonText], [ButtonUrl], [Image]) VALUES (3, N'  KİŞİ AKSESUARLARI', N'İNDİ AL', N'bilmirem.com', N'e42cae40-61a7-4160-908e-3430ecf6c7aeman-acc (1).png')
SET IDENTITY_INSERT [dbo].[Focuses] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderItems] ON 

INSERT [dbo].[OrderItems] ([Id], [Name], [Price], [ProductId], [Quantity], [OrderId], [Size]) VALUES (2, N'Silversun Uşaq Don', 20, 4, 1, 2, N'XXL')
INSERT [dbo].[OrderItems] ([Id], [Name], [Price], [ProductId], [Quantity], [OrderId], [Size]) VALUES (4, N'Blackspade Kişi Köynək', 12, 15, 1, 4, N'S')
SET IDENTITY_INSERT [dbo].[OrderItems] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Id], [City], [Address], [TotalPrice], [Status], [Message], [Number], [Date], [AppUserId]) VALUES (1, N'Baku', N'Salyan', 43, 1, N'asdasd', 55555555, CAST(N'2023-07-22T03:43:06.7352130' AS DateTime2), N'a12e0a60-34dd-4f38-b32c-64a86540bea5')
INSERT [dbo].[Orders] ([Id], [City], [Address], [TotalPrice], [Status], [Message], [Number], [Date], [AppUserId]) VALUES (2, N'Baku', N'Hovsan', 20, 1, N'Salam Magsud', 506988323, CAST(N'2023-07-22T04:03:50.8275819' AS DateTime2), N'a12e0a60-34dd-4f38-b32c-64a86540bea5')
INSERT [dbo].[Orders] ([Id], [City], [Address], [TotalPrice], [Status], [Message], [Number], [Date], [AppUserId]) VALUES (4, N'Baku', N'asa', 12, 1, N'asa', 508338883, CAST(N'2023-07-27T10:01:25.8504005' AS DateTime2), N'bf9525a0-f9ee-4287-af78-f42cbd39857e')
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductImages] ON 

INSERT [dbo].[ProductImages] ([Id], [ProductId], [Image], [PosterStatus]) VALUES (4, 4, N'1508f275-875e-40bd-8de4-1a5a4f63627484272-2.jpg', 1)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Image], [PosterStatus]) VALUES (25, 9, N'57b66b3b-7ccc-4c39-8073-b9a37c976d0984508-1.jpg', 1)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Image], [PosterStatus]) VALUES (26, 10, N'e762f26a-a48f-4310-85cd-12e88389a41784403.jpg', 1)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Image], [PosterStatus]) VALUES (27, 11, N'67e7b2c4-7c76-4287-afe4-f7d93ee11643september_334.jpg', 1)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Image], [PosterStatus]) VALUES (28, 12, N'82d0a2c7-a2a8-435a-a469-73340bc201bb84511-1.jpg', 1)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Image], [PosterStatus]) VALUES (29, 13, N'380961f1-166e-46e8-9991-ca74ca633af783018-1.jpg', 1)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Image], [PosterStatus]) VALUES (30, 14, N'9757d9a5-e7e1-4fe8-881c-57ac650989748APR5254.jpg', 1)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Image], [PosterStatus]) VALUES (31, 15, N'66c2730c-1384-4e79-a412-31d6e683e5e882475-1.jpg', 1)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Image], [PosterStatus]) VALUES (32, 16, N'00aaf5ec-72ff-4e64-b670-77bed1e1ae6d85366-1.jpg', 1)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Image], [PosterStatus]) VALUES (33, 17, N'fe39a4de-55ae-4490-8913-e862395d51d186024-1.jpg', 1)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Image], [PosterStatus]) VALUES (34, 18, N'72d9b440-9d90-45bd-ae8c-d37d7afb0fca86059-1.jpg', 1)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Image], [PosterStatus]) VALUES (35, 19, N'fd362be5-8efa-4567-b5c2-5ab7fc1c6e9c83260-1.jpg', 1)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Image], [PosterStatus]) VALUES (36, 20, N'03044920-95f4-4514-af15-2e4f9aa20fb484748-1.jpg', 1)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Image], [PosterStatus]) VALUES (37, 21, N'f7bf7bdb-81a6-4c48-8320-69fa52885f3483999-83960-1_GU8Hsdj.jpg', 1)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Image], [PosterStatus]) VALUES (38, 22, N'3d7184a5-66c2-4442-b1b9-af13ffc9ec9b85625-1.jpg', 1)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Image], [PosterStatus]) VALUES (39, 23, N'56e5799b-024c-4a5a-8772-35dfb60685db83627-1 (1).png', 1)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Image], [PosterStatus]) VALUES (58, 4, N'67af11ed-3657-4a94-8b7a-7894370dec6184272-1.jpg', NULL)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Image], [PosterStatus]) VALUES (59, 4, N'461f1fc0-a909-4b17-b743-d0961ef56c4a84272-2.jpg', NULL)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Image], [PosterStatus]) VALUES (60, 9, N'0dac206c-6e8f-43a3-b115-8e979742c8b284508-1.jpg', NULL)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Image], [PosterStatus]) VALUES (61, 9, N'14a1e4cd-b08c-4512-b67d-3c5d6efe749984508-2.jpg', NULL)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Image], [PosterStatus]) VALUES (62, 10, N'907a5172-2b42-45b5-99fd-dab38f4a00e584423-1.jpg', NULL)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Image], [PosterStatus]) VALUES (63, 10, N'bbe60c35-11b8-46d5-be6e-9898a1643af984423-2.jpg', NULL)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Image], [PosterStatus]) VALUES (64, 11, N'10192f74-de5b-413f-96cd-fc894491c5e4september_335.jpg', NULL)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Image], [PosterStatus]) VALUES (65, 11, N'36e2bcd2-4db1-49eb-a6de-02ef102fe897september_336.jpg', NULL)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Image], [PosterStatus]) VALUES (66, 12, N'82e9cfe2-16d8-42da-baeb-ccd25c0a9e8884511-1.jpg', NULL)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Image], [PosterStatus]) VALUES (67, 12, N'9630b338-514d-4d12-93f3-e5fb8b9060a884511-2.jpg', NULL)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Image], [PosterStatus]) VALUES (68, 13, N'1ed1361d-0502-44b3-b112-0c0ae299e6f783018-2.jpg', NULL)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Image], [PosterStatus]) VALUES (69, 13, N'99decba9-4226-4ccf-8e14-1cf4712d28cb83018-3.jpg', NULL)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Image], [PosterStatus]) VALUES (70, 14, N'dd14ca79-f0d1-41b8-997b-b467c206ffa58APR5255.jpg', NULL)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Image], [PosterStatus]) VALUES (71, 14, N'6f5525a4-a8ce-4c79-abd9-a185466cd2d28APR5257.jpg', NULL)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Image], [PosterStatus]) VALUES (72, 15, N'dbf9879a-31a6-4a13-81e9-77dd31eaead282475-2.jpg', NULL)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Image], [PosterStatus]) VALUES (73, 15, N'70a6a559-d28f-45b8-958c-cc7b8bd2e86482475-3.jpg', NULL)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Image], [PosterStatus]) VALUES (74, 16, N'6e4e0a4a-dbe0-48ea-a70c-99ac6a769f8a85366-2.jpg', NULL)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Image], [PosterStatus]) VALUES (75, 16, N'ddfcec3a-f7f0-41cf-9789-99618068b4c685366-3.jpg', NULL)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Image], [PosterStatus]) VALUES (78, 18, N'07cd3fb3-6b20-4be5-8a0d-6e9a5bdc94dc86059-2.jpg', NULL)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Image], [PosterStatus]) VALUES (79, 18, N'1f613165-94a4-43ab-a40d-b469b276a25c86059-3.jpg', NULL)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Image], [PosterStatus]) VALUES (80, 19, N'2ad590cb-3dee-422f-b3fe-0f12953b9dce83260-2.jpg', NULL)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Image], [PosterStatus]) VALUES (81, 19, N'8223fddf-d10b-4d30-897b-ff884db504e483260-3.jpg', NULL)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Image], [PosterStatus]) VALUES (82, 20, N'895c1895-bd58-473b-93cf-001bc1190d7684748-2.jpg', NULL)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Image], [PosterStatus]) VALUES (83, 20, N'5ff0697a-6eef-45d7-80f4-a731d522d54584748-3.jpg', NULL)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Image], [PosterStatus]) VALUES (84, 21, N'6446d528-e342-49f5-a23e-6c8cc30689f683999-83960-2_T4aHrsy.jpg', NULL)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Image], [PosterStatus]) VALUES (85, 21, N'4f3bc812-4bf8-405f-ac3f-13f2ee630d0683999-83960-3_tqM80FT.jpg', NULL)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Image], [PosterStatus]) VALUES (86, 22, N'5e4791cb-013a-4dff-bf1c-3492bb5c902185625-2.jpg', NULL)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Image], [PosterStatus]) VALUES (87, 22, N'a97cedc2-ce0e-41a9-885c-28123c45f25785625-3.jpg', NULL)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Image], [PosterStatus]) VALUES (90, 17, N'5471b63e-14e4-4c3b-9b92-cfe408b0314886024-2.jpg', NULL)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Image], [PosterStatus]) VALUES (91, 17, N'72b11f8e-1fab-478e-8eb4-c9bd0c95726686024-3.jpg', NULL)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Image], [PosterStatus]) VALUES (92, 23, N'30ea729e-ca06-49a9-b21c-2e92c236d04a83627-1.png', NULL)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Image], [PosterStatus]) VALUES (93, 23, N'64084b9c-39a6-419c-a81c-f3429adae1fa83627-4.png', NULL)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Image], [PosterStatus]) VALUES (94, 24, N'27a2baca-4680-4970-bc7a-4cbe3d67838d8APR5254.jpg', 1)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [Image], [PosterStatus]) VALUES (95, 25, N'f177da27-5dc6-42b2-81ef-46682127041582994-1.jpg', 1)
SET IDENTITY_INSERT [dbo].[ProductImages] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [IsDeleted], [Color], [Age], [IsDiscounted], [DiscountPercent], [Size], [Gender], [CategoryId], [BrandId]) VALUES (4, N'Denti Uşaq Köynək', N'Bosdu', CAST(20.00 AS Decimal(18, 2)), 0, N'Mavi', CAST(9.00 AS Decimal(18, 2)), 1, CAST(0.00 AS Decimal(18, 2)), NULL, 3, 6, 1)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [IsDeleted], [Color], [Age], [IsDiscounted], [DiscountPercent], [Size], [Gender], [CategoryId], [BrandId]) VALUES (9, N'Silversun Uşaq Don', N'Bosdu', CAST(20.00 AS Decimal(18, 2)), 0, N'Mavi', CAST(9.00 AS Decimal(18, 2)), 1, CAST(0.00 AS Decimal(18, 2)), NULL, 3, 6, 1)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [IsDeleted], [Color], [Age], [IsDiscounted], [DiscountPercent], [Size], [Gender], [CategoryId], [BrandId]) VALUES (10, N'Gallus Ətək', N'sadads', CAST(12.00 AS Decimal(18, 2)), 0, N'xccsd', CAST(21.00 AS Decimal(18, 2)), 1, CAST(0.00 AS Decimal(18, 2)), N'das', 3, 7, 7)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [IsDeleted], [Color], [Age], [IsDiscounted], [DiscountPercent], [Size], [Gender], [CategoryId], [BrandId]) VALUES (11, N'Cantaş Ayaqqabı', N'dsas', CAST(12.00 AS Decimal(18, 2)), 0, N'sc', CAST(21.00 AS Decimal(18, 2)), 0, CAST(0.00 AS Decimal(18, 2)), N'213', 3, 8, 7)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [IsDeleted], [Color], [Age], [IsDiscounted], [DiscountPercent], [Size], [Gender], [CategoryId], [BrandId]) VALUES (12, N'Denti Ətək', N'fd', CAST(21.00 AS Decimal(18, 2)), 0, N'Göy', CAST(12.00 AS Decimal(18, 2)), 0, CAST(0.00 AS Decimal(18, 2)), N'X', 3, 20, 10)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [IsDeleted], [Color], [Age], [IsDiscounted], [DiscountPercent], [Size], [Gender], [CategoryId], [BrandId]) VALUES (13, N'Monita Uşaq Don', N'sad', CAST(43.00 AS Decimal(18, 2)), 0, N'Sarı', CAST(12.00 AS Decimal(18, 2)), 0, CAST(0.00 AS Decimal(18, 2)), N'sd', 3, 7, 5)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [IsDeleted], [Color], [Age], [IsDiscounted], [DiscountPercent], [Size], [Gender], [CategoryId], [BrandId]) VALUES (14, N'London Kişi Şalvar', N'Bosdu', CAST(20.00 AS Decimal(18, 2)), 0, N'Mavi', CAST(9.00 AS Decimal(18, 2)), 1, CAST(0.00 AS Decimal(18, 2)), NULL, 1, 6, 1)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [IsDeleted], [Color], [Age], [IsDiscounted], [DiscountPercent], [Size], [Gender], [CategoryId], [BrandId]) VALUES (15, N'Blackspade Kişi Köynək', N'sadads', CAST(12.00 AS Decimal(18, 2)), 0, N'Qara', CAST(21.00 AS Decimal(18, 2)), 1, CAST(0.00 AS Decimal(18, 2)), N'das', 1, 7, 7)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [IsDeleted], [Color], [Age], [IsDiscounted], [DiscountPercent], [Size], [Gender], [CategoryId], [BrandId]) VALUES (16, N'sas', N'dsas', CAST(50.00 AS Decimal(18, 2)), 0, N'Göy', CAST(21.00 AS Decimal(18, 2)), 0, CAST(0.00 AS Decimal(18, 2)), N'213', 1, 8, 7)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [IsDeleted], [Color], [Age], [IsDiscounted], [DiscountPercent], [Size], [Gender], [CategoryId], [BrandId]) VALUES (17, N'Cantaş Kişi Kostyum', N'fd', CAST(21.00 AS Decimal(18, 2)), 0, N'Qara', CAST(12.00 AS Decimal(18, 2)), 0, CAST(0.00 AS Decimal(18, 2)), N'dsf', 1, 20, 10)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [IsDeleted], [Color], [Age], [IsDiscounted], [DiscountPercent], [Size], [Gender], [CategoryId], [BrandId]) VALUES (18, N'De Blasio Kostyum', N'sad', CAST(43.00 AS Decimal(18, 2)), 0, N'sds', CAST(12.00 AS Decimal(18, 2)), 0, CAST(0.00 AS Decimal(18, 2)), N'sd', 1, 7, 5)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [IsDeleted], [Color], [Age], [IsDiscounted], [DiscountPercent], [Size], [Gender], [CategoryId], [BrandId]) VALUES (19, N'Monita Kişi Ayaqqabı', N'Bosdu', CAST(20.00 AS Decimal(18, 2)), 0, N'Mavi', CAST(9.00 AS Decimal(18, 2)), 1, CAST(0.00 AS Decimal(18, 2)), NULL, 1, 6, 1)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [IsDeleted], [Color], [Age], [IsDiscounted], [DiscountPercent], [Size], [Gender], [CategoryId], [BrandId]) VALUES (20, N'Denti Qadın Ətək', N'sadads', CAST(12.00 AS Decimal(18, 2)), 0, N'xccsd', CAST(21.00 AS Decimal(18, 2)), 1, CAST(0.00 AS Decimal(18, 2)), N'das', 2, 7, 7)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [IsDeleted], [Color], [Age], [IsDiscounted], [DiscountPercent], [Size], [Gender], [CategoryId], [BrandId]) VALUES (21, N'De Blasio Qadın Şalvar', N'dsas', CAST(12.00 AS Decimal(18, 2)), 0, N'Qırmızı', CAST(21.00 AS Decimal(18, 2)), 0, CAST(0.00 AS Decimal(18, 2)), N'213', 2, 8, 7)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [IsDeleted], [Color], [Age], [IsDiscounted], [DiscountPercent], [Size], [Gender], [CategoryId], [BrandId]) VALUES (22, N'Step Qadın Ayaqqabı', N'fd', CAST(21.00 AS Decimal(18, 2)), 0, N'Ağ', CAST(12.00 AS Decimal(18, 2)), 0, CAST(0.00 AS Decimal(18, 2)), N'dsf', 2, 20, 10)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [IsDeleted], [Color], [Age], [IsDiscounted], [DiscountPercent], [Size], [Gender], [CategoryId], [BrandId]) VALUES (23, N'De Blasio Qadın Don', N'sad', CAST(43.00 AS Decimal(18, 2)), 0, N'sds', CAST(12.00 AS Decimal(18, 2)), 0, CAST(0.00 AS Decimal(18, 2)), N'sd', 2, 7, 5)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [IsDeleted], [Color], [Age], [IsDiscounted], [DiscountPercent], [Size], [Gender], [CategoryId], [BrandId]) VALUES (24, N'Cantaş Qadın Şalvar', N'a', CAST(13.00 AS Decimal(18, 2)), 0, N'Ağ', CAST(12.00 AS Decimal(18, 2)), 0, CAST(0.00 AS Decimal(18, 2)), NULL, 2, 11, 11)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [IsDeleted], [Color], [Age], [IsDiscounted], [DiscountPercent], [Size], [Gender], [CategoryId], [BrandId]) VALUES (25, N'Denti Qadın Ətək', NULL, CAST(21.00 AS Decimal(18, 2)), 0, N'Ağ', CAST(12.00 AS Decimal(18, 2)), 0, CAST(0.00 AS Decimal(18, 2)), NULL, 2, 7, 6)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Sliders] ON 

INSERT [dbo].[Sliders] ([Id], [Order], [Title1], [Title2], [Image], [ButtonText], [ButtonUrl]) VALUES (4, 1, N'YAZ-YAY', N'2023', N'ad0772a9-0059-43c5-a662-b0833ed44528slider1.png', N'Ətraflı', N'bilmirem.com')
INSERT [dbo].[Sliders] ([Id], [Order], [Title1], [Title2], [Image], [ButtonText], [ButtonUrl]) VALUES (5, 2, N'YAZ-YAY', N'2023', N'e1c57e09-1b24-4e6a-a28f-ccc0c7fb1c25slider2.png', N'Ətraflı', N'bilmirem.com')
INSERT [dbo].[Sliders] ([Id], [Order], [Title1], [Title2], [Image], [ButtonText], [ButtonUrl]) VALUES (7, 4, N'YAZ-YAY', N'2023', N'da120c9d-182a-405a-b07d-233a17306dc8slider4.png', N'Ətraflı', N'bilmirem.com')
SET IDENTITY_INSERT [dbo].[Sliders] OFF
GO
SET IDENTITY_INSERT [dbo].[Subscribes] ON 

INSERT [dbo].[Subscribes] ([Id], [Email]) VALUES (3, N'rashid@bk.ru')
INSERT [dbo].[Subscribes] ([Id], [Email]) VALUES (4, N'sdsads@sm.cm')
INSERT [dbo].[Subscribes] ([Id], [Email]) VALUES (5, N'Muslumov98@mail.ru')
SET IDENTITY_INSERT [dbo].[Subscribes] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 7/28/2023 7:10:46 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 7/28/2023 7:10:46 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 7/28/2023 7:10:46 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 7/28/2023 7:10:46 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 7/28/2023 7:10:46 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 7/28/2023 7:10:46 PM ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 7/28/2023 7:10:46 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_BasketItems_AppUserId]    Script Date: 7/28/2023 7:10:46 PM ******/
CREATE NONCLUSTERED INDEX [IX_BasketItems_AppUserId] ON [dbo].[BasketItems]
(
	[AppUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_BasketItems_ProductId]    Script Date: 7/28/2023 7:10:46 PM ******/
CREATE NONCLUSTERED INDEX [IX_BasketItems_ProductId] ON [dbo].[BasketItems]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderItems_OrderId]    Script Date: 7/28/2023 7:10:46 PM ******/
CREATE NONCLUSTERED INDEX [IX_OrderItems_OrderId] ON [dbo].[OrderItems]
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderItems_ProductId]    Script Date: 7/28/2023 7:10:46 PM ******/
CREATE NONCLUSTERED INDEX [IX_OrderItems_ProductId] ON [dbo].[OrderItems]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Orders_AppUserId]    Script Date: 7/28/2023 7:10:46 PM ******/
CREATE NONCLUSTERED INDEX [IX_Orders_AppUserId] ON [dbo].[Orders]
(
	[AppUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductImages_ProductId]    Script Date: 7/28/2023 7:10:46 PM ******/
CREATE NONCLUSTERED INDEX [IX_ProductImages_ProductId] ON [dbo].[ProductImages]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Products_BrandId]    Script Date: 7/28/2023 7:10:46 PM ******/
CREATE NONCLUSTERED INDEX [IX_Products_BrandId] ON [dbo].[Products]
(
	[BrandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Products_CategoryId]    Script Date: 7/28/2023 7:10:46 PM ******/
CREATE NONCLUSTERED INDEX [IX_Products_CategoryId] ON [dbo].[Products]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetUsers] ADD  DEFAULT (N'') FOR [Discriminator]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ((0)) FOR [CategoryId]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ((0)) FOR [BrandId]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[BasketItems]  WITH CHECK ADD  CONSTRAINT [FK_BasketItems_AspNetUsers_AppUserId] FOREIGN KEY([AppUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[BasketItems] CHECK CONSTRAINT [FK_BasketItems_AspNetUsers_AppUserId]
GO
ALTER TABLE [dbo].[BasketItems]  WITH CHECK ADD  CONSTRAINT [FK_BasketItems_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BasketItems] CHECK CONSTRAINT [FK_BasketItems_Products_ProductId]
GO
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD  CONSTRAINT [FK_OrderItems_Orders_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderItems] CHECK CONSTRAINT [FK_OrderItems_Orders_OrderId]
GO
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD  CONSTRAINT [FK_OrderItems_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[OrderItems] CHECK CONSTRAINT [FK_OrderItems_Products_ProductId]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_AspNetUsers_AppUserId] FOREIGN KEY([AppUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_AspNetUsers_AppUserId]
GO
ALTER TABLE [dbo].[ProductImages]  WITH CHECK ADD  CONSTRAINT [FK_ProductImages_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductImages] CHECK CONSTRAINT [FK_ProductImages_Products_ProductId]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Brands_BrandId] FOREIGN KEY([BrandId])
REFERENCES [dbo].[Brands] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Brands_BrandId]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories_CategoryId]
GO
USE [master]
GO
ALTER DATABASE [CiniciDb] SET  READ_WRITE 
GO
