USE [ShippingOrderProjectDb]
GO
/****** Object:  Schema [HangFire]    Script Date: 11.10.2024 19:21:26 ******/
CREATE SCHEMA [HangFire]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 11.10.2024 19:21:26 ******/
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
/****** Object:  Table [dbo].[CarrierConfigurations]    Script Date: 11.10.2024 19:21:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarrierConfigurations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CarrierId] [int] NOT NULL,
	[CarrierMinDesi] [int] NOT NULL,
	[CarrierMaxDesi] [int] NOT NULL,
	[CarrierCost] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_CarrierConfigurations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CarrierReports]    Script Date: 11.10.2024 19:21:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarrierReports](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CarrierId] [int] NOT NULL,
	[CarrierCost] [decimal](18, 2) NOT NULL,
	[CarrierReportDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_CarrierReports] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Carriers]    Script Date: 11.10.2024 19:21:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carriers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CarrierName] [nvarchar](max) NOT NULL,
	[CarrierIsActive] [bit] NOT NULL,
	[CarrierPlusDesiCost] [int] NOT NULL,
	[CarrierConfigurationId] [int] NOT NULL,
 CONSTRAINT [PK_Carriers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 11.10.2024 19:21:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CarrierId] [int] NOT NULL,
	[OrderDesi] [int] NOT NULL,
	[OrderDate] [datetime2](7) NOT NULL,
	[OrderCarrierCost] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[AggregatedCounter]    Script Date: 11.10.2024 19:21:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[AggregatedCounter](
	[Key] [nvarchar](100) NOT NULL,
	[Value] [bigint] NOT NULL,
	[ExpireAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_CounterAggregated] PRIMARY KEY CLUSTERED 
(
	[Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Counter]    Script Date: 11.10.2024 19:21:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Counter](
	[Key] [nvarchar](100) NOT NULL,
	[Value] [int] NOT NULL,
	[ExpireAt] [datetime] NULL,
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_HangFire_Counter] PRIMARY KEY CLUSTERED 
(
	[Key] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Hash]    Script Date: 11.10.2024 19:21:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Hash](
	[Key] [nvarchar](100) NOT NULL,
	[Field] [nvarchar](100) NOT NULL,
	[Value] [nvarchar](max) NULL,
	[ExpireAt] [datetime2](7) NULL,
 CONSTRAINT [PK_HangFire_Hash] PRIMARY KEY CLUSTERED 
(
	[Key] ASC,
	[Field] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = ON, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Job]    Script Date: 11.10.2024 19:21:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Job](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[StateId] [bigint] NULL,
	[StateName] [nvarchar](20) NULL,
	[InvocationData] [nvarchar](max) NOT NULL,
	[Arguments] [nvarchar](max) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[ExpireAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_Job] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[JobParameter]    Script Date: 11.10.2024 19:21:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[JobParameter](
	[JobId] [bigint] NOT NULL,
	[Name] [nvarchar](40) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_HangFire_JobParameter] PRIMARY KEY CLUSTERED 
(
	[JobId] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[JobQueue]    Script Date: 11.10.2024 19:21:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[JobQueue](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[JobId] [bigint] NOT NULL,
	[Queue] [nvarchar](50) NOT NULL,
	[FetchedAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_JobQueue] PRIMARY KEY CLUSTERED 
(
	[Queue] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[List]    Script Date: 11.10.2024 19:21:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[List](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Key] [nvarchar](100) NOT NULL,
	[Value] [nvarchar](max) NULL,
	[ExpireAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_List] PRIMARY KEY CLUSTERED 
(
	[Key] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Schema]    Script Date: 11.10.2024 19:21:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Schema](
	[Version] [int] NOT NULL,
 CONSTRAINT [PK_HangFire_Schema] PRIMARY KEY CLUSTERED 
(
	[Version] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Server]    Script Date: 11.10.2024 19:21:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Server](
	[Id] [nvarchar](200) NOT NULL,
	[Data] [nvarchar](max) NULL,
	[LastHeartbeat] [datetime] NOT NULL,
 CONSTRAINT [PK_HangFire_Server] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Set]    Script Date: 11.10.2024 19:21:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Set](
	[Key] [nvarchar](100) NOT NULL,
	[Score] [float] NOT NULL,
	[Value] [nvarchar](256) NOT NULL,
	[ExpireAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_Set] PRIMARY KEY CLUSTERED 
(
	[Key] ASC,
	[Value] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = ON, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[State]    Script Date: 11.10.2024 19:21:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[State](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[JobId] [bigint] NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[Reason] [nvarchar](100) NULL,
	[CreatedAt] [datetime] NOT NULL,
	[Data] [nvarchar](max) NULL,
 CONSTRAINT [PK_HangFire_State] PRIMARY KEY CLUSTERED 
(
	[JobId] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241010110420_mg1', N'6.0.35')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241011122810_mg2', N'6.0.35')
GO
SET IDENTITY_INSERT [dbo].[CarrierConfigurations] ON 

INSERT [dbo].[CarrierConfigurations] ([Id], [CarrierId], [CarrierMinDesi], [CarrierMaxDesi], [CarrierCost]) VALUES (1, 1, 1, 10, CAST(32.00 AS Decimal(18, 2)))
INSERT [dbo].[CarrierConfigurations] ([Id], [CarrierId], [CarrierMinDesi], [CarrierMaxDesi], [CarrierCost]) VALUES (4, 4, 10, 20, CAST(40.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[CarrierConfigurations] OFF
GO
SET IDENTITY_INSERT [dbo].[CarrierReports] ON 

INSERT [dbo].[CarrierReports] ([Id], [CarrierId], [CarrierCost], [CarrierReportDate]) VALUES (1, 1, CAST(160.00 AS Decimal(18, 2)), CAST(N'2024-10-11T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[CarrierReports] ([Id], [CarrierId], [CarrierCost], [CarrierReportDate]) VALUES (2, 4, CAST(90.00 AS Decimal(18, 2)), CAST(N'2024-10-11T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[CarrierReports] ([Id], [CarrierId], [CarrierCost], [CarrierReportDate]) VALUES (3, 1, CAST(160.00 AS Decimal(18, 2)), CAST(N'2024-10-11T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[CarrierReports] ([Id], [CarrierId], [CarrierCost], [CarrierReportDate]) VALUES (4, 4, CAST(90.00 AS Decimal(18, 2)), CAST(N'2024-10-11T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[CarrierReports] ([Id], [CarrierId], [CarrierCost], [CarrierReportDate]) VALUES (5, 1, CAST(160.00 AS Decimal(18, 2)), CAST(N'2024-10-11T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[CarrierReports] ([Id], [CarrierId], [CarrierCost], [CarrierReportDate]) VALUES (6, 4, CAST(90.00 AS Decimal(18, 2)), CAST(N'2024-10-11T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[CarrierReports] ([Id], [CarrierId], [CarrierCost], [CarrierReportDate]) VALUES (7, 1, CAST(160.00 AS Decimal(18, 2)), CAST(N'2024-10-11T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[CarrierReports] ([Id], [CarrierId], [CarrierCost], [CarrierReportDate]) VALUES (8, 4, CAST(90.00 AS Decimal(18, 2)), CAST(N'2024-10-11T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[CarrierReports] ([Id], [CarrierId], [CarrierCost], [CarrierReportDate]) VALUES (9, 1, CAST(160.00 AS Decimal(18, 2)), CAST(N'2024-10-11T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[CarrierReports] ([Id], [CarrierId], [CarrierCost], [CarrierReportDate]) VALUES (10, 4, CAST(90.00 AS Decimal(18, 2)), CAST(N'2024-10-11T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[CarrierReports] ([Id], [CarrierId], [CarrierCost], [CarrierReportDate]) VALUES (11, 1, CAST(160.00 AS Decimal(18, 2)), CAST(N'2024-10-11T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[CarrierReports] ([Id], [CarrierId], [CarrierCost], [CarrierReportDate]) VALUES (12, 4, CAST(90.00 AS Decimal(18, 2)), CAST(N'2024-10-11T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[CarrierReports] ([Id], [CarrierId], [CarrierCost], [CarrierReportDate]) VALUES (13, 1, CAST(160.00 AS Decimal(18, 2)), CAST(N'2024-10-11T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[CarrierReports] ([Id], [CarrierId], [CarrierCost], [CarrierReportDate]) VALUES (14, 4, CAST(90.00 AS Decimal(18, 2)), CAST(N'2024-10-11T00:00:00.0000000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[CarrierReports] OFF
GO
SET IDENTITY_INSERT [dbo].[Carriers] ON 

INSERT [dbo].[Carriers] ([Id], [CarrierName], [CarrierIsActive], [CarrierPlusDesiCost], [CarrierConfigurationId]) VALUES (1, N'MNG', 1, 4, 0)
INSERT [dbo].[Carriers] ([Id], [CarrierName], [CarrierIsActive], [CarrierPlusDesiCost], [CarrierConfigurationId]) VALUES (4, N'Aras', 1, 5, 0)
SET IDENTITY_INSERT [dbo].[Carriers] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Id], [CarrierId], [OrderDesi], [OrderDate], [OrderCarrierCost]) VALUES (2, 1, 13, CAST(N'2024-10-11T14:02:23.2902270' AS DateTime2), CAST(44.00 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([Id], [CarrierId], [OrderDesi], [OrderDate], [OrderCarrierCost]) VALUES (3, 1, 13, CAST(N'2024-10-11T14:12:58.5501950' AS DateTime2), CAST(44.00 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([Id], [CarrierId], [OrderDesi], [OrderDate], [OrderCarrierCost]) VALUES (4, 1, 20, CAST(N'2024-10-11T14:24:05.2092055' AS DateTime2), CAST(72.00 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([Id], [CarrierId], [OrderDesi], [OrderDate], [OrderCarrierCost]) VALUES (5, 4, 22, CAST(N'2024-10-11T14:25:44.7264772' AS DateTime2), CAST(50.00 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([Id], [CarrierId], [OrderDesi], [OrderDate], [OrderCarrierCost]) VALUES (6, 4, 15, CAST(N'2024-10-11T14:25:58.3876659' AS DateTime2), CAST(40.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
INSERT [HangFire].[AggregatedCounter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:succeeded', 4, NULL)
INSERT [HangFire].[AggregatedCounter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:succeeded:2024-10-11', 6, CAST(N'2024-11-11T14:53:55.323' AS DateTime))
INSERT [HangFire].[AggregatedCounter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:succeeded:2024-10-11-12', 1, CAST(N'2024-10-12T12:39:26.130' AS DateTime))
INSERT [HangFire].[AggregatedCounter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:succeeded:2024-10-11-14', 5, CAST(N'2024-10-12T14:53:55.323' AS DateTime))
GO
SET IDENTITY_INSERT [HangFire].[Counter] ON 

INSERT [HangFire].[Counter] ([Key], [Value], [ExpireAt], [Id]) VALUES (N'stats:succeeded', 1, NULL, 21)
INSERT [HangFire].[Counter] ([Key], [Value], [ExpireAt], [Id]) VALUES (N'stats:succeeded:2024-10-11', 1, CAST(N'2024-11-11T15:26:57.723' AS DateTime), 22)
INSERT [HangFire].[Counter] ([Key], [Value], [ExpireAt], [Id]) VALUES (N'stats:succeeded:2024-10-11-15', 1, CAST(N'2024-10-12T15:26:57.723' AS DateTime), 23)
SET IDENTITY_INSERT [HangFire].[Counter] OFF
GO
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:generate-daily-carrier-report', N'CreatedAt', N'2024-10-11T12:34:37.5861365Z', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:generate-daily-carrier-report', N'Cron', N'0 * * * *', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:generate-daily-carrier-report', N'Job', N'{"Type":"ShippingOrderProject.Application.Jobs.CarrierReportJob, ShippingOrderProject.Application, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"GenerateDailyCarrierReport","ParameterTypes":"[\"System.Threading.CancellationToken, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\"]","Arguments":"[null]"}', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:generate-daily-carrier-report', N'LastExecution', N'2024-10-11T15:26:47.1761611Z', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:generate-daily-carrier-report', N'LastJobId', N'5', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:generate-daily-carrier-report', N'NextExecution', N'2024-10-11T16:00:00.0000000Z', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:generate-daily-carrier-report', N'Queue', N'default', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:generate-daily-carrier-report', N'TimeZoneId', N'UTC', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:generate-daily-carrier-report', N'V', N'2', NULL)
GO
SET IDENTITY_INSERT [HangFire].[Job] ON 

INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (1, 3, N'Succeeded', N'{"Type":"ShippingOrderProject.Application.Jobs.CarrierReportJob, ShippingOrderProject.Application, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"GenerateDailyCarrierReport","ParameterTypes":"[\"System.Threading.CancellationToken, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\"]","Arguments":null}', N'[null]', CAST(N'2024-10-11T12:39:23.207' AS DateTime), CAST(N'2024-10-12T12:39:26.143' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (2, 6, N'Succeeded', N'{"Type":"ShippingOrderProject.Application.Jobs.CarrierReportJob, ShippingOrderProject.Application, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"GenerateDailyCarrierReport","ParameterTypes":"[\"System.Threading.CancellationToken, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\"]","Arguments":null}', N'[null]', CAST(N'2024-10-11T14:33:15.200' AS DateTime), CAST(N'2024-10-12T14:33:25.593' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (3, 15, N'Succeeded', N'{"Type":"ShippingOrderProject.Application.Jobs.CarrierReportJob, ShippingOrderProject.Application, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"GenerateDailyCarrierReport","ParameterTypes":"[\"System.Threading.CancellationToken, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\"]","Arguments":null}', N'[null]', CAST(N'2024-10-11T14:33:51.433' AS DateTime), CAST(N'2024-10-12T14:39:40.630' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (4, 18, N'Succeeded', N'{"Type":"ShippingOrderProject.Application.Jobs.CarrierReportJob, ShippingOrderProject.Application, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"GenerateDailyCarrierReport","ParameterTypes":"[\"System.Threading.CancellationToken, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\"]","Arguments":null}', N'[null]', CAST(N'2024-10-11T14:53:50.297' AS DateTime), CAST(N'2024-10-12T14:53:55.340' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (5, 21, N'Succeeded', N'{"Type":"ShippingOrderProject.Application.Jobs.CarrierReportJob, ShippingOrderProject.Application, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"GenerateDailyCarrierReport","ParameterTypes":"[\"System.Threading.CancellationToken, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\"]","Arguments":null}', N'[null]', CAST(N'2024-10-11T15:26:47.520' AS DateTime), CAST(N'2024-10-12T15:26:57.743' AS DateTime))
SET IDENTITY_INSERT [HangFire].[Job] OFF
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (1, N'CurrentCulture', N'"tr-TR"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (1, N'CurrentUICulture', N'"tr-TR"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (1, N'RecurringJobId', N'"generate-daily-carrier-report"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (1, N'Time', N'1728650363')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (2, N'CurrentCulture', N'"tr-TR"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (2, N'CurrentUICulture', N'"tr-TR"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (2, N'RecurringJobId', N'"generate-daily-carrier-report"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (2, N'Time', N'1728657194')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (3, N'CurrentCulture', N'"tr-TR"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (3, N'CurrentUICulture', N'"tr-TR"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (3, N'RecurringJobId', N'"generate-daily-carrier-report"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (3, N'Time', N'1728657231')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (4, N'CurrentCulture', N'"tr-TR"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (4, N'CurrentUICulture', N'"tr-TR"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (4, N'RecurringJobId', N'"generate-daily-carrier-report"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (4, N'Time', N'1728658430')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (5, N'CurrentCulture', N'"tr-TR"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (5, N'CurrentUICulture', N'"tr-TR"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (5, N'RecurringJobId', N'"generate-daily-carrier-report"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (5, N'Time', N'1728660407')
GO
INSERT [HangFire].[Schema] ([Version]) VALUES (9)
GO
INSERT [HangFire].[Server] ([Id], [Data], [LastHeartbeat]) VALUES (N'desktop-oeifo1o:2832:06abe078-50ad-47bb-9650-81b1e54dad0a', N'{"WorkerCount":20,"Queues":["default"],"StartedAt":"2024-10-11T15:26:46.7363756Z"}', CAST(N'2024-10-11T15:27:16.873' AS DateTime))
GO
INSERT [HangFire].[Set] ([Key], [Score], [Value], [ExpireAt]) VALUES (N'recurring-jobs', 1728662400, N'generate-daily-carrier-report', NULL)
GO
SET IDENTITY_INSERT [HangFire].[State] ON 

INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (1, 1, N'Enqueued', N'Triggered using recurring job manager', CAST(N'2024-10-11T12:39:23.243' AS DateTime), N'{"EnqueuedAt":"2024-10-11T12:39:23.2334682Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (2, 1, N'Processing', NULL, CAST(N'2024-10-11T12:39:23.437' AS DateTime), N'{"StartedAt":"2024-10-11T12:39:23.2921606Z","ServerId":"desktop-oeifo1o:3416:a9e97bf8-562c-4d08-8960-51691607c0bc","WorkerId":"f0856a4d-ebac-4300-bf40-3c12506eaa0a"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (3, 1, N'Succeeded', NULL, CAST(N'2024-10-11T12:39:26.137' AS DateTime), N'{"SucceededAt":"2024-10-11T12:39:26.1244897Z","PerformanceDuration":"2678","Latency":"238"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (4, 2, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-11T14:33:15.257' AS DateTime), N'{"EnqueuedAt":"2024-10-11T14:33:15.2334219Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (5, 2, N'Processing', NULL, CAST(N'2024-10-11T14:33:15.880' AS DateTime), N'{"StartedAt":"2024-10-11T14:33:15.4652980Z","ServerId":"desktop-oeifo1o:9024:59929175-fe2f-48a7-a07f-f234845b7bc6","WorkerId":"5fb16fb4-8599-4684-a2ad-4ab457cc4815"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (6, 2, N'Succeeded', NULL, CAST(N'2024-10-11T14:33:25.577' AS DateTime), N'{"SucceededAt":"2024-10-11T14:33:25.5556961Z","PerformanceDuration":"9651","Latency":"703","Result":"{\"Data\":\"2 kargo raporu başarıyla oluşturuldu. Detaylı kayıt loglara yazıldı.\",\"ErrorMessages\":null,\"IsSuccessful\":true,\"StatusCode\":200}"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (7, 3, N'Enqueued', N'Triggered using recurring job manager', CAST(N'2024-10-11T14:33:51.440' AS DateTime), N'{"EnqueuedAt":"2024-10-11T14:33:51.4385053Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (8, 3, N'Processing', NULL, CAST(N'2024-10-11T14:33:51.463' AS DateTime), N'{"StartedAt":"2024-10-11T14:33:51.4577884Z","ServerId":"desktop-oeifo1o:9024:59929175-fe2f-48a7-a07f-f234845b7bc6","WorkerId":"b0f141a2-5c32-459c-b9d4-ffb2a2504214"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (9, 3, N'Succeeded', NULL, CAST(N'2024-10-11T14:33:51.700' AS DateTime), N'{"SucceededAt":"2024-10-11T14:33:51.6837254Z","PerformanceDuration":"200","Latency":"50","Result":"{\"Data\":\"2 kargo raporu başarıyla oluşturuldu. Detaylı kayıt loglara yazıldı.\",\"ErrorMessages\":null,\"IsSuccessful\":true,\"StatusCode\":200}"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (10, 3, N'Enqueued', N'Triggered via Dashboard UI', CAST(N'2024-10-11T14:39:38.870' AS DateTime), N'{"EnqueuedAt":"2024-10-11T14:39:38.8655221Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (11, 3, N'Processing', NULL, CAST(N'2024-10-11T14:39:38.890' AS DateTime), N'{"StartedAt":"2024-10-11T14:39:38.8901980Z","ServerId":"desktop-oeifo1o:9024:59929175-fe2f-48a7-a07f-f234845b7bc6","WorkerId":"de6901ad-93e9-4b3a-940f-81022b93e79a"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (12, 3, N'Succeeded', NULL, CAST(N'2024-10-11T14:39:38.983' AS DateTime), N'{"SucceededAt":"2024-10-11T14:39:38.9814376Z","PerformanceDuration":"87","Latency":"347460","Result":"{\"Data\":\"2 kargo raporu başarıyla oluşturuldu. Detaylı kayıt loglara yazıldı.\",\"ErrorMessages\":null,\"IsSuccessful\":true,\"StatusCode\":200}"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (13, 3, N'Enqueued', N'Triggered via Dashboard UI', CAST(N'2024-10-11T14:39:40.537' AS DateTime), N'{"EnqueuedAt":"2024-10-11T14:39:40.5364307Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (14, 3, N'Processing', NULL, CAST(N'2024-10-11T14:39:40.543' AS DateTime), N'{"StartedAt":"2024-10-11T14:39:40.5414652Z","ServerId":"desktop-oeifo1o:9024:59929175-fe2f-48a7-a07f-f234845b7bc6","WorkerId":"2dee04f4-3016-4b0b-bc1e-1a963957988d"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (15, 3, N'Succeeded', NULL, CAST(N'2024-10-11T14:39:40.630' AS DateTime), N'{"SucceededAt":"2024-10-11T14:39:40.6210766Z","PerformanceDuration":"76","Latency":"349111","Result":"{\"Data\":\"2 kargo raporu başarıyla oluşturuldu. Detaylı kayıt loglara yazıldı.\",\"ErrorMessages\":null,\"IsSuccessful\":true,\"StatusCode\":200}"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (16, 4, N'Enqueued', N'Triggered using recurring job manager', CAST(N'2024-10-11T14:53:50.347' AS DateTime), N'{"EnqueuedAt":"2024-10-11T14:53:50.3290811Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (17, 4, N'Processing', NULL, CAST(N'2024-10-11T14:53:50.620' AS DateTime), N'{"StartedAt":"2024-10-11T14:53:50.4943642Z","ServerId":"desktop-oeifo1o:25888:113657d5-1900-4c07-a75a-5e7180a52768","WorkerId":"5ed6817d-1583-426c-b43a-c3d5990412c3"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (18, 4, N'Succeeded', NULL, CAST(N'2024-10-11T14:53:55.330' AS DateTime), N'{"SucceededAt":"2024-10-11T14:53:55.3050966Z","PerformanceDuration":"4660","Latency":"347","Result":"{\"Data\":\"2 kargo raporu başarıyla oluşturuldu. Taşıyıcı ID: 1, 11.10.2024 tarihinde 160,00₺ ödendi., Taşıyıcı ID: 4, 11.10.2024 tarihinde 90,00₺ ödendi.\",\"ErrorMessages\":null,\"IsSuccessful\":true,\"StatusCode\":200}"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (19, 5, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-11T15:26:47.587' AS DateTime), N'{"EnqueuedAt":"2024-10-11T15:26:47.5593157Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (20, 5, N'Processing', NULL, CAST(N'2024-10-11T15:26:48.060' AS DateTime), N'{"StartedAt":"2024-10-11T15:26:47.8234285Z","ServerId":"desktop-oeifo1o:2832:06abe078-50ad-47bb-9650-81b1e54dad0a","WorkerId":"103b3d27-02f0-462a-a60a-855be27f6555"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (21, 5, N'Succeeded', NULL, CAST(N'2024-10-11T15:26:57.730' AS DateTime), N'{"SucceededAt":"2024-10-11T15:26:57.7068762Z","PerformanceDuration":"9628","Latency":"558","Result":"{\"Data\":\"2 kargo raporu başarıyla oluşturuldu. Taşıyıcı ID: 1, 11.10.2024 tarihinde 160,00₺ ödendi., Taşıyıcı ID: 4, 11.10.2024 tarihinde 90,00₺ ödendi.\",\"ErrorMessages\":null,\"IsSuccessful\":true,\"StatusCode\":200}"}')
SET IDENTITY_INSERT [HangFire].[State] OFF
GO
ALTER TABLE [dbo].[CarrierConfigurations]  WITH CHECK ADD  CONSTRAINT [FK_CarrierConfigurations_Carriers_CarrierId] FOREIGN KEY([CarrierId])
REFERENCES [dbo].[Carriers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CarrierConfigurations] CHECK CONSTRAINT [FK_CarrierConfigurations_Carriers_CarrierId]
GO
ALTER TABLE [dbo].[CarrierReports]  WITH CHECK ADD  CONSTRAINT [FK_CarrierReports_Carriers_CarrierId] FOREIGN KEY([CarrierId])
REFERENCES [dbo].[Carriers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CarrierReports] CHECK CONSTRAINT [FK_CarrierReports_Carriers_CarrierId]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Carriers_CarrierId] FOREIGN KEY([CarrierId])
REFERENCES [dbo].[Carriers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Carriers_CarrierId]
GO
ALTER TABLE [HangFire].[JobParameter]  WITH CHECK ADD  CONSTRAINT [FK_HangFire_JobParameter_Job] FOREIGN KEY([JobId])
REFERENCES [HangFire].[Job] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [HangFire].[JobParameter] CHECK CONSTRAINT [FK_HangFire_JobParameter_Job]
GO
ALTER TABLE [HangFire].[State]  WITH CHECK ADD  CONSTRAINT [FK_HangFire_State_Job] FOREIGN KEY([JobId])
REFERENCES [HangFire].[Job] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [HangFire].[State] CHECK CONSTRAINT [FK_HangFire_State_Job]
GO
