USE [master]
GO
/****** Object:  Database [BachHoa]    Script Date: 3/30/2023 7:04:14 PM ******/
CREATE DATABASE [BachHoa]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BachHoa', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\BachHoa.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BachHoa_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\BachHoa_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [BachHoa] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BachHoa].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BachHoa] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BachHoa] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BachHoa] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BachHoa] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BachHoa] SET ARITHABORT OFF 
GO
ALTER DATABASE [BachHoa] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BachHoa] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BachHoa] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BachHoa] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BachHoa] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BachHoa] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BachHoa] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BachHoa] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BachHoa] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BachHoa] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BachHoa] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BachHoa] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BachHoa] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BachHoa] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BachHoa] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BachHoa] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BachHoa] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BachHoa] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BachHoa] SET  MULTI_USER 
GO
ALTER DATABASE [BachHoa] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BachHoa] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BachHoa] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BachHoa] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BachHoa] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BachHoa] SET QUERY_STORE = OFF
GO
USE [BachHoa]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 3/30/2023 7:04:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 3/30/2023 7:04:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[order_id] [int] NOT NULL,
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[booking_date] [datetime] NULL,
	[delivery_date] [datetime] NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_detail]    Script Date: 3/30/2023 7:04:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_detail](
	[order_id] [int] NOT NULL,
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[price] [money] NULL,
	[quanitty] [int] NULL,
 CONSTRAINT [PK_Order_detail] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 3/30/2023 7:04:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
	[price] [int] NULL,
	[net_weight] [text] NULL,
	[expried] [date] NULL,
	[desciption] [nvarchar](500) NULL,
	[ingredient] [nvarchar](255) NULL,
	[guide] [nvarchar](500) NULL,
	[preserved] [nvarchar](255) NULL,
	[factory] [nvarchar](255) NULL,
	[brand] [nvarchar](255) NULL,
	[category_id] [int] NOT NULL,
	[image] [nvarchar](255) NULL,
	[quantity] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 3/30/2023 7:04:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[email] [varchar](50) NULL,
	[password] [varchar](50) NULL,
	[name] [nvarchar](50) NULL,
	[dob] [date] NULL,
	[gender] [nvarchar](5) NULL,
	[address] [nvarchar](255) NULL,
	[phonenumber] [varchar](50) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([category_id], [name]) VALUES (1, N'Thịt')
INSERT [dbo].[Categories] ([category_id], [name]) VALUES (2, N'Cá')
INSERT [dbo].[Categories] ([category_id], [name]) VALUES (3, N'Trứng')
INSERT [dbo].[Categories] ([category_id], [name]) VALUES (4, N'Sữa')
INSERT [dbo].[Categories] ([category_id], [name]) VALUES (5, N'Rau, Củ, Quả')
INSERT [dbo].[Categories] ([category_id], [name]) VALUES (6, N'Nước giải khát, Bia')
INSERT [dbo].[Categories] ([category_id], [name]) VALUES (7, N'Lương thực')
INSERT [dbo].[Categories] ([category_id], [name]) VALUES (8, N'Chăm sóc cá nhân')
INSERT [dbo].[Categories] ([category_id], [name]) VALUES (9, N'Dầu ăn')
INSERT [dbo].[Categories] ([category_id], [name]) VALUES (10, N'Kem')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([product_id], [name], [price], [net_weight], [expried], [desciption], [ingredient], [guide], [preserved], [factory], [brand], [category_id], [image], [quantity]) VALUES (1, N'Thịt heo CP', 72000, N'500g', NULL, N'Sườn cốt lết CP đạt các tiêu chuẩn về an toàn toàn thực phẩm, đảm bảo chất lượng, độ tươi ngon. Bản sườn to, dày và thịt heo mềm thích hợp để nướng hoặc làm sườn ram mặn ăn với cơm trắng. Thịt heo CP có thể dùng điện thoại quét mã QR trên tem sản phẩm để kiểm tra nguồn gốc.', N'Thịt heo', N'Nấu chín trước khi sử dụng', N'Bảo quản ở nhiệt độ 0 - 4 độ C', N'VIệt Nam', N'C.P', 1, N'/Content/Images/1', 4)
INSERT [dbo].[Product] ([product_id], [name], [price], [net_weight], [expried], [desciption], [ingredient], [guide], [preserved], [factory], [brand], [category_id], [image], [quantity]) VALUES (2, N'Đùi tỏi gà nhập khẩu đông lạnh', 45000, N'550g', NULL, N'Đùi tỏi gà nhập khẩu từ Mỹ được đóng gói và bảo quản theo những tiêu chuẩn nghiêm ngặt về vệ sinh và an toàn thực phẩm, đảm bảo về chất lượng. Đùi tỏi gà nhập khẩu đông lạnh với phương pháp cấp đông hiện đại, giúp lưu giữ hương vị tự nhiên, mang đến những món ăn ngon cho gia đình.', N'Thịt gà', N'Đùi gà tỏi cơ bản đã được làm sạch, do đó bạn chỉ cần rửa sạch lại đùi gà với muối, cuối cùng là rửa lại với nước sạch là có thể mang đi chế biến rồi.', N'Nên bảo quản thịt ở ngăn đông đá là -18°C đến 25°C và ngăn mát là 1 – 4°C.', N'Mỹ', N'USA', 1, N'/Content/Images/2', 2)
INSERT [dbo].[Product] ([product_id], [name], [price], [net_weight], [expried], [desciption], [ingredient], [guide], [preserved], [factory], [brand], [category_id], [image], [quantity]) VALUES (3, N'Đùi bò nhập khẩu đông lạnh', 99000, N'500g', NULL, N'Thịt đùi có vị ngon tương tự phần mông bò và thường được cắt thành lát dày như bít-tết để nướng. Đùi bò nhập khẩu đông lạnh được cấp đông từ thịt bò tươi ngon là sản phẩm có xuất xứ rõ ràng nên đảm bảo an toàn thực phẩm và giàu chất dinh dưỡng', N'thịt bò', N'Thịt đùi bò cơ bản đã được làm sạch, đóng khay, bạn chỉ cần rửa sạch lại và thái thành miếng vừa ăn, sau đó chế biến thành các món ăn yêu thích.', N'Thịt đùi bò nên được bảo quản trong ngăn mát tủ lạnh. Nếu đã rã đông thì không nên trữ đông lại.', N'Nga', N'Nga', 1, N'/Content/Images/3', 1)
INSERT [dbo].[Product] ([product_id], [name], [price], [net_weight], [expried], [desciption], [ingredient], [guide], [preserved], [factory], [brand], [category_id], [image], [quantity]) VALUES (5, N'Ba rọi xông khói xắt lát Le Gourmet', 51000, N'200g', NULL, N'Là loại sản phẩm cao cấp đến từ thương hiệu thịt nguội Le Gourmet quen thuộc. Ba rọi xông khói xắt lát Le Gourmet gói 200g được chế biến từ thịt heo ba rọi tươi ngon. Thịt nguội là lựa chọn hàng đầu khi không có quá nhiều thời gian chế biến cho bữa ăn gia đình.', N'thịt heo', N'Dùng ăn trực tiếp sau khi mở bao bì. Thái lát ăn ngay hoặc chế biến các món ăn theo nhu cầu', N'Để ở nhiệt độ 0 - 3 độ C bảo quản được 40 ngày. Ở nhiệt độ -12 đến -18 độ C bảo quản được 90 ngày.', N'Việt Nam', N'Việt Nam', 1, N'/Content/Images/4', 1)
INSERT [dbo].[Product] ([product_id], [name], [price], [net_weight], [expried], [desciption], [ingredient], [guide], [preserved], [factory], [brand], [category_id], [image], [quantity]) VALUES (6, N'Cá ngừ ồ nướng', 47000, N'300g', NULL, N'Cá ngừ ồ hay còn được gọi là cá ồ, là loại cá nước mặn, có lớp da ngoài trơn, màu đen và trắng bạc. Thịt cá được nướng chín tới bên trong nhiều, thơm ngon, chứa ít chất béo và calo nhưng rất giàu protein, tốt cho sức khỏe. Cá ngừ nướng có hương thơm đặc trưng, ăn thịt tươi và thấm vị', N'Cá', N' chiên bằng chảo, nồi chiên không dầu, nướng,…', N'Cá ngừ ồ nướng có thể bảo quản ở nhiệt độ thường hoặc bảo quản ngăn đông từ 0 - 4 độ C.', N'Việt Nam', N'Việt Nam', 2, N'/Content/Images/5', 3)
INSERT [dbo].[Product] ([product_id], [name], [price], [net_weight], [expried], [desciption], [ingredient], [guide], [preserved], [factory], [brand], [category_id], [image], [quantity]) VALUES (8, N'Cá nục nướng', 35000, N'300g', NULL, N'Cá nục là một trong những loại cá phổ biển, được nhiều người yêu thích. Cá nục nướng thơm ngon, nhiều thịt, thịt thơm, ngọt và béo. Cá nục có giá trị dinh dưỡng cao, giàu omega 3, DHA tốt cho não bộ, ngoài ra còn hỗ trợ điều trị cao huyết áp, hạn chế tiếu đường.', N'Cá', N'Ăn trực tiếp với cơm', N'Cá nục nên được bảo quản trong tủ lạnh để bảo quản sản phẩm được tươi ngon hơn và bảo quản được lâu hơn.', N'Việt Nam', N'Việt Nam', 2, N'/Content/Images/6', 5)
INSERT [dbo].[Product] ([product_id], [name], [price], [net_weight], [expried], [desciption], [ingredient], [guide], [preserved], [factory], [brand], [category_id], [image], [quantity]) VALUES (10, N'Cá hồi đông lạnh', 79000, N'300g', NULL, N'Cá hồi cắt khúc đông lạnh vẫn giữ được độ tươi ngon, màu sắc bắt mắt, được sơ chế sạch sẽ an toàn, đặt mua giao hàng trong ngày tại Bách hoá XANH. Cá hồi xuất xứ Chi Lê, chứa nhiều chất dinh dưỡng, được nhiều chọn mua cung cấp cho bữa ăn gia đình', N'Cá', N'Cá hồi được cắt khúc, làm sạch và đóng khay tiện lợi. Bạn chỉ cần rửa sạch lại với nước, tẩm ướp và chế biến thành các món ăn yêu thích', N'Cá hồi nên được bảo quản trong tủ lạnh để giúp cá tươi ngon lâu hơn.', N'Việt Nam', N'Việt Nam', 2, N'/Content/Images/7', 2)
INSERT [dbo].[Product] ([product_id], [name], [price], [net_weight], [expried], [desciption], [ingredient], [guide], [preserved], [factory], [brand], [category_id], [image], [quantity]) VALUES (11, N'Cá ngừ bò', 116000, N'1200g', NULL, N'Cá ngừ bò là loại cá biển có thịt chắc, dai, ngon, chất lượng. Cá ngừ bò được làm sẵn, tiện lợi, giúp khách hàng tiết kiệm thời gian. Cá ngừ bò có thể chế biến thành nhiều món ăn ngon, dinh dưỡng và hấp dẫn', N'Cá', N'Cá ngừ bò đã được làm sạch sẵn, sơ chế trước khi giao đến tay khách hàng. Vì vậy, bạn chỉ cần rửa sạch lại với nước muối và chế biến thành các món ăn yêu thích.', N'Cá ngừ bò nguyên con được làm sạch, nên được bảo quản trong tủ lạnh. Nếu cá đã được rã đông thì không nên cấp đông lại.', N'Việt Nam', N'Việt Nam', 2, N'/Content/Images/8', 1)
INSERT [dbo].[Product] ([product_id], [name], [price], [net_weight], [expried], [desciption], [ingredient], [guide], [preserved], [factory], [brand], [category_id], [image], [quantity]) VALUES (12, N'Trứng gà Happy Egg', 26000, N'54g', NULL, N'Hộp 10 trứng gà Happy Egg được đóng gói và bảo quản theo những tiêu chuẩn nghiêm ngặt về vệ sinh và an toàn thực phẩm, đảm bảo về chất lượng của thực phẩm. Trứng gà to tròn, đều. Trứng gà Happy Egg có thể luộc chín chế biến thành một số món ăn khác như: thịt kho trứng, cơm chiên trứng,...', N'Trứng', N'Trứng gà có thể luộc chín rồi thưởng thức hoặc có thể chế biến thành một số món ăn khác như: thịt kho trứng, cơm chiên trứng, khổ qua xào trứng, mì trứng chiên, lạp xưởng chiên trứng, trứng quậy,...', N'Sản phẩm nên được bảo quản ở ngăn mát của tủ lạnh để có thể bảo quản lâu hơn.', N'Việt Nam', N'Việt Nam', 3, N'/Content/Images/9', 10)
INSERT [dbo].[Product] ([product_id], [name], [price], [net_weight], [expried], [desciption], [ingredient], [guide], [preserved], [factory], [brand], [category_id], [image], [quantity]) VALUES (13, N'Trứng vịt bắc thảo', 27000, N'55g', NULL, N'Hộp 4 trứng vịt bắc thảo được đóng gói và bảo quản theo những tiêu chuẩn nghiêm ngặt về vệ sinh và an toàn thực phẩm, đảm bảo về chất lượng của thực phẩm. Trứng vịt to tròn, đều. Có thể luộc chín hoặc chế biến thành các món ăn khác như: cháo trứng bắc thảo, chả cá trứng bắc thảo,...', N'Trứng', N'Có thể luộc chín hoặc chế biến thành các món ăn khác như: cháo trứng bắc thảo, chả cá trứng bắc thảo,...', N'Nên bảo quản trứng ở ngăn mát ở tủ lạnh để bảo quản được lâu hơn.', N'Việt Nam', N'Việt Nam', 3, N'/Content/Images/10', 4)
INSERT [dbo].[Product] ([product_id], [name], [price], [net_weight], [expried], [desciption], [ingredient], [guide], [preserved], [factory], [brand], [category_id], [image], [quantity]) VALUES (14, N'Trứng cút tươi', 26000, N'68g', NULL, N'Hộp 30 trứng cút tươi được đóng gói và bảo quản theo những tiêu chuẩn nghiêm ngặt về vệ sinh và an toàn thực phẩm, đảm bảo về chất lượng của thực phẩm. Trứng cút tròn, đều.Trứng cút thì bạn có thể luộc chín chế biến thành một số món ăn như: trứng cút hun khói, xíu mại trứng cút,..', N'Trứng', N'Trứng cút thì bạn có thể luộc chín rồi thưởng thức hoặc có thể chế biến thành một số món ăn khác như: trứng cút hun khói, xíu mại trứng cút, đậu hũ kho trứng cút, trứng cút om coca,...', N'Có nhiều cách bảo quản trứng cút như bảo quản nơi khô ráo, thoáng mát, tránh ánh nắng trực tiếp của mặt trời.', N'Việt Nam', N'Việt Nam', 3, N'/Content/Images/11', 30)
INSERT [dbo].[Product] ([product_id], [name], [price], [net_weight], [expried], [desciption], [ingredient], [guide], [preserved], [factory], [brand], [category_id], [image], [quantity]) VALUES (16, N'Trứng gà ta', 20000, N'50g', NULL, N'Hộp 6 trứng gà ta được đóng gói và bảo quản theo những tiêu chuẩn nghiêm ngặt về vệ sinh và an toàn thực phẩm, đảm bảo về chất lượng của thực phẩm. Trứng gà to tròn, đều. Trứng gà ta thì bạn có thể luộc chín chế biến thành một số món ăn khác như: thịt kho trứng, cơm chiên trứng,...', N'Trứng', N'Luộc, kho, chiên', N'Sản phẩm nên được bảo quản ở ngăn mát của tủ lạnh để có thể bảo quản lâu hơn.', N'Việt Nam', N'Việt Nam', 3, N'/Content/Images/12', 6)
INSERT [dbo].[Product] ([product_id], [name], [price], [net_weight], [expried], [desciption], [ingredient], [guide], [preserved], [factory], [brand], [category_id], [image], [quantity]) VALUES (23, N'Thùng 48 hộp thức uống lúa mạch Milo Active Go', 340000, N'180ml', NULL, N'Sản phẩm sữa socola thơm ngon, giàu canxi và protein giúp cho cơ thể phát triển. Đặc biệt, thương hiệu sữa ca cao Milo nổi tiếng rất được các bé yêu thích và tin dùng. Thùng 48 hộp thức uống lúa mạch Milo Active Go 180ml cung cấp nguồn năng lượng dồi dào cho bé hoạt động mỗi ngày.', N'Sữa', N'Dùng uống trực tiếp. Ngon hơn khi uống lạnh.', N'Nơi khô ráo thoáng mát, tránh ánh nắng trực tiếp', N'Thuỵ Sĩ', N'Thuỵ Sĩ', 4, N'/Content/Images/13', 48)
INSERT [dbo].[Product] ([product_id], [name], [price], [net_weight], [expried], [desciption], [ingredient], [guide], [preserved], [factory], [brand], [category_id], [image], [quantity]) VALUES (25, N'Thùng 48 hộp sữa tươi ít đường Vinamilk', 340000, N'180ml', NULL, N'Được chế biến từ nguồn sữa tươi 100% chứa nhiều dưỡng chất như vitamin A, D3, canxi,... tốt cho xương và hệ miễn dịch, sữa tươi Vinamilk là thương hiệu được tin dùng hàng đầu với chất lượng tuyệt vời. Thùng 48 hộp sữa tươi ít đường Vinamilk 100% Sữa Tươi 180ml thơm ngon tiện lợi.', N'Sữa', N'Sử dụng ngay sau khi mở bao bì.', N'Bảo quản nơi khô ráo, thoáng mát.', N'Thuỵ Điển', N'Thuỵ Điển', 4, N'/Content/Images/14', 48)
INSERT [dbo].[Product] ([product_id], [name], [price], [net_weight], [expried], [desciption], [ingredient], [guide], [preserved], [factory], [brand], [category_id], [image], [quantity]) VALUES (26, N'Lốc 4 hộp sữa chua ít đường TH True Yogurt ', 28000, N'100g', NULL, N'Sữa chua TH True Yourt là dòng sữa chua sử dụng hoàn toàn sữa tươi sạch nguyên chất của trang trại TH, lên men tự nhiên, không chất bảo quản. Lốc 4 hộp sữa chua ít đường TH True Yogurt 100g mang đến hương vị thơm ngon, thanh nhẹ, cho cả nhà vui khỏe mỗi ngày.', N'Sữa', N'Sử dụng ngay sau khi mở bao bì', N'Bảo quản ở nhiệt độ 4 - 8 độ C', N'Việt Nam', N'Việt Nam', 4, N'/Content/Images/15', 4)
INSERT [dbo].[Product] ([product_id], [name], [price], [net_weight], [expried], [desciption], [ingredient], [guide], [preserved], [factory], [brand], [category_id], [image], [quantity]) VALUES (32, N'Thùng 40 bịch sữa đậu nành ít đường Fami Canxi ', 137000, N'200ml', NULL, N'Sữa đậu nành Fami là sữa đậu nành được bổ sung thêm canxi, vitamin D3 và vitamin B12 giúp chắc khoẻ xương. Sữa đậu nành Fami thơm ngon, dễ uống vô cùng. 40 bịch sữa ít đường canxi 200ml dễ uống, đóng thùng tiết kiệm, tiện dùng lâu dài.', N'Sữa', N'Sử dụn ngay sau khi mở bao bì', N'Bảo quản trong nhiệt độ từ 1-4 độ C', N'Việt Nam', N'Việt Nam', 4, N'/Content/Images/16', 40)
INSERT [dbo].[Product] ([product_id], [name], [price], [net_weight], [expried], [desciption], [ingredient], [guide], [preserved], [factory], [brand], [category_id], [image], [quantity]) VALUES (34, N'Rau diếp cá', 6400, N'100g', NULL, N'Rau diếp cá là loại rau thường được ăn sống để chấm thịt kho, cuốn bánh tráng,... Ngoài làm thực phẩm thì diếp cá còn là một vị thuốc đông y cực tốt để chữ trị một số bệnh nhẹ như táo bón, trĩ, hạ sốt,... Đặc biệt, diếp cá còn có thể giúp làm đẹp hiệu quả như: trị mụn, đẹp da,..', N'Rau', N'Sử dụng làm các món rau sống hoặc gỏi', N'Rau diếp cá nên được bảo quản trong ngăn mát tủ lạnh để giúp rau được tươi ngon lâu hơn.', N'Việt Nam', N'Việt Nam', 5, N'/Content/Images/17', 10)
INSERT [dbo].[Product] ([product_id], [name], [price], [net_weight], [expried], [desciption], [ingredient], [guide], [preserved], [factory], [brand], [category_id], [image], [quantity]) VALUES (35, N'Tắc trái', 8000, N'200g', NULL, N'Tắc trái của Bách Hóa Xanh tươi ngon, mọng nước và to trái. Tắc được bảo đảm các chỉ tiêu về an toàn và chất lượng. Hương tắc thơm, vị chua dịu, không quá gắt kích thích vị giác của người dùng thường được dùng ăn kèm với các món bún, pha nước tắc.', N'Quả', N'Sử dụng làm trà tắc,,,', N'Trái tắc nên được bảo quản trong ngăn mát tủ lạnh để giúp tắc được tươi, ngon, giữ được nước lâu hơn.', N'Việt Nam', N'Việt Nam', 5, N'/Content/Images/18', 20)
INSERT [dbo].[Product] ([product_id], [name], [price], [net_weight], [expried], [desciption], [ingredient], [guide], [preserved], [factory], [brand], [category_id], [image], [quantity]) VALUES (36, N'Gừng', 6000, N'100g', NULL, N'Gừng là một loại củ có rất nhiều công dụng đối với chúng ta. Ngoài là gia vị trong nấu ăn hàng ngày, gừng có thể dùng trong làm đẹp, làm thuốc cũng cực tốt. Có thể kể đến một số lợi ích của gừng như: làm ấm cơ thể, trừ hàn, tiêu đàm, dịu ho, cầm máu,...', N'Củ', N'Canh cải bẹ xanh nấu gừng,Đuôi bò hấp gừng,Mực nhồi thịt hấp gừng.', N'Gừng có thể bảo quản trong môi trường phòng khá lâu, tuy nhiên để gừng giữ được độ tươi, nên bảo quản trong ngăn mát tủ lạnh để sử dụng được lâu hơn.', N'Việt Nam', N'Việt Nam', 5, N'/Content/Images/19', 2)
INSERT [dbo].[Product] ([product_id], [name], [price], [net_weight], [expried], [desciption], [ingredient], [guide], [preserved], [factory], [brand], [category_id], [image], [quantity]) VALUES (37, N'Rau muống', 14000, N'300g', NULL, N'Rau muống hạt baby là rau non nên có độ giòn, ngọt hơn so với rau muống thông thường, quy trình trồng nghiêm ngặt, đảm bảo an toàn và chất lượng đến tay người tiêu dùng. Rau muống hạt baby có hàm lượng chất dinh dưỡng cao, đặc biệt là sắt và chất xơ, thường được dùng để luộc, xào,...', N'Rau', N'Luộc, xào...', N'Rau muống hạt baby nên được rửa sạch, để ráo nước, lót dưới đáy túi nilon một lớp giấy và bảo quản trong ngăn mát tủ lạnh giúp rau được tươi và ngọt.', N'Việt Nam', N'Việt Nam', 5, N'/Content/Images/20', 10)
INSERT [dbo].[Product] ([product_id], [name], [price], [net_weight], [expried], [desciption], [ingredient], [guide], [preserved], [factory], [brand], [category_id], [image], [quantity]) VALUES (38, N'Nước ngọt Coca Cola', 10000, N'600ml', NULL, N'Từ thương hiệu loại nước ngọt giải khát được nhiều người yêu thích với hương vị thơm ngon, sảng khoái. Nước ngọt Coca Cola chai 600ml chính hãng nước ngọt Coca Cola với lượng gas lớn sẽ giúp bạn xua tan mọi cảm giác mệt mỏi, căng thẳng, đem lại cảm giác thoải mái sau khi hoạt động ngoài trời', N'Nước Giải Khát', N'Dùng trực tiếp, ngon hơn khi uống lạnh.', N'Tránh ánh sáng trực tiếp từu mặt trời', N'Việt Nam', N'Việt Nam', 6, N'/Content/Images/21', 1)
INSERT [dbo].[Product] ([product_id], [name], [price], [net_weight], [expried], [desciption], [ingredient], [guide], [preserved], [factory], [brand], [category_id], [image], [quantity]) VALUES (39, N'6 lon nước ngọt có ga Mirinda vị soda kem việt quất', 62000, N'320ml', NULL, N'Nước ngọt Mirinda vị soda kem việt quất là dòng sản phẩm nước ngọt mang đến cho bạn nguồn năng lượng mới mẻ với vị soda kem ngon bùng nổ cùng hương việt quất. Hãy mua lốc 6 lon nước ngọt Mirinda vị soda kem việt quất 320ml để thưởng thức và cảm nhận vị ngon đặc biệt nhé!', N'Nước Giải Khát', N'Ngon hơn khi uống lạnh', N'Nơi khô ráo thoáng mát, tránh ánh nắng mặt trời.', N'Việt Nam', N'Việt Nam', 6, N'/Content/Images/22', 6)
INSERT [dbo].[Product] ([product_id], [name], [price], [net_weight], [expried], [desciption], [ingredient], [guide], [preserved], [factory], [brand], [category_id], [image], [quantity]) VALUES (40, N'Khay 24 lon bia Heineken Silver', 460000, N'330ml', NULL, N'Thương hiệu bia chất lượng được ưa chuộng tại hơn 192 quốc gia trên thế giới đến từ Hà Lan. Khay 24 lon Heineken Silver 330ml mang hương vị đặc trưng thơm ngon hương vị bia tuyệt hảo, cân bằng và êm dịu. Bên cạnh đó là thiết kế đẹp mắt, cho người dùng cảm giác sang trọng, nâng tầm đẳng cấp.', N'Bia', N'Ngon hơn khi uống lạnh', N'Nơi khô ráo, tránh ánh sáng mặt trời', N'Việt Nam ', N'Việt Nam ', 6, N'/Content/Images/23', 24)
INSERT [dbo].[Product] ([product_id], [name], [price], [net_weight], [expried], [desciption], [ingredient], [guide], [preserved], [factory], [brand], [category_id], [image], [quantity]) VALUES (42, N'Thùng 24 lon bia Heineken Sleek', 445000, N'330ml', NULL, N'Bia chất lượng từ thương hiệu được ưa chuộng tại hơn 192 quốc gia trên thế giới đến từ Hà Lan - Bia Heineken. 24 lon Heineken Sleek 330ml mang hương vị đặc trưng thơm ngon hương vị bia tuyệt hảo, cân bằng và êm dịu, thiết kế đẹp mắt, cho người dùng cảm giác sang trọng, nâng tầm đẳng cấp.', N'Bia', N'Ngon hơn khi uống lạnh', N'Nơi khô ráo, tránh ánh sáng mặt trời', N'Việt Nam ', N'Việt Nam ', 6, N'/Content/Images/24', 24)
INSERT [dbo].[Product] ([product_id], [name], [price], [net_weight], [expried], [desciption], [ingredient], [guide], [preserved], [factory], [brand], [category_id], [image], [quantity]) VALUES (43, N'Gạo thơm Vua Gạo ST25 Lúa Tôm', 195000, N'5kg', NULL, N'Gạo thơm Vua Gạo ST25 Lúa Tôm túi 5kg là loại gạo thơm ngon, có độ dẻo và mềm đặc biệt, hạt gạo thon dài, không bị khô sau khi nấu. Sản phẩm gạo Vua Gạo được đánh giá cao về chất lượng sản phẩm, hương vị thơm ngon, hấp dẫn, túi 5kg thích hợp cho gia đình sử dụng.', N'Lương thực', N'1 chén gạo cho 1,1 chén nước (tăng giảm tuỳ khẩu vị)', N'Bảo quản nơi khô ráo, thoáng mát, cách xa nơi có độ ẩm cao và tránh ánh nắng trực tiếp', N'Việt Nam', N'Việt Nam', 7, N'/Content/Images/25', 1)
INSERT [dbo].[Product] ([product_id], [name], [price], [net_weight], [expried], [desciption], [ingredient], [guide], [preserved], [factory], [brand], [category_id], [image], [quantity]) VALUES (44, N'Xúc xích tiệt trùng Winner Gold C.P', 17000, N'175g', NULL, N'Xúc xích thơm ngon, đậm vị thịt bò, gia vị vừa phải ăn rất ngon miệng. Xúc xích tiệt trùng Winner Gold C.P gói 175g dinh dưỡng, có thể ăn với mì tôm hoặc những món ăn khác như xúc xích chiên rất ngon. C.P là thương hiệu xúc xích lớn tại Việt Nam được nhiều người tin dùng', N'Lương thực', N'Ăn liền hoặc ăn kèm mì, bánh mì, pizza,..', N'Bảo quản nơi khô ráo, thoáng mát, nhiệt độ thường, tránh ánh nắng trực tiếp và côn trùng', N'Việt Nam', N'Việt Nam', 7, N'/Content/Images/26', 5)
INSERT [dbo].[Product] ([product_id], [name], [price], [net_weight], [expried], [desciption], [ingredient], [guide], [preserved], [factory], [brand], [category_id], [image], [quantity]) VALUES (45, N'Cá ngừ xốt cà chua Tuna Việt Nam', 16000, N'140g', NULL, N'Cá ngừ xốt cà chua Tuna Việt Nam lon 140g của cá hộp Tuna Việt Nam với hơn 60% cá ngừ , hòa quyện với sốt cà chua đặc cùng các gia vị được tuyển chọn kĩ càng đã tạo nên một món cá hộp đầy bổ dưỡng, lạ miệng, phù hợp cho việc chế biến các món ăn trong gia đình hoặc đi dã ngoại du lịch.', N'Lương thực', N'Dùng ngày sau khi mở nắp, có thể làm nóng trước lại khi dùng hoặc chế biến thành các món ăn khác', N'Để nơi khô ráo, thoáng mát', N'Việt Nam', N'Việt Nam', 7, N'/Content/Images/27', 1)
INSERT [dbo].[Product] ([product_id], [name], [price], [net_weight], [expried], [desciption], [ingredient], [guide], [preserved], [factory], [brand], [category_id], [image], [quantity]) VALUES (46, N'Sườn non chay An Nhiên', 36000, N'150g', NULL, N'Sườn chay rất tiện lợi, mỗi lần dùng chỉ cần sơ chế qua 15 phút là nấu được, giá lại rẻ nữa. Sườn non chay An Nhiên gói 150g chất lượng có thể chế biến các món chiên, xáo, cháo, súp,... tùy ý. Đồ chay An Nhiên chất lượng, an toàn vệ sinh và nhanh gọn cho người ăn chay', N'Lương thực', N'Ngâm nước, rửa sạch, dùng để chế biến những món ăn như kho, xào nướng, nấu la-gu, trộn gỏi, nấu cháo, lẩu, phở, súp.', N'Nơi khô ráo, thoáng mát, tránh ánh nắng trực tiếp', N'Việt Nam', N'Việt Nam', 7, N'/Content/Images/28', 1)
INSERT [dbo].[Product] ([product_id], [name], [price], [net_weight], [expried], [desciption], [ingredient], [guide], [preserved], [factory], [brand], [category_id], [image], [quantity]) VALUES (47, N'6 cuộn giấy vệ sinh tre không lõi Lency 2 lớp', 27000, N'10g', NULL, N'Giấy vệ sinh từ thương hiệu giấy vệ sinh Lency với thành phần 100% bột giấy nguyên chất, an toàn cho da. 6 cuộn giấy vệ sinh tre không lõi Lency 2 lớp nhiều giấy hơn, mềm mại, thấm hút tốt, dùng để vệ sinh cá nhân, lau chùi các bề mặt, vật dụng,...trong gia đình, văn phòng.', N'Chăm sóc cá nhân', N'Xé và dùng', N'Nơi khô ráo', N'Việt Nam', N'Việt Nam', 8, N'/Content/Images/29', 6)
INSERT [dbo].[Product] ([product_id], [name], [price], [net_weight], [expried], [desciption], [ingredient], [guide], [preserved], [factory], [brand], [category_id], [image], [quantity]) VALUES (48, N'Dầu gội Pantene PRO-V', 225000, N'900ml', NULL, N'Dầu gội thương hiệu Pantene được sản xuất trực tiếp tại Thái Lan. Dầu gội Pantene sạch gàu 900ml công thức Pro-V kết hợp cùng hoạt chất ZPT không chỉ làm sạch da, loại bỏ gàu mà còn giúp cân bằng độ ẩm, nuôi dưỡng tóc từ chân đến ngọn', N'Chăm sóc cá nhân', N'Làm ướt tóc, lấy một lượng dầu gội vừa đủ tạo bọt và xoa nhẹ nhàng lên tóc và da đầu, mát-xa và xả sạch lại với nước.', N'Tránh nhiệt độ cao và ánh nắng trực tiếp', N'Việt Nam', N'Việt Nam', 8, N'/Content/Images/30', 1)
INSERT [dbo].[Product] ([product_id], [name], [price], [net_weight], [expried], [desciption], [ingredient], [guide], [preserved], [factory], [brand], [category_id], [image], [quantity]) VALUES (49, N'Nước tẩy trang 3 in 1 Calliderm Micellar chiết xuất hoa hồng', 147000, N'500ml', NULL, N'Làm sạch hoàn toàn lớp trang điểm, bụi bẩn, bã nhờn bám sâu trong lỗ chân lông mà không gây khô hại da, phù hợp với làn da khô, thiếu ẩm. Với chiết xuất từ tinh chất hoa hồng giúp se khít lỗ chân lông, kháng khuẩn, ngừa mụn, làm sáng da', N'Chăm sóc cá nhân', N'Dùng bông tẩy trang thấm nước tẩy trang thoa lên mặt, mắt, cổ. Lặp lại đến khi sạch hoàn toàn, không cần rửa lại với nước', N'Nơi khô ráo, tránh ánh sáng trực tiếp từ mặt trời', N'Việt Nam', N'Việt Nam', 8, N'/Content/Images/31', 1)
INSERT [dbo].[Product] ([product_id], [name], [price], [net_weight], [expried], [desciption], [ingredient], [guide], [preserved], [factory], [brand], [category_id], [image], [quantity]) VALUES (50, N'Kem đánh răng P/S bảo vệ 123 than hoạt tính', 30000, N'230g', NULL, N'Với công dụng vượt trội, sản phẩm kem đánh răng chất lượng của thương hiệu kem đánh răng P/S được đánh giá tốt nhất tại Việt Nam. Kem đánh răng P/S bảo vệ 123 than hoạt tính 230g làm sạch các vết ố, mảng bám từ thức ăn, trả lại độ trắng tự nhiên cho răng.', N'Chăm sóc cá nhân', N'Lấy 1 lượng vừa đủ lên bàn chải đánh răng và dùng', N'nơi khô ráo, tránh ánh ánh sáng từ mặt trời', N'Việt Nam', N'Việt Nam', 8, N'/Content/Images/32', 1)
INSERT [dbo].[Product] ([product_id], [name], [price], [net_weight], [expried], [desciption], [ingredient], [guide], [preserved], [factory], [brand], [category_id], [image], [quantity]) VALUES (52, N'Dầu đậu nành nguyên chất Simply', 125000, N'2l', NULL, N'Dầu ăn Simply là loại dầu ăn sử dụng nguyên liệu chọn lọc, không chất bảo quản, tạo màu, rất an toàn cho sức khỏe. Dầu đậu nành Simply can 2 lít bổ sung Omega 3, 6, 9 có lợi cho sức khỏe và sự phát triển của não bộ, đẩy lùi nguy cơ mắc bệnh tim mạch.', N'Dầu ăn', N'Sử dụng khi nấu ăn ', N'Nơi thoáng mát, nên dùng trong 1 tháng sau khi mở nắp', N'Việt Nam', N'Việt Nam', 9, N'/Content/Images/33', 1)
INSERT [dbo].[Product] ([product_id], [name], [price], [net_weight], [expried], [desciption], [ingredient], [guide], [preserved], [factory], [brand], [category_id], [image], [quantity]) VALUES (53, N'Dầu ăn cao cấp Happi Koki', 98000, N'2l', NULL, N'Dầu ăn Happi Koki là loại dầu ăn không chứa cholesterol và axit béo cấu hình Trans, an toàn cho sức khỏe. Dầu ăn cao cấp Happi Koki chai 2 lít có nguồn gốc 100% từ thực vật, thích hợp dùng để chế biến thực phẩm từ chiên, xào, ướp các món mặn cho đến món chay.', N'Dầu ăn', N'dùng để chế biến thực phẩm từ chiên, xào, ướp các món mặn cho đến món chay.', N'Nơi thoáng mát, nên dùng trong 1 tháng sau khi mở nắp', N'Việt Nam', N'Việt Nam', 9, N'/Content/Images/34', 1)
INSERT [dbo].[Product] ([product_id], [name], [price], [net_weight], [expried], [desciption], [ingredient], [guide], [preserved], [factory], [brand], [category_id], [image], [quantity]) VALUES (54, N'Dầu thực vật Nakydaco Cooking Oil', 43000, N'1l', NULL, N'Dầu ăn Nakydaco hay còn gọi là dầu ăn con két, từ khâu nguyên liệu tới chế biến đều diễn ra khép kín dưới sự giám sát nghiêm ngặt. Dầu thực vật Cooking Oil Nakydaco 1 lít được chiết xuất từ các loại dầu tự nhiên khác nhau, không chứa hóa chất, chất bảo quản, an toàn cho sức khỏe người dùng.', N'Dầu ăn', N'Chiên, xào, trộn salad, làm bánh, sốt trứng, nấu món chay', N'Nơi thoáng mát, nên dùng trong 1 tháng sau khi mở nắp', N'Việt Nam', N'Việt Nam', 9, N'/Content/Images/35', 1)
INSERT [dbo].[Product] ([product_id], [name], [price], [net_weight], [expried], [desciption], [ingredient], [guide], [preserved], [factory], [brand], [category_id], [image], [quantity]) VALUES (55, N'Dầu đậu nành nguyên chất Bee Soya Nakydaco ', 340000, N'5l', NULL, N'Dầu ăn Nakydaco là thương hiệu dầu ăn đã có hơn 50 năm kinh nghiệm trên thị trường, đạt chuẩn an toàn thực phẩm ISO 22000. Dầu đậu nành nguyên chất Bee Soya Nakydaco 5 lít giàu chất chống oxy hóa, cải thiện các vấn đề về mắt và rất tốt cho tim mạch.', N'Dầu ăn', N'Dùng để chiên, xào, trộn salad, làm bánh, làm nước xốt, chay mặn đều dùng được', N'Nơi thoáng mát, nên dùng trong 2 - 3 tháng sau khi mở nắp', N'Việt Nam', N'Việt Nam', 9, N'/Content/Images/36', 1)
INSERT [dbo].[Product] ([product_id], [name], [price], [net_weight], [expried], [desciption], [ingredient], [guide], [preserved], [factory], [brand], [category_id], [image], [quantity]) VALUES (56, N'Kem que Topten Socola Wall''s', 11500, N'55g', NULL, N'Sản phẩm đến từ thương hiệu kem Wall''s quen thuộc. Kem que Topten Socola Wall''s 55g với lớp vỏ socola đậu phộng giòn rụm cùng vị thơm ngon ngọt bùi của lớp kem socola bên trong, mang đến hương vị đầy lôi cuốn ngay từ miếng cắn đầu tiên.', N'Kem', N'Sử dụng ngay sau khi mở bao bì', N'Bảo quản ở nhiệt độ dưới -18ºC', N'Thái Lan', N'Thái Lan', 10, N'/Content/Images/37', 1)
INSERT [dbo].[Product] ([product_id], [name], [price], [net_weight], [expried], [desciption], [ingredient], [guide], [preserved], [factory], [brand], [category_id], [image], [quantity]) VALUES (57, N'Kem cầu vòng Iberri', 60000, N'500ml', NULL, N'Từ thương hiệu kem iberri quen thuộc, mang đến sự kết hợp giữa nhiều hương vị. Kem cầu vòng Iberri hộp 500ml với sự kết hợp đa dạng hương vị độc đáo, màu sắc bắt mắt, có kẹo dẻo bên trong, mang lại cảm giác sảng khoái khi thưởng thức kem mát lạnh giữa thời tiết nóng bức.', N'Kem', N'Sử dụng ngay sau khi mở bao bì', N'Bảo quản ở nhiệt độ dưới -18ºC', N'Thái Lan', N'Thái Lan', 10, N'/Content/Images/38', 1)
INSERT [dbo].[Product] ([product_id], [name], [price], [net_weight], [expried], [desciption], [ingredient], [guide], [preserved], [factory], [brand], [category_id], [image], [quantity]) VALUES (58, N'Kem ốc quế socola dâu Cornetto', 19000, N'66g', NULL, N'Vị kem Cornetto mát lạnh, xua tan cơn nóng bức và mang đến cảm giác sảng khoái cho người dùng. Kem ốc quế socola dâu Cornetto cây 66g với hương vị kem socola dâu ngọt ngào kết hợp cùng bánh ốc quế giòn tan bắt vị.', N'Kem', N'Sử dụng ngay sau khi mở bao bì', N'Bảo quản ở nhiệt độ dưới -18ºC', N'Thái Lan', N'Thái Lan', 10, N'/Content/Images/39', 1)
INSERT [dbo].[Product] ([product_id], [name], [price], [net_weight], [expried], [desciption], [ingredient], [guide], [preserved], [factory], [brand], [category_id], [image], [quantity]) VALUES (59, N'Kem khoai môn Vinamilk', 74000, N'1l', NULL, N'Kem Vinamilk hãng kem với các loại kem cũng như hương vị độc đáo, được rất nhiều khách hàng tại Việt Nam tin dùng bởi chất lượng sản phẩm. Kem khoai môn Vinamilk hộp 1 lít kem dạng hộp đẹp mắt, hương vị khoai môn thơm ngon khó cưỡng, béo béo lạnh lạnh thích miệng', N'Kem', N'Sử dụng ngay sau khi mở bao bì', N'Bảo quản ở nhiệt độ dưới -18ºC', N'Thái Lan', N'Thái Lan', 10, N'/Content/Images/40', 1)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([user_id], [email], [password], [name], [dob], [gender], [address], [phonenumber]) VALUES (1, N'minh@gmail.com', N'minh123', N'minh', CAST(N'2002-03-29' AS Date), N'Nam', N'HCm', N'0351312312')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Users]
GO
ALTER TABLE [dbo].[Order_detail]  WITH CHECK ADD  CONSTRAINT [FK_Order_detail_Order] FOREIGN KEY([order_id])
REFERENCES [dbo].[Order] ([order_id])
GO
ALTER TABLE [dbo].[Order_detail] CHECK CONSTRAINT [FK_Order_detail_Order]
GO
ALTER TABLE [dbo].[Order_detail]  WITH CHECK ADD  CONSTRAINT [FK_Order_detail_Product] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([product_id])
GO
ALTER TABLE [dbo].[Order_detail] CHECK CONSTRAINT [FK_Order_detail_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Categories] FOREIGN KEY([category_id])
REFERENCES [dbo].[Categories] ([category_id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Categories]
GO
USE [master]
GO
ALTER DATABASE [BachHoa] SET  READ_WRITE 
GO
