USE [master]
GO
/****** Object:  Database [GoPASTA]    Script Date: 2021/7/6 上午 11:31:08 ******/
CREATE DATABASE [GoPASTA]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GoPASTA', FILENAME = N'D:\MySQL2019\GoPASTA.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'GoPASTA_log', FILENAME = N'D:\MySQL2019\GoPASTA_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [GoPASTA] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GoPASTA].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GoPASTA] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GoPASTA] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GoPASTA] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GoPASTA] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GoPASTA] SET ARITHABORT OFF 
GO
ALTER DATABASE [GoPASTA] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [GoPASTA] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GoPASTA] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GoPASTA] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GoPASTA] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GoPASTA] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GoPASTA] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GoPASTA] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GoPASTA] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GoPASTA] SET  DISABLE_BROKER 
GO
ALTER DATABASE [GoPASTA] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GoPASTA] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GoPASTA] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GoPASTA] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GoPASTA] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GoPASTA] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GoPASTA] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GoPASTA] SET RECOVERY FULL 
GO
ALTER DATABASE [GoPASTA] SET  MULTI_USER 
GO
ALTER DATABASE [GoPASTA] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GoPASTA] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GoPASTA] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GoPASTA] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [GoPASTA] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [GoPASTA] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'GoPASTA', N'ON'
GO
ALTER DATABASE [GoPASTA] SET QUERY_STORE = OFF
GO
USE [GoPASTA]
GO
/****** Object:  Table [dbo].[Carts]    Script Date: 2021/7/6 上午 11:31:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carts](
	[rowid] [int] IDENTITY(1,1) NOT NULL,
	[cart_lotno] [nvarchar](50) NULL,
	[mno] [nvarchar](50) NULL,
	[product_no] [nvarchar](50) NULL,
	[Property_select] [nvarchar](50) NULL,
	[qty] [int] NULL,
	[create_time] [datetime] NULL,
	[each_item_amount] [int] NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[rowid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categorys]    Script Date: 2021/7/6 上午 11:31:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorys](
	[rowid] [int] IDENTITY(1,1) NOT NULL,
	[parentid] [int] NULL,
	[category_no] [nvarchar](50) NOT NULL,
	[category_name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Categorys] PRIMARY KEY CLUSTERED 
(
	[rowid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Company]    Script Date: 2021/7/6 上午 11:31:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[rowid] [int] IDENTITY(1,1) NOT NULL,
	[company_id] [int] NULL,
	[brandname] [nvarchar](50) NULL,
	[tel] [nvarchar](50) NULL,
	[fax] [nvarchar](50) NULL,
	[address] [nvarchar](50) NULL,
	[opentime] [time](0) NULL,
	[closetime] [time](0) NULL,
	[public_holiday] [date] NULL,
	[logoimage_path] [nvarchar](50) NULL,
	[indeximage_path] [nvarchar](50) NULL,
 CONSTRAINT [PK_companyinfo] PRIMARY KEY CLUSTERED 
(
	[rowid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Concepts]    Script Date: 2021/7/6 上午 11:31:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Concepts](
	[rowid] [int] NOT NULL,
	[corevalue_title] [nvarchar](50) NULL,
	[corevalue_descpt] [nvarchar](250) NULL,
	[corevalue_path] [nvarchar](50) NULL,
 CONSTRAINT [PK_Concepts] PRIMARY KEY CLUSTERED 
(
	[rowid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MealService]    Script Date: 2021/7/6 上午 11:31:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MealService](
	[rowid] [int] IDENTITY(1,1) NOT NULL,
	[mealservice_no] [nvarchar](50) NULL,
	[mealservice_name] [nvarchar](50) NULL,
	[remark] [nvarchar](250) NULL,
 CONSTRAINT [PK_Shippings] PRIMARY KEY CLUSTERED 
(
	[rowid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 2021/7/6 上午 11:31:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[rowid] [int] IDENTITY(1,1) NOT NULL,
	[order_no] [nvarchar](50) NULL,
	[order_date] [datetime] NULL,
	[mno] [nvarchar](50) NULL,
	[discount_rate] [decimal](18, 4) NULL,
	[taxs] [decimal](18, 4) NULL,
	[total] [decimal](18, 4) NULL,
	[orderstatus_no] [nvarchar](50) NULL,
	[mealservice_no] [nvarchar](50) NULL,
	[SchedulOrderTime] [datetime] NULL,
	[table_no] [nvarchar](50) NULL,
	[paid_no] [nvarchar](50) NULL,
	[receive_name] [nvarchar](50) NULL,
	[receive_phone] [nvarchar](50) NULL,
	[receive_address] [nvarchar](250) NULL,
	[isclosed] [bit] NULL,
	[ispaided] [bit] NULL,
	[order_guid] [nvarchar](50) NULL,
	[cancelorder] [bit] NULL,
	[cancelreason] [nvarchar](50) NULL,
	[remark] [nvarchar](250) NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[rowid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrdersDetails]    Script Date: 2021/7/6 上午 11:31:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrdersDetails](
	[rowid] [int] IDENTITY(1,1) NOT NULL,
	[order_no] [nvarchar](50) NOT NULL,
	[product_no] [nvarchar](50) NULL,
	[Property_select] [nvarchar](50) NULL,
	[each_item_amount] [int] NULL,
	[qty] [int] NULL,
	[discount_rate] [decimal](18, 4) NULL,
	[remark] [nvarchar](250) NULL,
 CONSTRAINT [PK_OrdersDetail_1] PRIMARY KEY CLUSTERED 
(
	[rowid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderStatus]    Script Date: 2021/7/6 上午 11:31:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderStatus](
	[orderstatus_no] [nvarchar](50) NOT NULL,
	[orderstatus_name] [nvarchar](50) NULL,
	[remark] [nvarchar](250) NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[orderstatus_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payments]    Script Date: 2021/7/6 上午 11:31:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payments](
	[rowid] [int] IDENTITY(1,1) NOT NULL,
	[paid_no] [nvarchar](50) NULL,
	[paid_name] [nvarchar](50) NULL,
	[remark] [nvarchar](250) NULL,
 CONSTRAINT [PK_Payments] PRIMARY KEY CLUSTERED 
(
	[rowid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 2021/7/6 上午 11:31:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[product_no] [nvarchar](50) NOT NULL,
	[product_name] [nvarchar](50) NULL,
	[product_spec] [nvarchar](250) NULL,
	[category_no] [nvarchar](50) NULL,
	[price_avgcost] [int] NULL,
	[price_sale] [int] NULL,
	[discount_price] [int] NULL,
	[stock_qty] [int] NULL,
	[image_path] [nvarchar](50) NULL,
	[description] [nvarchar](250) NULL,
	[browse_count] [int] NULL,
	[istop] [bit] NULL,
	[issale] [bit] NULL,
	[ishot] [bit] NULL,
	[remark] [nvarchar](250) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[product_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductsProperty]    Script Date: 2021/7/6 上午 11:31:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductsProperty](
	[rowid] [int] IDENTITY(1,1) NOT NULL,
	[product_no] [nvarchar](50) NULL,
	[Property_no] [nvarchar](50) NULL,
 CONSTRAINT [PK_ProductsProperty] PRIMARY KEY CLUSTERED 
(
	[rowid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Profiles]    Script Date: 2021/7/6 上午 11:31:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Profiles](
	[rowid] [int] IDENTITY(1,1) NOT NULL,
	[company_profile] [nvarchar](250) NULL,
	[profileimage_path] [nvarchar](50) NULL,
 CONSTRAINT [PK_Profiles] PRIMARY KEY CLUSTERED 
(
	[rowid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProgramList]    Script Date: 2021/7/6 上午 11:31:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProgramList](
	[rowid] [int] IDENTITY(1,1) NOT NULL,
	[parentid] [int] NULL,
	[filter_role] [nvarchar](50) NULL,
	[pro_no] [nvarchar](50) NULL,
	[pro_name] [nvarchar](50) NULL,
	[controller_name] [nvarchar](50) NULL,
	[action_name] [nvarchar](50) NULL,
 CONSTRAINT [PK_ProgramList] PRIMARY KEY CLUSTERED 
(
	[rowid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Propertys]    Script Date: 2021/7/6 上午 11:31:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Propertys](
	[rowid] [int] IDENTITY(1,1) NOT NULL,
	[property_no] [nvarchar](50) NULL,
	[property_name] [nvarchar](50) NULL,
	[add_price] [int] NULL,
	[property_value] [nvarchar](50) NULL,
	[remark] [nvarchar](250) NULL,
 CONSTRAINT [PK_Propertys] PRIMARY KEY CLUSTERED 
(
	[rowid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 2021/7/6 上午 11:31:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[role_no] [nvarchar](50) NOT NULL,
	[role_name] [nvarchar](50) NOT NULL,
	[remark] [nvarchar](250) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[role_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 2021/7/6 上午 11:31:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[mno] [nvarchar](50) NULL,
	[mname] [nvarchar](50) NULL,
	[account_name] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NULL,
	[id] [nvarchar](50) NULL,
	[birthday] [datetime] NULL,
	[phone] [nvarchar](50) NULL,
	[address] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[role_no] [nvarchar](50) NULL,
	[varify_code] [nvarchar](50) NULL,
	[isvarify] [bit] NULL,
	[isvalidate] [bit] NULL,
 CONSTRAINT [PK_Users_1] PRIMARY KEY CLUSTERED 
(
	[account_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Carts] ON 

INSERT [dbo].[Carts] ([rowid], [cart_lotno], [mno], [product_no], [Property_select], [qty], [create_time], [each_item_amount]) VALUES (14, N'F2CF2B01-8596-4', N'002', N'A020002', N'', 1, CAST(N'2021-06-06T00:19:41.000' AS DateTime), 350)
INSERT [dbo].[Carts] ([rowid], [cart_lotno], [mno], [product_no], [Property_select], [qty], [create_time], [each_item_amount]) VALUES (23, N'8A3ECF10-6347-4', N'', N'C010001', N'冰塊 : 少冰 ', 1, CAST(N'2021-06-11T22:08:48.000' AS DateTime), 50)
INSERT [dbo].[Carts] ([rowid], [cart_lotno], [mno], [product_no], [Property_select], [qty], [create_time], [each_item_amount]) VALUES (24, N'8A3ECF10-6347-4', N'', N'C010002', N'', 1, CAST(N'2021-06-11T22:08:48.000' AS DateTime), 50)
INSERT [dbo].[Carts] ([rowid], [cart_lotno], [mno], [product_no], [Property_select], [qty], [create_time], [each_item_amount]) VALUES (26, N'7F6289F9-5A40-4', N'', N'A010002', N'', 1, CAST(N'2021-06-11T22:23:29.000' AS DateTime), 280)
INSERT [dbo].[Carts] ([rowid], [cart_lotno], [mno], [product_no], [Property_select], [qty], [create_time], [each_item_amount]) VALUES (27, N'E3343DEB-E558-4', N'', N'A010002', N'', 1, CAST(N'2021-06-11T22:24:42.000' AS DateTime), 280)
INSERT [dbo].[Carts] ([rowid], [cart_lotno], [mno], [product_no], [Property_select], [qty], [create_time], [each_item_amount]) VALUES (28, N'AF45F7B2-377B-4', N'', N'C010001', N'', 5, CAST(N'2021-06-11T22:34:48.000' AS DateTime), 250)
INSERT [dbo].[Carts] ([rowid], [cart_lotno], [mno], [product_no], [Property_select], [qty], [create_time], [each_item_amount]) VALUES (29, N'AF45F7B2-377B-4', N'', N'A020001', N'', 5, CAST(N'2021-06-11T22:34:48.000' AS DateTime), 1500)
INSERT [dbo].[Carts] ([rowid], [cart_lotno], [mno], [product_no], [Property_select], [qty], [create_time], [each_item_amount]) VALUES (30, N'542347EC-8E04-4', N'', N'C010002', N'', 3, CAST(N'2021-06-11T22:41:48.000' AS DateTime), 150)
INSERT [dbo].[Carts] ([rowid], [cart_lotno], [mno], [product_no], [Property_select], [qty], [create_time], [each_item_amount]) VALUES (31, N'96F0A207-B076-4', N'', N'A010002', N'', 1, CAST(N'2021-06-11T22:50:14.000' AS DateTime), 280)
INSERT [dbo].[Carts] ([rowid], [cart_lotno], [mno], [product_no], [Property_select], [qty], [create_time], [each_item_amount]) VALUES (35, N'68683E40-9C10-4', N'', N'A020002', N'', 5, CAST(N'2021-06-12T20:36:26.000' AS DateTime), 1750)
INSERT [dbo].[Carts] ([rowid], [cart_lotno], [mno], [product_no], [Property_select], [qty], [create_time], [each_item_amount]) VALUES (36, N'A0497F2B-A186-4', N'', N'B010001', N'', 2, CAST(N'2021-06-12T21:56:00.000' AS DateTime), 160)
INSERT [dbo].[Carts] ([rowid], [cart_lotno], [mno], [product_no], [Property_select], [qty], [create_time], [each_item_amount]) VALUES (38, N'B45E481C-A628-4', N'', N'C010001', N'冰塊 : 微冰 ', 1, CAST(N'2021-06-16T10:08:14.000' AS DateTime), 50)
INSERT [dbo].[Carts] ([rowid], [cart_lotno], [mno], [product_no], [Property_select], [qty], [create_time], [each_item_amount]) VALUES (61, N'', N'admin', N'C010001', N'', 1, CAST(N'2021-07-05T11:44:16.000' AS DateTime), 50)
INSERT [dbo].[Carts] ([rowid], [cart_lotno], [mno], [product_no], [Property_select], [qty], [create_time], [each_item_amount]) VALUES (62, N'', N'admin', N'C010002', N'', 1, CAST(N'2021-07-05T11:44:16.000' AS DateTime), 50)
SET IDENTITY_INSERT [dbo].[Carts] OFF
GO
SET IDENTITY_INSERT [dbo].[Categorys] ON 

INSERT [dbo].[Categorys] ([rowid], [parentid], [category_no], [category_name]) VALUES (1, 0, N'A', N'主餐')
INSERT [dbo].[Categorys] ([rowid], [parentid], [category_no], [category_name]) VALUES (2, 0, N'B', N'副餐')
INSERT [dbo].[Categorys] ([rowid], [parentid], [category_no], [category_name]) VALUES (3, 0, N'C', N'飲料')
INSERT [dbo].[Categorys] ([rowid], [parentid], [category_no], [category_name]) VALUES (4, 1, N'A01', N'義大利麵')
INSERT [dbo].[Categorys] ([rowid], [parentid], [category_no], [category_name]) VALUES (5, 1, N'A02', N'千層麵')
INSERT [dbo].[Categorys] ([rowid], [parentid], [category_no], [category_name]) VALUES (6, 2, N'B01', N'油炸類')
INSERT [dbo].[Categorys] ([rowid], [parentid], [category_no], [category_name]) VALUES (7, 2, N'B02', N'沙拉類')
INSERT [dbo].[Categorys] ([rowid], [parentid], [category_no], [category_name]) VALUES (8, 3, N'C01', N'汽水類')
INSERT [dbo].[Categorys] ([rowid], [parentid], [category_no], [category_name]) VALUES (9, 3, N'C02', N'茶類')
INSERT [dbo].[Categorys] ([rowid], [parentid], [category_no], [category_name]) VALUES (18, 1, N'A03', N'Z011111')
INSERT [dbo].[Categorys] ([rowid], [parentid], [category_no], [category_name]) VALUES (20, 19, N'F01', N'蛋糕')
INSERT [dbo].[Categorys] ([rowid], [parentid], [category_no], [category_name]) VALUES (23, 21, N'D01', N'肉丸')
INSERT [dbo].[Categorys] ([rowid], [parentid], [category_no], [category_name]) VALUES (24, 19, N'F02', N'奶凍')
SET IDENTITY_INSERT [dbo].[Categorys] OFF
GO
SET IDENTITY_INSERT [dbo].[MealService] ON 

INSERT [dbo].[MealService] ([rowid], [mealservice_no], [mealservice_name], [remark]) VALUES (1, N'A', N'內用', NULL)
INSERT [dbo].[MealService] ([rowid], [mealservice_no], [mealservice_name], [remark]) VALUES (2, N'B', N'外帶(自取)', NULL)
INSERT [dbo].[MealService] ([rowid], [mealservice_no], [mealservice_name], [remark]) VALUES (3, N'C', N'外送', NULL)
SET IDENTITY_INSERT [dbo].[MealService] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([rowid], [order_no], [order_date], [mno], [discount_rate], [taxs], [total], [orderstatus_no], [mealservice_no], [SchedulOrderTime], [table_no], [paid_no], [receive_name], [receive_phone], [receive_address], [isclosed], [ispaided], [order_guid], [cancelorder], [cancelreason], [remark]) VALUES (1, N'C-O20210611000001', CAST(N'2021-06-11T21:49:50.717' AS DateTime), N'mimi', NULL, NULL, CAST(80.0000 AS Decimal(18, 4)), N'TBC', N'C', CAST(N'2021-06-11T21:48:28.000' AS DateTime), NULL, N'P03', N'黃怡萱', N'+886910543522', N'廣豐路42-1號', 0, 0, N'205ab41c-5db1-4997-87ef-6', 0, N'', N'')
INSERT [dbo].[Orders] ([rowid], [order_no], [order_date], [mno], [discount_rate], [taxs], [total], [orderstatus_no], [mealservice_no], [SchedulOrderTime], [table_no], [paid_no], [receive_name], [receive_phone], [receive_address], [isclosed], [ispaided], [order_guid], [cancelorder], [cancelreason], [remark]) VALUES (2, N'A-O20210612000001', CAST(N'2021-06-12T21:58:34.020' AS DateTime), N'', NULL, NULL, CAST(160.0000 AS Decimal(18, 4)), N'TBC', N'A', CAST(N'2021-06-12T21:58:23.000' AS DateTime), N'B', N'P02', NULL, NULL, NULL, 0, 0, N'b5c6949a-1797-49bd-b9de-7', 0, N'', N'')
INSERT [dbo].[Orders] ([rowid], [order_no], [order_date], [mno], [discount_rate], [taxs], [total], [orderstatus_no], [mealservice_no], [SchedulOrderTime], [table_no], [paid_no], [receive_name], [receive_phone], [receive_address], [isclosed], [ispaided], [order_guid], [cancelorder], [cancelreason], [remark]) VALUES (3, N'A-O20210613000001', CAST(N'2021-06-13T09:52:40.433' AS DateTime), N'', NULL, NULL, CAST(0.0000 AS Decimal(18, 4)), N'TBC', N'A', CAST(N'2021-06-13T09:52:22.000' AS DateTime), N'B', NULL, NULL, NULL, NULL, 0, 0, N'3f46531d-c071-4468-82c5-9', 0, N'', N'')
INSERT [dbo].[Orders] ([rowid], [order_no], [order_date], [mno], [discount_rate], [taxs], [total], [orderstatus_no], [mealservice_no], [SchedulOrderTime], [table_no], [paid_no], [receive_name], [receive_phone], [receive_address], [isclosed], [ispaided], [order_guid], [cancelorder], [cancelreason], [remark]) VALUES (4, N'B-O20210616000001', CAST(N'2021-06-16T16:59:40.620' AS DateTime), N'001', NULL, NULL, CAST(1770.0000 AS Decimal(18, 4)), N'TBC', N'B', CAST(N'2021-06-18T20:35:00.000' AS DateTime), NULL, NULL, N'供祚誑', N'0998546845', NULL, 0, 0, N'd28e9c07-0fff-40eb-a632-2', 0, N'', N'')
INSERT [dbo].[Orders] ([rowid], [order_no], [order_date], [mno], [discount_rate], [taxs], [total], [orderstatus_no], [mealservice_no], [SchedulOrderTime], [table_no], [paid_no], [receive_name], [receive_phone], [receive_address], [isclosed], [ispaided], [order_guid], [cancelorder], [cancelreason], [remark]) VALUES (5, N'A-O20210618000001', CAST(N'2021-06-18T00:00:00.000' AS DateTime), N'001', NULL, NULL, CAST(1900.0000 AS Decimal(18, 4)), N'ALD', N'A', CAST(N'2021-06-18T00:00:00.000' AS DateTime), N'A', N'P01', NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([rowid], [order_no], [order_date], [mno], [discount_rate], [taxs], [total], [orderstatus_no], [mealservice_no], [SchedulOrderTime], [table_no], [paid_no], [receive_name], [receive_phone], [receive_address], [isclosed], [ispaided], [order_guid], [cancelorder], [cancelreason], [remark]) VALUES (6, N'A-O20210618000002', CAST(N'2021-06-18T17:16:19.870' AS DateTime), N'001', NULL, NULL, CAST(1770.0000 AS Decimal(18, 4)), N'ALD', N'A', CAST(N'2021-06-18T17:16:11.000' AS DateTime), N'B', N'P04', N'供祚誑', N'0998546845', NULL, 1, 1, N'c81a7af6-2750-4289-ac84-9', 0, N'', N'')
INSERT [dbo].[Orders] ([rowid], [order_no], [order_date], [mno], [discount_rate], [taxs], [total], [orderstatus_no], [mealservice_no], [SchedulOrderTime], [table_no], [paid_no], [receive_name], [receive_phone], [receive_address], [isclosed], [ispaided], [order_guid], [cancelorder], [cancelreason], [remark]) VALUES (7, N'B-O20210618000001', CAST(N'2021-06-18T17:26:12.057' AS DateTime), N'001', NULL, NULL, CAST(1770.0000 AS Decimal(18, 4)), N'TBC', N'B', CAST(N'2021-06-18T17:25:55.000' AS DateTime), NULL, N'P02', N'供祚誑', N'0998546845', NULL, 0, 0, N'b33b1650-1502-47f2-8b34-b', 0, N'', N'')
INSERT [dbo].[Orders] ([rowid], [order_no], [order_date], [mno], [discount_rate], [taxs], [total], [orderstatus_no], [mealservice_no], [SchedulOrderTime], [table_no], [paid_no], [receive_name], [receive_phone], [receive_address], [isclosed], [ispaided], [order_guid], [cancelorder], [cancelreason], [remark]) VALUES (8, N'B-O20210618000002', CAST(N'2021-06-06T00:00:00.000' AS DateTime), N'mimi', NULL, NULL, NULL, NULL, N'B', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([rowid], [order_no], [order_date], [mno], [discount_rate], [taxs], [total], [orderstatus_no], [mealservice_no], [SchedulOrderTime], [table_no], [paid_no], [receive_name], [receive_phone], [receive_address], [isclosed], [ispaided], [order_guid], [cancelorder], [cancelreason], [remark]) VALUES (9, N'A-O20210621000001', CAST(N'2021-06-21T14:43:45.977' AS DateTime), N'001', NULL, NULL, CAST(0.0000 AS Decimal(18, 4)), N'TBC', N'A', CAST(N'2021-06-21T14:43:36.000' AS DateTime), N'6', N'P01', N'供祚誑', N'0998546845', NULL, 0, 0, N'5bc169fc-511a-4fc2-9663-f', 0, N'', N'')
INSERT [dbo].[Orders] ([rowid], [order_no], [order_date], [mno], [discount_rate], [taxs], [total], [orderstatus_no], [mealservice_no], [SchedulOrderTime], [table_no], [paid_no], [receive_name], [receive_phone], [receive_address], [isclosed], [ispaided], [order_guid], [cancelorder], [cancelreason], [remark]) VALUES (10, N'C-O20210621000001', CAST(N'2021-06-21T14:54:32.803' AS DateTime), N'001', NULL, NULL, CAST(710.0000 AS Decimal(18, 4)), N'TBC', N'C', CAST(N'2021-06-21T14:54:05.000' AS DateTime), NULL, N'P01', N'供祚誑', N'0998546845', N'100臺北市中正區test123', 0, 0, N'5269711b-627c-4ddc-b1ee-e', 0, N'', N'')
INSERT [dbo].[Orders] ([rowid], [order_no], [order_date], [mno], [discount_rate], [taxs], [total], [orderstatus_no], [mealservice_no], [SchedulOrderTime], [table_no], [paid_no], [receive_name], [receive_phone], [receive_address], [isclosed], [ispaided], [order_guid], [cancelorder], [cancelreason], [remark]) VALUES (11, N'C-O20210621000002', CAST(N'2021-06-21T14:59:25.897' AS DateTime), N'001', NULL, NULL, CAST(5500.0000 AS Decimal(18, 4)), N'TBC', N'C', CAST(N'2021-06-21T14:58:31.000' AS DateTime), NULL, N'P02', N'供祚誑', N'0998546845', N'300新竹市東區100臺北市中正區test123', 0, 0, N'fe321e28-c521-4325-a40d-a', 0, N'', N'')
INSERT [dbo].[Orders] ([rowid], [order_no], [order_date], [mno], [discount_rate], [taxs], [total], [orderstatus_no], [mealservice_no], [SchedulOrderTime], [table_no], [paid_no], [receive_name], [receive_phone], [receive_address], [isclosed], [ispaided], [order_guid], [cancelorder], [cancelreason], [remark]) VALUES (12, N'C-O20210622000001', CAST(N'2021-06-22T20:14:24.863' AS DateTime), N'001', NULL, NULL, CAST(1320.0000 AS Decimal(18, 4)), N'TBC', N'C', CAST(N'2021-06-22T20:14:13.000' AS DateTime), NULL, NULL, N'供祚誑', N'0998546845', N'200基隆市仁愛區100臺北市中正區test123', 0, 0, N'fbbead6e-1502-40d4-bcba-6', 0, N'', N'')
INSERT [dbo].[Orders] ([rowid], [order_no], [order_date], [mno], [discount_rate], [taxs], [total], [orderstatus_no], [mealservice_no], [SchedulOrderTime], [table_no], [paid_no], [receive_name], [receive_phone], [receive_address], [isclosed], [ispaided], [order_guid], [cancelorder], [cancelreason], [remark]) VALUES (13, N'B-O20210622000001', CAST(N'2021-06-22T21:32:08.583' AS DateTime), N'001', NULL, NULL, CAST(400.0000 AS Decimal(18, 4)), N'TBC', N'B', CAST(N'2021-06-22T21:31:58.000' AS DateTime), NULL, NULL, N'供祚誑', N'0998546845', NULL, 0, 0, N'ef421f15-0051-4cbf-b311-b', 0, N'', N'')
INSERT [dbo].[Orders] ([rowid], [order_no], [order_date], [mno], [discount_rate], [taxs], [total], [orderstatus_no], [mealservice_no], [SchedulOrderTime], [table_no], [paid_no], [receive_name], [receive_phone], [receive_address], [isclosed], [ispaided], [order_guid], [cancelorder], [cancelreason], [remark]) VALUES (14, N'C-O20210624000001', CAST(N'2021-06-24T13:07:21.087' AS DateTime), N'001', NULL, NULL, CAST(1250.0000 AS Decimal(18, 4)), N'TBC', N'C', CAST(N'2021-06-24T13:07:04.000' AS DateTime), NULL, N'P01', N'供祚誑', N'0998546845', N'100臺北市中正區100臺北市中正區test123', 0, 0, N'f5a05ef0-3bce-4ce0-bff7-4', 0, N'', N'')
INSERT [dbo].[Orders] ([rowid], [order_no], [order_date], [mno], [discount_rate], [taxs], [total], [orderstatus_no], [mealservice_no], [SchedulOrderTime], [table_no], [paid_no], [receive_name], [receive_phone], [receive_address], [isclosed], [ispaided], [order_guid], [cancelorder], [cancelreason], [remark]) VALUES (15, N'A-O20210624000001', CAST(N'2021-06-24T15:41:21.853' AS DateTime), N'001', NULL, NULL, CAST(560.0000 AS Decimal(18, 4)), N'TBC', N'A', CAST(N'2021-06-24T15:41:08.000' AS DateTime), N'6', N'P01', N'供祚誑', N'0998546845', NULL, 0, 0, N'5431d645-51d1-4c1d-9796-f', 0, N'', N'')
INSERT [dbo].[Orders] ([rowid], [order_no], [order_date], [mno], [discount_rate], [taxs], [total], [orderstatus_no], [mealservice_no], [SchedulOrderTime], [table_no], [paid_no], [receive_name], [receive_phone], [receive_address], [isclosed], [ispaided], [order_guid], [cancelorder], [cancelreason], [remark]) VALUES (16, N'A-O20210624000002', CAST(N'2021-06-24T15:50:13.677' AS DateTime), N'', NULL, NULL, CAST(160.0000 AS Decimal(18, 4)), N'TBC', N'A', CAST(N'2021-06-24T15:50:01.000' AS DateTime), N'6', NULL, NULL, NULL, NULL, 0, 0, N'20092949-3a33-4614-adbd-9', 0, N'', N'')
INSERT [dbo].[Orders] ([rowid], [order_no], [order_date], [mno], [discount_rate], [taxs], [total], [orderstatus_no], [mealservice_no], [SchedulOrderTime], [table_no], [paid_no], [receive_name], [receive_phone], [receive_address], [isclosed], [ispaided], [order_guid], [cancelorder], [cancelreason], [remark]) VALUES (17, N'C-O20210628000001', CAST(N'2021-06-28T14:09:33.053' AS DateTime), N'001', NULL, NULL, CAST(350.0000 AS Decimal(18, 4)), N'TBC', N'C', CAST(N'2021-06-28T14:09:23.000' AS DateTime), NULL, NULL, N'供祚誑', N'0998546845', N'260宜蘭縣宜蘭市123', 0, 0, N'79f5127a-e946-48b6-b183-b', 0, N'', N'')
INSERT [dbo].[Orders] ([rowid], [order_no], [order_date], [mno], [discount_rate], [taxs], [total], [orderstatus_no], [mealservice_no], [SchedulOrderTime], [table_no], [paid_no], [receive_name], [receive_phone], [receive_address], [isclosed], [ispaided], [order_guid], [cancelorder], [cancelreason], [remark]) VALUES (18, N'A-O20210703000001', CAST(N'2021-07-03T17:38:12.113' AS DateTime), N'001', NULL, NULL, CAST(510.0000 AS Decimal(18, 4)), N'TBC', N'A', CAST(N'2021-07-03T17:37:43.000' AS DateTime), N'6', N'P02', N'供祚誑', N'0998546845', NULL, 0, 1, N'f671de97-23b8-4d54-b73e-e', 0, N'', N'')
INSERT [dbo].[Orders] ([rowid], [order_no], [order_date], [mno], [discount_rate], [taxs], [total], [orderstatus_no], [mealservice_no], [SchedulOrderTime], [table_no], [paid_no], [receive_name], [receive_phone], [receive_address], [isclosed], [ispaided], [order_guid], [cancelorder], [cancelreason], [remark]) VALUES (19, N'A-O20210703000002', CAST(N'2021-07-03T17:40:06.000' AS DateTime), NULL, NULL, NULL, CAST(350.0000 AS Decimal(18, 4)), N'TBP', N'A', CAST(N'2021-07-03T17:39:53.000' AS DateTime), N'6', N'P01', NULL, NULL, NULL, 0, 1, N'b99571d5-927c-4b5a-ad8a-2', 0, N'', N'')
INSERT [dbo].[Orders] ([rowid], [order_no], [order_date], [mno], [discount_rate], [taxs], [total], [orderstatus_no], [mealservice_no], [SchedulOrderTime], [table_no], [paid_no], [receive_name], [receive_phone], [receive_address], [isclosed], [ispaided], [order_guid], [cancelorder], [cancelreason], [remark]) VALUES (20, N'A-O20210703000003', CAST(N'2021-07-03T17:53:38.167' AS DateTime), NULL, NULL, NULL, CAST(830.0000 AS Decimal(18, 4)), N'TBP', N'A', CAST(N'2021-07-03T17:53:20.000' AS DateTime), N'6', N'P02', NULL, NULL, NULL, 0, 1, N'fbe7f2fc-f55a-41a4-8995-4', 0, N'', N'')
INSERT [dbo].[Orders] ([rowid], [order_no], [order_date], [mno], [discount_rate], [taxs], [total], [orderstatus_no], [mealservice_no], [SchedulOrderTime], [table_no], [paid_no], [receive_name], [receive_phone], [receive_address], [isclosed], [ispaided], [order_guid], [cancelorder], [cancelreason], [remark]) VALUES (21, N'A-O20210703000004', CAST(N'2021-07-03T17:54:23.033' AS DateTime), NULL, NULL, NULL, CAST(330.0000 AS Decimal(18, 4)), N'TBP', N'A', CAST(N'2021-07-03T17:54:21.140' AS DateTime), N'6', NULL, NULL, NULL, NULL, 0, 0, N'837f2ae4-fbe1-4cfa-ae45-0', 0, N'', N'')
INSERT [dbo].[Orders] ([rowid], [order_no], [order_date], [mno], [discount_rate], [taxs], [total], [orderstatus_no], [mealservice_no], [SchedulOrderTime], [table_no], [paid_no], [receive_name], [receive_phone], [receive_address], [isclosed], [ispaided], [order_guid], [cancelorder], [cancelreason], [remark]) VALUES (22, N'A-O20210703000005', CAST(N'2021-07-03T17:56:42.600' AS DateTime), NULL, NULL, NULL, CAST(50.0000 AS Decimal(18, 4)), N'TBP', N'A', CAST(N'2021-07-03T17:55:57.000' AS DateTime), N'6', N'P01', NULL, NULL, NULL, 0, 1, N'5c3ca615-8c9b-4632-9f91-2', 0, N'', N'')
INSERT [dbo].[Orders] ([rowid], [order_no], [order_date], [mno], [discount_rate], [taxs], [total], [orderstatus_no], [mealservice_no], [SchedulOrderTime], [table_no], [paid_no], [receive_name], [receive_phone], [receive_address], [isclosed], [ispaided], [order_guid], [cancelorder], [cancelreason], [remark]) VALUES (23, N'A-O20210705000001', CAST(N'2021-07-05T07:50:10.027' AS DateTime), N'001', NULL, NULL, CAST(50.0000 AS Decimal(18, 4)), N'TBC', N'A', CAST(N'2021-07-05T07:50:00.000' AS DateTime), N'6', N'P01', N'供祚誑', N'0998546845', NULL, 0, 0, N'770f9916-5ace-4fb4-805c-8', 0, N'', N'')
INSERT [dbo].[Orders] ([rowid], [order_no], [order_date], [mno], [discount_rate], [taxs], [total], [orderstatus_no], [mealservice_no], [SchedulOrderTime], [table_no], [paid_no], [receive_name], [receive_phone], [receive_address], [isclosed], [ispaided], [order_guid], [cancelorder], [cancelreason], [remark]) VALUES (24, N'A-O20210705000002', CAST(N'2021-07-05T12:07:45.750' AS DateTime), NULL, NULL, NULL, CAST(400.0000 AS Decimal(18, 4)), N'TBP', N'A', CAST(N'2021-07-05T12:07:33.000' AS DateTime), N'6', N'P01', NULL, NULL, NULL, 0, 1, N'd5ede4c2-4664-4642-89ea-7', 0, N'', N'')
INSERT [dbo].[Orders] ([rowid], [order_no], [order_date], [mno], [discount_rate], [taxs], [total], [orderstatus_no], [mealservice_no], [SchedulOrderTime], [table_no], [paid_no], [receive_name], [receive_phone], [receive_address], [isclosed], [ispaided], [order_guid], [cancelorder], [cancelreason], [remark]) VALUES (25, N'A-O20210705000003', CAST(N'2021-07-05T13:52:11.417' AS DateTime), NULL, NULL, NULL, CAST(400.0000 AS Decimal(18, 4)), N'TBP', N'A', CAST(N'2021-07-05T13:52:03.000' AS DateTime), N'6', N'P01', NULL, NULL, NULL, 0, 1, N'0d2d47a3-3da6-4002-a325-c', 0, N'', N'')
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[OrdersDetails] ON 

INSERT [dbo].[OrdersDetails] ([rowid], [order_no], [product_no], [Property_select], [each_item_amount], [qty], [discount_rate], [remark]) VALUES (1, N'C-O20210611000001', N'B010001', N'', 80, 1, NULL, N'')
INSERT [dbo].[OrdersDetails] ([rowid], [order_no], [product_no], [Property_select], [each_item_amount], [qty], [discount_rate], [remark]) VALUES (2, N'A-O20210612000001', N'B010001', N'', 160, 2, NULL, N'')
INSERT [dbo].[OrdersDetails] ([rowid], [order_no], [product_no], [Property_select], [each_item_amount], [qty], [discount_rate], [remark]) VALUES (3, N'B-O20210616000001', N'A010002', N'', 560, 2, NULL, N'')
INSERT [dbo].[OrdersDetails] ([rowid], [order_no], [product_no], [Property_select], [each_item_amount], [qty], [discount_rate], [remark]) VALUES (4, N'B-O20210616000001', N'A010001', N'辣度 : 中辣 ', 750, 3, NULL, N'')
INSERT [dbo].[OrdersDetails] ([rowid], [order_no], [product_no], [Property_select], [each_item_amount], [qty], [discount_rate], [remark]) VALUES (5, N'B-O20210616000001', N'B010001', N'', 80, 1, NULL, N'')
INSERT [dbo].[OrdersDetails] ([rowid], [order_no], [product_no], [Property_select], [each_item_amount], [qty], [discount_rate], [remark]) VALUES (6, N'B-O20210616000001', N'C010001', N'冰塊 : 去冰 ', 50, 1, NULL, N'')
INSERT [dbo].[OrdersDetails] ([rowid], [order_no], [product_no], [Property_select], [each_item_amount], [qty], [discount_rate], [remark]) VALUES (7, N'B-O20210616000001', N'B010001', N'', 80, 1, NULL, N'')
INSERT [dbo].[OrdersDetails] ([rowid], [order_no], [product_no], [Property_select], [each_item_amount], [qty], [discount_rate], [remark]) VALUES (8, N'B-O20210616000001', N'C010001', N'冰塊 : 正常冰 ', 250, 5, NULL, N'')
INSERT [dbo].[OrdersDetails] ([rowid], [order_no], [product_no], [Property_select], [each_item_amount], [qty], [discount_rate], [remark]) VALUES (9, N'A-O20210618000002', N'A010002', N'', 560, 2, NULL, N'')
INSERT [dbo].[OrdersDetails] ([rowid], [order_no], [product_no], [Property_select], [each_item_amount], [qty], [discount_rate], [remark]) VALUES (10, N'A-O20210618000002', N'A010001', N'辣度 : 中辣 ', 750, 3, NULL, N'')
INSERT [dbo].[OrdersDetails] ([rowid], [order_no], [product_no], [Property_select], [each_item_amount], [qty], [discount_rate], [remark]) VALUES (11, N'A-O20210618000002', N'B010001', N'', 80, 1, NULL, N'')
INSERT [dbo].[OrdersDetails] ([rowid], [order_no], [product_no], [Property_select], [each_item_amount], [qty], [discount_rate], [remark]) VALUES (12, N'A-O20210618000002', N'C010001', N'冰塊 : 去冰 ', 50, 1, NULL, N'')
INSERT [dbo].[OrdersDetails] ([rowid], [order_no], [product_no], [Property_select], [each_item_amount], [qty], [discount_rate], [remark]) VALUES (13, N'A-O20210618000002', N'B010001', N'', 80, 1, NULL, N'')
INSERT [dbo].[OrdersDetails] ([rowid], [order_no], [product_no], [Property_select], [each_item_amount], [qty], [discount_rate], [remark]) VALUES (14, N'A-O20210618000002', N'C010001', N'冰塊 : 正常冰 ', 250, 5, NULL, N'')
INSERT [dbo].[OrdersDetails] ([rowid], [order_no], [product_no], [Property_select], [each_item_amount], [qty], [discount_rate], [remark]) VALUES (15, N'B-O20210618000001', N'A010002', N'', 560, 2, NULL, N'')
INSERT [dbo].[OrdersDetails] ([rowid], [order_no], [product_no], [Property_select], [each_item_amount], [qty], [discount_rate], [remark]) VALUES (16, N'B-O20210618000001', N'A010001', N'辣度 : 中辣 ', 750, 3, NULL, N'')
INSERT [dbo].[OrdersDetails] ([rowid], [order_no], [product_no], [Property_select], [each_item_amount], [qty], [discount_rate], [remark]) VALUES (17, N'B-O20210618000001', N'B010001', N'', 80, 1, NULL, N'')
INSERT [dbo].[OrdersDetails] ([rowid], [order_no], [product_no], [Property_select], [each_item_amount], [qty], [discount_rate], [remark]) VALUES (18, N'B-O20210618000001', N'C010001', N'冰塊 : 去冰 ', 50, 1, NULL, N'')
INSERT [dbo].[OrdersDetails] ([rowid], [order_no], [product_no], [Property_select], [each_item_amount], [qty], [discount_rate], [remark]) VALUES (19, N'B-O20210618000001', N'B010001', N'', 80, 1, NULL, N'')
INSERT [dbo].[OrdersDetails] ([rowid], [order_no], [product_no], [Property_select], [each_item_amount], [qty], [discount_rate], [remark]) VALUES (20, N'B-O20210618000001', N'C010001', N'冰塊 : 正常冰 ', 250, 5, NULL, N'')
INSERT [dbo].[OrdersDetails] ([rowid], [order_no], [product_no], [Property_select], [each_item_amount], [qty], [discount_rate], [remark]) VALUES (21, N'A-O20210618000001', N'C010001', N'冰塊 : 正常冰 ', 50, 5, NULL, NULL)
INSERT [dbo].[OrdersDetails] ([rowid], [order_no], [product_no], [Property_select], [each_item_amount], [qty], [discount_rate], [remark]) VALUES (22, N'A-O20210618000001', N'B010001', NULL, 80, 1, NULL, NULL)
INSERT [dbo].[OrdersDetails] ([rowid], [order_no], [product_no], [Property_select], [each_item_amount], [qty], [discount_rate], [remark]) VALUES (23, N'C-O20210621000001', N'A010002', N'', 560, 2, NULL, N'')
INSERT [dbo].[OrdersDetails] ([rowid], [order_no], [product_no], [Property_select], [each_item_amount], [qty], [discount_rate], [remark]) VALUES (24, N'C-O20210621000001', N'C010002', N'', 150, 3, NULL, N'')
INSERT [dbo].[OrdersDetails] ([rowid], [order_no], [product_no], [Property_select], [each_item_amount], [qty], [discount_rate], [remark]) VALUES (25, N'C-O20210621000002', N'A020002', N'', 2800, 8, NULL, N'')
INSERT [dbo].[OrdersDetails] ([rowid], [order_no], [product_no], [Property_select], [each_item_amount], [qty], [discount_rate], [remark]) VALUES (26, N'C-O20210621000002', N'A020001', N'', 2700, 9, NULL, N'')
INSERT [dbo].[OrdersDetails] ([rowid], [order_no], [product_no], [Property_select], [each_item_amount], [qty], [discount_rate], [remark]) VALUES (27, N'C-O20210622000001', N'C010002', N'', 200, 4, NULL, N'')
INSERT [dbo].[OrdersDetails] ([rowid], [order_no], [product_no], [Property_select], [each_item_amount], [qty], [discount_rate], [remark]) VALUES (28, N'C-O20210622000001', N'A010002', N'', 1120, 4, NULL, N'')
INSERT [dbo].[OrdersDetails] ([rowid], [order_no], [product_no], [Property_select], [each_item_amount], [qty], [discount_rate], [remark]) VALUES (29, N'B-O20210622000001', N'C010002', N'', 150, 3, NULL, N'')
INSERT [dbo].[OrdersDetails] ([rowid], [order_no], [product_no], [Property_select], [each_item_amount], [qty], [discount_rate], [remark]) VALUES (30, N'B-O20210622000001', N'A010001', N'', 250, 1, NULL, N'')
INSERT [dbo].[OrdersDetails] ([rowid], [order_no], [product_no], [Property_select], [each_item_amount], [qty], [discount_rate], [remark]) VALUES (31, N'C-O20210624000001', N'A020002', N'', 350, 1, NULL, N'')
INSERT [dbo].[OrdersDetails] ([rowid], [order_no], [product_no], [Property_select], [each_item_amount], [qty], [discount_rate], [remark]) VALUES (32, N'C-O20210624000001', N'B020002', N'', 720, 4, NULL, N'')
INSERT [dbo].[OrdersDetails] ([rowid], [order_no], [product_no], [Property_select], [each_item_amount], [qty], [discount_rate], [remark]) VALUES (33, N'C-O20210624000001', N'B020001', N'', 180, 1, NULL, N'')
INSERT [dbo].[OrdersDetails] ([rowid], [order_no], [product_no], [Property_select], [each_item_amount], [qty], [discount_rate], [remark]) VALUES (34, N'A-O20210624000001', N'B010001', N'', 320, 4, NULL, N'')
INSERT [dbo].[OrdersDetails] ([rowid], [order_no], [product_no], [Property_select], [each_item_amount], [qty], [discount_rate], [remark]) VALUES (35, N'A-O20210624000001', N'B010003', N'', 240, 3, NULL, N'')
INSERT [dbo].[OrdersDetails] ([rowid], [order_no], [product_no], [Property_select], [each_item_amount], [qty], [discount_rate], [remark]) VALUES (36, N'A-O20210624000002', N'B010001', N'', 160, 2, NULL, N'')
INSERT [dbo].[OrdersDetails] ([rowid], [order_no], [product_no], [Property_select], [each_item_amount], [qty], [discount_rate], [remark]) VALUES (37, N'C-O20210628000001', N'A020002', N'', 350, 1, NULL, N'')
INSERT [dbo].[OrdersDetails] ([rowid], [order_no], [product_no], [Property_select], [each_item_amount], [qty], [discount_rate], [remark]) VALUES (38, N'A-O20210703000001', N'B010001', N'', 160, 2, NULL, N'')
INSERT [dbo].[OrdersDetails] ([rowid], [order_no], [product_no], [Property_select], [each_item_amount], [qty], [discount_rate], [remark]) VALUES (39, N'A-O20210703000001', N'A020002', N'', 350, 1, NULL, N'')
INSERT [dbo].[OrdersDetails] ([rowid], [order_no], [product_no], [Property_select], [each_item_amount], [qty], [discount_rate], [remark]) VALUES (40, N'A-O20210703000002', N'A020002', N'', 350, 1, NULL, N'')
INSERT [dbo].[OrdersDetails] ([rowid], [order_no], [product_no], [Property_select], [each_item_amount], [qty], [discount_rate], [remark]) VALUES (41, N'A-O20210703000003', N'A020002', N'', 350, 1, NULL, N'')
INSERT [dbo].[OrdersDetails] ([rowid], [order_no], [product_no], [Property_select], [each_item_amount], [qty], [discount_rate], [remark]) VALUES (42, N'A-O20210703000003', N'A010002', N'', 280, 1, NULL, N'')
INSERT [dbo].[OrdersDetails] ([rowid], [order_no], [product_no], [Property_select], [each_item_amount], [qty], [discount_rate], [remark]) VALUES (43, N'A-O20210703000003', N'C010002', N'', 50, 1, NULL, N'')
INSERT [dbo].[OrdersDetails] ([rowid], [order_no], [product_no], [Property_select], [each_item_amount], [qty], [discount_rate], [remark]) VALUES (44, N'A-O20210703000003', N'C010001', N'冰塊    : 微冰 ', 50, 1, NULL, N'')
INSERT [dbo].[OrdersDetails] ([rowid], [order_no], [product_no], [Property_select], [each_item_amount], [qty], [discount_rate], [remark]) VALUES (45, N'A-O20210703000003', N'C010001', N'冰塊    : 去冰 ', 100, 2, NULL, N'')
INSERT [dbo].[OrdersDetails] ([rowid], [order_no], [product_no], [Property_select], [each_item_amount], [qty], [discount_rate], [remark]) VALUES (46, N'A-O20210703000004', N'C010001', N'冰塊    : 正常冰 ', 50, 1, NULL, N'')
INSERT [dbo].[OrdersDetails] ([rowid], [order_no], [product_no], [Property_select], [each_item_amount], [qty], [discount_rate], [remark]) VALUES (47, N'A-O20210703000004', N'A010002', N'', 280, 1, NULL, N'')
INSERT [dbo].[OrdersDetails] ([rowid], [order_no], [product_no], [Property_select], [each_item_amount], [qty], [discount_rate], [remark]) VALUES (48, N'A-O20210703000005', N'C010002', N'', 50, 1, NULL, N'')
INSERT [dbo].[OrdersDetails] ([rowid], [order_no], [product_no], [Property_select], [each_item_amount], [qty], [discount_rate], [remark]) VALUES (49, N'A-O20210705000001', N'C010001', N'冰塊 : 去冰 ', 50, 1, NULL, N'')
INSERT [dbo].[OrdersDetails] ([rowid], [order_no], [product_no], [Property_select], [each_item_amount], [qty], [discount_rate], [remark]) VALUES (50, N'A-O20210705000002', N'C010001', N'冰塊    : 微冰 ', 50, 1, NULL, N'')
INSERT [dbo].[OrdersDetails] ([rowid], [order_no], [product_no], [Property_select], [each_item_amount], [qty], [discount_rate], [remark]) VALUES (51, N'A-O20210705000002', N'A020002', N'', 350, 1, NULL, N'')
INSERT [dbo].[OrdersDetails] ([rowid], [order_no], [product_no], [Property_select], [each_item_amount], [qty], [discount_rate], [remark]) VALUES (52, N'A-O20210705000003', N'C010001', N'冰塊    : 微冰 ', 50, 1, NULL, N'')
INSERT [dbo].[OrdersDetails] ([rowid], [order_no], [product_no], [Property_select], [each_item_amount], [qty], [discount_rate], [remark]) VALUES (53, N'A-O20210705000003', N'A020002', N'', 350, 1, NULL, N'')
SET IDENTITY_INSERT [dbo].[OrdersDetails] OFF
GO
INSERT [dbo].[OrderStatus] ([orderstatus_no], [orderstatus_name], [remark]) VALUES (N'ALC', N'備餐完成', N'//Already cooked
')
INSERT [dbo].[OrderStatus] ([orderstatus_no], [orderstatus_name], [remark]) VALUES (N'ALD', N'已出餐', N'//Already Delivered')
INSERT [dbo].[OrderStatus] ([orderstatus_no], [orderstatus_name], [remark]) VALUES (N'TBC', N'確認中', N'已下單//To be confirmed')
INSERT [dbo].[OrderStatus] ([orderstatus_no], [orderstatus_name], [remark]) VALUES (N'TBP', N'備餐中', N'//To be prepared')
GO
SET IDENTITY_INSERT [dbo].[Payments] ON 

INSERT [dbo].[Payments] ([rowid], [paid_no], [paid_name], [remark]) VALUES (1, N'P01', N'現金', NULL)
INSERT [dbo].[Payments] ([rowid], [paid_no], [paid_name], [remark]) VALUES (2, N'P02', N'信用卡', NULL)
INSERT [dbo].[Payments] ([rowid], [paid_no], [paid_name], [remark]) VALUES (3, N'P03', N'Linepay', NULL)
INSERT [dbo].[Payments] ([rowid], [paid_no], [paid_name], [remark]) VALUES (4, N'P04', N'街口支付', NULL)
SET IDENTITY_INSERT [dbo].[Payments] OFF
GO
INSERT [dbo].[Products] ([product_no], [product_name], [product_spec], [category_no], [price_avgcost], [price_sale], [discount_price], [stock_qty], [image_path], [description], [browse_count], [istop], [issale], [ishot], [remark]) VALUES (N'A010001', N'蒜香培根義大利麵', N'份', N'A01', 160, 250, NULL, 0, NULL, NULL, 2, 1, 1, 0, N'')
INSERT [dbo].[Products] ([product_no], [product_name], [product_spec], [category_no], [price_avgcost], [price_sale], [discount_price], [stock_qty], [image_path], [description], [browse_count], [istop], [issale], [ishot], [remark]) VALUES (N'A010002', N'番茄海鮮義大利麵', N'份', N'A01', 200, 280, NULL, 6, NULL, NULL, 0, NULL, 1, 1, NULL)
INSERT [dbo].[Products] ([product_no], [product_name], [product_spec], [category_no], [price_avgcost], [price_sale], [discount_price], [stock_qty], [image_path], [description], [browse_count], [istop], [issale], [ishot], [remark]) VALUES (N'A010003', N'烤鴨', N'份', N'A01', 100, 100, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([product_no], [product_name], [product_spec], [category_no], [price_avgcost], [price_sale], [discount_price], [stock_qty], [image_path], [description], [browse_count], [istop], [issale], [ishot], [remark]) VALUES (N'A020001', N'海鮮千層麵', N'份', N'A02', 230, 300, NULL, 0, NULL, NULL, 2, 0, 1, 0, NULL)
INSERT [dbo].[Products] ([product_no], [product_name], [product_spec], [category_no], [price_avgcost], [price_sale], [discount_price], [stock_qty], [image_path], [description], [browse_count], [istop], [issale], [ishot], [remark]) VALUES (N'A020002', N'青醬雞肉千層麵', N'份', N'A02', 300, 350, NULL, 3, NULL, NULL, 0, NULL, 1, 1, NULL)
INSERT [dbo].[Products] ([product_no], [product_name], [product_spec], [category_no], [price_avgcost], [price_sale], [discount_price], [stock_qty], [image_path], [description], [browse_count], [istop], [issale], [ishot], [remark]) VALUES (N'A030001', N'GG', N'份', N'A03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([product_no], [product_name], [product_spec], [category_no], [price_avgcost], [price_sale], [discount_price], [stock_qty], [image_path], [description], [browse_count], [istop], [issale], [ishot], [remark]) VALUES (N'B010001', N'炸薯條', N'份', N'B01', 50, 80, NULL, 11, NULL, NULL, 0, 0, 1, 1, N'')
INSERT [dbo].[Products] ([product_no], [product_name], [product_spec], [category_no], [price_avgcost], [price_sale], [discount_price], [stock_qty], [image_path], [description], [browse_count], [istop], [issale], [ishot], [remark]) VALUES (N'B010002', N'炸雞塊', N'份', N'B01', 50, 80, NULL, 11, NULL, NULL, 0, 0, 1, 0, NULL)
INSERT [dbo].[Products] ([product_no], [product_name], [product_spec], [category_no], [price_avgcost], [price_sale], [discount_price], [stock_qty], [image_path], [description], [browse_count], [istop], [issale], [ishot], [remark]) VALUES (N'B010003', N'炸地瓜', N'份', N'B01', 50, 80, NULL, 11, NULL, NULL, 0, 0, 1, 0, NULL)
INSERT [dbo].[Products] ([product_no], [product_name], [product_spec], [category_no], [price_avgcost], [price_sale], [discount_price], [stock_qty], [image_path], [description], [browse_count], [istop], [issale], [ishot], [remark]) VALUES (N'B010004', N'炸羊腿', N'份', N'B01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([product_no], [product_name], [product_spec], [category_no], [price_avgcost], [price_sale], [discount_price], [stock_qty], [image_path], [description], [browse_count], [istop], [issale], [ishot], [remark]) VALUES (N'B020001', N'水果綜合沙拉', N'份', N'B02', 130, 180, NULL, 11, NULL, NULL, 0, 0, 1, 0, NULL)
INSERT [dbo].[Products] ([product_no], [product_name], [product_spec], [category_no], [price_avgcost], [price_sale], [discount_price], [stock_qty], [image_path], [description], [browse_count], [istop], [issale], [ishot], [remark]) VALUES (N'B020002', N'當下綜合沙拉', N'份', N'B02', 130, 180, NULL, 11, NULL, NULL, 0, 1, 1, 0, NULL)
INSERT [dbo].[Products] ([product_no], [product_name], [product_spec], [category_no], [price_avgcost], [price_sale], [discount_price], [stock_qty], [image_path], [description], [browse_count], [istop], [issale], [ishot], [remark]) VALUES (N'C010001', N'可樂', N'杯', N'C01', 30, 50, NULL, 10, NULL, NULL, 4, 0, 1, 1, NULL)
INSERT [dbo].[Products] ([product_no], [product_name], [product_spec], [category_no], [price_avgcost], [price_sale], [discount_price], [stock_qty], [image_path], [description], [browse_count], [istop], [issale], [ishot], [remark]) VALUES (N'C010002', N'雪碧', N'杯', N'C01', 25, 50, NULL, 15, NULL, NULL, 0, 1, 1, 1, NULL)
INSERT [dbo].[Products] ([product_no], [product_name], [product_spec], [category_no], [price_avgcost], [price_sale], [discount_price], [stock_qty], [image_path], [description], [browse_count], [istop], [issale], [ishot], [remark]) VALUES (N'D020001', N'牛小排', N'份', N'D02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([product_no], [product_name], [product_spec], [category_no], [price_avgcost], [price_sale], [discount_price], [stock_qty], [image_path], [description], [browse_count], [istop], [issale], [ishot], [remark]) VALUES (N'D020002', N'pizza', N'份', N'D02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([product_no], [product_name], [product_spec], [category_no], [price_avgcost], [price_sale], [discount_price], [stock_qty], [image_path], [description], [browse_count], [istop], [issale], [ishot], [remark]) VALUES (N'E010001', N'牛小排', N'份', N'E01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([product_no], [product_name], [product_spec], [category_no], [price_avgcost], [price_sale], [discount_price], [stock_qty], [image_path], [description], [browse_count], [istop], [issale], [ishot], [remark]) VALUES (N'G010001', N'蒜香清寧烤雞', N'份', N'G01', 150, 150, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[ProductsProperty] ON 

INSERT [dbo].[ProductsProperty] ([rowid], [product_no], [Property_no]) VALUES (1, N'C010001', N'ice')
INSERT [dbo].[ProductsProperty] ([rowid], [product_no], [Property_no]) VALUES (2, N'C020001', N'topping')
INSERT [dbo].[ProductsProperty] ([rowid], [product_no], [Property_no]) VALUES (3, N'A010001', N'spicy')
SET IDENTITY_INSERT [dbo].[ProductsProperty] OFF
GO
SET IDENTITY_INSERT [dbo].[ProgramList] ON 

INSERT [dbo].[ProgramList] ([rowid], [parentid], [filter_role], [pro_no], [pro_name], [controller_name], [action_name]) VALUES (1, 0, N'A', N'A', N'會員管理', N'MemberBack', NULL)
INSERT [dbo].[ProgramList] ([rowid], [parentid], [filter_role], [pro_no], [pro_name], [controller_name], [action_name]) VALUES (2, 1, N'A', N'A01', N'權限管理', N'MemberBack', NULL)
INSERT [dbo].[ProgramList] ([rowid], [parentid], [filter_role], [pro_no], [pro_name], [controller_name], [action_name]) VALUES (3, 0, N'A', N'B', N'商品管理', N'ProductBack', NULL)
INSERT [dbo].[ProgramList] ([rowid], [parentid], [filter_role], [pro_no], [pro_name], [controller_name], [action_name]) VALUES (4, 0, N'S', N'C', N'訂單管理', N'OrderBack', NULL)
INSERT [dbo].[ProgramList] ([rowid], [parentid], [filter_role], [pro_no], [pro_name], [controller_name], [action_name]) VALUES (6, 4, N'S', N'C02', N'歷史訂單', N'OrderBack', NULL)
INSERT [dbo].[ProgramList] ([rowid], [parentid], [filter_role], [pro_no], [pro_name], [controller_name], [action_name]) VALUES (7, 0, N'A', N'D', N'基本資料管理', N'Store', NULL)
INSERT [dbo].[ProgramList] ([rowid], [parentid], [filter_role], [pro_no], [pro_name], [controller_name], [action_name]) VALUES (9, 7, N'A', N'D01', N'公司資料', N'Store', NULL)
INSERT [dbo].[ProgramList] ([rowid], [parentid], [filter_role], [pro_no], [pro_name], [controller_name], [action_name]) VALUES (10, 7, N'A', N'D02', N'付款方式設定', N'Payments', N'Index')
INSERT [dbo].[ProgramList] ([rowid], [parentid], [filter_role], [pro_no], [pro_name], [controller_name], [action_name]) VALUES (14, 1, N'A', N'A02', N'會員資料異動', N'MemberBack', NULL)
INSERT [dbo].[ProgramList] ([rowid], [parentid], [filter_role], [pro_no], [pro_name], [controller_name], [action_name]) VALUES (15, 3, N'A', N'B01', N'商品分類', N'Categorys', N'Index')
INSERT [dbo].[ProgramList] ([rowid], [parentid], [filter_role], [pro_no], [pro_name], [controller_name], [action_name]) VALUES (16, 3, N'A', N'B02', N'商品資料', N'ProductBack', N'Index')
INSERT [dbo].[ProgramList] ([rowid], [parentid], [filter_role], [pro_no], [pro_name], [controller_name], [action_name]) VALUES (17, 3, N'A', N'B03', N'附加選項設定', N'Propertys', N'Index')
INSERT [dbo].[ProgramList] ([rowid], [parentid], [filter_role], [pro_no], [pro_name], [controller_name], [action_name]) VALUES (18, 0, N'S', N'F', N'庫存管理', NULL, NULL)
INSERT [dbo].[ProgramList] ([rowid], [parentid], [filter_role], [pro_no], [pro_name], [controller_name], [action_name]) VALUES (19, 0, N'S', N'G', N'報表分析', NULL, NULL)
INSERT [dbo].[ProgramList] ([rowid], [parentid], [filter_role], [pro_no], [pro_name], [controller_name], [action_name]) VALUES (20, 18, N'S', N'F01', N'進貨管理', NULL, NULL)
INSERT [dbo].[ProgramList] ([rowid], [parentid], [filter_role], [pro_no], [pro_name], [controller_name], [action_name]) VALUES (21, 18, N'S', N'F02', N'盤點管理', NULL, NULL)
INSERT [dbo].[ProgramList] ([rowid], [parentid], [filter_role], [pro_no], [pro_name], [controller_name], [action_name]) VALUES (22, 19, N'S', N'G01', N'銷售查詢', NULL, NULL)
INSERT [dbo].[ProgramList] ([rowid], [parentid], [filter_role], [pro_no], [pro_name], [controller_name], [action_name]) VALUES (23, 19, N'S', N'G02', N'報廢查詢', NULL, NULL)
INSERT [dbo].[ProgramList] ([rowid], [parentid], [filter_role], [pro_no], [pro_name], [controller_name], [action_name]) VALUES (24, 19, N'S', N'G03', N'庫存查詢', NULL, NULL)
SET IDENTITY_INSERT [dbo].[ProgramList] OFF
GO
SET IDENTITY_INSERT [dbo].[Propertys] ON 

INSERT [dbo].[Propertys] ([rowid], [property_no], [property_name], [add_price], [property_value], [remark]) VALUES (1, N'ice', N'冰塊', 0, N'正常冰/微冰/少冰/去冰', NULL)
INSERT [dbo].[Propertys] ([rowid], [property_no], [property_name], [add_price], [property_value], [remark]) VALUES (2, N'hot', N'熱度', 0, N'溫/熱', NULL)
INSERT [dbo].[Propertys] ([rowid], [property_no], [property_name], [add_price], [property_value], [remark]) VALUES (3, N'spicy', N'辣度', 0, N'大辣/中辣/小辣', NULL)
INSERT [dbo].[Propertys] ([rowid], [property_no], [property_name], [add_price], [property_value], [remark]) VALUES (4, N'sweet', N'甜度', 0, N'無糖/微糖/半糖/少糖/正常糖', NULL)
INSERT [dbo].[Propertys] ([rowid], [property_no], [property_name], [add_price], [property_value], [remark]) VALUES (5, N'topping', N'加料', 20, N'珍珠/芋圓/仙草/布丁', NULL)
INSERT [dbo].[Propertys] ([rowid], [property_no], [property_name], [add_price], [property_value], [remark]) VALUES (23, N'other', N'加料', 13, N'起司多', NULL)
SET IDENTITY_INSERT [dbo].[Propertys] OFF
GO
INSERT [dbo].[Roles] ([role_no], [role_name], [remark]) VALUES (N'A', N'Admin', N'管理員')
INSERT [dbo].[Roles] ([role_no], [role_name], [remark]) VALUES (N'M', N'Member', N'會員')
INSERT [dbo].[Roles] ([role_no], [role_name], [remark]) VALUES (N'S', N'Staff', N'員工')
GO
INSERT [dbo].[Users] ([mno], [mname], [account_name], [password], [id], [birthday], [phone], [address], [email], [role_no], [varify_code], [isvarify], [isvalidate]) VALUES (N'MNO202105280001', N'供祚誑', N'001', N'001', N'B1200546846', CAST(N'1970-08-08T00:00:00.000' AS DateTime), N'0998546845', N'宜蘭市羅東區', N'x@gmail.com', N'M', NULL, 1, 1)
INSERT [dbo].[Users] ([mno], [mname], [account_name], [password], [id], [birthday], [phone], [address], [email], [role_no], [varify_code], [isvarify], [isvalidate]) VALUES (N'MNO202101010001', N'郝蚌蚌1', N'002', N'123', N'MNO202101010001', CAST(N'1999-01-01T00:00:00.000' AS DateTime), N'0912846579', N'宜蘭市礁溪區', N'BOO@gmail.com', N'S', NULL, 0, 0)
INSERT [dbo].[Users] ([mno], [mname], [account_name], [password], [id], [birthday], [phone], [address], [email], [role_no], [varify_code], [isvarify], [isvalidate]) VALUES (N'MNO202105040001', N'王曉明', N'admin', N'admin', N'F123544455', CAST(N'1987-01-25T00:00:00.000' AS DateTime), N'0955123456', N'桃園市新屋區區', N'ming@gmail.com', N'A', NULL, 1, 1)
INSERT [dbo].[Users] ([mno], [mname], [account_name], [password], [id], [birthday], [phone], [address], [email], [role_no], [varify_code], [isvarify], [isvalidate]) VALUES (N'MNO202106120001', N'fff', N'dddd', N'ddd', NULL, NULL, NULL, NULL, N'sdd', N'M', N'AB5064A6763A43DB8F51', 0, NULL)
INSERT [dbo].[Users] ([mno], [mname], [account_name], [password], [id], [birthday], [phone], [address], [email], [role_no], [varify_code], [isvarify], [isvalidate]) VALUES (N'MNO202106150001', N'jjjjj', N'ddddea', N'fffa', NULL, CAST(N'2021-06-24T00:00:00.000' AS DateTime), N'0909876544', NULL, N'sdd33@hliea', N'M', N'7C30667E9FDE48189792', 0, NULL)
INSERT [dbo].[Users] ([mno], [mname], [account_name], [password], [id], [birthday], [phone], [address], [email], [role_no], [varify_code], [isvarify], [isvalidate]) VALUES (N'MNO202106130002', N'fff', N'eeee', N'effef', NULL, NULL, NULL, NULL, N'miwa.eje@gjal.coo', N'M', N'94204EA7B6DE42BCA010', 0, NULL)
INSERT [dbo].[Users] ([mno], [mname], [account_name], [password], [id], [birthday], [phone], [address], [email], [role_no], [varify_code], [isvarify], [isvalidate]) VALUES (N'MNO202105310002', N'LULU', N'LULU', N'LULU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([mno], [mname], [account_name], [password], [id], [birthday], [phone], [address], [email], [role_no], [varify_code], [isvarify], [isvalidate]) VALUES (N'MNO202106030001', N'黃怡萱', N'mimi', N'DDD', NULL, NULL, N'+886910543522', N'廣豐路42-1號', N'miwa.huang0625@gmail.com', N'M', N'', 1, NULL)
INSERT [dbo].[Users] ([mno], [mname], [account_name], [password], [id], [birthday], [phone], [address], [email], [role_no], [varify_code], [isvarify], [isvalidate]) VALUES (N'MNO202106130001', N'MIMIww', N'mimiss', N'dddd', NULL, CAST(N'2021-06-25T00:00:00.000' AS DateTime), N'+886910543522', N'廣豐路42-1號', N'miwa.huang062e5@gmail.com', N'M', N'C67CFD79C7DC47DAB931', 0, NULL)
INSERT [dbo].[Users] ([mno], [mname], [account_name], [password], [id], [birthday], [phone], [address], [email], [role_no], [varify_code], [isvarify], [isvalidate]) VALUES (N'MNO202105040002', N'愛錶縣', N'shin', N'aaa', N'P110054697', CAST(N'2010-09-30T00:00:00.000' AS DateTime), N'0988546975', N'新北市瑞芳區', N'goodwork@msn.hinet.net', N'M', NULL, 1, 1)
INSERT [dbo].[Users] ([mno], [mname], [account_name], [password], [id], [birthday], [phone], [address], [email], [role_no], [varify_code], [isvarify], [isvalidate]) VALUES (N'MNO202105050001', N'蔡陶桂', N'tsing', N'456', N'Q220005491', CAST(N'1999-05-01T00:00:00.000' AS DateTime), N'0955134877', N'桃園市龜山區', N'Wang@gmail.com', N'M', NULL, 1, 1)
INSERT [dbo].[Users] ([mno], [mname], [account_name], [password], [id], [birthday], [phone], [address], [email], [role_no], [varify_code], [isvarify], [isvalidate]) VALUES (N'MNO202105060001', N'許清風', N'ZFF', N'5555', N'E154244452', CAST(N'1980-02-29T00:00:00.000' AS DateTime), N'0987546879', N'基隆市中正區', N'ZFF@GMAIL.COM', N'M', NULL, 1, 1)
INSERT [dbo].[Users] ([mno], [mname], [account_name], [password], [id], [birthday], [phone], [address], [email], [role_no], [varify_code], [isvarify], [isvalidate]) VALUES (N'MNO202101090001', N'和家人', N'zing1', N'999', N'G220054687', CAST(N'1965-04-08T00:00:00.000' AS DateTime), N'0980554666', N'新北市瑞芳區', N'ZING@gmail', N'A', NULL, 1, 0)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Category_no]    Script Date: 2021/7/6 上午 11:31:09 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Category_no] ON [dbo].[Categorys]
(
	[category_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_mealService_no]    Script Date: 2021/7/6 上午 11:31:09 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_mealService_no] ON [dbo].[MealService]
(
	[mealservice_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Paid_no]    Script Date: 2021/7/6 上午 11:31:09 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Paid_no] ON [dbo].[Payments]
(
	[paid_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Property_no]    Script Date: 2021/7/6 上午 11:31:09 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Property_no] ON [dbo].[Propertys]
(
	[property_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_mno]    Script Date: 2021/7/6 上午 11:31:09 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_mno] ON [dbo].[Users]
(
	[mno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_order_closed]  DEFAULT ((0)) FOR [isclosed]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_browse_count]  DEFAULT ((0)) FOR [browse_count]
GO
/****** Object:  Trigger [dbo].[tr_order_mno]    Script Date: 2021/7/6 上午 11:31:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>[dbo].[tr_sal_sales]
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
 CREATE TRIGGER [dbo].[tr_order_mno] 
   ON   [dbo].[Orders]
   AFTER INSERT,DELETE,UPDATE
AS 
BEGIN
	
	SET NOCOUNT ON;
    
	
	DECLARE @ymd_no nvarchar(50) = 'YMD'  --會員編號設定ydm編碼
	DECLARE @sheet_len int  = 6           --會員編號設定流水號為3碼
	DECLARE @rowid nvarchar(50)
	DECLARE @order_no nvarchar(50)

	DECLARE @lead_no nvarchar(50)  ='-O'
	DECLARE @command nvarchar(50)         --儲存觸發模式
	DECLARE @mno_no nvarchar(50)          --會員編號
	DECLARE @find_no nvarchar(50)         --資料庫搜尋變數
	DECLARE @mealservice_no nvarchar(50)    --用餐方式編號
	DECLARE @seq int                      --流水號編號



	
	--判斷觸發模式總類
	IF EXISTS(SELECT * FROM inserted) AND NOT EXISTS(SELECT * FROM deleted) SET @command = 'INSERT'
	IF NOT EXISTS(SELECT * FROM inserted) AND EXISTS(SELECT * FROM deleted) SET @command = 'DELETE'
	IF EXISTS(SELECT * FROM inserted) AND EXISTS(SELECT * FROM deleted) SET @command = 'UPDATE'

	
	
	IF (@command = 'INSERT')
	BEGIN
		SET @rowid = (SELECT rowid FROM inserted)
		SET @mealservice_no = (SELECT mealservice_no FROM inserted)
		SET @mno_no = @mealservice_no + @lead_no
		IF (@ymd_no = 'Y') SET @mno_no += CONVERT(varchar(4) , GETDATE() , 112)
		IF (@ymd_no = 'YM') SET @mno_no += CONVERT(varchar(6) , GETDATE() , 112)
		IF (@ymd_no = 'YMD') SET @mno_no += CONVERT(varchar(8) , GETDATE() , 112)

		SET @seq = 1             --預設流水編號為1
		SET @find_no = @mno_no + '%'   
		IF EXISTS(SELECT @mealservice_no FROM [dbo].[Orders] WHERE order_no LIKE @find_no)      
		BEGIN
			SET @find_no = (SELECT TOP 1 order_no FROM [dbo].[Orders] WHERE order_no LIKE @find_no ORDER BY order_no DESC)
			SET @seq = CAST(RIGHT(@find_no , @sheet_len) AS int) + 1
		END
		SET @mno_no += RIGHT(REPLICATE('0' , @sheet_len) +  CAST(@seq AS varchar) ,@sheet_len) 
		UPDATE [dbo].[Orders] SET order_no = @mno_no WHERE rowid = @rowid
	END







END
GO
ALTER TABLE [dbo].[Orders] ENABLE TRIGGER [tr_order_mno]
GO
/****** Object:  Trigger [dbo].[tr_paid_mno]    Script Date: 2021/7/6 上午 11:31:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>[dbo].[tr_sal_sales]
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[tr_paid_mno] 
   ON   [dbo].[Payments]
   AFTER INSERT,DELETE,UPDATE
AS 
BEGIN
	
	SET NOCOUNT ON;

	DECLARE @lead_no nvarchar(50) = 'P'
	DECLARE @ymd_no nvarchar(50) = 'YMD'
	DECLARE @sheet_len int  = 2

    DECLARE @command nvarchar(50)
	DECLARE @sheet_no nvarchar(50)
	DECLARE @find_no nvarchar(50)
	DECLARE @sheet_date date
	DECLARE @rowid int 
	DECLARE @seq int 

	IF EXISTS(SELECT * FROM inserted) AND NOT EXISTS(SELECT * FROM deleted) SET @command = 'INSERT'
	IF NOT EXISTS(SELECT * FROM inserted) AND EXISTS(SELECT * FROM deleted) SET @command = 'DELETE'
	IF EXISTS(SELECT * FROM inserted) AND EXISTS(SELECT * FROM deleted) SET @command = 'UPDATE'

	IF (@command = 'INSERT')
	BEGIN
		SET @rowid = (SELECT rowid FROM inserted)
		--SET @sheet_date = (SELECT mdate FROM inserted)
		SET @sheet_no = @lead_no
		--IF (@ymd_no = 'Y') SET @sheet_no += CONVERT(varchar(4) , @sheet_date , 112)
		--IF (@ymd_no = 'YM') SET @sheet_no += CONVERT(varchar(6) , @sheet_date , 112)
		--IF (@ymd_no = 'YMD') SET @sheet_no += CONVERT(varchar(8) , @sheet_date , 112)

		SET @seq = 1
		SET @find_no = @sheet_no + '%'
		IF EXISTS(SELECT rowid FROM [dbo].[Payments] WHERE paid_no LIKE @find_no)
		BEGIN
			SET @find_no = (SELECT TOP 1 paid_no FROM [dbo].[Payments] WHERE paid_no LIKE @find_no ORDER BY paid_no DESC)
			SET @seq = CAST(RIGHT(@find_no , @sheet_len) AS int) + 1
		END
		SET @sheet_no += RIGHT(REPLICATE('0' , @sheet_len) +  CAST(@seq AS varchar) ,@sheet_len) 
		UPDATE [dbo].[Payments] SET paid_no = @sheet_no WHERE rowid = @rowid
	END

END
GO
ALTER TABLE [dbo].[Payments] ENABLE TRIGGER [tr_paid_mno]
GO
/****** Object:  Trigger [dbo].[tr_user_no]    Script Date: 2021/7/6 上午 11:31:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Johnson
-- Create date: 2021/02/22
-- Description:	sal_sales Trigger
-- =============================================
CREATE TRIGGER [dbo].[tr_user_no]
   ON  [dbo].[Users]
   AFTER INSERT,DELETE,UPDATE
AS 
BEGIN
	SET NOCOUNT ON;

	DECLARE @lead_no nvarchar(50) = 'MNO'
	DECLARE @ymd_no nvarchar(50) = 'YMD'
	DECLARE @sheet_len int  = 4
	DECLARE @account_name nvarchar(50)
    DECLARE @command nvarchar(50)
	DECLARE @sheet_no nvarchar(50)
	DECLARE @find_no nvarchar(50)
	DECLARE @sheet_date date
	
	DECLARE @seq int 

	IF EXISTS(SELECT * FROM inserted) AND NOT EXISTS(SELECT * FROM deleted) SET @command = 'INSERT'
	IF NOT EXISTS(SELECT * FROM inserted) AND EXISTS(SELECT * FROM deleted) SET @command = 'DELETE'
	IF EXISTS(SELECT * FROM inserted) AND EXISTS(SELECT * FROM deleted) SET @command = 'UPDATE'

	IF (@command = 'INSERT')
	BEGIN
		SET @account_name = (SELECT account_name FROM inserted)
		--SET @sheet_date = (SELECT createdate FROM inserted)
		SET @sheet_no = @lead_no
		IF (@ymd_no = 'Y') SET @sheet_no += CONVERT(varchar(4) , GETDATE() , 112)    --改放getdate()
		IF (@ymd_no = 'YM') SET @sheet_no += CONVERT(varchar(6) , GETDATE() , 112)
		IF (@ymd_no = 'YMD') SET @sheet_no += CONVERT(varchar(8) , GETDATE() , 112)

		SET @seq = 1
		SET @find_no = @sheet_no + '%'
		IF EXISTS(SELECT account_name FROM  [dbo].[Users] WHERE mno LIKE @find_no)
		BEGIN
			SET @find_no = (SELECT TOP 1 mno FROM  [dbo].[Users] WHERE mno LIKE @find_no ORDER BY mno DESC)
			SET @seq = CAST(RIGHT(@find_no , @sheet_len) AS int) + 1
		END
		SET @sheet_no += RIGHT(REPLICATE('0' , @sheet_len) +  CAST(@seq AS varchar) ,@sheet_len) 
		UPDATE [dbo].[Users] SET mno = @sheet_no WHERE account_name = @account_name
	END

END
GO
ALTER TABLE [dbo].[Users] ENABLE TRIGGER [tr_user_no]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流水編碼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Carts', @level2type=N'COLUMN',@level2name=N'rowid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'購物車批次碼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Carts', @level2type=N'COLUMN',@level2name=N'cart_lotno'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'使用者編號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Carts', @level2type=N'COLUMN',@level2name=N'mno'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'商品編號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Carts', @level2type=N'COLUMN',@level2name=N'product_no'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'購買產品屬性' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Carts', @level2type=N'COLUMN',@level2name=N'Property_select'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'數量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Carts', @level2type=N'COLUMN',@level2name=N'qty'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'購物車產生時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Carts', @level2type=N'COLUMN',@level2name=N'create_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流水編碼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Categorys', @level2type=N'COLUMN',@level2name=N'rowid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'父類別編碼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Categorys', @level2type=N'COLUMN',@level2name=N'parentid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'子類別編號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Categorys', @level2type=N'COLUMN',@level2name=N'category_no'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'類別名稱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Categorys', @level2type=N'COLUMN',@level2name=N'category_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流水編碼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Company', @level2type=N'COLUMN',@level2name=N'rowid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'統一編號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Company', @level2type=N'COLUMN',@level2name=N'company_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'品牌名稱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Company', @level2type=N'COLUMN',@level2name=N'brandname'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'電話' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Company', @level2type=N'COLUMN',@level2name=N'tel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'傳真' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Company', @level2type=N'COLUMN',@level2name=N'fax'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Company', @level2type=N'COLUMN',@level2name=N'address'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'營業開始時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Company', @level2type=N'COLUMN',@level2name=N'opentime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'營業結束時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Company', @level2type=N'COLUMN',@level2name=N'closetime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公休日' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Company', @level2type=N'COLUMN',@level2name=N'public_holiday'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'logo照片' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Company', @level2type=N'COLUMN',@level2name=N'logoimage_path'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'首頁照片' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Company', @level2type=N'COLUMN',@level2name=N'indeximage_path'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流水編碼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Concepts', @level2type=N'COLUMN',@level2name=N'rowid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'理念' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Concepts', @level2type=N'COLUMN',@level2name=N'corevalue_title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'理念說明' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Concepts', @level2type=N'COLUMN',@level2name=N'corevalue_descpt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'理念照片' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Concepts', @level2type=N'COLUMN',@level2name=N'corevalue_path'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流水編碼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MealService', @level2type=N'COLUMN',@level2name=N'rowid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用餐方式編碼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MealService', @level2type=N'COLUMN',@level2name=N'mealservice_no'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用餐方式' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MealService', @level2type=N'COLUMN',@level2name=N'mealservice_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備註' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MealService', @level2type=N'COLUMN',@level2name=N'remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流水碼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'rowid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'訂單編號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'order_no'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'訂單日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'order_date'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'會員編號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'mno'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'折扣 (整筆訂單)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'discount_rate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'稅額' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'taxs'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'總計(已折扣含稅)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'total'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'訂單狀態' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'orderstatus_no'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用餐方式編碼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'mealservice_no'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'預約取餐時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'SchedulOrderTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'桌號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'table_no'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'付款方式編碼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'paid_no'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'收件人姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'receive_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'收件人電話' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'receive_phone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'收件地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'receive_address'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'訂單結案' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'isclosed'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否結帳' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'ispaided'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'取消訂單' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'cancelorder'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'取消訂單原因' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'cancelreason'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備註' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'訂單編號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrdersDetails', @level2type=N'COLUMN',@level2name=N'order_no'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'商品編號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrdersDetails', @level2type=N'COLUMN',@level2name=N'product_no'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'購買產品屬性' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrdersDetails', @level2type=N'COLUMN',@level2name=N'Property_select'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'品項小計' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrdersDetails', @level2type=N'COLUMN',@level2name=N'each_item_amount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'數量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrdersDetails', @level2type=N'COLUMN',@level2name=N'qty'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'折扣 (商品)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrdersDetails', @level2type=N'COLUMN',@level2name=N'discount_rate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備註' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrdersDetails', @level2type=N'COLUMN',@level2name=N'remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'訂單狀態編碼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderStatus', @level2type=N'COLUMN',@level2name=N'orderstatus_no'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'訂單狀態' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderStatus', @level2type=N'COLUMN',@level2name=N'orderstatus_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備註' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderStatus', @level2type=N'COLUMN',@level2name=N'remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流水編碼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Payments', @level2type=N'COLUMN',@level2name=N'rowid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'付款方式編碼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Payments', @level2type=N'COLUMN',@level2name=N'paid_no'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'付款方式' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Payments', @level2type=N'COLUMN',@level2name=N'paid_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備註' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Payments', @level2type=N'COLUMN',@level2name=N'remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'商品編號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'product_no'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'商品名稱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'product_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'商品規格' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'product_spec'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'子類別編號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'category_no'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'平均成本' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'price_avgcost'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'售價' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'price_sale'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'各商品折扣後價格' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'discount_price'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'庫存數量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'stock_qty'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'產品圖片' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'image_path'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'商品描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'瀏覽次數' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'browse_count'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否銷售排行前面10名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'istop'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否上架' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'issale'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否熱銷' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'ishot'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備註' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流水編碼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductsProperty', @level2type=N'COLUMN',@level2name=N'rowid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'商品編號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductsProperty', @level2type=N'COLUMN',@level2name=N'product_no'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'產品屬性編碼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductsProperty', @level2type=N'COLUMN',@level2name=N'Property_no'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流水編碼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Profiles', @level2type=N'COLUMN',@level2name=N'rowid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'簡介' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Profiles', @level2type=N'COLUMN',@level2name=N'company_profile'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'簡介照片' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Profiles', @level2type=N'COLUMN',@level2name=N'profileimage_path'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流水編碼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Propertys', @level2type=N'COLUMN',@level2name=N'rowid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'產品屬性碼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Propertys', @level2type=N'COLUMN',@level2name=N'property_no'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'屬性名稱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Propertys', @level2type=N'COLUMN',@level2name=N'property_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'加價' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Propertys', @level2type=N'COLUMN',@level2name=N'add_price'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'屬性值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Propertys', @level2type=N'COLUMN',@level2name=N'property_value'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備註' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Propertys', @level2type=N'COLUMN',@level2name=N'remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色編碼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Roles', @level2type=N'COLUMN',@level2name=N'role_no'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Roles', @level2type=N'COLUMN',@level2name=N'role_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備註' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Roles', @level2type=N'COLUMN',@level2name=N'remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'會員編號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Users', @level2type=N'COLUMN',@level2name=N'mno'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Users', @level2type=N'COLUMN',@level2name=N'mname'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'帳號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Users', @level2type=N'COLUMN',@level2name=N'account_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'密碼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Users', @level2type=N'COLUMN',@level2name=N'password'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'身分證字號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Users', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生日' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Users', @level2type=N'COLUMN',@level2name=N'birthday'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'手機號碼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Users', @level2type=N'COLUMN',@level2name=N'phone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Users', @level2type=N'COLUMN',@level2name=N'address'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'電子信箱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Users', @level2type=N'COLUMN',@level2name=N'email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'使用者角色' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Users', @level2type=N'COLUMN',@level2name=N'role_no'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'認證編碼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Users', @level2type=N'COLUMN',@level2name=N'varify_code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否認證' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Users', @level2type=N'COLUMN',@level2name=N'isvarify'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否有效' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Users', @level2type=N'COLUMN',@level2name=N'isvalidate'
GO
USE [master]
GO
ALTER DATABASE [GoPASTA] SET  READ_WRITE 
GO
