USE [master]
GO
/****** Object:  Database [FAP]    Script Date: 7/17/2024 8:33:32 AM ******/
CREATE DATABASE [FAP]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FAP', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\FAP.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FAP_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\FAP_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [FAP] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FAP].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FAP] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FAP] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FAP] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FAP] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FAP] SET ARITHABORT OFF 
GO
ALTER DATABASE [FAP] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [FAP] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FAP] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FAP] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FAP] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FAP] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FAP] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FAP] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FAP] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FAP] SET  ENABLE_BROKER 
GO
ALTER DATABASE [FAP] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FAP] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FAP] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FAP] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FAP] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FAP] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FAP] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FAP] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FAP] SET  MULTI_USER 
GO
ALTER DATABASE [FAP] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FAP] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FAP] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FAP] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FAP] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FAP] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [FAP] SET QUERY_STORE = ON
GO
ALTER DATABASE [FAP] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [FAP]
GO
/****** Object:  Table [dbo].[academic]    Script Date: 7/17/2024 8:33:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[academic](
	[academic_id] [int] IDENTITY(1,1) NOT NULL,
	[roll_number] [nvarchar](250) NULL,
	[old_number] [nvarchar](250) NULL,
	[enroll_date] [date] NULL,
	[mode] [nvarchar](250) NULL,
	[student_status] [bit] NULL,
	[current_term] [nvarchar](250) NULL,
	[major] [nvarchar](15) NULL,
	[curriculumn] [nvarchar](250) NULL,
	[capstone] [nvarchar](250) NULL,
	[sid] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[academic_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[application]    Script Date: 7/17/2024 8:33:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[application](
	[app_id] [int] IDENTITY(1,1) NOT NULL,
	[sid] [int] NOT NULL,
	[sendApp] [text] NOT NULL,
	[send_at] [datetime] NULL,
	[type_id] [int] NULL,
	[feedback] [text] NULL,
	[feedback_time] [datetime] NULL,
	[did] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[app_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[assesments]    Script Date: 7/17/2024 8:33:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[assesments](
	[aid] [int] NOT NULL,
	[aname] [varchar](150) NOT NULL,
	[weight] [float] NOT NULL,
	[subid] [int] NULL,
 CONSTRAINT [PK_assesments] PRIMARY KEY CLUSTERED 
(
	[aid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Attendence]    Script Date: 7/17/2024 8:33:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attendence](
	[aid] [int] IDENTITY(1,1) NOT NULL,
	[leid] [int] NOT NULL,
	[sid] [int] NULL,
	[description] [varchar](150) NOT NULL,
	[isPresent] [bit] NOT NULL,
	[capturedtime] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[aid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[courses]    Script Date: 7/17/2024 8:33:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[courses](
	[cid] [int] NOT NULL,
	[cname] [varchar](150) NOT NULL,
	[lid] [int] NOT NULL,
	[subid] [int] NOT NULL,
	[semid] [int] NOT NULL,
 CONSTRAINT [PK_courses] PRIMARY KEY CLUSTERED 
(
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[departments]    Script Date: 7/17/2024 8:33:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[departments](
	[did] [int] NOT NULL,
	[dname] [varchar](150) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[did] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[exams]    Script Date: 7/17/2024 8:33:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[exams](
	[eid] [int] NOT NULL,
	[from] [datetime] NOT NULL,
	[duration] [float] NOT NULL,
	[aid] [int] NOT NULL,
 CONSTRAINT [PK_exams] PRIMARY KEY CLUSTERED 
(
	[eid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[features]    Script Date: 7/17/2024 8:33:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[features](
	[featureid] [int] NOT NULL,
	[url] [varchar](max) NOT NULL,
 CONSTRAINT [PK_features] PRIMARY KEY CLUSTERED 
(
	[featureid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[grades]    Script Date: 7/17/2024 8:33:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[grades](
	[eid] [int] NOT NULL,
	[sid] [int] NOT NULL,
	[score] [float] NOT NULL,
 CONSTRAINT [PK_grades] PRIMARY KEY CLUSTERED 
(
	[eid] ASC,
	[sid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[lecturers]    Script Date: 7/17/2024 8:33:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lecturers](
	[lid] [int] NOT NULL,
	[lname] [varchar](150) NOT NULL,
 CONSTRAINT [PK_lecturers] PRIMARY KEY CLUSTERED 
(
	[lid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lession]    Script Date: 7/17/2024 8:33:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lession](
	[leid] [int] IDENTITY(1,1) NOT NULL,
	[cid] [int] NOT NULL,
	[tid] [int] NOT NULL,
	[rid] [int] NOT NULL,
	[lid] [int] NOT NULL,
	[date] [date] NOT NULL,
	[isAttended] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[leid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[profile]    Script Date: 7/17/2024 8:33:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[profile](
	[profile_id] [int] IDENTITY(1,1) NOT NULL,
	[fullname] [nvarchar](250) NULL,
	[dob] [date] NULL,
	[gender] [bit] NULL,
	[id_card] [nvarchar](250) NULL,
	[student_address] [nvarchar](250) NULL,
	[phonenumber] [nvarchar](15) NULL,
	[email] [nvarchar](250) NULL,
	[date_of_issue] [date] NULL,
	[place_of_isue] [nvarchar](250) NULL,
	[sid] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[profile_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[roles]    Script Date: 7/17/2024 8:33:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roles](
	[roleid] [int] NOT NULL,
	[rolename] [varchar](150) NOT NULL,
 CONSTRAINT [PK_roles] PRIMARY KEY CLUSTERED 
(
	[roleid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[roles_features]    Script Date: 7/17/2024 8:33:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roles_features](
	[roleid] [int] NOT NULL,
	[featureid] [int] NOT NULL,
 CONSTRAINT [PK_roles_features] PRIMARY KEY CLUSTERED 
(
	[roleid] ASC,
	[featureid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 7/17/2024 8:33:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[rid] [int] NOT NULL,
	[rname] [varchar](150) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[rid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[semester]    Script Date: 7/17/2024 8:33:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[semester](
	[semid] [int] NOT NULL,
	[year] [int] NOT NULL,
	[season] [varchar](10) NOT NULL,
	[active] [bit] NOT NULL,
 CONSTRAINT [PK_semester] PRIMARY KEY CLUSTERED 
(
	[semid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[students]    Script Date: 7/17/2024 8:33:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[students](
	[sid] [int] NOT NULL,
	[sname] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_students] PRIMARY KEY CLUSTERED 
(
	[sid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[students_courses]    Script Date: 7/17/2024 8:33:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[students_courses](
	[sid] [int] NOT NULL,
	[cid] [int] NOT NULL,
 CONSTRAINT [PK_students_courses] PRIMARY KEY CLUSTERED 
(
	[sid] ASC,
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[subjects]    Script Date: 7/17/2024 8:33:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[subjects](
	[subid] [int] NOT NULL,
	[subname] [varchar](150) NOT NULL,
 CONSTRAINT [PK_subjects] PRIMARY KEY CLUSTERED 
(
	[subid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TimeSlot]    Script Date: 7/17/2024 8:33:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimeSlot](
	[tid] [int] NOT NULL,
	[tname] [varchar](150) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[tid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[type]    Script Date: 7/17/2024 8:33:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[type](
	[type_id] [int] IDENTITY(1,1) NOT NULL,
	[type_name] [nvarchar](250) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_student]    Script Date: 7/17/2024 8:33:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_student](
	[username] [varchar](150) NULL,
	[sid] [int] NULL,
	[active] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 7/17/2024 8:33:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[username] [varchar](150) NOT NULL,
	[password] [varchar](150) NOT NULL,
	[displayname] [varchar](150) NOT NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users_departments]    Script Date: 7/17/2024 8:33:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users_departments](
	[username] [varchar](150) NOT NULL,
	[did] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users_lecturers]    Script Date: 7/17/2024 8:33:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users_lecturers](
	[username] [varchar](150) NOT NULL,
	[lid] [int] NOT NULL,
	[active] [bit] NOT NULL,
 CONSTRAINT [PK_users_lecturers] PRIMARY KEY CLUSTERED 
(
	[username] ASC,
	[lid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users_roles]    Script Date: 7/17/2024 8:33:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users_roles](
	[username] [varchar](150) NOT NULL,
	[roleid] [int] NOT NULL,
 CONSTRAINT [PK_users_roles] PRIMARY KEY CLUSTERED 
(
	[username] ASC,
	[roleid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[academic] ON 

INSERT [dbo].[academic] ([academic_id], [roll_number], [old_number], [enroll_date], [mode], [student_status], [current_term], [major], [curriculumn], [capstone], [sid]) VALUES (1, N'HE186637', NULL, NULL, N'Chính quy', 1, N'4', N'BIT', NULL, NULL, 1)
INSERT [dbo].[academic] ([academic_id], [roll_number], [old_number], [enroll_date], [mode], [student_status], [current_term], [major], [curriculumn], [capstone], [sid]) VALUES (2, N'HE176137', NULL, NULL, N'Chính quy', 1, N'4', N'BIT', NULL, NULL, 2)
SET IDENTITY_INSERT [dbo].[academic] OFF
GO
SET IDENTITY_INSERT [dbo].[application] ON 

INSERT [dbo].[application] ([app_id], [sid], [sendApp], [send_at], [type_id], [feedback], [feedback_time], [did]) VALUES (3, 1, N'agergregrfvdvrf', CAST(N'2024-07-16T00:00:00.000' AS DateTime), 1, N'frebsdgbsgn', CAST(N'2024-07-16T23:54:04.817' AS DateTime), 1)
INSERT [dbo].[application] ([app_id], [sid], [sendApp], [send_at], [type_id], [feedback], [feedback_time], [did]) VALUES (4, 2, N'Em mu?n th?c m?c', CAST(N'2024-07-16T00:00:00.000' AS DateTime), 2, N'Ð?ng ý', CAST(N'2024-07-17T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[application] ([app_id], [sid], [sendApp], [send_at], [type_id], [feedback], [feedback_time], [did]) VALUES (1010, 1, N'vfvbbgsgb', CAST(N'2024-07-16T23:31:04.937' AS DateTime), NULL, N'', CAST(N'2024-07-16T00:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[application] OFF
GO
INSERT [dbo].[assesments] ([aid], [aname], [weight], [subid]) VALUES (1, N'WS1', 0.05, 1)
INSERT [dbo].[assesments] ([aid], [aname], [weight], [subid]) VALUES (2, N'WS2', 0.05, 1)
INSERT [dbo].[assesments] ([aid], [aname], [weight], [subid]) VALUES (3, N'PT', 0.05, 1)
INSERT [dbo].[assesments] ([aid], [aname], [weight], [subid]) VALUES (4, N'PT2', 0.05, 1)
INSERT [dbo].[assesments] ([aid], [aname], [weight], [subid]) VALUES (5, N'Assignment', 0.4, 1)
INSERT [dbo].[assesments] ([aid], [aname], [weight], [subid]) VALUES (6, N'Final Exam', 0.2, 1)
INSERT [dbo].[assesments] ([aid], [aname], [weight], [subid]) VALUES (7, N'Practical Exam', 0.2, 1)
INSERT [dbo].[assesments] ([aid], [aname], [weight], [subid]) VALUES (8, N'WS1', 0.5, 2)
INSERT [dbo].[assesments] ([aid], [aname], [weight], [subid]) VALUES (9, N'WS2', 0.5, 2)
INSERT [dbo].[assesments] ([aid], [aname], [weight], [subid]) VALUES (10, N'FE', 1, 3)
GO
INSERT [dbo].[courses] ([cid], [cname], [lid], [subid], [semid]) VALUES (1, N'SE1871-PRJ301', 1, 1, 4)
INSERT [dbo].[courses] ([cid], [cname], [lid], [subid], [semid]) VALUES (2, N'SE1871-IOT102', 2, 2, 4)
INSERT [dbo].[courses] ([cid], [cname], [lid], [subid], [semid]) VALUES (3, N'SE1871-PRO192', 1, 3, 4)
INSERT [dbo].[courses] ([cid], [cname], [lid], [subid], [semid]) VALUES (4, N'SE1922-PRJ301', 1, 1, 4)
GO
INSERT [dbo].[departments] ([did], [dname]) VALUES (1, N'admin')
GO
INSERT [dbo].[exams] ([eid], [from], [duration], [aid]) VALUES (1, CAST(N'2024-06-17T09:00:00.000' AS DateTime), 30, 1)
INSERT [dbo].[exams] ([eid], [from], [duration], [aid]) VALUES (2, CAST(N'2024-06-17T09:00:00.000' AS DateTime), 30, 2)
INSERT [dbo].[exams] ([eid], [from], [duration], [aid]) VALUES (3, CAST(N'2024-06-17T09:00:00.000' AS DateTime), 30, 3)
INSERT [dbo].[exams] ([eid], [from], [duration], [aid]) VALUES (4, CAST(N'2024-06-17T09:00:00.000' AS DateTime), 30, 4)
INSERT [dbo].[exams] ([eid], [from], [duration], [aid]) VALUES (5, CAST(N'2024-06-17T09:00:00.000' AS DateTime), 30, 5)
INSERT [dbo].[exams] ([eid], [from], [duration], [aid]) VALUES (6, CAST(N'2024-06-17T09:00:00.000' AS DateTime), 30, 6)
INSERT [dbo].[exams] ([eid], [from], [duration], [aid]) VALUES (7, CAST(N'2024-06-17T09:00:00.000' AS DateTime), 30, 7)
INSERT [dbo].[exams] ([eid], [from], [duration], [aid]) VALUES (8, CAST(N'2024-06-18T09:00:00.000' AS DateTime), 30, 1)
INSERT [dbo].[exams] ([eid], [from], [duration], [aid]) VALUES (9, CAST(N'2024-06-18T09:00:00.000' AS DateTime), 30, 8)
INSERT [dbo].[exams] ([eid], [from], [duration], [aid]) VALUES (10, CAST(N'2024-06-18T09:00:00.000' AS DateTime), 30, 9)
INSERT [dbo].[exams] ([eid], [from], [duration], [aid]) VALUES (11, CAST(N'2024-06-18T09:00:00.000' AS DateTime), 30, 10)
GO
INSERT [dbo].[features] ([featureid], [url]) VALUES (1, N'/exam/lecturer')
INSERT [dbo].[features] ([featureid], [url]) VALUES (2, N'/exam/take')
GO
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (1, 1, 8)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (1, 2, 1)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (2, 1, 2)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (3, 2, 9)
GO
INSERT [dbo].[lecturers] ([lid], [lname]) VALUES (1, N'sonnt')
INSERT [dbo].[lecturers] ([lid], [lname]) VALUES (2, N'sonhx')
INSERT [dbo].[lecturers] ([lid], [lname]) VALUES (3, N'sonnt1')
GO
SET IDENTITY_INSERT [dbo].[profile] ON 

INSERT [dbo].[profile] ([profile_id], [fullname], [dob], [gender], [id_card], [student_address], [phonenumber], [email], [date_of_issue], [place_of_isue], [sid]) VALUES (1, N'Đỗ Trung Hiếu', CAST(N'2004-10-27' AS Date), 1, N'026204004382', N'Số nhà 33, đường Tô Hiến Thành, Phường Đồng Tâm, Thành phố Vĩnh Yên, Vĩnh Phúc', N'0374209688', N'hieudthe186637@fpt.edu.vn', CAST(N'2021-04-13' AS Date), N'Cục cảnh sát quản lý hành chính về trật tự xã hội.', 1)
INSERT [dbo].[profile] ([profile_id], [fullname], [dob], [gender], [id_card], [student_address], [phonenumber], [email], [date_of_issue], [place_of_isue], [sid]) VALUES (2, N'Chu Thế Văn', CAST(N'2003-04-06' AS Date), 1, N'026204004382', N'Từ Sơn, Bắc Ninh', N'0374209688', N'vancthe17@fpt.edu.vn', CAST(N'2021-04-21' AS Date), N'Cục cảnh sát quản lý hành chính về trật tự xã hội', 2)
SET IDENTITY_INSERT [dbo].[profile] OFF
GO
INSERT [dbo].[roles] ([roleid], [rolename]) VALUES (1, N'student ')
INSERT [dbo].[roles] ([roleid], [rolename]) VALUES (2, N'lecturer')
INSERT [dbo].[roles] ([roleid], [rolename]) VALUES (3, N'department')
GO
INSERT [dbo].[roles_features] ([roleid], [featureid]) VALUES (2, 1)
INSERT [dbo].[roles_features] ([roleid], [featureid]) VALUES (2, 2)
GO
INSERT [dbo].[semester] ([semid], [year], [season], [active]) VALUES (1, 2023, N'SUMMER', 0)
INSERT [dbo].[semester] ([semid], [year], [season], [active]) VALUES (2, 2023, N'FALL', 0)
INSERT [dbo].[semester] ([semid], [year], [season], [active]) VALUES (3, 2024, N'SPRING', 0)
INSERT [dbo].[semester] ([semid], [year], [season], [active]) VALUES (4, 2024, N'SUMMER', 1)
GO
INSERT [dbo].[students] ([sid], [sname]) VALUES (1, N'student 1')
INSERT [dbo].[students] ([sid], [sname]) VALUES (2, N'student 2')
INSERT [dbo].[students] ([sid], [sname]) VALUES (3, N'student 3')
INSERT [dbo].[students] ([sid], [sname]) VALUES (4, N'student 4')
INSERT [dbo].[students] ([sid], [sname]) VALUES (5, N'student 5')
INSERT [dbo].[students] ([sid], [sname]) VALUES (6, N'student 6')
GO
INSERT [dbo].[students_courses] ([sid], [cid]) VALUES (1, 1)
INSERT [dbo].[students_courses] ([sid], [cid]) VALUES (1, 2)
INSERT [dbo].[students_courses] ([sid], [cid]) VALUES (2, 1)
INSERT [dbo].[students_courses] ([sid], [cid]) VALUES (2, 2)
INSERT [dbo].[students_courses] ([sid], [cid]) VALUES (3, 1)
INSERT [dbo].[students_courses] ([sid], [cid]) VALUES (3, 3)
INSERT [dbo].[students_courses] ([sid], [cid]) VALUES (4, 3)
GO
INSERT [dbo].[subjects] ([subid], [subname]) VALUES (1, N'PRJ301')
INSERT [dbo].[subjects] ([subid], [subname]) VALUES (2, N'IOT102')
INSERT [dbo].[subjects] ([subid], [subname]) VALUES (3, N'PRO192')
GO
SET IDENTITY_INSERT [dbo].[type] ON 

INSERT [dbo].[type] ([type_id], [type_name]) VALUES (1, N'Đơn khác')
INSERT [dbo].[type] ([type_id], [type_name]) VALUES (2, N'Đơn hoàn lại tiền ')
SET IDENTITY_INSERT [dbo].[type] OFF
GO
INSERT [dbo].[user_student] ([username], [sid], [active]) VALUES (N'hieudt', 1, 1)
INSERT [dbo].[user_student] ([username], [sid], [active]) VALUES (N'vanct', 2, 1)
GO
INSERT [dbo].[users] ([username], [password], [displayname]) VALUES (N'hieudt', N'123', N'Do Trung Hieu')
INSERT [dbo].[users] ([username], [password], [displayname]) VALUES (N'khanhkt', N'123', N'Khanh kt')
INSERT [dbo].[users] ([username], [password], [displayname]) VALUES (N'sonhx', N'123', N'Hoang Xuan Son')
INSERT [dbo].[users] ([username], [password], [displayname]) VALUES (N'sonnt', N'123', N'Ngo Tung Son')
INSERT [dbo].[users] ([username], [password], [displayname]) VALUES (N'vanct', N'123', N'Chu The Van')
GO
INSERT [dbo].[users_departments] ([username], [did]) VALUES (N'khanhkt', 1)
GO
INSERT [dbo].[users_lecturers] ([username], [lid], [active]) VALUES (N'sonhx', 1, 1)
INSERT [dbo].[users_lecturers] ([username], [lid], [active]) VALUES (N'sonnt', 2, 1)
GO
INSERT [dbo].[users_roles] ([username], [roleid]) VALUES (N'hieudt', 1)
INSERT [dbo].[users_roles] ([username], [roleid]) VALUES (N'khanhkt', 3)
INSERT [dbo].[users_roles] ([username], [roleid]) VALUES (N'sonhx', 2)
INSERT [dbo].[users_roles] ([username], [roleid]) VALUES (N'sonnt ', 2)
INSERT [dbo].[users_roles] ([username], [roleid]) VALUES (N'vanct', 1)
GO
ALTER TABLE [dbo].[academic]  WITH CHECK ADD  CONSTRAINT [FK_Academic_Student] FOREIGN KEY([sid])
REFERENCES [dbo].[students] ([sid])
GO
ALTER TABLE [dbo].[academic] CHECK CONSTRAINT [FK_Academic_Student]
GO
ALTER TABLE [dbo].[application]  WITH CHECK ADD  CONSTRAINT [FK_application_students] FOREIGN KEY([sid])
REFERENCES [dbo].[students] ([sid])
GO
ALTER TABLE [dbo].[application] CHECK CONSTRAINT [FK_application_students]
GO
ALTER TABLE [dbo].[application]  WITH CHECK ADD  CONSTRAINT [FK_application_type] FOREIGN KEY([type_id])
REFERENCES [dbo].[type] ([type_id])
GO
ALTER TABLE [dbo].[application] CHECK CONSTRAINT [FK_application_type]
GO
ALTER TABLE [dbo].[application]  WITH CHECK ADD  CONSTRAINT [FK_Department] FOREIGN KEY([did])
REFERENCES [dbo].[departments] ([did])
GO
ALTER TABLE [dbo].[application] CHECK CONSTRAINT [FK_Department]
GO
ALTER TABLE [dbo].[assesments]  WITH CHECK ADD  CONSTRAINT [FK_assesments_subjects] FOREIGN KEY([subid])
REFERENCES [dbo].[subjects] ([subid])
GO
ALTER TABLE [dbo].[assesments] CHECK CONSTRAINT [FK_assesments_subjects]
GO
ALTER TABLE [dbo].[Attendence]  WITH CHECK ADD  CONSTRAINT [FK_Attendence_Lession] FOREIGN KEY([leid])
REFERENCES [dbo].[Lession] ([leid])
GO
ALTER TABLE [dbo].[Attendence] CHECK CONSTRAINT [FK_Attendence_Lession]
GO
ALTER TABLE [dbo].[Attendence]  WITH CHECK ADD  CONSTRAINT [FK_Attendence_Lession1] FOREIGN KEY([leid])
REFERENCES [dbo].[Lession] ([leid])
GO
ALTER TABLE [dbo].[Attendence] CHECK CONSTRAINT [FK_Attendence_Lession1]
GO
ALTER TABLE [dbo].[Attendence]  WITH CHECK ADD  CONSTRAINT [FK_Attendence_Student] FOREIGN KEY([sid])
REFERENCES [dbo].[students] ([sid])
GO
ALTER TABLE [dbo].[Attendence] CHECK CONSTRAINT [FK_Attendence_Student]
GO
ALTER TABLE [dbo].[courses]  WITH CHECK ADD  CONSTRAINT [FK_courses_lecturers] FOREIGN KEY([lid])
REFERENCES [dbo].[lecturers] ([lid])
GO
ALTER TABLE [dbo].[courses] CHECK CONSTRAINT [FK_courses_lecturers]
GO
ALTER TABLE [dbo].[courses]  WITH CHECK ADD  CONSTRAINT [FK_courses_semester] FOREIGN KEY([semid])
REFERENCES [dbo].[semester] ([semid])
GO
ALTER TABLE [dbo].[courses] CHECK CONSTRAINT [FK_courses_semester]
GO
ALTER TABLE [dbo].[courses]  WITH CHECK ADD  CONSTRAINT [FK_courses_subjects] FOREIGN KEY([subid])
REFERENCES [dbo].[subjects] ([subid])
GO
ALTER TABLE [dbo].[courses] CHECK CONSTRAINT [FK_courses_subjects]
GO
ALTER TABLE [dbo].[exams]  WITH CHECK ADD  CONSTRAINT [FK_exams_assesments] FOREIGN KEY([aid])
REFERENCES [dbo].[assesments] ([aid])
GO
ALTER TABLE [dbo].[exams] CHECK CONSTRAINT [FK_exams_assesments]
GO
ALTER TABLE [dbo].[grades]  WITH CHECK ADD  CONSTRAINT [FK_grades_exams] FOREIGN KEY([eid])
REFERENCES [dbo].[exams] ([eid])
GO
ALTER TABLE [dbo].[grades] CHECK CONSTRAINT [FK_grades_exams]
GO
ALTER TABLE [dbo].[grades]  WITH CHECK ADD  CONSTRAINT [FK_grades_students] FOREIGN KEY([sid])
REFERENCES [dbo].[students] ([sid])
GO
ALTER TABLE [dbo].[grades] CHECK CONSTRAINT [FK_grades_students]
GO
ALTER TABLE [dbo].[Lession]  WITH CHECK ADD  CONSTRAINT [FK_Lession_courses] FOREIGN KEY([cid])
REFERENCES [dbo].[courses] ([cid])
GO
ALTER TABLE [dbo].[Lession] CHECK CONSTRAINT [FK_Lession_courses]
GO
ALTER TABLE [dbo].[Lession]  WITH CHECK ADD  CONSTRAINT [FK_Lession_Lecturer] FOREIGN KEY([lid])
REFERENCES [dbo].[lecturers] ([lid])
GO
ALTER TABLE [dbo].[Lession] CHECK CONSTRAINT [FK_Lession_Lecturer]
GO
ALTER TABLE [dbo].[Lession]  WITH CHECK ADD  CONSTRAINT [FK_Lession_Room] FOREIGN KEY([rid])
REFERENCES [dbo].[Room] ([rid])
GO
ALTER TABLE [dbo].[Lession] CHECK CONSTRAINT [FK_Lession_Room]
GO
ALTER TABLE [dbo].[Lession]  WITH CHECK ADD  CONSTRAINT [FK_Lession_TimeSlot] FOREIGN KEY([tid])
REFERENCES [dbo].[TimeSlot] ([tid])
GO
ALTER TABLE [dbo].[Lession] CHECK CONSTRAINT [FK_Lession_TimeSlot]
GO
ALTER TABLE [dbo].[profile]  WITH CHECK ADD  CONSTRAINT [FK_Profile_Student] FOREIGN KEY([sid])
REFERENCES [dbo].[students] ([sid])
GO
ALTER TABLE [dbo].[profile] CHECK CONSTRAINT [FK_Profile_Student]
GO
ALTER TABLE [dbo].[roles_features]  WITH CHECK ADD  CONSTRAINT [FK_roles_features_features] FOREIGN KEY([featureid])
REFERENCES [dbo].[features] ([featureid])
GO
ALTER TABLE [dbo].[roles_features] CHECK CONSTRAINT [FK_roles_features_features]
GO
ALTER TABLE [dbo].[roles_features]  WITH CHECK ADD  CONSTRAINT [FK_roles_features_roles] FOREIGN KEY([roleid])
REFERENCES [dbo].[roles] ([roleid])
GO
ALTER TABLE [dbo].[roles_features] CHECK CONSTRAINT [FK_roles_features_roles]
GO
ALTER TABLE [dbo].[students_courses]  WITH CHECK ADD  CONSTRAINT [FK_students_courses_courses] FOREIGN KEY([cid])
REFERENCES [dbo].[courses] ([cid])
GO
ALTER TABLE [dbo].[students_courses] CHECK CONSTRAINT [FK_students_courses_courses]
GO
ALTER TABLE [dbo].[students_courses]  WITH CHECK ADD  CONSTRAINT [FK_students_courses_students] FOREIGN KEY([sid])
REFERENCES [dbo].[students] ([sid])
GO
ALTER TABLE [dbo].[students_courses] CHECK CONSTRAINT [FK_students_courses_students]
GO
ALTER TABLE [dbo].[user_student]  WITH CHECK ADD  CONSTRAINT [FK_user_student_users] FOREIGN KEY([username])
REFERENCES [dbo].[users] ([username])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[user_student] CHECK CONSTRAINT [FK_user_student_users]
GO
ALTER TABLE [dbo].[user_student]  WITH CHECK ADD  CONSTRAINT [FK_users_student_students] FOREIGN KEY([sid])
REFERENCES [dbo].[students] ([sid])
GO
ALTER TABLE [dbo].[user_student] CHECK CONSTRAINT [FK_users_student_students]
GO
ALTER TABLE [dbo].[users_departments]  WITH CHECK ADD  CONSTRAINT [FK_users_departments_departments] FOREIGN KEY([did])
REFERENCES [dbo].[departments] ([did])
GO
ALTER TABLE [dbo].[users_departments] CHECK CONSTRAINT [FK_users_departments_departments]
GO
ALTER TABLE [dbo].[users_departments]  WITH CHECK ADD  CONSTRAINT [FK_users_departments_users] FOREIGN KEY([username])
REFERENCES [dbo].[users] ([username])
GO
ALTER TABLE [dbo].[users_departments] CHECK CONSTRAINT [FK_users_departments_users]
GO
ALTER TABLE [dbo].[users_lecturers]  WITH CHECK ADD  CONSTRAINT [FK_users_lecturers_lecturers] FOREIGN KEY([lid])
REFERENCES [dbo].[lecturers] ([lid])
GO
ALTER TABLE [dbo].[users_lecturers] CHECK CONSTRAINT [FK_users_lecturers_lecturers]
GO
ALTER TABLE [dbo].[users_lecturers]  WITH CHECK ADD  CONSTRAINT [FK_users_lecturers_users] FOREIGN KEY([username])
REFERENCES [dbo].[users] ([username])
GO
ALTER TABLE [dbo].[users_lecturers] CHECK CONSTRAINT [FK_users_lecturers_users]
GO
ALTER TABLE [dbo].[users_roles]  WITH CHECK ADD  CONSTRAINT [FK_users_roles_roles] FOREIGN KEY([roleid])
REFERENCES [dbo].[roles] ([roleid])
GO
ALTER TABLE [dbo].[users_roles] CHECK CONSTRAINT [FK_users_roles_roles]
GO
ALTER TABLE [dbo].[users_roles]  WITH CHECK ADD  CONSTRAINT [FK_users_roles_users] FOREIGN KEY([username])
REFERENCES [dbo].[users] ([username])
GO
ALTER TABLE [dbo].[users_roles] CHECK CONSTRAINT [FK_users_roles_users]
GO
USE [master]
GO
ALTER DATABASE [FAP] SET  READ_WRITE 
GO
