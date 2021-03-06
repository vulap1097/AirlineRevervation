USE [TrainManagement]
GO
/****** Object:  User [admin]    Script Date: 7/14/2021 6:29:28 PM ******/
CREATE USER [admin] FOR LOGIN [admin] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [admin1]    Script Date: 7/14/2021 6:29:28 PM ******/
CREATE USER [admin1] FOR LOGIN [admin1] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [admin]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [admin]
GO
/****** Object:  Table [dbo].[tblStation]    Script Date: 7/14/2021 6:29:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblStation](
	[Id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[StationName] [varchar](50) NULL,
	[StationCode] [varchar](50) NULL,
	[RailwayDivisionName] [varchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[PositionDistance] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTrain]    Script Date: 7/14/2021 6:29:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTrain](
	[Id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[TrainName] [varchar](50) NULL,
	[TrainCode] [varchar](50) NULL,
	[TrainNo] [varchar](50) NULL,
	[Status] [varchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[ACCoaches] [int] NULL,
	[FirstClassCoaches] [int] NULL,
	[SleeperClassCoaches] [int] NULL,
	[ProposedPrice] [decimal](18, 2) NULL,
	[ACSeats] [int] NULL,
	[FirstClassSeats] [int] NULL,
	[SleeperClassSeats] [int] NULL,
	[Route] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTrainSchedule]    Script Date: 7/14/2021 6:29:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTrainSchedule](
	[id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[TrainId] [numeric](18, 0) NULL,
	[StationId] [numeric](18, 0) NULL,
	[DepartureDate] [datetime] NULL,
	[DepartureTime] [varchar](25) NULL,
	[CreatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_GetTrainSchedule]    Script Date: 7/14/2021 6:29:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_GetTrainSchedule]  
AS  
     SELECT [tblTrainSchedule].[id],   
            [tblTrainSchedule].[TrainId] AS TrainId,   
            [tblTrain].[TrainNo],   
            [tblTrain].[TrainName],   
            [tblStation].[Id] AS StationId,   
            [tblStation].[StationName],  
   [tblTrainSchedule].[DepartureDate],  
   [tblTrainSchedule].[DepartureTime]  
     FROM tblTrainSchedule  
          INNER JOIN tblTrain ON [tblTrainSchedule].[TrainId] = [tblTrain].[Id]  
          INNER JOIN tblStation ON [tblStation].[Id] = [tblTrainSchedule].[stationid]
GO
/****** Object:  Table [dbo].[tblBooking]    Script Date: 7/14/2021 6:29:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBooking](
	[Id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[UserId] [numeric](18, 0) NULL,
	[TotalPrice] [decimal](19, 4) NULL,
	[CreatedDate] [datetime] NULL,
	[PhoneNumber] [varchar](50) NULL,
	[PassportId] [varchar](50) NULL,
	[PRN] [varchar](50) NULL,
	[UserName] [varchar](50) NULL,
	[IsCancel] [bit] NULL,
	[RefuncMoney] [decimal](18, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblBookingDetail]    Script Date: 7/14/2021 6:29:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBookingDetail](
	[Id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[BookingId] [numeric](18, 0) NULL,
	[Class] [int] NULL,
	[StartStation] [numeric](18, 0) NULL,
	[EndStation] [numeric](18, 0) NULL,
	[Quantity] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[Price] [decimal](18, 0) NULL,
	[TrainCode] [varchar](50) NULL,
	[DepDay] [datetime] NULL,
	[DepTime] [varchar](50) NULL,
	[StartStationName] [varchar](50) NULL,
	[EndStationName] [varchar](50) NULL,
	[SeatNum] [int] NULL,
	[CoachNum] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblClass]    Script Date: 7/14/2021 6:29:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblClass](
	[Id] [int] NOT NULL,
	[ClassName] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRole]    Script Date: 7/14/2021 6:29:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRole](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](50) NULL,
	[CreatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRuleCancelBooking]    Script Date: 7/14/2021 6:29:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRuleCancelBooking](
	[Id] [int] NOT NULL,
	[RulName] [varchar](50) NULL,
	[RuleType] [varchar](50) NULL,
	[Class] [int] NULL,
	[Value] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRuleClass]    Script Date: 7/14/2021 6:29:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRuleClass](
	[Id] [int] NOT NULL,
	[RulName] [varchar](50) NULL,
	[RuleType] [varchar](50) NULL,
	[Class] [int] NULL,
	[Value] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRuleDistance]    Script Date: 7/14/2021 6:29:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRuleDistance](
	[Id] [int] NOT NULL,
	[RulName] [varchar](50) NULL,
	[RuleType] [varchar](50) NULL,
	[StartStation] [numeric](18, 0) NULL,
	[EndStation] [numeric](18, 0) NULL,
	[Distance] [int] NULL,
	[Value] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTrainDetail]    Script Date: 7/14/2021 6:29:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTrainDetail](
	[Id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[TrainId] [numeric](18, 0) NULL,
	[SeatClass] [int] NULL,
	[Quantity] [int] NULL,
	[CreatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUser]    Script Date: 7/14/2021 6:29:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUser](
	[Id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](255) NULL,
	[EmailAddress] [varchar](255) NULL,
	[Password] [varchar](255) NULL,
	[RoleId] [int] NULL,
	[PhoneNumber] [varchar](50) NULL,
	[CreatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblBooking] ON 

INSERT [dbo].[tblBooking] ([Id], [UserId], [TotalPrice], [CreatedDate], [PhoneNumber], [PassportId], [PRN], [UserName], [IsCancel], [RefuncMoney]) VALUES (CAST(1 AS Numeric(18, 0)), NULL, CAST(11270000.0000 AS Decimal(19, 4)), CAST(N'2021-07-12T20:47:40.363' AS DateTime), N'09876', N'1234', N'1234127', N'name', NULL, NULL)
INSERT [dbo].[tblBooking] ([Id], [UserId], [TotalPrice], [CreatedDate], [PhoneNumber], [PassportId], [PRN], [UserName], [IsCancel], [RefuncMoney]) VALUES (CAST(2 AS Numeric(18, 0)), NULL, CAST(21800000.0000 AS Decimal(19, 4)), CAST(N'2021-07-12T21:28:11.520' AS DateTime), N'123456', N'123', N'123127', N'tui', 1, NULL)
SET IDENTITY_INSERT [dbo].[tblBooking] OFF
GO
SET IDENTITY_INSERT [dbo].[tblBookingDetail] ON 

INSERT [dbo].[tblBookingDetail] ([Id], [BookingId], [Class], [StartStation], [EndStation], [Quantity], [CreatedDate], [Price], [TrainCode], [DepDay], [DepTime], [StartStationName], [EndStationName], [SeatNum], [CoachNum]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), 1, CAST(1 AS Numeric(18, 0)), CAST(3 AS Numeric(18, 0)), 1, NULL, CAST(5620000 AS Decimal(18, 0)), N'T01', CAST(N'2021-07-22T00:00:00.000' AS DateTime), N'03:15', N'Sai Gon', N'Tuy Hoa', 1, 2)
INSERT [dbo].[tblBookingDetail] ([Id], [BookingId], [Class], [StartStation], [EndStation], [Quantity], [CreatedDate], [Price], [TrainCode], [DepDay], [DepTime], [StartStationName], [EndStationName], [SeatNum], [CoachNum]) VALUES (CAST(2 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), 2, CAST(1 AS Numeric(18, 0)), CAST(3 AS Numeric(18, 0)), 0, NULL, CAST(5650000 AS Decimal(18, 0)), N'T01', CAST(N'2021-07-22T00:00:00.000' AS DateTime), N'03:15', N'Sai Gon', N'Tuy Hoa', 1, 5)
INSERT [dbo].[tblBookingDetail] ([Id], [BookingId], [Class], [StartStation], [EndStation], [Quantity], [CreatedDate], [Price], [TrainCode], [DepDay], [DepTime], [StartStationName], [EndStationName], [SeatNum], [CoachNum]) VALUES (CAST(3 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), 1, CAST(1 AS Numeric(18, 0)), CAST(10003 AS Numeric(18, 0)), 1, NULL, CAST(1620000 AS Decimal(18, 0)), N'T01', CAST(N'2021-07-22T00:00:00.000' AS DateTime), N'03:15', N'Sai Gon', N'Nha Trang', 2, 2)
INSERT [dbo].[tblBookingDetail] ([Id], [BookingId], [Class], [StartStation], [EndStation], [Quantity], [CreatedDate], [Price], [TrainCode], [DepDay], [DepTime], [StartStationName], [EndStationName], [SeatNum], [CoachNum]) VALUES (CAST(4 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), 3, CAST(10004 AS Numeric(18, 0)), CAST(10005 AS Numeric(18, 0)), 0, NULL, CAST(20180000 AS Decimal(18, 0)), N'T01', CAST(N'2021-07-22T00:00:00.000' AS DateTime), N'21:00', N'Da Nang', N'Ha Noi', 1, 8)
SET IDENTITY_INSERT [dbo].[tblBookingDetail] OFF
GO
INSERT [dbo].[tblClass] ([Id], [ClassName]) VALUES (1, N'AC Coach')
INSERT [dbo].[tblClass] ([Id], [ClassName]) VALUES (2, N'First Class Coach')
INSERT [dbo].[tblClass] ([Id], [ClassName]) VALUES (3, N'Sleeper Class Coach')
GO
SET IDENTITY_INSERT [dbo].[tblRole] ON 

INSERT [dbo].[tblRole] ([Id], [RoleName], [CreatedDate]) VALUES (1, N'Admin', CAST(N'2021-06-29T20:43:15.167' AS DateTime))
INSERT [dbo].[tblRole] ([Id], [RoleName], [CreatedDate]) VALUES (2, N'User', CAST(N'2021-06-29T20:43:15.167' AS DateTime))
SET IDENTITY_INSERT [dbo].[tblRole] OFF
GO
INSERT [dbo].[tblRuleCancelBooking] ([Id], [RulName], [RuleType], [Class], [Value]) VALUES (1, N'cancel', NULL, NULL, 0.1)
GO
INSERT [dbo].[tblRuleClass] ([Id], [RulName], [RuleType], [Class], [Value]) VALUES (1, NULL, NULL, 1, 1.2)
INSERT [dbo].[tblRuleClass] ([Id], [RulName], [RuleType], [Class], [Value]) VALUES (2, NULL, NULL, 2, 1.5)
INSERT [dbo].[tblRuleClass] ([Id], [RulName], [RuleType], [Class], [Value]) VALUES (3, NULL, NULL, 3, 1.8)
GO
INSERT [dbo].[tblRuleDistance] ([Id], [RulName], [RuleType], [StartStation], [EndStation], [Distance], [Value]) VALUES (3, NULL, N'rule-distance', NULL, NULL, NULL, 10000)
GO
SET IDENTITY_INSERT [dbo].[tblStation] ON 

INSERT [dbo].[tblStation] ([Id], [StationName], [StationCode], [RailwayDivisionName], [CreatedDate], [PositionDistance]) VALUES (CAST(1 AS Numeric(18, 0)), N'Sai Gon', N'SG', NULL, CAST(N'2021-07-01T23:41:18.000' AS DateTime), 0)
INSERT [dbo].[tblStation] ([Id], [StationName], [StationCode], [RailwayDivisionName], [CreatedDate], [PositionDistance]) VALUES (CAST(3 AS Numeric(18, 0)), N'Tuy Hoa', N'TH', NULL, CAST(N'2021-07-02T00:23:33.973' AS DateTime), 550)
INSERT [dbo].[tblStation] ([Id], [StationName], [StationCode], [RailwayDivisionName], [CreatedDate], [PositionDistance]) VALUES (CAST(10002 AS Numeric(18, 0)), N'', NULL, NULL, CAST(N'2021-07-12T21:01:36.487' AS DateTime), NULL)
INSERT [dbo].[tblStation] ([Id], [StationName], [StationCode], [RailwayDivisionName], [CreatedDate], [PositionDistance]) VALUES (CAST(10003 AS Numeric(18, 0)), N'Nha Trang', N'NT', N'ABC', CAST(N'2021-07-12T21:08:05.470' AS DateTime), 150)
INSERT [dbo].[tblStation] ([Id], [StationName], [StationCode], [RailwayDivisionName], [CreatedDate], [PositionDistance]) VALUES (CAST(10004 AS Numeric(18, 0)), N'Da Nang', N'DN', NULL, CAST(N'2021-07-12T21:22:26.230' AS DateTime), 800)
INSERT [dbo].[tblStation] ([Id], [StationName], [StationCode], [RailwayDivisionName], [CreatedDate], [PositionDistance]) VALUES (CAST(10005 AS Numeric(18, 0)), N'Ha Noi', N'HN', NULL, CAST(N'2021-07-12T21:23:24.323' AS DateTime), 2000)
SET IDENTITY_INSERT [dbo].[tblStation] OFF
GO
SET IDENTITY_INSERT [dbo].[tblTrain] ON 

INSERT [dbo].[tblTrain] ([Id], [TrainName], [TrainCode], [TrainNo], [Status], [CreatedDate], [ACCoaches], [FirstClassCoaches], [SleeperClassCoaches], [ProposedPrice], [ACSeats], [FirstClassSeats], [SleeperClassSeats], [Route]) VALUES (CAST(1 AS Numeric(18, 0)), N'Train0111', N'T01', N'T01', N'Down', NULL, 3, 3, 3, CAST(100000.00 AS Decimal(18, 2)), 30, 20, 15, N'SaiGon-PhanThiet')
SET IDENTITY_INSERT [dbo].[tblTrain] OFF
GO
SET IDENTITY_INSERT [dbo].[tblTrainSchedule] ON 

INSERT [dbo].[tblTrainSchedule] ([id], [TrainId], [StationId], [DepartureDate], [DepartureTime], [CreatedDate]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(N'2021-07-22T00:00:00.000' AS DateTime), N'03:15', CAST(N'2021-07-08T21:45:46.580' AS DateTime))
INSERT [dbo].[tblTrainSchedule] ([id], [TrainId], [StationId], [DepartureDate], [DepartureTime], [CreatedDate]) VALUES (CAST(2 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(3 AS Numeric(18, 0)), CAST(N'2021-07-22T00:00:00.000' AS DateTime), N'20:40', CAST(N'2021-07-08T21:46:55.367' AS DateTime))
INSERT [dbo].[tblTrainSchedule] ([id], [TrainId], [StationId], [DepartureDate], [DepartureTime], [CreatedDate]) VALUES (CAST(3 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(3 AS Numeric(18, 0)), CAST(N'2021-07-23T00:00:00.000' AS DateTime), N'01:00', CAST(N'2021-07-09T00:45:47.203' AS DateTime))
INSERT [dbo].[tblTrainSchedule] ([id], [TrainId], [StationId], [DepartureDate], [DepartureTime], [CreatedDate]) VALUES (CAST(4 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(N'2021-07-10T00:00:00.000' AS DateTime), N'03:15', CAST(N'2021-07-09T09:13:38.310' AS DateTime))
INSERT [dbo].[tblTrainSchedule] ([id], [TrainId], [StationId], [DepartureDate], [DepartureTime], [CreatedDate]) VALUES (CAST(5 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(10003 AS Numeric(18, 0)), CAST(N'2021-08-21T00:00:00.000' AS DateTime), N'12:00', CAST(N'2021-07-12T21:10:21.390' AS DateTime))
INSERT [dbo].[tblTrainSchedule] ([id], [TrainId], [StationId], [DepartureDate], [DepartureTime], [CreatedDate]) VALUES (CAST(6 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(10003 AS Numeric(18, 0)), CAST(N'2021-07-22T00:00:00.000' AS DateTime), N'18:30', CAST(N'2021-07-12T21:14:31.100' AS DateTime))
INSERT [dbo].[tblTrainSchedule] ([id], [TrainId], [StationId], [DepartureDate], [DepartureTime], [CreatedDate]) VALUES (CAST(7 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(10004 AS Numeric(18, 0)), CAST(N'2021-07-22T00:00:00.000' AS DateTime), N'21:00', CAST(N'2021-07-12T21:22:56.933' AS DateTime))
INSERT [dbo].[tblTrainSchedule] ([id], [TrainId], [StationId], [DepartureDate], [DepartureTime], [CreatedDate]) VALUES (CAST(8 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(10005 AS Numeric(18, 0)), CAST(N'2021-07-22T00:00:00.000' AS DateTime), N'23:55', CAST(N'2021-07-12T21:24:56.690' AS DateTime))
SET IDENTITY_INSERT [dbo].[tblTrainSchedule] OFF
GO
SET IDENTITY_INSERT [dbo].[tblUser] ON 

INSERT [dbo].[tblUser] ([Id], [UserName], [EmailAddress], [Password], [RoleId], [PhoneNumber], [CreatedDate]) VALUES (CAST(1 AS Numeric(18, 0)), N'ahihi', N'ahihi@gmail.com', N'82080600934821faf0bc59cba79964bc', 2, NULL, CAST(N'2021-06-29T20:44:06.423' AS DateTime))
INSERT [dbo].[tblUser] ([Id], [UserName], [EmailAddress], [Password], [RoleId], [PhoneNumber], [CreatedDate]) VALUES (CAST(6 AS Numeric(18, 0)), N'tuicute1', N'tuicute@gmail.com', N'82080600934821faf0bc59cba79964bc', 2, NULL, CAST(N'2021-07-02T01:02:58.093' AS DateTime))
INSERT [dbo].[tblUser] ([Id], [UserName], [EmailAddress], [Password], [RoleId], [PhoneNumber], [CreatedDate]) VALUES (CAST(10004 AS Numeric(18, 0)), N'ahihi123', N'ahihi123@gmail.com', N'82080600934821faf0bc59cba79964bc', 1, NULL, CAST(N'2021-07-02T17:26:30.897' AS DateTime))
SET IDENTITY_INSERT [dbo].[tblUser] OFF
GO
ALTER TABLE [dbo].[tblBooking] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tblBookingDetail] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tblRole] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tblStation] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tblTrain] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tblTrainDetail] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tblUser] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tblBooking]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[tblUser] ([Id])
GO
ALTER TABLE [dbo].[tblBookingDetail]  WITH CHECK ADD FOREIGN KEY([BookingId])
REFERENCES [dbo].[tblBooking] ([Id])
GO
ALTER TABLE [dbo].[tblBookingDetail]  WITH CHECK ADD FOREIGN KEY([Class])
REFERENCES [dbo].[tblClass] ([Id])
GO
ALTER TABLE [dbo].[tblBookingDetail]  WITH CHECK ADD FOREIGN KEY([EndStation])
REFERENCES [dbo].[tblStation] ([Id])
GO
ALTER TABLE [dbo].[tblBookingDetail]  WITH CHECK ADD FOREIGN KEY([StartStation])
REFERENCES [dbo].[tblStation] ([Id])
GO
ALTER TABLE [dbo].[tblTrainDetail]  WITH CHECK ADD FOREIGN KEY([TrainId])
REFERENCES [dbo].[tblTrain] ([Id])
GO
ALTER TABLE [dbo].[tblTrainSchedule]  WITH CHECK ADD FOREIGN KEY([StationId])
REFERENCES [dbo].[tblStation] ([Id])
GO
ALTER TABLE [dbo].[tblTrainSchedule]  WITH CHECK ADD FOREIGN KEY([TrainId])
REFERENCES [dbo].[tblTrain] ([Id])
GO
ALTER TABLE [dbo].[tblUser]  WITH CHECK ADD FOREIGN KEY([RoleId])
REFERENCES [dbo].[tblRole] ([Id])
GO
/****** Object:  StoredProcedure [dbo].[sp_Count_SeatAvailable]    Script Date: 7/14/2021 6:29:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Count_SeatAvailable] @TrainCode   VARCHAR(50),       
                                      @ClassId INT,  
           @Date datetime  
AS      
BEGIN  
SELECT COUNT (1 )FROM tblBookingDetail   
WHERE tblBookingDetail.TrainCode = @TrainCode   
AND tblBookingDetail.DepDay = @Date   
AND tblBookingDetail.Class = @ClassId  
END 
GO
/****** Object:  StoredProcedure [dbo].[sp_GetBookingDetail]    Script Date: 7/14/2021 6:29:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetBookingDetail]   
AS        
BEGIN    
SELECT tblBooking.UserName,   
       tblBooking.PhoneNumber,   
       tblBooking.PassportId,   
       tblBooking.PRN,   
       tblBooking.isCancel,  
    tblBooking.totalprice,   
       tblBooking.CreatedDate,  
    tblBookingDetail.traincode,  
    tblBookingDetail.Class,  
    tblBookingDetail.price,  
    tblBookingDetail.quantity,  
    tblBookingDetail.startstationname,  
    tblBookingDetail.endstationname,  
    tblBookingDetail.deptime,  
    tblBookingDetail.depday  
  
FROM tblBookingDetail  
     INNER JOIN tblBooking ON tblBooking.Id = tblBookingDetail.BookingId;  
END 
GO
/****** Object:  StoredProcedure [dbo].[sp_GetBookingDetailList]    Script Date: 7/14/2021 6:29:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetBookingDetailList]   
AS        
BEGIN    
SELECT tblBooking.UserName,   
       tblBooking.PhoneNumber,   
       tblBooking.PassportId,   
       tblBooking.PRN,   
       tblBooking.isCancel,  
    tblBooking.totalprice,   
       tblBooking.CreatedDate,  
    tblBookingDetail.traincode,  
    tblBookingDetail.Class,  
    tblBookingDetail.price,  
    tblBookingDetail.quantity,  
    tblBookingDetail.startstationname,  
    tblBookingDetail.endstationname,  
    tblBookingDetail.deptime,  
    tblBookingDetail.depday,  
    tblBooking.RefuncMoney  
  
FROM tblBookingDetail  
     INNER JOIN tblBooking ON tblBooking.Id = tblBookingDetail.BookingId;  
END 
GO
/****** Object:  StoredProcedure [dbo].[sp_GetTrainSchedule]    Script Date: 7/14/2021 6:29:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_GetTrainSchedule] @DepartureStationName VARCHAR(255), 
                                             @ArrivalStationName   VARCHAR(255)
AS
     DECLARE @Count INT;
     DECLARE @Result BIT;
     DECLARE @UserId NUMERIC(18, 0);

     DECLARE @DepartureStation TABLE
     (StationId     NUMERIC(18, 0), 
      StationName   VARCHAR(50), 
      TrainId       NUMERIC(18, 0), 
      TrainCode     VARCHAR(50), 
      DepartureDate DATETIME, 
      DepartureTime VARCHAR(50)
     );
     DECLARE @ArrivalStation TABLE
     (StationId     NUMERIC(18, 0), 
      StationName   VARCHAR(50), 
      TrainId       NUMERIC(18, 0), 
      TrainCode     VARCHAR(50), 
      DepartureDate DATETIME, 
      DepartureTime VARCHAR(50)
     );
    BEGIN
        INSERT INTO @DepartureStation
        (StationId, 
         StationName, 
         TrainId, 
         TrainCode, 
         DepartureDate, 
         DepartureTime
        )
               SELECT tblTrainSchedule.StationId, 
                      tblStation.StationName, 
                      tblTrainSchedule.TrainId, 
                      tblTrain.TrainCode, 
                      tblTrainSchedule.DepartureDate, 
                      tblTrainSchedule.DepartureTime
               FROM tblTrainSchedule
                    INNER JOIN tblStation ON tblStation.id = tblTrainSchedule.StationId
                    INNER JOIN tblTrain ON tblTrain.id = tblTrainSchedule.TrainId
               WHERE tblStation.StationName = @DepartureStationName;

		INSERT INTO @ArrivalStation
        (StationId, 
         StationName, 
         TrainId, 
         TrainCode, 
         DepartureDate, 
         DepartureTime
        )
               SELECT tblTrainSchedule.StationId, 
                      tblStation.StationName, 
                      tblTrainSchedule.TrainId, 
                      tblTrain.TrainCode, 
                      tblTrainSchedule.DepartureDate, 
                      tblTrainSchedule.DepartureTime
               FROM tblTrainSchedule
                    INNER JOIN tblStation ON tblStation.id = tblTrainSchedule.StationId
                    INNER JOIN tblTrain ON tblTrain.id = tblTrainSchedule.TrainId
               WHERE tblStation.StationName = @ArrivalStationName;

			   SELECT ds.StationName AS DepartureStation,
			   ds.TrainCode as Train,
			   ds.Trainid as TrainId,
			   ds.DepartureDate as DepartureDate,
			   ds.DepartureTime as DepartureTime,
			   dr.StationName as ArrivalStation,
			   dr.DepartureDate as ArrivalDate,
			   dr.DepartureTime as ArrivalTime
			    
			    FROM @DepartureStation AS ds INNER JOIN @ArrivalStation as dr ON ds.TrainId = dr.TrainId
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_GetTrainScheduleList]    Script Date: 7/14/2021 6:29:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_GetTrainScheduleList] @DepartureStationName VARCHAR(255), 
                                             @ArrivalStationName   VARCHAR(255)
AS
     DECLARE @Count INT;
     DECLARE @Result BIT;
     DECLARE @UserId NUMERIC(18, 0);

     DECLARE @DepartureStation TABLE
     (StationId     NUMERIC(18, 0), 
      StationName   VARCHAR(50), 
      TrainId       NUMERIC(18, 0), 
      TrainCode     VARCHAR(50), 
      DepartureDate DATETIME, 
      DepartureTime VARCHAR(50)
     );
     DECLARE @ArrivalStation TABLE
     (StationId     NUMERIC(18, 0), 
      StationName   VARCHAR(50), 
      TrainId       NUMERIC(18, 0), 
      TrainCode     VARCHAR(50), 
      DepartureDate DATETIME, 
      DepartureTime VARCHAR(50)
     );
    BEGIN
        INSERT INTO @DepartureStation
        (StationId, 
         StationName, 
         TrainId, 
         TrainCode, 
         DepartureDate, 
         DepartureTime
        )
               SELECT tblTrainSchedule.StationId, 
                      tblStation.StationName, 
                      tblTrainSchedule.TrainId, 
                      tblTrain.TrainCode, 
                      tblTrainSchedule.DepartureDate, 
                      tblTrainSchedule.DepartureTime
               FROM tblTrainSchedule
                    INNER JOIN tblStation ON tblStation.id = tblTrainSchedule.StationId
                    INNER JOIN tblTrain ON tblTrain.id = tblTrainSchedule.TrainId
               WHERE tblStation.StationName = @DepartureStationName;

		INSERT INTO @ArrivalStation
        (StationId, 
         StationName, 
         TrainId, 
         TrainCode, 
         DepartureDate, 
         DepartureTime
        )
               SELECT tblTrainSchedule.StationId, 
                      tblStation.StationName, 
                      tblTrainSchedule.TrainId, 
                      tblTrain.TrainCode, 
                      tblTrainSchedule.DepartureDate, 
                      tblTrainSchedule.DepartureTime
               FROM tblTrainSchedule
                    INNER JOIN tblStation ON tblStation.id = tblTrainSchedule.StationId
                    INNER JOIN tblTrain ON tblTrain.id = tblTrainSchedule.TrainId
               WHERE tblStation.StationName = @ArrivalStationName;

			   SELECT ds.StationName AS DepartureStation,
			   ds.TrainCode as Train,
			   ds.Trainid as TrainId,
			   ds.DepartureDate as DepartureDate,
			   ds.DepartureTime as DepartureTime,
			   dr.StationName as ArrivalStation,
			   dr.DepartureDate as ArrivalDate,
			   dr.DepartureTime as ArrivalTime
			    
			    FROM @DepartureStation AS ds INNER JOIN @ArrivalStation as dr ON ds.TrainId = dr.TrainId
    END;
	
	--------------------
	INSERT INTO tblRuleClass(id,class,[value])
VALUES(1,1,1.2)
INSERT INTO tblRuleClass(id,class,[value])
VALUES(2,1,1.5)
INSERT INTO tblRuleClass(id,class,[value])
VALUES(3,1,1.8)

INSERT INTO tblRuleClass(id,class,[value])
VALUES(1,1,1.2)
INSERT INTO tblRuleClass(id,class,[value])
VALUES(2,1,1.5)
INSERT INTO tblRuleClass(id,class,[value])
VALUES(3,1,1.8)

INSERT INTO tblRuleDistance(id,RuleType,[value])
VALUES(3,'rule-distance',10000)
------------------------------
ALTER TABLE tblBooking
ADD PhoneNumber varchar(50);

ALTER TABLE tblBooking
ADD PassportId varchar(50);

ALTER TABLE tblBooking
ADD PRN varchar(50);
GO
/****** Object:  StoredProcedure [dbo].[sp_User_Login]    Script Date: 7/14/2021 6:29:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_User_Login] @Email    VARCHAR(255),   
                                      @Password VARCHAR(255)  
AS  
     DECLARE @Count INT;  
     DECLARE @Result BIT;
	 DECLARE @UserId numeric(18,0);  
	 DECLARE @Temp TABLE
	(Result BIT, 
	 UserId numeric(18,0)	 
	)
    BEGIN  
        IF EXISTS  
        (  
            SELECT TOP 1 1  
            FROM dbo.tblUser  
            WHERE EmailAddress = @Email  
                  AND [Password] = @Password  
        )  
            BEGIN  
			SET @UserId = (SELECT TOP 1 id FROM tblUser WHERE EmailAddress = @Email AND  [Password] = @Password)
                INSERT INTO @Temp
				values (1,@UserId)
        END;  
            ELSE  
            BEGIN  
                INSERT INTO @Temp
				values (0,null)   
        END;  
  SELECT * FROM @Temp
    END;
GO
