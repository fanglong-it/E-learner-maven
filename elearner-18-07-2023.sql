USE [master]
GO
/****** Object:  Database [e-learner]    Script Date: 7/18/2023 11:47:28 PM ******/
CREATE DATABASE [e-learner]
ALTER DATABASE [e-learner] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [e-learner].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [e-learner] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [e-learner] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [e-learner] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [e-learner] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [e-learner] SET ARITHABORT OFF 
GO
ALTER DATABASE [e-learner] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [e-learner] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [e-learner] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [e-learner] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [e-learner] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [e-learner] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [e-learner] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [e-learner] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [e-learner] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [e-learner] SET  ENABLE_BROKER 
GO
ALTER DATABASE [e-learner] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [e-learner] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [e-learner] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [e-learner] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [e-learner] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [e-learner] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [e-learner] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [e-learner] SET RECOVERY FULL 
GO
ALTER DATABASE [e-learner] SET  MULTI_USER 
GO
ALTER DATABASE [e-learner] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [e-learner] SET DB_CHAINING OFF 
GO
ALTER DATABASE [e-learner] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [e-learner] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [e-learner] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'e-learner', N'ON'
GO
ALTER DATABASE [e-learner] SET QUERY_STORE = OFF
GO
USE [e-learner]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 7/18/2023 11:47:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](255) NULL,
	[password] [nvarchar](255) NULL,
	[status] [bit] NULL,
	[email] [nvarchar](255) NULL,
	[phone] [nvarchar](255) NULL,
	[fullname] [nvarchar](255) NULL,
	[address] [nvarchar](255) NULL,
	[avatar] [nvarchar](255) NULL,
	[roleId] [int] NULL,
 CONSTRAINT [PK__Account__3213E83F3BEF53B1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Class]    Script Date: 7/18/2023 11:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Class](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[className] [nvarchar](255) NULL,
	[maxStudent] [int] NULL,
	[userId] [int] NULL,
	[dateCreate] [date] NULL,
	[image] [nvarchar](255) NULL,
	[status] [bit] NULL,
	[courseId] [int] NULL,
 CONSTRAINT [PK__Class__3213E83FEE514B06] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 7/18/2023 11:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[courseName] [nvarchar](255) NULL,
	[status] [bit] NULL,
	[image] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[createDate] [date] NULL,
 CONSTRAINT [PK__Course__3213E83F4B6C639B] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FeedBack]    Script Date: 7/18/2023 11:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FeedBack](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[start] [int] NULL,
	[content] [nvarchar](255) NULL,
	[date] [date] NULL,
	[userId] [int] NULL,
	[teacherId] [int] NULL,
 CONSTRAINT [PK__FeedBack__3213E83F3F86C017] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GroupChat]    Script Date: 7/18/2023 11:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupChat](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[groupChatName] [nvarchar](255) NULL,
	[isPrivate] [bit] NULL,
	[classId] [int] NULL,
	[userId] [int] NULL,
 CONSTRAINT [PK__GroupCha__3213E83FDBD43DC8] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lesson]    Script Date: 7/18/2023 11:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lesson](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[lessonName] [nvarchar](255) NULL,
	[status] [bit] NULL,
	[description] [nvarchar](255) NULL,
	[videoUrl] [nvarchar](max) NULL,
	[courseId] [int] NULL,
 CONSTRAINT [PK__Lesson__3213E83F3CCBADA7] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Member]    Script Date: 7/18/2023 11:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Member](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[groupChatId] [int] NULL,
	[userId] [int] NULL,
	[isLeader] [int] NULL,
 CONSTRAINT [PK__Member__3213E83FDBD43DC8] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Message]    Script Date: 7/18/2023 11:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Message](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[content] [nvarchar](255) NULL,
	[resoucePathFile] [nvarchar](255) NULL,
	[userId] [int] NULL,
	[groupId] [int] NULL,
	[dateSended] [datetime] NULL,
 CONSTRAINT [PK__Message__3213E83F99F8FAF6] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notification]    Script Date: 7/18/2023 11:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notification](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[content] [nvarchar](255) NULL,
	[ownerId] [int] NULL,
	[dateCreate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RegistrationClass]    Script Date: 7/18/2023 11:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RegistrationClass](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[requestDate] [date] NULL,
	[requestStatus] [varchar](10) NULL,
	[classId] [int] NULL,
	[accountId] [int] NULL,
	[reason] [nvarchar](255) NULL,
 CONSTRAINT [PK__Registra__3213E83F19FF774F] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Resource]    Script Date: 7/18/2023 11:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Resource](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[resourceName] [nvarchar](255) NULL,
	[description] [nvarchar](255) NULL,
	[resourcePath] [nvarchar](255) NULL,
	[lessonId] [int] NULL,
 CONSTRAINT [PK__Resource__3213E83FF61910C0] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 7/18/2023 11:47:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[roleId] [int] NOT NULL,
	[roleName] [varchar](50) NOT NULL,
 CONSTRAINT [PK__Role__CD98462A6B065A89] PRIMARY KEY CLUSTERED 
(
	[roleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([id], [username], [password], [status], [email], [phone], [fullname], [address], [avatar], [roleId]) VALUES (1, N'admin', N'admin', 1, N'user1@example.com', N'123456789', N'Administration', N'Address 1', N'avatar1.jpg', 1)
INSERT [dbo].[Account] ([id], [username], [password], [status], [email], [phone], [fullname], [address], [avatar], [roleId]) VALUES (2, N'teacher', N'teacher', 1, N'teacher@gmail.com', N'987654321', N'teacher 1', N'Hanoi', N'team-1.jpg', 2)
INSERT [dbo].[Account] ([id], [username], [password], [status], [email], [phone], [fullname], [address], [avatar], [roleId]) VALUES (8, N'teacher2', N'teacher2', 1, N'teacher2@gmail.com', N'0984065979', N'Cô Thảo', N'address 2', N'team-2.jpg', 2)
INSERT [dbo].[Account] ([id], [username], [password], [status], [email], [phone], [fullname], [address], [avatar], [roleId]) VALUES (9, N'teacher3', N'teacher3', 1, N'teacher3@gmail.com', N'0984065979', N'Thầy Đạt', N'HCM City hahaha', N'team-4.jpg', 2)
INSERT [dbo].[Account] ([id], [username], [password], [status], [email], [phone], [fullname], [address], [avatar], [roleId]) VALUES (10, N'longpc', N'longpc', 1, N'longpc@gmail.com', N'0984065979', N'longpc', N'address 3', N'carousel-1.jpg', 3)
INSERT [dbo].[Account] ([id], [username], [password], [status], [email], [phone], [fullname], [address], [avatar], [roleId]) VALUES (11, N'fanglongpc', N'123456', 1, N'fang.longpc@gmail.com', N'984065979', N'PHUONG LONG', N'address 1', N'testimonial-4.jpg', 3)
INSERT [dbo].[Account] ([id], [username], [password], [status], [email], [phone], [fullname], [address], [avatar], [roleId]) VALUES (12, N'thanhdat', N'123456', 1, N'thanhdat123@gmail.com', N'0984065979', N'Thầy Thành Đạt', N'address 1', N'', 2)
INSERT [dbo].[Account] ([id], [username], [password], [status], [email], [phone], [fullname], [address], [avatar], [roleId]) VALUES (13, N'TatHai', N'123456', 1, N'tathai@gmail.com', N'0984065979', N'DO TAT HAI', N'Hanoi', N'course-3.jpg', 2)
INSERT [dbo].[Account] ([id], [username], [password], [status], [email], [phone], [fullname], [address], [avatar], [roleId]) VALUES (14, N'datnguyen', N'123456', 1, N'datnguyen@gmail.com', N'0984065979', N'Dat Nguyen', N'address 1', N'about.jpg', 3)
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Class] ON 

INSERT [dbo].[Class] ([id], [className], [maxStudent], [userId], [dateCreate], [image], [status], [courseId]) VALUES (14, N'Lớp Thầy Hải', 10, 13, CAST(N'2023-07-18' AS Date), N'123.png', 1, 1)
SET IDENTITY_INSERT [dbo].[Class] OFF
GO
SET IDENTITY_INSERT [dbo].[Course] ON 

INSERT [dbo].[Course] ([id], [courseName], [status], [image], [description], [createDate]) VALUES (1, N'Math', 1, N'course1.png', N'Description for Course 1', CAST(N'2023-01-01' AS Date))
INSERT [dbo].[Course] ([id], [courseName], [status], [image], [description], [createDate]) VALUES (2, N'Java', 1, N'course2.jpg', N'Description for Course 2', CAST(N'2023-02-01' AS Date))
INSERT [dbo].[Course] ([id], [courseName], [status], [image], [description], [createDate]) VALUES (3, N'Python', 1, N'course3.jpg', N'Description for Course 2', CAST(N'2023-02-01' AS Date))
INSERT [dbo].[Course] ([id], [courseName], [status], [image], [description], [createDate]) VALUES (4, N'Spring Boot', 1, N'course4.png', N'Description for Course 2', CAST(N'2023-02-01' AS Date))
INSERT [dbo].[Course] ([id], [courseName], [status], [image], [description], [createDate]) VALUES (5, N'VueJS', 0, N'course5.png', N'Description for Course 2', CAST(N'2023-02-01' AS Date))
INSERT [dbo].[Course] ([id], [courseName], [status], [image], [description], [createDate]) VALUES (6, N'ReactJs', 1, N'react.png', N'Khoá học react ngắn hạn', CAST(N'2023-07-12' AS Date))
SET IDENTITY_INSERT [dbo].[Course] OFF
GO
SET IDENTITY_INSERT [dbo].[FeedBack] ON 

INSERT [dbo].[FeedBack] ([id], [start], [content], [date], [userId], [teacherId]) VALUES (10, 4, N'Thầy này dạy sao thế ?', CAST(N'2023-07-18' AS Date), 10, 13)
INSERT [dbo].[FeedBack] ([id], [start], [content], [date], [userId], [teacherId]) VALUES (11, 5, N'Thầy dạy được !', CAST(N'2023-07-18' AS Date), 14, 13)
SET IDENTITY_INSERT [dbo].[FeedBack] OFF
GO
SET IDENTITY_INSERT [dbo].[GroupChat] ON 

INSERT [dbo].[GroupChat] ([id], [groupChatName], [isPrivate], [classId], [userId]) VALUES (17, N'Math-Lớp Thầy Hải', 0, 14, NULL)
INSERT [dbo].[GroupChat] ([id], [groupChatName], [isPrivate], [classId], [userId]) VALUES (18, N'longpc Send Message To DO TAT HAI', 1, NULL, NULL)
INSERT [dbo].[GroupChat] ([id], [groupChatName], [isPrivate], [classId], [userId]) VALUES (19, N'Test chat với long', 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[GroupChat] OFF
GO
SET IDENTITY_INSERT [dbo].[Lesson] ON 

INSERT [dbo].[Lesson] ([id], [lessonName], [status], [description], [videoUrl], [courseId]) VALUES (11, N'Trường Đời', 1, N'Nhạc Chill Hot TikTok Nghe Là Nghiện', N'YVWiKGzkmYU', 1)
SET IDENTITY_INSERT [dbo].[Lesson] OFF
GO
SET IDENTITY_INSERT [dbo].[Member] ON 

INSERT [dbo].[Member] ([id], [groupChatId], [userId], [isLeader]) VALUES (1033, 17, 13, 1)
INSERT [dbo].[Member] ([id], [groupChatId], [userId], [isLeader]) VALUES (1034, 17, 10, 0)
INSERT [dbo].[Member] ([id], [groupChatId], [userId], [isLeader]) VALUES (1035, 17, 14, 0)
INSERT [dbo].[Member] ([id], [groupChatId], [userId], [isLeader]) VALUES (1036, 18, 13, 1)
INSERT [dbo].[Member] ([id], [groupChatId], [userId], [isLeader]) VALUES (1037, 18, 10, 0)
INSERT [dbo].[Member] ([id], [groupChatId], [userId], [isLeader]) VALUES (1038, 19, 13, 1)
INSERT [dbo].[Member] ([id], [groupChatId], [userId], [isLeader]) VALUES (1039, 19, 10, 0)
SET IDENTITY_INSERT [dbo].[Member] OFF
GO
SET IDENTITY_INSERT [dbo].[Message] ON 

INSERT [dbo].[Message] ([id], [content], [resoucePathFile], [userId], [groupId], [dateSended]) VALUES (1046, N'longpc@gmail.com Has Join! this conversation ', N'', 10, 17, CAST(N'2023-07-18T22:59:13.807' AS DateTime))
INSERT [dbo].[Message] ([id], [content], [resoucePathFile], [userId], [groupId], [dateSended]) VALUES (1047, N'datnguyen@gmail.com Has Join! this conversation ', N'', 14, 17, CAST(N'2023-07-18T23:15:46.957' AS DateTime))
INSERT [dbo].[Message] ([id], [content], [resoucePathFile], [userId], [groupId], [dateSended]) VALUES (1048, N'Thầy gửi excel', N'INVOICE---20230718 (2).xlsx', 13, 17, CAST(N'2023-07-18T23:16:16.467' AS DateTime))
INSERT [dbo].[Message] ([id], [content], [resoucePathFile], [userId], [groupId], [dateSended]) VALUES (1049, N'helo', N'meo1.PNG', 13, 17, CAST(N'2023-07-18T23:16:40.147' AS DateTime))
INSERT [dbo].[Message] ([id], [content], [resoucePathFile], [userId], [groupId], [dateSended]) VALUES (1050, N'Cảm ơn thầy', N'', 10, 17, CAST(N'2023-07-18T23:17:15.727' AS DateTime))
INSERT [dbo].[Message] ([id], [content], [resoucePathFile], [userId], [groupId], [dateSended]) VALUES (1051, N'dell', N'', 10, 17, CAST(N'2023-07-18T23:18:27.633' AS DateTime))
INSERT [dbo].[Message] ([id], [content], [resoucePathFile], [userId], [groupId], [dateSended]) VALUES (1052, N'Dm cô', N'', 10, 17, CAST(N'2023-07-18T23:18:34.020' AS DateTime))
INSERT [dbo].[Message] ([id], [content], [resoucePathFile], [userId], [groupId], [dateSended]) VALUES (1053, N'Em chào Thầy', N'', 10, 18, CAST(N'2023-07-18T23:21:16.210' AS DateTime))
INSERT [dbo].[Message] ([id], [content], [resoucePathFile], [userId], [groupId], [dateSended]) VALUES (1054, N'Có gì ko e dm', N'', 13, 18, CAST(N'2023-07-18T23:21:35.660' AS DateTime))
INSERT [dbo].[Message] ([id], [content], [resoucePathFile], [userId], [groupId], [dateSended]) VALUES (1055, N'longpc@gmail.com Has Join! this conversation ', N'', 10, 19, CAST(N'2023-07-18T23:22:22.887' AS DateTime))
INSERT [dbo].[Message] ([id], [content], [resoucePathFile], [userId], [groupId], [dateSended]) VALUES (1056, N'Test 1', N'', 13, 17, CAST(N'2023-07-18T23:29:06.107' AS DateTime))
SET IDENTITY_INSERT [dbo].[Message] OFF
GO
SET IDENTITY_INSERT [dbo].[Notification] ON 

INSERT [dbo].[Notification] ([id], [content], [ownerId], [dateCreate]) VALUES (3, N'The student longpc has join the class 1', 2, CAST(N'2023-06-20T23:15:26.857' AS DateTime))
INSERT [dbo].[Notification] ([id], [content], [ownerId], [dateCreate]) VALUES (10, N'The student longpc has join the class 2', 8, CAST(N'2023-06-21T01:14:30.677' AS DateTime))
INSERT [dbo].[Notification] ([id], [content], [ownerId], [dateCreate]) VALUES (11, N'You have been approved by teacher teacher2', 10, CAST(N'2023-06-21T01:16:08.573' AS DateTime))
INSERT [dbo].[Notification] ([id], [content], [ownerId], [dateCreate]) VALUES (8, N'You have have been reject by teacher teacher<br> reason: hoc ngu qua cho nghi luon', 10, CAST(N'2023-06-20T23:50:23.910' AS DateTime))
INSERT [dbo].[Notification] ([id], [content], [ownerId], [dateCreate]) VALUES (9, N'The student longpc has join the class 3', 2, CAST(N'2023-06-20T23:54:44.427' AS DateTime))
INSERT [dbo].[Notification] ([id], [content], [ownerId], [dateCreate]) VALUES (12, N'The student longpc has send request to join class 7', 12, CAST(N'2023-07-12T02:16:58.027' AS DateTime))
INSERT [dbo].[Notification] ([id], [content], [ownerId], [dateCreate]) VALUES (13, N'The student PHUONG LONG has send request to join class 8', 8, CAST(N'2023-07-12T03:02:39.470' AS DateTime))
INSERT [dbo].[Notification] ([id], [content], [ownerId], [dateCreate]) VALUES (14, N'The student PHUONG LONG has send request to join class 9', 8, CAST(N'2023-07-12T03:11:59.497' AS DateTime))
INSERT [dbo].[Notification] ([id], [content], [ownerId], [dateCreate]) VALUES (15, N'The student PHUONG LONG has send request to join class 9', 8, CAST(N'2023-07-12T03:15:56.417' AS DateTime))
INSERT [dbo].[Notification] ([id], [content], [ownerId], [dateCreate]) VALUES (18, N'The student longpc has send request to join class 14', 13, CAST(N'2023-07-18T22:58:56.670' AS DateTime))
INSERT [dbo].[Notification] ([id], [content], [ownerId], [dateCreate]) VALUES (19, N'You have been approved to class 14 by DO TAT HAI', 10, CAST(N'2023-07-18T22:59:13.873' AS DateTime))
INSERT [dbo].[Notification] ([id], [content], [ownerId], [dateCreate]) VALUES (20, N'The student Dat Nguyen has send request to join class 14', 13, CAST(N'2023-07-18T23:07:28.560' AS DateTime))
INSERT [dbo].[Notification] ([id], [content], [ownerId], [dateCreate]) VALUES (21, N'You have been approved to class 14 by DO TAT HAI', 14, CAST(N'2023-07-18T23:15:47.037' AS DateTime))
INSERT [dbo].[Notification] ([id], [content], [ownerId], [dateCreate]) VALUES (16, N'The student PHUONG LONG has send request to join class 13', 8, CAST(N'2023-07-12T03:33:48.637' AS DateTime))
INSERT [dbo].[Notification] ([id], [content], [ownerId], [dateCreate]) VALUES (17, N'You have been approved to class 13 by Cô Thảo', 11, CAST(N'2023-07-12T03:34:40.443' AS DateTime))
SET IDENTITY_INSERT [dbo].[Notification] OFF
GO
SET IDENTITY_INSERT [dbo].[RegistrationClass] ON 

INSERT [dbo].[RegistrationClass] ([id], [requestDate], [requestStatus], [classId], [accountId], [reason]) VALUES (22, CAST(N'2023-07-18' AS Date), N'Approved', 14, 10, N'')
INSERT [dbo].[RegistrationClass] ([id], [requestDate], [requestStatus], [classId], [accountId], [reason]) VALUES (23, CAST(N'2023-07-18' AS Date), N'Approved', 14, 14, N'')
SET IDENTITY_INSERT [dbo].[RegistrationClass] OFF
GO
INSERT [dbo].[Role] ([roleId], [roleName]) VALUES (1, N'ADMIN')
INSERT [dbo].[Role] ([roleId], [roleName]) VALUES (2, N'TEACHER')
INSERT [dbo].[Role] ([roleId], [roleName]) VALUES (3, N'STUDENT')
INSERT [dbo].[Role] ([roleId], [roleName]) VALUES (4, N'CUSTOMER')
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK__Account__roleId__38996AB5] FOREIGN KEY([roleId])
REFERENCES [dbo].[Role] ([roleId])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK__Account__roleId__38996AB5]
GO
ALTER TABLE [dbo].[Class]  WITH CHECK ADD  CONSTRAINT [FK_COURSE_ID] FOREIGN KEY([courseId])
REFERENCES [dbo].[Course] ([id])
GO
ALTER TABLE [dbo].[Class] CHECK CONSTRAINT [FK_COURSE_ID]
GO
ALTER TABLE [dbo].[FeedBack]  WITH CHECK ADD  CONSTRAINT [FK__FeedBack__userId__3B75D760] FOREIGN KEY([userId])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[FeedBack] CHECK CONSTRAINT [FK__FeedBack__userId__3B75D760]
GO
ALTER TABLE [dbo].[Lesson]  WITH CHECK ADD  CONSTRAINT [FK__Lesson__courseId__4222D4EF] FOREIGN KEY([courseId])
REFERENCES [dbo].[Course] ([id])
GO
ALTER TABLE [dbo].[Lesson] CHECK CONSTRAINT [FK__Lesson__courseId__4222D4EF]
GO
ALTER TABLE [dbo].[Member]  WITH CHECK ADD  CONSTRAINT [FK__Member__groupCha__2CF2ADDF] FOREIGN KEY([groupChatId])
REFERENCES [dbo].[GroupChat] ([id])
GO
ALTER TABLE [dbo].[Member] CHECK CONSTRAINT [FK__Member__groupCha__2CF2ADDF]
GO
ALTER TABLE [dbo].[Member]  WITH CHECK ADD  CONSTRAINT [FK__Member__userId__2DE6D218] FOREIGN KEY([userId])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[Member] CHECK CONSTRAINT [FK__Member__userId__2DE6D218]
GO
ALTER TABLE [dbo].[Message]  WITH CHECK ADD  CONSTRAINT [FK__Message__groupId__4F7CD00D] FOREIGN KEY([groupId])
REFERENCES [dbo].[GroupChat] ([id])
GO
ALTER TABLE [dbo].[Message] CHECK CONSTRAINT [FK__Message__groupId__4F7CD00D]
GO
ALTER TABLE [dbo].[Message]  WITH CHECK ADD  CONSTRAINT [FK__Message__userId__4E88ABD4] FOREIGN KEY([userId])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[Message] CHECK CONSTRAINT [FK__Message__userId__4E88ABD4]
GO
ALTER TABLE [dbo].[Notification]  WITH CHECK ADD FOREIGN KEY([ownerId])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[RegistrationClass]  WITH CHECK ADD  CONSTRAINT [FK__Registrat__accou__47DBAE45] FOREIGN KEY([accountId])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[RegistrationClass] CHECK CONSTRAINT [FK__Registrat__accou__47DBAE45]
GO
ALTER TABLE [dbo].[RegistrationClass]  WITH CHECK ADD  CONSTRAINT [FK__Registrat__class__46E78A0C] FOREIGN KEY([classId])
REFERENCES [dbo].[Class] ([id])
GO
ALTER TABLE [dbo].[RegistrationClass] CHECK CONSTRAINT [FK__Registrat__class__46E78A0C]
GO
ALTER TABLE [dbo].[Resource]  WITH CHECK ADD  CONSTRAINT [Resource_FK] FOREIGN KEY([lessonId])
REFERENCES [dbo].[Lesson] ([id])
GO
ALTER TABLE [dbo].[Resource] CHECK CONSTRAINT [Resource_FK]
GO
USE [master]
GO
ALTER DATABASE [e-learner] SET  READ_WRITE 
GO
