USE [master]
GO
/****** Object:  Database [QLBanCay]    Script Date: 23/04/2023 02:09:38 CH ******/
CREATE DATABASE [QLBanCay]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLBanCay', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\QLBanCay.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QLBanCay_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\QLBanCay_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [QLBanCay] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLBanCay].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLBanCay] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLBanCay] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLBanCay] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLBanCay] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLBanCay] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLBanCay] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [QLBanCay] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLBanCay] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLBanCay] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLBanCay] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLBanCay] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLBanCay] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLBanCay] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLBanCay] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLBanCay] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QLBanCay] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLBanCay] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLBanCay] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLBanCay] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLBanCay] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLBanCay] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLBanCay] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLBanCay] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QLBanCay] SET  MULTI_USER 
GO
ALTER DATABASE [QLBanCay] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLBanCay] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLBanCay] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLBanCay] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QLBanCay] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QLBanCay] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [QLBanCay] SET QUERY_STORE = OFF
GO
USE [QLBanCay]
GO
/****** Object:  Table [dbo].[cart_details]    Script Date: 23/04/2023 02:09:38 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cart_details](
	[customer_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[amount] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC,
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[category]    Script Date: 23/04/2023 02:09:38 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[id] [int] NOT NULL,
	[name] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customer]    Script Date: 23/04/2023 02:09:38 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer](
	[id] [int] NOT NULL,
	[name] [nvarchar](255) NULL,
	[date_of_birth] [date] NULL,
	[phone_number] [varchar](100) NULL,
	[email] [varchar](255) NULL,
	[password] [varchar](255) NULL,
	[address] [ntext] NULL,
	[registration_time] [datetime] NULL,
	[role] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[manufacturer]    Script Date: 23/04/2023 02:09:38 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[manufacturer](
	[id] [int] NOT NULL,
	[name] [nvarchar](255) NULL,
	[email] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[permission]    Script Date: 23/04/2023 02:09:38 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[permission](
	[id] [int] NOT NULL,
	[position_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[position]    Script Date: 23/04/2023 02:09:38 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[position](
	[id] [int] NOT NULL,
	[name] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 23/04/2023 02:09:38 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[id] [int] NOT NULL,
	[name] [nvarchar](255) NULL,
	[description] [ntext] NULL,
	[price] [money] NULL,
	[manufacturer_id] [int] NULL,
	[image_url] [nvarchar](255) NULL,
	[Categoryid] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sell_receipt]    Script Date: 23/04/2023 02:09:38 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sell_receipt](
	[id] [int] NOT NULL,
	[staff_id] [int] NULL,
	[time] [datetime] NULL,
	[customer_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sell_receipt_details]    Script Date: 23/04/2023 02:09:38 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sell_receipt_details](
	[sell_receipt_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[amount] [int] NULL,
	[discount] [real] NULL,
PRIMARY KEY CLUSTERED 
(
	[sell_receipt_id] ASC,
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[staff]    Script Date: 23/04/2023 02:09:38 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[staff](
	[id] [int] NOT NULL,
	[name] [nvarchar](255) NULL,
	[gender] [bit] NULL,
	[date_of_birth] [date] NULL,
	[address] [ntext] NULL,
	[phone_number] [varchar](100) NULL,
	[email] [varchar](100) NULL,
	[password] [varchar](100) NULL,
	[start_working] [date] NULL,
	[end_working] [date] NULL,
	[position_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tAnhSP]    Script Date: 23/04/2023 02:09:38 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tAnhSP](
	[MaSP] [int] NOT NULL,
	[TenFileAnh] [char](100) NOT NULL,
	[ViTri] [smallint] NULL,
 CONSTRAINT [PK_tAnhSP] PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC,
	[TenFileAnh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[cart_details] ([customer_id], [product_id], [amount]) VALUES (3, 1, 1)
GO
INSERT [dbo].[category] ([id], [name]) VALUES (1, N'Outdoors plants')
INSERT [dbo].[category] ([id], [name]) VALUES (2, N'Indoors plants')
INSERT [dbo].[category] ([id], [name]) VALUES (3, N'Office plants')
INSERT [dbo].[category] ([id], [name]) VALUES (4, N'Potted')
INSERT [dbo].[category] ([id], [name]) VALUES (5, N'Others')
GO
INSERT [dbo].[customer] ([id], [name], [date_of_birth], [phone_number], [email], [password], [address], [registration_time], [role]) VALUES (1, N'Admin', CAST(N'2002-10-03' AS Date), N'0975598573', N'admin@admin.admin', N'e4b8c2fb10e534c635b203129b69e4c9368714c16ceed2d512076a40bbf4c56e', N'BN', CAST(N'2023-04-19T00:00:00.000' AS DateTime), N'Admin')
INSERT [dbo].[customer] ([id], [name], [date_of_birth], [phone_number], [email], [password], [address], [registration_time], [role]) VALUES (2, N'HungAnhss', CAST(N'2002-10-03' AS Date), N'0975598573', N'hunganh03102002@gmail.com', N'91d0080dd78cecf02a98f7bfb9dfaca93273d3f955bf8c7cdaa6bfce87bc7614', N'Đồng Kỵ Từ Sơn Bắc Ninh', CAST(N'2023-04-19T00:00:00.000' AS DateTime), N'User')
INSERT [dbo].[customer] ([id], [name], [date_of_birth], [phone_number], [email], [password], [address], [registration_time], [role]) VALUES (3, N'ANH', CAST(N'2002-06-01' AS Date), N'0975598573', N'caohunganh969@gmail.com', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', N'HN', CAST(N'2023-04-20T00:00:00.000' AS DateTime), N'User')
INSERT [dbo].[customer] ([id], [name], [date_of_birth], [phone_number], [email], [password], [address], [registration_time], [role]) VALUES (4, N'Hung', CAST(N'2002-10-03' AS Date), N'0975598573', N'caohunganh696@gmail.com', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', N'BN', CAST(N'2023-04-22T00:00:00.000' AS DateTime), N'User')
GO
INSERT [dbo].[product] ([id], [name], [description], [price], [manufacturer_id], [image_url], [Categoryid]) VALUES (1, N'Cactus flower', N'Cây nh? xinh phù h?p d? t?ng quà, d? bàn làm vi?c, trang trí quán cà phê...', 3.0000, NULL, N'product-3.jpg', 1)
INSERT [dbo].[product] ([id], [name], [description], [price], [manufacturer_id], [image_url], [Categoryid]) VALUES (2, N'Cây Bàng Nhật', N'Cây có chi?u cao 1m phù h?p d? decor sân vu?n', 10.0000, NULL, N'product-2.jpg', 3)
INSERT [dbo].[product] ([id], [name], [description], [price], [manufacturer_id], [image_url], [Categoryid]) VALUES (3, N'Sen Ðá Giva', N'Cây Sen Ðá Giva có cánh hoi b?u màu xanh, phù h?p làm cây phong th?y cho ngu?i m?nh m?c và h?a', 1.0000, NULL, N'product-5.jpg', 2)
INSERT [dbo].[product] ([id], [name], [description], [price], [manufacturer_id], [image_url], [Categoryid]) VALUES (4, N'Cây Phú Quý để bàn', N'Cây có chi?u cao c? ch?u ch? t? 30-35cm. Màu ch? d?o c?a cây là xanh và d? n?i b?t giúp mang l?i không gian thu giãn, sang tr?ng.', 6.0000, NULL, N'product-4.jpg', 4)
INSERT [dbo].[product] ([id], [name], [description], [price], [manufacturer_id], [image_url], [Categoryid]) VALUES (5, N'Cây Xương Rồng Asterias', N'Cây nh? xinh phù h?p d? t?ng quà, d? bàn làm vi?c, trang trí quán cà phê...', 3.0000, NULL, N'product-5.jpg', 1)
INSERT [dbo].[product] ([id], [name], [description], [price], [manufacturer_id], [image_url], [Categoryid]) VALUES (6, N'Cactus flower', N'Cây nh? xinh phù h?p d? t?ng quà, d? bàn làm vi?c, trang trí quán cà phê...', 3.0000, NULL, N'product-1.jpg', 1)
INSERT [dbo].[product] ([id], [name], [description], [price], [manufacturer_id], [image_url], [Categoryid]) VALUES (7, N'Cactus flower', N'Cây nh? xinh phù h?p d? t?ng quà, d? bàn làm vi?c, trang trí quán cà phê...', 3.0000, NULL, N'product-1.jpg', 1)
INSERT [dbo].[product] ([id], [name], [description], [price], [manufacturer_id], [image_url], [Categoryid]) VALUES (8, N'Cactus flower', N'Cây nh? xinh phù h?p d? t?ng quà, d? bàn làm vi?c, trang trí quán cà phê...', 3.0000, NULL, N'product-1.jpg', 1)
INSERT [dbo].[product] ([id], [name], [description], [price], [manufacturer_id], [image_url], [Categoryid]) VALUES (9, N'Cactus flower', N'Cây nh? xinh phù h?p d? t?ng quà, d? bàn làm vi?c, trang trí quán cà phê...', 3.0000, NULL, N'product-1.jpg', 1)
INSERT [dbo].[product] ([id], [name], [description], [price], [manufacturer_id], [image_url], [Categoryid]) VALUES (10, N'Cactus flower', N'Cây nh? xinh phù h?p d? t?ng quà, d? bàn làm vi?c, trang trí quán cà phê...', 3.0000, NULL, N'product-1.jpg', 1)
INSERT [dbo].[product] ([id], [name], [description], [price], [manufacturer_id], [image_url], [Categoryid]) VALUES (11, N'Cactus flower', N'Cây nh? xinh phù h?p d? t?ng quà, d? bàn làm vi?c, trang trí quán cà phê...', 3.0000, NULL, N'product-1.jpg', 1)
INSERT [dbo].[product] ([id], [name], [description], [price], [manufacturer_id], [image_url], [Categoryid]) VALUES (12, N'Cactus flower', N'Cây nh? xinh phù h?p d? t?ng quà, d? bàn làm vi?c, trang trí quán cà phê...', 4.0000, NULL, N'product-1.jpg', 1)
INSERT [dbo].[product] ([id], [name], [description], [price], [manufacturer_id], [image_url], [Categoryid]) VALUES (13, N'Cây Xuong Rồng Asterias', N'Cây nh? xinh phù h?p d? t?ng quà, d? bàn làm vi?c, trang trí quán cà phê...', 5.0000, NULL, N'product-5.jpg', 1)
INSERT [dbo].[product] ([id], [name], [description], [price], [manufacturer_id], [image_url], [Categoryid]) VALUES (14, N'Cây Xuong Rồng Asterias', N'Cây nh? xinh phù h?p d? t?ng quà, d? bàn làm vi?c, trang trí quán cà phê...', 2.5000, NULL, N'product-5.jpg', 1)
INSERT [dbo].[product] ([id], [name], [description], [price], [manufacturer_id], [image_url], [Categoryid]) VALUES (17, N'Cây gì đó', N'Cay dep qua di', 3.0000, NULL, N'product-3.jpg', 5)
GO
INSERT [dbo].[sell_receipt] ([id], [staff_id], [time], [customer_id]) VALUES (1, NULL, CAST(N'2023-04-21T23:02:58.860' AS DateTime), 2)
INSERT [dbo].[sell_receipt] ([id], [staff_id], [time], [customer_id]) VALUES (2, NULL, CAST(N'2023-04-21T23:12:36.710' AS DateTime), 3)
INSERT [dbo].[sell_receipt] ([id], [staff_id], [time], [customer_id]) VALUES (3, NULL, CAST(N'2023-04-21T23:24:59.703' AS DateTime), 3)
INSERT [dbo].[sell_receipt] ([id], [staff_id], [time], [customer_id]) VALUES (4, NULL, CAST(N'2023-04-23T00:15:21.627' AS DateTime), 2)
INSERT [dbo].[sell_receipt] ([id], [staff_id], [time], [customer_id]) VALUES (5, NULL, CAST(N'2023-04-23T02:22:12.617' AS DateTime), 2)
INSERT [dbo].[sell_receipt] ([id], [staff_id], [time], [customer_id]) VALUES (6, NULL, CAST(N'2023-04-23T03:03:59.337' AS DateTime), 2)
GO
INSERT [dbo].[sell_receipt_details] ([sell_receipt_id], [product_id], [amount], [discount]) VALUES (1, 1, 5, NULL)
INSERT [dbo].[sell_receipt_details] ([sell_receipt_id], [product_id], [amount], [discount]) VALUES (1, 14, 5, NULL)
INSERT [dbo].[sell_receipt_details] ([sell_receipt_id], [product_id], [amount], [discount]) VALUES (2, 1, 1, NULL)
INSERT [dbo].[sell_receipt_details] ([sell_receipt_id], [product_id], [amount], [discount]) VALUES (3, 1, 1, NULL)
INSERT [dbo].[sell_receipt_details] ([sell_receipt_id], [product_id], [amount], [discount]) VALUES (4, 1, 2, NULL)
INSERT [dbo].[sell_receipt_details] ([sell_receipt_id], [product_id], [amount], [discount]) VALUES (4, 14, 5, NULL)
INSERT [dbo].[sell_receipt_details] ([sell_receipt_id], [product_id], [amount], [discount]) VALUES (5, 4, 3, NULL)
INSERT [dbo].[sell_receipt_details] ([sell_receipt_id], [product_id], [amount], [discount]) VALUES (5, 8, 1, NULL)
INSERT [dbo].[sell_receipt_details] ([sell_receipt_id], [product_id], [amount], [discount]) VALUES (6, 2, 2, NULL)
GO
ALTER TABLE [dbo].[cart_details]  WITH CHECK ADD FOREIGN KEY([customer_id])
REFERENCES [dbo].[customer] ([id])
GO
ALTER TABLE [dbo].[permission]  WITH CHECK ADD FOREIGN KEY([position_id])
REFERENCES [dbo].[position] ([id])
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD FOREIGN KEY([Categoryid])
REFERENCES [dbo].[category] ([id])
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD FOREIGN KEY([manufacturer_id])
REFERENCES [dbo].[manufacturer] ([id])
GO
ALTER TABLE [dbo].[sell_receipt]  WITH CHECK ADD FOREIGN KEY([customer_id])
REFERENCES [dbo].[customer] ([id])
GO
ALTER TABLE [dbo].[sell_receipt]  WITH CHECK ADD FOREIGN KEY([staff_id])
REFERENCES [dbo].[staff] ([id])
GO
ALTER TABLE [dbo].[sell_receipt_details]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([id])
GO
ALTER TABLE [dbo].[sell_receipt_details]  WITH CHECK ADD FOREIGN KEY([sell_receipt_id])
REFERENCES [dbo].[sell_receipt] ([id])
GO
ALTER TABLE [dbo].[staff]  WITH CHECK ADD FOREIGN KEY([position_id])
REFERENCES [dbo].[position] ([id])
GO
ALTER TABLE [dbo].[tAnhSP]  WITH CHECK ADD FOREIGN KEY([MaSP])
REFERENCES [dbo].[product] ([id])
GO
USE [master]
GO
ALTER DATABASE [QLBanCay] SET  READ_WRITE 
GO
