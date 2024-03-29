USE [master]
GO
/****** Object:  Database [VNPost]    Script Date: 6/23/2019 12:06:14 AM ******/
CREATE DATABASE [VNPost]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'VNPost', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\VNPost.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'VNPost_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\VNPost_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [VNPost] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [VNPost].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [VNPost] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [VNPost] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [VNPost] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [VNPost] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [VNPost] SET ARITHABORT OFF 
GO
ALTER DATABASE [VNPost] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [VNPost] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [VNPost] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [VNPost] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [VNPost] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [VNPost] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [VNPost] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [VNPost] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [VNPost] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [VNPost] SET  DISABLE_BROKER 
GO
ALTER DATABASE [VNPost] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [VNPost] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [VNPost] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [VNPost] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [VNPost] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [VNPost] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [VNPost] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [VNPost] SET RECOVERY FULL 
GO
ALTER DATABASE [VNPost] SET  MULTI_USER 
GO
ALTER DATABASE [VNPost] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [VNPost] SET DB_CHAINING OFF 
GO
ALTER DATABASE [VNPost] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [VNPost] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [VNPost] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'VNPost', N'ON'
GO
ALTER DATABASE [VNPost] SET QUERY_STORE = OFF
GO
USE [VNPost]
GO
/****** Object:  Table [dbo].[Package]    Script Date: 6/23/2019 12:06:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Package](
	[packageId] [char](5) NOT NULL,
	[packageName] [nvarchar](100) NULL,
	[numberOfItem] [int] NULL,
	[packageValue] [decimal](18, 0) NULL,
 CONSTRAINT [PK_Package] PRIMARY KEY CLUSTERED 
(
	[packageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Recipient]    Script Date: 6/23/2019 12:06:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Recipient](
	[recipientId] [int] IDENTITY(1,1) NOT NULL,
	[recipientName] [nvarchar](100) NULL,
	[recipientPhone] [varchar](50) NULL,
	[address] [nvarchar](150) NULL,
 CONSTRAINT [PK_Recipient] PRIMARY KEY CLUSTERED 
(
	[recipientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sender]    Script Date: 6/23/2019 12:06:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sender](
	[senderId] [int] IDENTITY(1,1) NOT NULL,
	[senderName] [nvarchar](100) NULL,
	[senderPhone] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[recipientId] [int] NULL,
	[packageId] [char](5) NULL,
 CONSTRAINT [PK_Sender] PRIMARY KEY CLUSTERED 
(
	[senderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Package] ([packageId], [packageName], [numberOfItem], [packageValue]) VALUES (N'fd76d', N'Bình nước', 1, CAST(100000 AS Decimal(18, 0)))
INSERT [dbo].[Package] ([packageId], [packageName], [numberOfItem], [packageValue]) VALUES (N'uy35w', N'Áo thun', 3, CAST(150000 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[Recipient] ON 

INSERT [dbo].[Recipient] ([recipientId], [recipientName], [recipientPhone], [address]) VALUES (1, N'Nguyễn Thắng', N'0123456789', N'12 Nguyễn Trãi, quận 1, Hồ Chí Minh')
INSERT [dbo].[Recipient] ([recipientId], [recipientName], [recipientPhone], [address]) VALUES (2, N'Trần Bảo', N'0123456789', N'22/4 Lý Thái Tổ, quận 10, Hồ Chí Minh')
SET IDENTITY_INSERT [dbo].[Recipient] OFF
SET IDENTITY_INSERT [dbo].[Sender] ON 

INSERT [dbo].[Sender] ([senderId], [senderName], [senderPhone], [email], [recipientId], [packageId]) VALUES (1, N'Nguyễn Công', N'0768658086', N'congnt@gmail.com', 1, N'fd76d')
INSERT [dbo].[Sender] ([senderId], [senderName], [senderPhone], [email], [recipientId], [packageId]) VALUES (2, N'Nguyễn Khánh', N'0123456789', N'khanh@gmail.com', 2, N'uy35w')
SET IDENTITY_INSERT [dbo].[Sender] OFF
ALTER TABLE [dbo].[Sender]  WITH CHECK ADD  CONSTRAINT [FK_Sender_Package] FOREIGN KEY([packageId])
REFERENCES [dbo].[Package] ([packageId])
GO
ALTER TABLE [dbo].[Sender] CHECK CONSTRAINT [FK_Sender_Package]
GO
ALTER TABLE [dbo].[Sender]  WITH CHECK ADD  CONSTRAINT [FK_Sender_Recipient] FOREIGN KEY([recipientId])
REFERENCES [dbo].[Recipient] ([recipientId])
GO
ALTER TABLE [dbo].[Sender] CHECK CONSTRAINT [FK_Sender_Recipient]
GO
USE [master]
GO
ALTER DATABASE [VNPost] SET  READ_WRITE 
GO
