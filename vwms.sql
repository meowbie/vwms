USE [master]
GO
/****** Object:  Database [vwms]    Script Date: 8/24/2022 23:53:38 ******/
CREATE DATABASE [vwms]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'vwms', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\vwms.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'vwms_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\vwms_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [vwms] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [vwms].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [vwms] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [vwms] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [vwms] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [vwms] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [vwms] SET ARITHABORT OFF 
GO
ALTER DATABASE [vwms] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [vwms] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [vwms] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [vwms] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [vwms] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [vwms] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [vwms] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [vwms] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [vwms] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [vwms] SET  DISABLE_BROKER 
GO
ALTER DATABASE [vwms] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [vwms] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [vwms] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [vwms] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [vwms] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [vwms] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [vwms] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [vwms] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [vwms] SET  MULTI_USER 
GO
ALTER DATABASE [vwms] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [vwms] SET DB_CHAINING OFF 
GO
ALTER DATABASE [vwms] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [vwms] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [vwms] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [vwms] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [vwms] SET QUERY_STORE = OFF
GO
USE [vwms]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 8/24/2022 23:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Saloon]    Script Date: 8/24/2022 23:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Saloon](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Saloon] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 8/24/2022 23:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Survey]    Script Date: 8/24/2022 23:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Survey](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[IsEnabled] [bit] NOT NULL,
 CONSTRAINT [PK_Survey] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SurveyChoice]    Script Date: 8/24/2022 23:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SurveyChoice](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[SurveyId] [int] NOT NULL,
 CONSTRAINT [PK_SurveyChoice] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SurveyResponse]    Script Date: 8/24/2022 23:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SurveyResponse](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SurveyChoiceId] [int] NOT NULL,
	[ExhibitorId] [int] NOT NULL,
 CONSTRAINT [PK_SurveyResponse] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Time]    Script Date: 8/24/2022 23:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Time](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StartTime] [time](7) NOT NULL,
	[EndTime] [time](7) NOT NULL,
 CONSTRAINT [PK_Time] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 8/24/2022 23:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[PasswordHash] [nchar](128) NOT NULL,
	[IsManager] [bit] NOT NULL,
	[FullName] [nvarchar](100) NOT NULL,
	[PersonalIdentifier] [nvarchar](50) NOT NULL,
	[Telephone] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Workshop]    Script Date: 8/24/2022 23:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Workshop](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Date] [date] NOT NULL,
	[HasWarned] [bit] NOT NULL,
	[SaloonId] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[TimeId] [int] NOT NULL,
	[ExhibitorId] [int] NOT NULL,
	[StatusId] [int] NOT NULL,
 CONSTRAINT [PK_Workshop] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [Name]) VALUES (1, N'Security            ')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (2, N'Trade               ')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (3, N'Technology          ')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (4, N'Network             ')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Saloon] ON 

INSERT [dbo].[Saloon] ([Id], [Name]) VALUES (1, N'North               ')
INSERT [dbo].[Saloon] ([Id], [Name]) VALUES (2, N'East                ')
INSERT [dbo].[Saloon] ([Id], [Name]) VALUES (3, N'South               ')
INSERT [dbo].[Saloon] ([Id], [Name]) VALUES (4, N'West                ')
SET IDENTITY_INSERT [dbo].[Saloon] OFF
GO
SET IDENTITY_INSERT [dbo].[Status] ON 

INSERT [dbo].[Status] ([Id], [Name]) VALUES (1, N'Pending        ')
INSERT [dbo].[Status] ([Id], [Name]) VALUES (2, N'Accepted       ')
INSERT [dbo].[Status] ([Id], [Name]) VALUES (3, N'Rejected       ')
SET IDENTITY_INSERT [dbo].[Status] OFF
GO
SET IDENTITY_INSERT [dbo].[Time] ON 

INSERT [dbo].[Time] ([Id], [StartTime], [EndTime]) VALUES (1, CAST(N'10:00:00' AS Time), CAST(N'12:00:00' AS Time))
INSERT [dbo].[Time] ([Id], [StartTime], [EndTime]) VALUES (3, CAST(N'12:00:00' AS Time), CAST(N'14:00:00' AS Time))
INSERT [dbo].[Time] ([Id], [StartTime], [EndTime]) VALUES (4, CAST(N'14:00:00' AS Time), CAST(N'16:00:00' AS Time))
SET IDENTITY_INSERT [dbo].[Time] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [Username], [PasswordHash], [IsManager], [FullName], [PersonalIdentifier], [Telephone]) VALUES (3, N'admin               ', N'21232F297A57A5A743894A0E4A801FC3                                                                                                ', 1, N'Manager                                                                                             ', N'T01234567A', N'91234567')
INSERT [dbo].[User] ([Id], [Username], [PasswordHash], [IsManager], [FullName], [PersonalIdentifier], [Telephone]) VALUES (4, N'exhibitor1          ', N'81DC9BDB52D04DC20036DBD8313ED055                                                                                                ', 0, N'Ashlee                                                                                              ', N'T01234567A', N'91234567')
INSERT [dbo].[User] ([Id], [Username], [PasswordHash], [IsManager], [FullName], [PersonalIdentifier], [Telephone]) VALUES (5, N'exhibitor2          ', N'81DC9BDB52D04DC20036DBD8313ED055                                                                                                ', 0, N'Viona                                                                                               ', N'T01234567A', N'91234567')
INSERT [dbo].[User] ([Id], [Username], [PasswordHash], [IsManager], [FullName], [PersonalIdentifier], [Telephone]) VALUES (6, N'exhibitor3          ', N'81DC9BDB52D04DC20036DBD8313ED055                                                                                                ', 0, N'Yong Lin                                                                                            ', N'T01234567A', N'91234567')
INSERT [dbo].[User] ([Id], [Username], [PasswordHash], [IsManager], [FullName], [PersonalIdentifier], [Telephone]) VALUES (7, N'exhibitor4          ', N'81DC9BDB52D04DC20036DBD8313ED055                                                                                                ', 0, N'Clara                                                                                               ', N'T01234567A', N'91234567')
INSERT [dbo].[User] ([Id], [Username], [PasswordHash], [IsManager], [FullName], [PersonalIdentifier], [Telephone]) VALUES (8, N'exhibitor5          ', N'81DC9BDB52D04DC20036DBD8313ED055                                                                                                ', 0, N'Betty                                                                                               ', N'T01234567A', N'91234567')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Workshop] ADD  CONSTRAINT [DF_Workshop_HasWarned]  DEFAULT ((0)) FOR [HasWarned]
GO
ALTER TABLE [dbo].[Workshop]  WITH CHECK ADD  CONSTRAINT [FK_Workshop_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Workshop] CHECK CONSTRAINT [FK_Workshop_Category]
GO
ALTER TABLE [dbo].[Workshop]  WITH CHECK ADD  CONSTRAINT [FK_Workshop_Saloon] FOREIGN KEY([SaloonId])
REFERENCES [dbo].[Saloon] ([Id])
GO
ALTER TABLE [dbo].[Workshop] CHECK CONSTRAINT [FK_Workshop_Saloon]
GO
ALTER TABLE [dbo].[Workshop]  WITH CHECK ADD  CONSTRAINT [FK_Workshop_Status] FOREIGN KEY([StatusId])
REFERENCES [dbo].[Status] ([Id])
GO
ALTER TABLE [dbo].[Workshop] CHECK CONSTRAINT [FK_Workshop_Status]
GO
ALTER TABLE [dbo].[Workshop]  WITH CHECK ADD  CONSTRAINT [FK_Workshop_Time] FOREIGN KEY([TimeId])
REFERENCES [dbo].[Time] ([Id])
GO
ALTER TABLE [dbo].[Workshop] CHECK CONSTRAINT [FK_Workshop_Time]
GO
ALTER TABLE [dbo].[Workshop]  WITH CHECK ADD  CONSTRAINT [FK_Workshop_User] FOREIGN KEY([ExhibitorId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Workshop] CHECK CONSTRAINT [FK_Workshop_User]
GO
USE [master]
GO
ALTER DATABASE [vwms] SET  READ_WRITE 
GO
