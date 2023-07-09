USE [master]
GO
/****** Object:  Database [e-learner]    Script Date: 7/9/2023 8:04:42 PM ******/
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
/****** Object:  Table [dbo].[Account]    Script Date: 7/9/2023 8:04:43 PM ******/
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
/****** Object:  Table [dbo].[Class]    Script Date: 7/9/2023 8:04:43 PM ******/
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
/****** Object:  Table [dbo].[Course]    Script Date: 7/9/2023 8:04:43 PM ******/
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
/****** Object:  Table [dbo].[FeedBack]    Script Date: 7/9/2023 8:04:43 PM ******/
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
    CONSTRAINT [PK__FeedBack__3213E83F3F86C017] PRIMARY KEY CLUSTERED
(
[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO
/****** Object:  Table [dbo].[GroupChat]    Script Date: 7/9/2023 8:04:43 PM ******/
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
/****** Object:  Table [dbo].[Lesson]    Script Date: 7/9/2023 8:04:43 PM ******/
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
/****** Object:  Table [dbo].[Member]    Script Date: 7/9/2023 8:04:43 PM ******/
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
/****** Object:  Table [dbo].[Message]    Script Date: 7/9/2023 8:04:43 PM ******/
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
/****** Object:  Table [dbo].[Notification]    Script Date: 7/9/2023 8:04:43 PM ******/
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
/****** Object:  Table [dbo].[RegistrationClass]    Script Date: 7/9/2023 8:04:43 PM ******/
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
/****** Object:  Table [dbo].[Resource]    Script Date: 7/9/2023 8:04:43 PM ******/
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
/****** Object:  Table [dbo].[Role]    Script Date: 7/9/2023 8:04:43 PM ******/
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
    INSERT [dbo].[Account] ([id], [username], [password], [status], [email], [phone], [fullname], [address], [avatar], [roleId]) VALUES (9, N'teacher3', N'teacher3', 1, N'teacher3@gmail.com', N'0984065979', N'Thầy Hải', N'address 3', N'team-3.jpg', 2)
    INSERT [dbo].[Account] ([id], [username], [password], [status], [email], [phone], [fullname], [address], [avatar], [roleId]) VALUES (10, N'longpc', N'longpc', 1, N'longpc@gmail.com', N'0984065979', N'longpc', N'address 3', N'meo1.PNG', 3)
    SET IDENTITY_INSERT [dbo].[Account] OFF
    GO
    SET IDENTITY_INSERT [dbo].[Class] ON

    INSERT [dbo].[Class] ([id], [className], [maxStudent], [userId], [dateCreate], [image], [status], [courseId]) VALUES (1, N'Class 1', 30, 2, CAST(N'2023-03-01' AS Date), N'classimage1.jpg', 1, 1)
    INSERT [dbo].[Class] ([id], [className], [maxStudent], [userId], [dateCreate], [image], [status], [courseId]) VALUES (2, N'Class 2', 30, 8, CAST(N'2023-03-01' AS Date), N'classimage1.jpg', 1, 1)
    INSERT [dbo].[Class] ([id], [className], [maxStudent], [userId], [dateCreate], [image], [status], [courseId]) VALUES (3, N'Class 2', 20, 2, CAST(N'2023-04-01' AS Date), N'classimage2.jpg', 1, 2)
    INSERT [dbo].[Class] ([id], [className], [maxStudent], [userId], [dateCreate], [image], [status], [courseId]) VALUES (4, N'Class 3', 20, 8, CAST(N'2023-04-01' AS Date), N'classimage2.jpg', 1, 3)
    INSERT [dbo].[Class] ([id], [className], [maxStudent], [userId], [dateCreate], [image], [status], [courseId]) VALUES (5, N'Class 4', 20, 9, CAST(N'2023-04-01' AS Date), N'classimage2.jpg', 1, 4)
    INSERT [dbo].[Class] ([id], [className], [maxStudent], [userId], [dateCreate], [image], [status], [courseId]) VALUES (6, N'Class 5', 20, 2, CAST(N'2023-04-01' AS Date), N'classimage2.jpg', 1, 5)
    SET IDENTITY_INSERT [dbo].[Class] OFF
    GO
    SET IDENTITY_INSERT [dbo].[Course] ON

    INSERT [dbo].[Course] ([id], [courseName], [status], [image], [description], [createDate]) VALUES (1, N'Math', 1, N'course1.png', N'Description for Course 1', CAST(N'2023-01-01' AS Date))
    INSERT [dbo].[Course] ([id], [courseName], [status], [image], [description], [createDate]) VALUES (2, N'Java', 1, N'course2.jpg', N'Description for Course 2', CAST(N'2023-02-01' AS Date))
    INSERT [dbo].[Course] ([id], [courseName], [status], [image], [description], [createDate]) VALUES (3, N'Python', 1, N'course3.jpg', N'Description for Course 2', CAST(N'2023-02-01' AS Date))
    INSERT [dbo].[Course] ([id], [courseName], [status], [image], [description], [createDate]) VALUES (4, N'Spring Boot', 1, N'course4.png', N'Description for Course 2', CAST(N'2023-02-01' AS Date))
    INSERT [dbo].[Course] ([id], [courseName], [status], [image], [description], [createDate]) VALUES (5, N'VueJS', 0, N'course5.png', N'Description for Course 2', CAST(N'2023-02-01' AS Date))
    SET IDENTITY_INSERT [dbo].[Course] OFF
    GO
    SET IDENTITY_INSERT [dbo].[FeedBack] ON

    INSERT [dbo].[FeedBack] ([id], [start], [content], [date], [userId]) VALUES (1, 5, N'Feedback content 1', CAST(N'2023-03-15' AS Date), 2)
    INSERT [dbo].[FeedBack] ([id], [start], [content], [date], [userId]) VALUES (2, 4, N'Feedback content 2', CAST(N'2023-04-15' AS Date), 2)
    SET IDENTITY_INSERT [dbo].[FeedBack] OFF
    GO
    SET IDENTITY_INSERT [dbo].[GroupChat] ON

    INSERT [dbo].[GroupChat] ([id], [groupChatName], [isPrivate], [classId], [userId]) VALUES (1, N'Group Chat 1', 0, 1, 2)
    INSERT [dbo].[GroupChat] ([id], [groupChatName], [isPrivate], [classId], [userId]) VALUES (2, N'Group Chat 2', 1, 2, 8)
    INSERT [dbo].[GroupChat] ([id], [groupChatName], [isPrivate], [classId], [userId]) VALUES (3, N'Group Chat 3', 0, 3, 2)
    INSERT [dbo].[GroupChat] ([id], [groupChatName], [isPrivate], [classId], [userId]) VALUES (4, N'Group Chat 4', 0, 4, 8)
    INSERT [dbo].[GroupChat] ([id], [groupChatName], [isPrivate], [classId], [userId]) VALUES (5, N'Group Chat 5', 0, 5, 9)
    INSERT [dbo].[GroupChat] ([id], [groupChatName], [isPrivate], [classId], [userId]) VALUES (6, N'Group Chat 6', 0, 6, 2)
    SET IDENTITY_INSERT [dbo].[GroupChat] OFF
    GO
    SET IDENTITY_INSERT [dbo].[Lesson] ON

    INSERT [dbo].[Lesson] ([id], [lessonName], [status], [description], [videoUrl], [courseId]) VALUES (1, N'Lesson 1', 1, N'Description for Lesson 1', N'jk0dILY3lqU', 1)
    INSERT [dbo].[Lesson] ([id], [lessonName], [status], [description], [videoUrl], [courseId]) VALUES (2, N'Lesson 2', 1, N'Description for Lesson 2', N'ljEwjChjCqA', 1)
    INSERT [dbo].[Lesson] ([id], [lessonName], [status], [description], [videoUrl], [courseId]) VALUES (3, N'Lesson 3', 1, N'Description for Lesson 3', N'yWv56h9oxG0', 1)
    INSERT [dbo].[Lesson] ([id], [lessonName], [status], [description], [videoUrl], [courseId]) VALUES (4, N'Lesson 4', 1, N'Description for Lesson 4', N'eY6U31dyuUs', 1)
    INSERT [dbo].[Lesson] ([id], [lessonName], [status], [description], [videoUrl], [courseId]) VALUES (5, N'Lesson 1', 1, N'Description for Lesson 1', N'D4o_8BhsK8s', 2)
    INSERT [dbo].[Lesson] ([id], [lessonName], [status], [description], [videoUrl], [courseId]) VALUES (6, N'Lesson 1', 1, N'Description for Lesson 1', N'wsNPdGi6ZlQ', 3)
    INSERT [dbo].[Lesson] ([id], [lessonName], [status], [description], [videoUrl], [courseId]) VALUES (7, N'Lesson 1', 1, N'Description for Lesson 1', N'MRZmg2-Egpw', 4)
    INSERT [dbo].[Lesson] ([id], [lessonName], [status], [description], [videoUrl], [courseId]) VALUES (8, N'Lesson 2', 1, N'Nhac remix', N'4VnAKcV6ls4', 3)
    SET IDENTITY_INSERT [dbo].[Lesson] OFF
    GO
    SET IDENTITY_INSERT [dbo].[Member] ON

    INSERT [dbo].[Member] ([id], [groupChatId], [userId], [isLeader]) VALUES (1012, 1, 2, 1)
    INSERT [dbo].[Member] ([id], [groupChatId], [userId], [isLeader]) VALUES (1013, 2, 8, 1)
    INSERT [dbo].[Member] ([id], [groupChatId], [userId], [isLeader]) VALUES (1014, 3, 2, 1)
    INSERT [dbo].[Member] ([id], [groupChatId], [userId], [isLeader]) VALUES (1015, 4, 8, 1)
    INSERT [dbo].[Member] ([id], [groupChatId], [userId], [isLeader]) VALUES (1016, 5, 9, 1)
    INSERT [dbo].[Member] ([id], [groupChatId], [userId], [isLeader]) VALUES (1017, 6, 2, 1)
    INSERT [dbo].[Member] ([id], [groupChatId], [userId], [isLeader]) VALUES (1018, 2, 10, NULL)
    SET IDENTITY_INSERT [dbo].[Member] OFF
    GO
    SET IDENTITY_INSERT [dbo].[Message] ON

    INSERT [dbo].[Message] ([id], [content], [resoucePathFile], [userId], [groupId], [dateSended]) VALUES (1026, N'longpc@gmail.com Has Join!', N'', 10, 2, CAST(N'2023-06-21T01:16:08.510' AS DateTime))
    INSERT [dbo].[Message] ([id], [content], [resoucePathFile], [userId], [groupId], [dateSended]) VALUES (1027, N'Chào e', N'', 8, 2, CAST(N'2023-06-21T01:17:28.263' AS DateTime))
    INSERT [dbo].[Message] ([id], [content], [resoucePathFile], [userId], [groupId], [dateSended]) VALUES (1028, N'Chào mừng e đến với lớp', N'', 8, 2, CAST(N'2023-06-21T01:17:44.327' AS DateTime))
    INSERT [dbo].[Message] ([id], [content], [resoucePathFile], [userId], [groupId], [dateSended]) VALUES (1029, N'E cảm ơn cô nhiều', N'', 10, 2, CAST(N'2023-06-21T01:18:04.327' AS DateTime))
    INSERT [dbo].[Message] ([id], [content], [resoucePathFile], [userId], [groupId], [dateSended]) VALUES (1030, N'Xin chao', N'', 10, 2, CAST(N'2023-07-09T19:48:23.597' AS DateTime))
    SET IDENTITY_INSERT [dbo].[Message] OFF
    GO
    SET IDENTITY_INSERT [dbo].[Notification] ON

    INSERT [dbo].[Notification] ([id], [content], [ownerId], [dateCreate]) VALUES (3, N'The student longpc has join the class 1', 2, CAST(N'2023-06-20T23:15:26.857' AS DateTime))
    INSERT [dbo].[Notification] ([id], [content], [ownerId], [dateCreate]) VALUES (10, N'The student longpc has join the class 2', 8, CAST(N'2023-06-21T01:14:30.677' AS DateTime))
    INSERT [dbo].[Notification] ([id], [content], [ownerId], [dateCreate]) VALUES (11, N'You have been approved by teacher teacher2', 10, CAST(N'2023-06-21T01:16:08.573' AS DateTime))
    INSERT [dbo].[Notification] ([id], [content], [ownerId], [dateCreate]) VALUES (8, N'You have have been reject by teacher teacher<br> reason: hoc ngu qua cho nghi luon', 10, CAST(N'2023-06-20T23:50:23.910' AS DateTime))
    INSERT [dbo].[Notification] ([id], [content], [ownerId], [dateCreate]) VALUES (9, N'The student longpc has join the class 3', 2, CAST(N'2023-06-20T23:54:44.427' AS DateTime))
    SET IDENTITY_INSERT [dbo].[Notification] OFF
    GO
    SET IDENTITY_INSERT [dbo].[RegistrationClass] ON

    INSERT [dbo].[RegistrationClass] ([id], [requestDate], [requestStatus], [classId], [accountId], [reason]) VALUES (16, CAST(N'2023-06-21' AS Date), N'Approved', 2, 10, N'')
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
ALTER TABLE [dbo].[GroupChat]  WITH CHECK ADD  CONSTRAINT [FK__GroupChat__class__4AB81AF0] FOREIGN KEY([classId])
    REFERENCES [dbo].[Class] ([id])
    GO
ALTER TABLE [dbo].[GroupChat] CHECK CONSTRAINT [FK__GroupChat__class__4AB81AF0]
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
