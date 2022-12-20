USE [master]
GO
/****** Object:  Database [Session2]    Script Date: 20.12.2022 9:58:35 ******/
CREATE DATABASE [Session2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Session2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLSERVER\MSSQL\DATA\Session2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Session2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLSERVER\MSSQL\DATA\Session2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Session2] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Session2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Session2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Session2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Session2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Session2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Session2] SET ARITHABORT OFF 
GO
ALTER DATABASE [Session2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Session2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Session2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Session2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Session2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Session2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Session2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Session2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Session2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Session2] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Session2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Session2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Session2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Session2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Session2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Session2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Session2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Session2] SET RECOVERY FULL 
GO
ALTER DATABASE [Session2] SET  MULTI_USER 
GO
ALTER DATABASE [Session2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Session2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Session2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Session2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Session2] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Session2', N'ON'
GO
ALTER DATABASE [Session2] SET QUERY_STORE = OFF
GO
USE [Session2]
GO
/****** Object:  Table [dbo].[Абонент]    Script Date: 20.12.2022 9:58:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Абонент](
	[ID] [int] NOT NULL,
	[Фамилия] [varchar](255) NOT NULL,
	[Имя] [varchar](255) NOT NULL,
	[Отчество] [varchar](255) NOT NULL,
	[Адрес] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Города]    Script Date: 20.12.2022 9:58:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Города](
	[Код_города] [int] NOT NULL,
	[Название] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Код_города] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Договор]    Script Date: 20.12.2022 9:58:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Договор](
	[ID] [int] NOT NULL,
	[Номер_договора] [varchar](255) NOT NULL,
	[ID_Телефона] [int] NOT NULL,
 CONSTRAINT [PK__Договор__3214EC276F590F5F] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Разговоры]    Script Date: 20.12.2022 9:58:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Разговоры](
	[ID] [int] NOT NULL,
	[Дата_разговора] [date] NOT NULL,
	[Продолжительность] [int] NOT NULL,
	[ID_Телефона] [int] NOT NULL,
	[Код_Города] [int] NOT NULL,
 CONSTRAINT [PK__Разговор__3214EC2760EE9DE3] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Тариф]    Script Date: 20.12.2022 9:58:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Тариф](
	[ID_Тарифа] [int] NOT NULL,
	[Стоимость] [int] NOT NULL,
	[Признак_оплаты] [varchar](255) NOT NULL,
	[ID_Телефона] [int] NOT NULL,
 CONSTRAINT [PK__Тариф__99E9B0B2965959CD] PRIMARY KEY CLUSTERED 
(
	[ID_Тарифа] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Телефон]    Script Date: 20.12.2022 9:58:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Телефон](
	[ID] [int] NOT NULL,
	[Номер_телефона] [int] NOT NULL,
	[Дата_установки] [date] NOT NULL,
	[ID_Абонента] [int] NOT NULL,
 CONSTRAINT [PK__Телефон__3214EC277FA061BD] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Договор]  WITH CHECK ADD  CONSTRAINT [FK_Договор_Телефон] FOREIGN KEY([ID_Телефона])
REFERENCES [dbo].[Телефон] ([ID])
GO
ALTER TABLE [dbo].[Договор] CHECK CONSTRAINT [FK_Договор_Телефон]
GO
ALTER TABLE [dbo].[Разговоры]  WITH CHECK ADD  CONSTRAINT [FK_Разговоры_Города] FOREIGN KEY([Код_Города])
REFERENCES [dbo].[Города] ([Код_города])
GO
ALTER TABLE [dbo].[Разговоры] CHECK CONSTRAINT [FK_Разговоры_Города]
GO
ALTER TABLE [dbo].[Разговоры]  WITH CHECK ADD  CONSTRAINT [FK_Разговоры_Телефон] FOREIGN KEY([ID_Телефона])
REFERENCES [dbo].[Телефон] ([ID])
GO
ALTER TABLE [dbo].[Разговоры] CHECK CONSTRAINT [FK_Разговоры_Телефон]
GO
ALTER TABLE [dbo].[Тариф]  WITH CHECK ADD  CONSTRAINT [FK_Тариф_Телефон] FOREIGN KEY([ID_Телефона])
REFERENCES [dbo].[Телефон] ([ID])
GO
ALTER TABLE [dbo].[Тариф] CHECK CONSTRAINT [FK_Тариф_Телефон]
GO
ALTER TABLE [dbo].[Телефон]  WITH CHECK ADD  CONSTRAINT [FK_Телефон_Абонент] FOREIGN KEY([ID_Абонента])
REFERENCES [dbo].[Абонент] ([ID])
GO
ALTER TABLE [dbo].[Телефон] CHECK CONSTRAINT [FK_Телефон_Абонент]
GO
/****** Object:  StoredProcedure [dbo].[add_Abonent]    Script Date: 20.12.2022 9:58:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[add_Abonent]
@Фамилия varchar(255),
@Имя varchar(255),
@Отчество varchar(255),
@Адрес varchar(255)
as
BEGIN
INSERT INTO [dbo].[Абонент]
([Фамилия],[Имя],[Отчество],[Адрес])
Values
(@Фамилия,@Имя,@Отчество,@Адрес)
END
GO
USE [master]
GO
ALTER DATABASE [Session2] SET  READ_WRITE 
GO
