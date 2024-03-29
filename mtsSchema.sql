﻿USE [master]
GO

CREATE DATABASE [mts] ON  PRIMARY 
( NAME = N'mts', FILENAME = N'D:\Sql ServerInstanceDir\DataDir\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\mts.mdf' , SIZE = 621568KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'mts_log', FILENAME = N'D:\Sql ServerInstanceDir\DataDir\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\mts_log.ldf' , SIZE = 916352KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [mts] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [mts].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [mts] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [mts] SET ANSI_NULLS OFF
GO
ALTER DATABASE [mts] SET ANSI_PADDING OFF
GO
ALTER DATABASE [mts] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [mts] SET ARITHABORT OFF
GO
ALTER DATABASE [mts] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [mts] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [mts] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [mts] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [mts] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [mts] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [mts] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [mts] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [mts] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [mts] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [mts] SET  DISABLE_BROKER
GO
ALTER DATABASE [mts] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [mts] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [mts] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [mts] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [mts] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [mts] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [mts] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [mts] SET  READ_WRITE
GO
ALTER DATABASE [mts] SET RECOVERY FULL
GO
ALTER DATABASE [mts] SET  MULTI_USER
GO
ALTER DATABASE [mts] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [mts] SET DB_CHAINING OFF
GO
USE [mts]
GO

CREATE USER [Tracking] FOR LOGIN [Tracking] WITH DEFAULT_SCHEMA=[dbo]
GO

CREATE USER [mts1] FOR LOGIN [mts1] WITH DEFAULT_SCHEMA=[dbo]
GO

CREATE USER [mts] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO

CREATE USER [demo] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rawData](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[imei] [bigint] NOT NULL,
	[codecId] [int] NULL,
	[time] [datetime] NOT NULL,
	[priority] [int] NULL,
	[latitude] [float] NULL,
	[longitude] [float] NULL,
	[altitude] [float] NULL,
	[sat] [int] NULL,
	[speed] [float] NULL,
	[angle] [int] NULL,
	[Din1] [int] NULL,
	[Din2] [int] NULL,
	[Din3] [int] NULL,
	[Din4] [int] NULL,
	[Analog1] [float] NULL,
	[Analog2] [float] NULL,
	[Analog3] [float] NULL,
	[Analog4] [float] NULL,
	[GSMSignalStrength] [int] NULL,
	[CurrentProfile] [int] NULL,
	[GPSSpeed] [float] NULL,
	[BatteryVoltage] [float] NULL,
	[BatteryCurrent] [float] NULL,
	[PcbTemp] [float] NULL,
	[FuelCounter] [bigint] NULL,
	[MovementSensor] [int] NULL,
	[Dallas0] [float] NULL,
	[Dallas1] [float] NULL,
	[Dallas2] [float] NULL,
	[Ibutton] [bigint] NULL,
	[Odometer] [int] NULL,
	[usbConnection] [tinyint] NULL,
	[cellId] [bigint] NULL,
	[operatorCode] [bigint] NULL,
	[hdop] [float] NULL,
	[vdop] [float] NULL,
	[pdop] [float] NULL,
	[operateCode] [bigint] NULL,
	[addressFId] [int] NULL,
 CONSTRAINT [PK_rawData] PRIMARY KEY CLUSTERED 
(
	[imei] ASC,
	[time] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'only for gh device' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'rawData', @level2type=N'COLUMN',@level2name=N'usbConnection'
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rawDataGoSafe](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[imei] [varchar](100) NOT NULL,
	[time] [datetime] NOT NULL,
	[priority] [int] NULL,
	[latitude] [float] NULL,
	[latDir] [varchar](50) NULL,
	[longitude] [float] NULL,
	[lonDir] [varchar](50) NULL,
	[altitude] [float] NULL,
	[speed] [float] NULL,
	[speedDir] [varchar](50) NULL,
	[byte1] [varchar](50) NULL,
	[byte2] [varchar](50) NULL,
	[byte3] [varchar](50) NULL,
	[byte4] [varchar](50) NULL,
	[mileage] [varchar](50) NULL,
	[userAlarm] [varchar](50) NULL,
	[ua1] [tinyint] NULL,
	[ua2] [tinyint] NULL,
	[ua3] [tinyint] NULL,
	[ua4] [tinyint] NULL,
	[ua5] [tinyint] NULL,
	[ua6] [tinyint] NULL,
	[ua7] [tinyint] NULL,
	[ua8] [tinyint] NULL,
	[Analog1] [float] NULL,
	[Analog2] [float] NULL,
	[Analog3] [float] NULL,
	[Analog4] [float] NULL,
	[GSMSignalStrength] [int] NULL,
	[CurrentProfile] [int] NULL,
	[BatteryVoltage] [float] NULL,
	[BatteryCurrent] [float] NULL,
	[PcbTemp] [float] NULL,
	[FuelCounter] [bigint] NULL,
	[MovementSensor] [int] NULL,
	[Dallas2] [float] NULL,
	[Ibutton] [bigint] NULL,
	[Odometer] [int] NULL,
 CONSTRAINT [PK_rawDataGoSafe] PRIMARY KEY CLUSTERED 
(
	[imei] ASC,
	[time] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Atul
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

-- [Prc_Rowdata] 1
CREATE PROCEDURE [dbo].[Prc_Rowdata] 
	-- Add the parameters for the stored procedure here
	
	@task int,
	@imei bigint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	--SET NOCOUNT ON;

    -- Insert statements for procedure here
    --@task 1 for circular, @task= 0 for square
    
    if(@task=1) --task 1 for row data
    begin
              select top 10 [imei],[time] ,[priority],[latitude],[longitude],[altitude],[speed]
              from rawData where imei=@imei order by Id desc
	end
	else -- task2 for row data go safe
	begin
	     select top 10 [imei],[time] ,[priority],[latitude],[longitude],[altitude],[speed]
              from rawDataGoSafe  where imei=@imei order by Id desc
	end
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rawDataGS503](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[imei] [bigint] NOT NULL,
	[time] [datetime] NOT NULL,
	[latitude] [float] NULL,
	[longitude] [float] NULL,
	[angle] [float] NULL,
	[lbsLocation] [tinyint] NULL,
	[sat] [int] NULL,
	[speed] [float] NULL,
	[GSMSignalStrength] [int] NULL,
	[BatteryVoltage] [float] NULL,
	[deviceStatus] [int] NULL,
	[acc] [int] NULL,
	[addressFId] [int] NULL,
	[mcc] [float] NULL,
	[mnc] [float] NULL,
	[mci] [int] NULL,
	[lac] [int] NULL,
	[mrssi] [int] NULL,
	[mci1] [int] NULL,
	[mci2] [int] NULL,
	[mci3] [int] NULL,
	[mci4] [int] NULL,
	[mci5] [int] NULL,
	[mci6] [int] NULL,
	[lac1] [int] NULL,
	[lac2] [int] NULL,
	[lac3] [int] NULL,
	[lac4] [int] NULL,
	[lac5] [int] NULL,
	[lac6] [int] NULL,
	[mrssi1] [int] NULL,
	[mrssi2] [int] NULL,
	[mrssi3] [int] NULL,
	[mrssi4] [int] NULL,
	[mrssi5] [int] NULL,
	[mrssi6] [int] NULL,
 CONSTRAINT [PK_rawDataGS503] PRIMARY KEY CLUSTERED 
(
	[imei] ASC,
	[time] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================


--rpt_prc_Trackcier 16,'2012-02-29 00:00:00.000','2012-02-29 23:59:59.000'
CREATE PROCEDURE [dbo].[mts_insert_rawDataGS503]
	-- Add the parameters for the stored procedure here
	@imei bigint,
	@time datetime,
	@lat float,
	@lon float,
	@sat int,
	@speed float,
	@gsmSignalStrength int,
	@batteryVoltage int,
	@deviceStatus int,
	@mcc int,
	@mnc int,
	@mci int,
	@mrssi int,
	@lac int,
	@mci1 int,
	@mci2 int,
	@mci3 int,
	@mci4 int,
	@mci5 int,
	@mci6 int,
	@mrssi1 int,
	@mrssi2 int,
	@mrssi3 int,
	@mrssi4 int,
	@mrssi5 int,
	@mrssi6 int,
	@lac1 int,
	@lac2 int,
	@lac3 int,
	@lac4 int,
	@lac5 int,
	@lac6 int	,
	@lbsLocation tinyint,
	@angle float,
	@acc int
AS
BEGIN
	insert into rawDataGS503(imei,time,latitude,longitude,sat,speed,GSMSignalStrength,BatteryVoltage,deviceStatus,mcc,mnc,mci,mci1,mci2,mci3,mci4,mci5,mci6,lac,lac1,lac2,lac3,lac4,lac5,lac6,mrssi,mrssi1,mrssi2,mrssi3,mrssi4,mrssi5,mrssi6,lbsLocation,angle,acc)
	values(@imei,@time,@lat,@lon,@sat,@speed,@GSMSignalStrength,@BatteryVoltage,@deviceStatus,@mcc,@mnc,@mci,@mci1,@mci2,@mci3,@mci4,@mci5,@mci6,@lac,@lac1,@lac2,@lac3,@lac4,@lac5,@lac6,@mrssi,@mrssi1,@mrssi2,@mrssi3,@mrssi4,@mrssi5,@mrssi6,@lbsLocation,@angle,@acc)	
END
GO
/****** Object:  Table [dbo].[rawDataBofanPT]    Script Date: 01/09/2017 11:10:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rawDataBofanPT](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[imei] [bigint] NOT NULL,
	[time] [datetime] NOT NULL,
	[latitude] [float] NULL,
	[priority] [int] NULL,
	[longitude] [float] NULL,
	[altitude] [float] NULL,
	[sat] [int] NULL,
	[speed] [float] NULL,
	[angle] [int] NULL,
	[Din1] [int] NULL,
	[Din2] [int] NULL,
	[Din3] [int] NULL,
	[Din4] [int] NULL,
	[Analog1] [float] NULL,
	[Analog2] [float] NULL,
	[Analog3] [float] NULL,
	[Analog4] [float] NULL,
	[PcbTemp] [float] NULL,
	[FuelCounter] [bigint] NULL,
	[Odometer] [float] NULL,
	[addressFId] [int] NULL,
	[input] [varchar](50) NULL,
	[output] [varchar](50) NULL,
 CONSTRAINT [PK_rawDataBofanPT] PRIMARY KEY CLUSTERED 
(
	[imei] ASC,
	[time] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [IX_rawDataBofanPT] ON [dbo].[rawDataBofanPT] 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[mts_insert_rawDataBofanPT]    Script Date: 01/09/2017 11:10:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================


--rpt_prc_Trackcier 16,'2012-02-29 00:00:00.000','2012-02-29 23:59:59.000'
CREATE PROCEDURE [dbo].[mts_insert_rawDataBofanPT]
	-- Add the parameters for the stored procedure here
	@imei varchar(150),
	@time datetime,
	@lat float,
	@lon float,	
	@speed float,	
	@course float,
	@odometer float,
	@output varchar(50),
	@input varchar(50)
	
AS
BEGIN
	insert into rawDataBofanPT(imei,time,latitude,longitude,speed,angle,input,output,Odometer)
	values(@imei,@time,@lat,@lon,@speed,@course,@input,@output,@odometer)	
END
GO
/****** Object:  Table [dbo].[rawDataAndroid]    Script Date: 01/09/2017 11:10:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rawDataAndroid](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[imei] [varchar](150) NOT NULL,
	[latitude] [float] NULL,
	[longitude] [float] NULL,
	[time] [datetime] NOT NULL,
	[mcc] [int] NULL,
	[mnc] [int] NULL,
	[lac] [int] NULL,
	[cellId] [int] NULL,
	[battery] [float] NULL,
	[speed] [float] NULL,
	[lbsLocation] [tinyint] NULL,
	[angle] [float] NULL,
 CONSTRAINT [PK_rawDataAndroid] PRIMARY KEY CLUSTERED 
(
	[imei] ASC,
	[time] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[mts_insert_rawDataAndroid]    Script Date: 01/09/2017 11:10:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================


--rpt_prc_Trackcier 16,'2012-02-29 00:00:00.000','2012-02-29 23:59:59.000'
CREATE PROCEDURE [dbo].[mts_insert_rawDataAndroid]
	-- Add the parameters for the stored procedure here
	@imei varchar(150),
	@time datetime,
	@lat float,
	@lon float,	
	@speed float,	
	@batteryVoltage float,	
	@mcc int,
	@mnc int,
	@mci int,	
	@lac int,
	@angle int,
	@lbsLocation tinyint
AS
BEGIN
	insert into rawDataAndroid(imei,time,latitude,longitude,speed,battery,mcc,mnc,cellId,lac,lbsLocation,angle)
	values(@imei,@time,@lat,@lon,@speed,@BatteryVoltage,@mcc,@mnc,@mci,@lac,@lbsLocation,@angle)	
END
GO
/****** Object:  Table [dbo].[mts]    Script Date: 01/09/2017 11:10:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[carrierFId] [int] NOT NULL,
	[codecId] [int] NULL,
	[time] [datetime] NOT NULL,
	[priority] [int] NULL,
	[latitude] [float] NULL,
	[longitude] [float] NULL,
	[altitude] [float] NULL,
	[sat] [int] NULL,
	[speed] [float] NULL,
	[angle] [int] NULL,
	[Din1] [int] NULL,
	[Din2] [int] NULL,
	[Din3] [int] NULL,
	[Din4] [int] NULL,
	[Analog1] [float] NULL,
	[Analog2] [float] NULL,
	[Analog3] [float] NULL,
	[Analog4] [float] NULL,
	[GSMSignalStrength] [int] NULL,
	[CurrentProfile] [int] NULL,
	[GPSSpeed] [float] NULL,
	[BatteryVoltage] [float] NULL,
	[BatteryCurrent] [float] NULL,
	[PcbTemp] [float] NULL,
	[FuelCounter] [bigint] NULL,
	[MovementSensor] [int] NULL,
	[Dallas0] [float] NULL,
	[Dallas1] [float] NULL,
	[Dallas2] [float] NULL,
	[IButton] [bigint] NULL,
	[Odometer] [int] NULL,
	[addressFId] [int] NULL,
	[lbsLocation] [tinyint] NULL,
 CONSTRAINT [PK_mts] PRIMARY KEY NONCLUSTERED 
(
	[carrierFId] ASC,
	[time] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [IDX_date] ON [dbo].[mts] 
(
	[time] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [index_mtscarrier] ON [dbo].[mts] 
(
	[carrierFId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [index_mtsdatetime] ON [dbo].[mts] 
(
	[time] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[updateMts]    Script Date: 01/09/2017 11:10:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		virus
-- Create date: 01 july 2023
-- Description:	updates the mts table with the geoaddress
-- =============================================
CREATE PROCEDURE [dbo].[updateMts] 
	@addressFId int,
	@lat float,
	@lon float,
	@accuracy int
	
	
AS
BEGIN
-- withnull 1 for 'is null' query
	if @accuracy=4
		begin
			update mts set addressFId=@addressFId where ROUND(latitude,@accuracy)= ROUND(@lat,@accuracy)  and round(longitude,@accuracy)=ROUND(@lon,@accuracy);
		end
	else
		begin
		update mts set addressFId=@addressFId where ROUND(latitude,@accuracy)= ROUND(@lat,@accuracy)  and round(longitude,@accuracy)=ROUND(@lon,@accuracy) and addressFId is null;
			
		
		end
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		virus

-- =============================================


create PROCEDURE [dbo].[rpt_speed]
	@carrier_id int,
	@dateStart varchar(50), -- '2023-01-07'  
	@dateStop varchar(50), -- '2023-01-07'  
	@speedAbove int
	
AS
BEGIN
	select mts.time,mts.speed from mts where carrierFId=@carrier_id and speed>=@speedAbove and time between @dateStart and @dateStop  
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================



CREATE PROCEDURE [dbo].[rpt_prc_Trackcarrier]
	-- Add the parameters for the stored procedure here
	@carrier_id int,
	@dateStart varchar(100),
	@dateStop varchar(100)
	
	
AS
BEGIN


	Select latitude as lat,longitude as long, time, speed from mts where time between @dateStart and @dateStop and carrierFId=@carrier_id order by time asc
	

END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================



CREATE PROCEDURE [dbo].[rpt_prc_Track]
	-- Add the parameters for the stored procedure here
	@carrier_id int,
	@dateStart varchar(100),
	@dateStop varchar(100)
	
	
AS
BEGIN

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
			
     select  ROW_NUMBER() OVER (ORDER BY [Id]) As SrNo, latitude as lat , longitude as long FROM [mts].[dbo].[mts]
	 where carrierFId=@carrier_id  and Din1=1 and mts.time between @dateStart and @dateStop
	 
   
	
END
GO
/****** Object:  StoredProcedure [dbo].[rpt_prc_TempNew]    Script Date: 01/09/2017 11:10:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		virus
-- =============================================

CREATE PROCEDURE [dbo].[rpt_prc_TempNew]
	@dateStart varchar(50),
	@dateStop varchar(50),
	@vehicle int	
AS
BEGIN
	declare @cnt as int
	declare @i as int
	declare @insertTime as datetime;
	declare @time as datetime;
	Declare @temp as table
	(
		SrNo int,time datetime ,temp float,speed float 
	)
	Declare @result as table
	(
		SrNo int,time datetime ,temp float,speed float 
	)
	
	insert into @temp
		SELECT ROW_NUMBER() OVER (ORDER BY [Id]) As SrNo,  mts.time, (mts.PcbTemp/ 10 ),speed
	    FROM   mts 
		where  carrierFId = @vehicle and mts.time between @dateStart and @dateStop order by time asc;
	set @cnt = (select COUNT(*) from @temp)
	
	set @i=1;
	if @cnt>0
	begin
		set @insertTime=(select time from @temp where SrNo=@i);
		insert into @result(SrNo,time,temp,speed)
						select SrNo,time,temp,speed from @temp where SrNo = @i;	
		set @i=@i+1;				
		while(@i<=@cnt)
		begin
			set @time=(select time from @temp where SrNo = @i)
			if DATEDIFF(MINUTE,@insertTime,@time)>1
			begin
				set @insertTime=@time;
				insert into @result(SrNo,time,temp,speed)
					select SrNo,time,temp,speed from @temp where SrNo = @i;		
			end
			set @i=@i+1;	
		end
	end
	select time, temp,speed from @result;
END
GO
/****** Object:  StoredProcedure [dbo].[rpt_prc_NewKM]    Script Date: 01/09/2017 11:10:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================


CREATE PROCEDURE [dbo].[rpt_prc_NewKM]
	-- Add the parameters for the stored procedure here
	@carrier_id int,
	@dateStart varchar(100),
	@dateStop varchar(100),
	@task int
	
	
AS
BEGIN

if @task=1
begin
	--Declare @trackresult as table
	--(	
	--	SrNo int,lat float, long float , speed float , time varchar(100)
	--)
	
	-- insert into @trackresult 
	-- select  ROW_NUMBER() OVER (ORDER BY [Id]) As SrNo, latitude as lat , longitude as long , speed as speed, time as time FROM [mts].[dbo].[mts]
	-- where carrierFId=@carrier_id   and mts.time between @dateStart and @dateStop order by time asc
	 
	--select * from @trackresult
	
	Select latitude as lat,longitude as long from mts where time between @dateStart and @dateStop and carrierFId=@carrier_id and latitude!=0 order by time asc
	
end

else
begin

Declare @cnt as int
Declare @counter as int

Declare @temp as table
(
SrNo int,lat float, long float , speed float , time1 varchar(50)
)

Declare @result as table
(
SrNo int,lat float, long float , speed float, time1 varchar(50)
)
	
     insert into @temp 
	 select  ROW_NUMBER() OVER (ORDER BY [Id]) As SrNo, latitude as lat , longitude as long , speed , time as time1  FROM [mts].[dbo].[mts]
	 where carrierFId=@carrier_id and speed > 4 and mts.time between @dateStart and @dateStop 
	
	 set @cnt=(select COUNT(SrNo)from @temp )
	 set @counter =1
	 
	 -- skipping row / adding alternate records
	 while(@counter<=@cnt)
	 begin
		insert into @result 
		select * from @temp where SrNo=@counter
		--select ROW_NUMBER() OVER (ORDER BY [SrNo]) As SrNo,lat,long from @temp where SrNo=@counter
		set @counter= @counter +2
	 
	 end
	 
	 select * from @result order by time1 asc
	
	 
	 
end
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

--rpt_prc_KMtravel 1,'2012-01-01 00:00:00.000','2012-01-01 24:56:12.000'
--rpt_prc_KMtravel 9,'2012/02/06 00:00:00','2012/02/06 23:59:59' , 1 --1 day
--rpt_prc_KMtravel 9,'2012-02-01 00:00:00.000','2012-02-06 23:59:59.000' --2 day
--rpt_prc_KMtravel 4,'2012-02-29 00:00:00.000','2012-02-29 14:59:59.000',0 --1 month
CREATE PROCEDURE [dbo].[rpt_prc_KMtravel]
	-- Add the parameters for the stored procedure here
	@carrier_id int,
	@dateStart varchar(100),
	@dateStop varchar(100),
	@task int
	
	
AS
begin
 select  latitude as lat , longitude as long ,time FROM [mts].[dbo].[mts]where carrierFId=@carrier_id and((lbsLocation is null) or (lbsLocation=0)) and mts.time between @dateStart and @dateStop and latitude!=0 order by time asc
end

--	Declare @trackresult as table
--	(	
--		SrNo int,lat float, long float , speed float , time varchar(100)
--	)
	
--	 insert into @trackresult 
--	 select  ROW_NUMBER() OVER (ORDER BY [Id]) As SrNo, latitude as lat , longitude as long , speed as speed, time as time FROM [mts].[dbo].[mts]
--	 where carrierFId=@carrier_id  and mts.time between @dateStart and @dateStop and latitude!=0 and longitude!=0
	 
--	select * from @trackresult
--end

--else
--begin

--/* vijay 6-2-2012*/

--Declare @cnt as int
--Declare @counter as int

--Declare @temp as table
--(
--SrNo int,lat float, long float 
--)

--Declare @result as table
--(
--SrNo int,lat float, long float 
--)




--	-- SET NOCOUNT ON added to prevent extra result sets from
--	-- interfering with SELECT statements.
--	SET NOCOUNT ON;
			
--    -- adding data to temp table
--    insert into @temp 
--	 select  ROW_NUMBER() OVER (ORDER BY [Id]) As SrNo, latitude as lat , longitude as long FROM [mts].[dbo].[mts]
--	 where carrierFId=@carrier_id  and Din1=1 and latitude>0 and longitude>0 and mts.time between @dateStart and @dateStop
	 
	 
	 
--	 set @cnt=(select COUNT(SrNo)from @temp )
--	 set @counter =1
	 
--	 -- skipping row / adding alternate records
--	 while(@counter<=@cnt)
--	 begin
--		insert into @result 
--		select * from @temp where SrNo=@counter
--		--select ROW_NUMBER() OVER (ORDER BY [SrNo]) As SrNo,lat,long from @temp where SrNo=@counter
--		set @counter= @counter + 2
	 
--	 end
	 
--	 -- reset counters
--	 set @cnt=(select COUNT(SrNo)from @result )
--	 set @counter =1
--	 --empty @temp table to reuse
--	 delete from @temp
--	 -- skipping same lat/long recordings
--	 while(@counter<=@cnt)
--	 begin
--		if((select lat from @result where SrNo = @counter) = (select lat from @result where SrNo = (@counter + 2)))
--		begin
--			set @counter = @counter + 2
--		end
--		else
--		begin 
--			insert into @temp 
--				select * from @result where SrNo = @counter
--			set @counter = @counter + 2
--		end
--	 end
	 
	 
--	 --select COUNT(srNo) as result from @result 
--	 --select COUNT(srNo) as temp from @temp
--	 --select * from @result
--	 select lat , long from @temp 
--end	 
--	 --select * from @result
	 
	
--	 -- select lat , long from @result
--	-- set @counter= @counter + 6
--	--end



--/* vijay 6-2-2012
--Declare @cnt as int
--Declare @counter as int

--Declare @temp as table
--(
--SrNo int,lat float, long float 
--)

--Declare @result as table
--(
--SrNo int,lat float, long float 
--)


--	-- SET NOCOUNT ON added to prevent extra result sets from
--	-- interfering with SELECT statements.
--	SET NOCOUNT ON;
	
--	--set @tot = (select COUNT(*) from [mts].[dbo].[mts]  where carrierFId=1  and Din1=1)
	
--	--while (@counter<=@tot)
--	--Begin
	
--    -- Insert statements for procedure here
--    insert into @temp 
--	 select  ROW_NUMBER() OVER (ORDER BY [Id]) As SrNo, latitude as lat , longitude as long FROM [mts].[dbo].[mts]
--	 where carrierFId=@carrier_id  and Din1=1 and mts.time between @dateStart and @dateStop
	 
--	 set @cnt=(select COUNT(SrNo)from @temp )
--	 set @counter =0
	 
--	 while(@counter<=@cnt)
--	 begin
--		insert into @result 
--		select * from @temp where SrNo=@counter
--		set @counter= @counter + 1
	 
--	 end
	 
--	 select COUNT(srNo) from @temp
--	 select COUNT(srNo) from @result 
--	 select * from @result 
--	-- set @counter= @counter + 6
--	--end
--	*/
GO
/****** Object:  StoredProcedure [dbo].[rpt_prc_geoFencing]    Script Date: 01/09/2017 11:10:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		virus

-- =============================================
--to fetch data for geofencing report

CREATE PROCEDURE [dbo].[rpt_prc_geoFencing]
	@carrier_id int,
	@dateStart varchar(50), -- '2012-01-22'  
	@dateStop varchar(50) 
	
	
AS
BEGIN
	select mts.time,mts.latitude,mts.longitude from mts where carrierFId=@carrier_id and  time between @dateStart and @dateStop  order by time asc;
END
GO
/****** Object:  StoredProcedure [dbo].[rpt_prc_Geo_getdata]    Script Date: 01/09/2017 11:10:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

--rpt_prc_Geo_getdata 4,'2012-02-02 00:00:00.000','2012-02-02 23:56:12.000'

CREATE PROCEDURE [dbo].[rpt_prc_Geo_getdata]
	-- Add the parameters for the stored procedure here
	@carrier_id int,
	@dateStart varchar(100),
	@dateStop varchar(100)
	

AS
BEGIN

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	
	
      select  ROW_NUMBER() OVER (ORDER BY [Id]) As SrNo, latitude as lat , longitude as long, time as DateT  FROM [mts].[dbo].[mts]
	 where carrierFId=@carrier_id  and mts.time between @dateStart and @dateStop 
	
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

--[rpt_prc_CarrierTrack] 9,'2012/02/06 12:00:00','2012/02/06 12:30:59'
CREATE PROCEDURE [dbo].[rpt_prc_CarrierTrack]
	-- Add the parameters for the stored procedure here
	@carrier_id int,
	@dateStart varchar(100),
	@dateStop varchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	 select  top 10 ROW_NUMBER() OVER (ORDER BY [Id]) As SrNo, latitude as lat , longitude as long FROM [mts].[dbo].[mts]
	 where carrierFId=@carrier_id  and Din1=1 and mts.time between @dateStart and @dateStop
END
GO
/****** Object:  StoredProcedure [dbo].[proc_test]    Script Date: 01/09/2017 11:10:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[proc_test]  
@CarrierID as int,  
@LogDate as datetime  
AS  
Declare @DI1 bit  
Declare @StartTime datetime  
Declare @EndTime datetime  
Declare @HoldDuration datetime  
Declare @start int  
Declare @End int  
Declare @LogDateTime datetime  
Declare @LatitudeVal float  
Declare @LongitudeVal float  
 
BEGIN  

 
Create table #tblTemp  
(  
StartTime datetime,  
EndTime datetime,  
LatitudeVal float,  
DiffTime int,
LongitudeVal float  
)  
 
declare Cur_TrackInfo CURSOR FOR  
--Select top 100 DI1,LogDateTime,LatitudeVal,LongitudeVal From mts where CarrierID = @CarrierID
--AND (LogDateTime >= @LogDate + '00:00:00' AND LogDateTime <= @LogDate + '23:59:59') OR LogDateTime Is Null  
--select top 100 Din1,time,latitude,longitude from mts where carrierFId = 3  and (mts.time between '2012-01-23 18:48:06.000' AND '2012-01-23 19:04:49.000')
select top 100 Din1,time,latitude,longitude from mts where carrierFId = 3  and (mts.time between  @LogDate + '00:00:00' AND @LogDate + '23:59:59' )

OPEN Cur_TrackInfo  
FETCH NEXT FROM Cur_TrackInfo INTO @DI1,@LogDateTime,@LatitudeVal,@LongitudeVal  

set @start = 1  
set @End = 1 
Declare @last_DI1  as bit
Declare @last1_DI1  as bit
Declare @Stop1  as datetime
Declare @Stop2  as Datetime

Declare @Car_started as bit

set @Car_started = 0
 
WHILE @@FETCH_STATUS = 0 

/*For the first True*/
----------------------------------------------------------------------------------------------------------------------------- 
Begin  
	print @DI1
	If @DI1 = 'True' And @start = 1  
		/* found first engine start*/
		Begin  
			SET @StartTime = @LogDateTime  
			SET @start = 2  
			SET @Car_started = 1
			print '@StartTime' + convert(varchar(20),@StartTime)
			--set @End = 1  
		End  
	If @DI1 = 'True' And @start = 2
	  
		Begin  
			print '@EndTime' + convert(varchar(20),@EndTime)
			set @EndTime = @LogDateTime  
			if   datediff(minute,@Stop1,@Stop2) >= 2 
			Begin  
				print 'datediff' + convert(varchar(20),@Stop1) + ' ' + convert(varchar(20),@Stop2) 
				Insert InTo #tblTemp(StartTime, EndTime, LatitudeVal, LongitudeVal, DiffTime)
				Values(@StartTime, @Stop2, @LatitudeVal, @LongitudeVal, datediff(minute,@Stop1,@Stop2) )  
				set @StartTime =@LogDateTime
				--set @End = 2  
				--set @start = 1  
				SET @Stop1 = @LogDateTime
				SET @Stop2 = @LogDateTime
			End  
		End  
	If @DI1 = 'False' AND @Car_started = 1
	BEGIN
		IF @last_DI1 = 'True'
			BEGIN
				print '@Stop1' + convert(varchar(20),@LogDateTime)
				set @Stop1 = @LogDateTime
				set @Stop2 = @LogDateTime
			END
		ELSE
			BEGIN
				print '@Stop2' + convert(varchar(20),@LogDateTime)
				set @Stop2 = @LogDateTime

			END

	END	
	set @last_DI1 = @DI1 /*get last status of DI1*/


	FETCH NEXT FROM Cur_TrackInfo INTO @DI1,@LogDateTime,@LatitudeVal,@LongitudeVal  
 
End  
 
CLOSE Cur_TrackInfo;  
DEALLOCATE Cur_TrackInfo;  
 
--drop table #tblTemp  
 
/**Select StartTime,EndTime, DateDiff(MINUTE,StartTime,EndTime) as DiffTime,LatitudeVal,LongitudeVal From #tblTemp  */
 
--Select CONVERT(varchar(8),StartTime,108),CONVERT(varchar(8),EndTime,108) From #tblTemp  

select * from #tblTemp
 
END
GO
/****** Object:  StoredProcedure [dbo].[prc_IgnitionOnOff]    Script Date: 01/09/2017 11:10:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		vijay
-- Create date: 10-02-2012
-- Description:	<Description,,>
-- =============================================
-- [prc_IgnitionOnOff] '2014-02-22 00:00:00.000','2014-02-28 23:59:59.000',606
CREATE PROCEDURE [dbo].[prc_IgnitionOnOff]
	-- Add the parameters for the stored procedure here
	
	@dateStart datetime,
	@dateEnd datetime,
	@vehID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	Declare @cnt as int
	Declare @counter as int
	Declare @UpID int

	Declare @result as table
	(
		SrNo int,dateOn datetime ,latOn float,longOn float,dateOff datetime ,latOff float,longOff float
	)

	Declare @temp as table
	(
		SrNo int,dates datetime,lat float,long float
	)
	
	insert into @temp	
	   SELECT ROW_NUMBER() OVER (ORDER BY [Id]) As SrNo,[time],[latitude],[longitude]
	   FROM [mts].[dbo].mts
	   where  [carrierFId] = @vehID and ([time] between @dateStart and @dateEnd) and Din1=1 order by time desc

	set @counter = (select COUNT(SrNo) from @temp)
	set @cnt = 1
	
	while(@counter >= @cnt)
	begin
		if(@cnt%2 != 0)
		begin
			insert into @result(SrNo,dateOn,latOn,longOn)
				select SrNo,dates,lat,long from @temp where SrNo = @cnt 
			set @UpID = @cnt 
			set @cnt = @cnt + 1
		end
		else
		begin
			update @result set dateOff = (select dates from @temp where SrNo = @cnt ),
			latOff = (select lat from @temp where SrNo = @cnt ),
			longOff = (select long from @temp where SrNo = @cnt ) where SrNo = @UpID
			set @cnt = @cnt + 1
		end
	end
	
	--select * from @temp
	--select * from @result
	
	select dateOn ,latOn,longOn,latOff,longOff,dateOff,sum(DATEDIFF(mi,dateOn,dateOff))as WorkingTime 
	from @result
	Group by dateOn,latOn,longOn,dateOff,latOff,longOff
	

	
	
	
END
GO
/****** Object:  Table [dbo].[lastLog]    Script Date: 01/09/2017 11:10:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lastLog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[carrierFId] [int] NOT NULL,
	[codecId] [int] NULL,
	[time] [datetime] NOT NULL,
	[priority] [int] NULL,
	[latitude] [float] NULL,
	[longitude] [float] NULL,
	[altitude] [float] NULL,
	[sat] [int] NULL,
	[speed] [float] NULL,
	[angle] [int] NULL,
	[Din1] [int] NULL,
	[Din2] [int] NULL,
	[Din3] [int] NULL,
	[Din4] [int] NULL,
	[Analog1] [float] NULL,
	[Analog2] [float] NULL,
	[Analog3] [float] NULL,
	[Analog4] [float] NULL,
	[GSMSignalStrength] [int] NULL,
	[CurrentProfile] [int] NULL,
	[GPSSpeed] [float] NULL,
	[BatteryVoltage] [float] NULL,
	[BatteryCurrent] [float] NULL,
	[PcbTemp] [float] NULL,
	[FuelCounter] [bigint] NULL,
	[MovementSensor] [int] NULL,
	[Dallas0] [float] NULL,
	[Dallas1] [float] NULL,
	[Dallas2] [float] NULL,
	[IButton] [bigint] NULL,
	[Odometer] [int] NULL,
	[addressFId] [int] NULL,
	[lbsLocation] [tinyint] NULL,
 CONSTRAINT [PK_lastLog] PRIMARY KEY CLUSTERED 
(
	[carrierFId] ASC,
	[time] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [index_lastLogcarrierid] ON [dbo].[lastLog] 
(
	[carrierFId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[FetchGofenceData]    Script Date: 01/09/2017 11:10:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		virus
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

-- [FetchGofenceData] 16 0
CREATE PROCEDURE [dbo].[FetchGofenceData] 
	-- Add the parameters for the stored procedure here
	@carrierID int,
	@task int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	--SET NOCOUNT ON;

    -- Insert statements for procedure here
    --@task 1 for circular, @task= 0 for square
    
    if(@task=1)
    begin
               SELECT top 1 carrierFId,  latitude , longitude  FROM lastLog where carrierFId=@carrierID 
	end
	else
	begin
	          SELECT top 1 carrierFId,  latitude , longitude  FROM lastLog where carrierFId=@carrierID 

	end
END
GO
/****** Object:  StoredProcedure [dbo].[getCarrierbyId]    Script Date: 01/09/2017 11:10:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		virus
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getCarrierbyId] 
	-- Add the parameters for the stored procedure here
	@carrierID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	--SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM lastLog WHERE carrierFId=@carrierID
END
GO
/****** Object:  Table [dbo].[IndividualDetails]    Script Date: 01/09/2017 11:10:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IndividualDetails](
	[CustomerID] [int] NOT NULL,
	[CustomerName] [nvarchar](255) NULL,
	[CustomerLandline] [int] NULL,
	[CustomerDOB] [datetime] NULL,
	[CustomerUniqueIDNo] [nvarchar](255) NULL,
	[CustomerBloodGroup] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[fifteenDayData]    Script Date: 01/09/2017 11:10:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fifteenDayData](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[carrierFId] [int] NOT NULL,
	[time] [datetime] NOT NULL,
	[codecId] [int] NULL,
	[priority] [int] NULL,
	[latitude] [float] NULL,
	[longitude] [float] NULL,
	[altitude] [float] NULL,
	[sat] [int] NULL,
	[speed] [float] NULL,
	[angle] [int] NULL,
	[Din1] [int] NULL,
	[Din2] [int] NULL,
	[Din3] [int] NULL,
	[Din4] [int] NULL,
	[Analog1] [float] NULL,
	[Analog2] [float] NULL,
	[Analog3] [float] NULL,
	[Analog4] [float] NULL,
	[GSMSignalStrength] [int] NULL,
	[CurrentProfile] [int] NULL,
	[GPSSpeed] [float] NULL,
	[BatteryVoltage] [float] NULL,
	[BatteryCurrent] [float] NULL,
	[PcbTemp] [float] NULL,
	[FuelCounter] [bigint] NULL,
	[MovementSensor] [int] NULL,
	[Dallas0] [float] NULL,
	[Dallas1] [float] NULL,
	[Dallas2] [float] NULL,
	[IButton] [bigint] NULL,
	[Odometer] [int] NULL,
	[addressFId] [int] NULL,
	[lbsLocation] [tinyint] NULL,
 CONSTRAINT [PK_fifteenDayData] PRIMARY KEY CLUSTERED 
(
	[carrierFId] ASC,
	[time] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[getkmFun]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		virus
-- =============================================
/* 



declare @km as float
select @km=[dbo].getkmFun ( 21, 75, 20, 74	);

select @km

*/


CREATE function [dbo].[getkmFun](@Lat1  float,
							@Long1  float,
							@Lat2  float,
							@Long2  float)
	
	returns float
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets froms
	-- interfering with SELECT statements.
		if @Lat1 is null or @Lat2 is null
		return 0;
		declare @dDistance as float
		declare @dLat1InRad as  float
		declare @dLong1InRad as float
		declare @dLat2InRad as float
		declare @dLongitude as float
		declare @dLatitude as float
		declare @dLong2InRad as float
		declare @a as float
		declare @c float
		declare @kEarthRadiusKms as float	
  
   
        select @dLat1InRad = @Lat1 * (select PI() / 180.0);
        select @dLong1InRad = @Long1 * (select PI() / 180.0);
        select @dLat2InRad = @Lat2 * (select PI() / 180.0);
        select @dLong2InRad = @Long2 * (select PI() / 180.0);

        select @dLongitude = @dLong2InRad - @dLong1InRad;
        select @dLatitude = @dLat2InRad - @dLat1InRad;

       -- Intermediate result a.
        select @a = Power(Sin(@dLatitude / 2.0), 2.0) +
                   Cos(@dLat1InRad) * Cos(@dLat2InRad) *
                   Power(Sin(@dLongitude / 2.0), 2.0);

       -- Intermediate result c (great circle distance in Radians).
        select @c = 2.0 * Asin(Sqrt(@a));

        --// Distance.
        --// const Double kEarthRadiusMiles = 3956.0;
         select @kEarthRadiusKms = 6376.5;
        select @dDistance = @kEarthRadiusKms * @c;

        return @dDistance;		
  
END
GO
/****** Object:  StoredProcedure [dbo].[getkm]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		virus
-- =============================================
/* 


exec getkm  18.500442, 73.941390, 18.501553, 73.931331	



*/


CREATE PROCEDURE [dbo].[getkm]
	@Lat1  float,
	@Long1  float,
	@Lat2  float,
	@Long2  float
	
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets froms
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	declare @dDistance as float
	declare @dLat1InRad as  float
	declare @dLong1InRad as float
	declare @dLat2InRad as float
	declare @dLongitude as float
	declare @dLatitude as float
	declare @dLong2InRad as float
	declare @a as float
	declare @c float
	declare @kEarthRadiusKms as float
	
	
	
  
   
        select @dLat1InRad = @Lat1 * (select PI() / 180.0);
        select @dLong1InRad = @Long1 * (select PI() / 180.0);
        select @dLat2InRad = @Lat2 * (select PI() / 180.0);
        select @dLong2InRad = @Long2 * (select PI() / 180.0);

        select @dLongitude = @dLong2InRad - @dLong1InRad;
        select @dLatitude = @dLat2InRad - @dLat1InRad;

       -- Intermediate result a.
        select @a = Power(Sin(@dLatitude / 2.0), 2.0) +
                   Cos(@dLat1InRad) * Cos(@dLat2InRad) *
                   Power(Sin(@dLongitude / 2.0), 2.0);

       -- Intermediate result c (great circle distance in Radians).
        select @c = 2.0 * Asin(Sqrt(@a));

        --// Distance.
        --// const Double kEarthRadiusMiles = 3956.0;
         select @kEarthRadiusKms = 6376.5;
        select @dDistance = @kEarthRadiusKms * @c;

        select @dDistance as km;
	
		
  
END
GO
/****** Object:  UserDefinedFunction [dbo].[getDistance]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		virus
-- =============================================
/* 



declare @km as float
select @km=[dbo].getkmFun ( 21, 75, 20, 74	);

select @km

*/
create function [dbo].[getDistance](@Lat1  float,
							@Long1  float,
							@Lat2  float,
							@Long2  float)	
	returns float
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets froms
	-- interfering with SELECT statements.
		if @Lat1 is null or @Lat2 is null
		return 0;
		declare @dDistance as float
		declare @dLat1InRad as  float
		declare @dLong1InRad as float
		declare @dLat2InRad as float
		declare @dLongitude as float
		declare @dLatitude as float
		declare @dLong2InRad as float
		declare @a as float
		declare @c float
		declare @kEarthRadiusKms as float	
  
   
        select @dLat1InRad = @Lat1 * (select PI() / 180.0);
        select @dLong1InRad = @Long1 * (select PI() / 180.0);
        select @dLat2InRad = @Lat2 * (select PI() / 180.0);
        select @dLong2InRad = @Long2 * (select PI() / 180.0);

        select @dLongitude = @dLong2InRad - @dLong1InRad;
        select @dLatitude = @dLat2InRad - @dLat1InRad;

       -- Intermediate result a.
        select @a = Power(Sin(@dLatitude / 2.0), 2.0) +
                   Cos(@dLat1InRad) * Cos(@dLat2InRad) *
                   Power(Sin(@dLongitude / 2.0), 2.0);

       -- Intermediate result c (great circle distance in Radians).
        select @c = 2.0 * Asin(Sqrt(@a));

        --// Distance.
        --// const Double kEarthRadiusMiles = 3956.0;
         select @kEarthRadiusKms = 6376.5;
        select @dDistance = @kEarthRadiusKms * @c;

        return @dDistance;		
  
END
GO
/****** Object:  Table [dbo].[ManDetails]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ManDetails](
	[ManID] [int] NOT NULL,
	[ManName] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoginDetails]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoginDetails](
	[ID] [int] NOT NULL,
	[LoginID] [nvarchar](255) NULL,
	[Password] [nvarchar](255) NULL,
	[UserType] [nvarchar](255) NULL,
	[UserPriority] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LicenseType]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LicenseType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LicenseType] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_LicenseType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LicenseDetails]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LicenseDetails](
	[LicenseDetailsID] [int] NOT NULL,
	[LicenseImage] [nvarchar](max) NULL,
	[LicenseExpiryDate] [datetime] NULL,
	[LicenseNumber] [nvarchar](255) NULL,
	[DriverFID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[globle_Values]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[globle_Values](
	[gl_id] [int] IDENTITY(1,1) NOT NULL,
	[din1] [tinyint] NULL,
 CONSTRAINT [PK_globle_Values] PRIMARY KEY CLUSTERED 
(
	[gl_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MTS_Reports]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MTS_Reports](
	[Report_ID] [int] IDENTITY(1,1) NOT NULL,
	[ReportName] [nvarchar](250) NULL,
 CONSTRAINT [PK_MTS_Reports] PRIMARY KEY CLUSTERED 
(
	[Report_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[overSpeedingMails]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[overSpeedingMails](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[carrierFId] [int] NULL,
	[time] [datetime] NULL,
	[latitude] [float] NULL,
	[longitude] [float] NULL,
	[speed] [float] NULL,
	[Flag] [bit] NULL,
 CONSTRAINT [PK_overSpeedingMails] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[overSpeeding]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[overSpeeding](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[carrierFId] [int] NOT NULL,
	[time] [datetime] NOT NULL,
	[latitude] [float] NULL,
	[longitude] [float] NULL,
	[speed] [float] NULL,
 CONSTRAINT [PK_overSpeeding] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Company]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Company](
	[companyID] [int] IDENTITY(1,1) NOT NULL,
	[companyName] [nvarchar](255) NOT NULL,
	[companyWebsite] [nvarchar](255) NULL,
	[companyEmail] [varchar](50) NULL,
	[companyContact] [bigint] NULL,
	[companyAddr] [varchar](50) NULL,
	[createdOn] [datetime] NULL,
	[expiryOn] [datetime] NULL,
	[logo] [varchar](500) NULL,
	[Status] [varchar](50) NULL,
	[OrganisationLimit] [int] NULL,
	[CarrierLimit] [int] NULL,
	[UsersLimit] [int] NULL,
	[UserID] [int] NULL,
 CONSTRAINT [PK_CompanyDetails] PRIMARY KEY CLUSTERED 
(
	[companyID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[carrierUsers]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[carrierUsers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[userID] [int] NULL,
	[carrierID] [int] NULL,
 CONSTRAINT [PK_carrierUsers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedTableType [dbo].[carrierTab]    Script Date: 01/09/2017 11:10:02 ******/
CREATE TYPE [dbo].[carrierTab] AS TABLE(
	[carrierFId] [int] NULL
)
GO
/****** Object:  Table [dbo].[geofenceAlert]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[geofenceAlert](
	[alertID] [int] IDENTITY(1,1) NOT NULL,
	[alertMessage] [varchar](150) NULL,
	[alertTime] [datetime] NULL,
	[carrierFid] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GCMPolice]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GCMPolice](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GcmId] [nvarchar](1050) NULL,
	[CarrierFId] [int] NULL,
 CONSTRAINT [PK_GCMPolice] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[fnSplit]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Function [dbo].[fnSplit](@text text, @delimitor nchar(1))
 
RETURNS
@table TABLE
(
    [Index] int Identity(0,1),
    [SplitText] varchar(10)
)
AS
 
BEGIN
    declare @current varchar(10)
    declare @endIndex int
    declare @textlength int
    declare @startIndex int
 
    set @startIndex = 1
 
    if(@text is not null)
    begin
        set @textLength = datalength(@text)
 
        while(1=1)
        begin
            set @endIndex = charindex(@delimitor, @text, @startIndex)
 
            if(@endIndex != 0)
            begin
                set @current = substring(@text,@startIndex, @endIndex - @StartIndex)
                Insert Into @table ([SplitText]) values(@current)
                set @startIndex = @endIndex + 1   
            end
            else
            begin
                set @current = substring(@text, @startIndex, datalength(@text)-@startIndex+1)
                Insert Into @table ([SplitText]) values(@current)
                break
            end
        end
 
    end
 
    return
END
GO
/****** Object:  UserDefinedTableType [dbo].[fleetTab]    Script Date: 01/09/2017 11:10:02 ******/
CREATE TYPE [dbo].[fleetTab] AS TABLE(
	[fleetFId] [int] NULL
)
GO
/****** Object:  StoredProcedure [dbo].[rpt_prc_BoldStopNew]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		virus
-- =============================================


CREATE PROCEDURE [dbo].[rpt_prc_BoldStopNew]
	@carrier_id int,
	@dateStart varchar(50), 
	@dateStop varchar(50)
	
AS
BEGIN
	select time,speed,mts_geonames.DBO.address.address from mts.dbo.mts 
	left outer JOIN    
    mts_geonames.dbo.address on mts.addressFId=mts_geonames.dbo.address.Id
	where carrierFId=@carrier_id and speed<20 and time between @dateStart and @dateStop order by time asc;	  	
END
GO
/****** Object:  Table [dbo].[callibration]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[callibration](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[perA1] [float] NULL,
	[perA2] [float] NULL,
	[perA3] [float] NULL,
	[perA4] [float] NULL,
	[litreA1] [float] NULL,
	[litreA2] [float] NULL,
	[litreA3] [float] NULL,
	[litreA4] [float] NULL,
	[carrierFId] [int] NULL,
 CONSTRAINT [PK_callibration] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[mts_getFuelRpt]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>					[mts_getFuelRpt] 636,'2014-11-14','2014-11-15'
-- =============================================

CREATE PROCEDURE [dbo].[mts_getFuelRpt]
	-- Add the parameters for the stored procedure here
	@vehicle int,
	@dateStart datetime,
	@dateStop datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    declare @perV1 float;
    declare @perV2 float;
    declare @perV3 float;
    declare @perV4 float;
    declare @literV1 float;
    declare @literV2 float;
    declare @literV3 float;
    declare @literV4 float;
    
    select @perV1=perA1,
    @perV2=perA2, 
    @perV3=perA3, 
    @perV4=perA4,
    @literV1=litreA1,
    @literV2=litreA2,
    @literV3=litreA3,
    @literV4=litreA4  
    from callibration where carrierFId=@vehicle;
    
    
	SELECT 
	time,
	((@perV1* POWER(Analog1/1000,3))+(@perV2* POWER(Analog1/1000,2))+(@perV3* Analog1/1000) +@perV4) as percentage,
	((@literV1* POWER(Analog1/1000,3))+(@literV2* POWER(Analog1/1000,2))+(@literV3* Analog1/1000) +@literV4) as litre
,address,mts.latitude,mts.longitude
	
	from mts 
		left outer join  mts_geonames.dbo.address on mts.addressFId=mts_geonames.dbo.address.Id
	where carrierFId=@vehicle and time between @dateStart and @dateStop order by time asc
		

END
GO
/****** Object:  Table [dbo].[alerts]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[alerts](
	[alertId] [int] IDENTITY(1,1) NOT NULL,
	[alertMessage] [varchar](160) NOT NULL,
	[alertPriority] [int] NULL,
	[alertRelatedTo] [varchar](50) NULL,
	[priority] [int] NULL,
	[timeout] [int] NULL,
 CONSTRAINT [PK_alerts] PRIMARY KEY CLUSTERED 
(
	[alertId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DetectedVehicles]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetectedVehicles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[VehicleNumber] [nvarchar](50) NULL,
	[Time] [nvarchar](50) NULL,
	[Location] [nvarchar](50) NULL,
 CONSTRAINT [PK_DetectedVehicles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AlertMgmt]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AlertMgmt](
	[AlertMgmt_ID] [int] IDENTITY(1,1) NOT NULL,
	[CarrierID] [int] NULL,
	[EmailID] [nvarchar](250) NULL,
	[Mobile1] [nvarchar](250) NULL,
	[Mobile2] [nvarchar](250) NULL,
	[Mobile3] [nvarchar](250) NULL,
 CONSTRAINT [PK_AlertMgmt] PRIMARY KEY CLUSTERED 
(
	[AlertMgmt_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DriverPerformance]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DriverPerformance](
	[DPID] [int] NOT NULL,
	[EventDateTime] [datetime] NULL,
	[PScale] [int] NULL,
	[PerfDescription] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DriverDetails]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DriverDetails](
	[DriverID] [int] NOT NULL,
	[DriverRFID] [nvarchar](255) NULL,
	[DriverName] [nvarchar](255) NULL,
	[DriverDOB] [datetime] NULL,
	[DriverAddress] [nvarchar](255) NULL,
	[DriverCell1] [int] NULL,
	[DriverCell2] [int] NULL,
	[DriverIdentMark] [nvarchar](255) NULL,
	[DriverBloodGroup] [nvarchar](255) NULL,
	[DriverExp] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doorStatus]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doorStatus](
	[smsId] [int] IDENTITY(1,1) NOT NULL,
	[alertTime] [datetime] NULL,
	[carrierFid] [int] NULL,
	[din2Status] [int] NULL,
 CONSTRAINT [PK_doorStatus] PRIMARY KEY CLUSTERED 
(
	[smsId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[din4OnOff]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[din4OnOff](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[carrierFId] [int] NOT NULL,
	[time] [datetime] NOT NULL,
	[latitude] [float] NULL,
	[longitude] [float] NULL,
	[speed] [float] NULL,
	[Din4] [int] NULL,
 CONSTRAINT [PK_din4OnOff] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[din3OnOff]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[din3OnOff](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[carrierFId] [int] NOT NULL,
	[time] [datetime] NOT NULL,
	[latitude] [float] NULL,
	[longitude] [float] NULL,
	[speed] [float] NULL,
	[Din3] [int] NULL,
 CONSTRAINT [PK_din3OnOff] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DeviceRecords]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeviceRecords](
	[RecordID] [int] NOT NULL,
	[DeviceFid] [int] NULL,
	[RecordTime] [datetime] NULL,
	[RecordLatitude] [int] NULL,
	[RecordLongitude] [int] NULL,
	[RecordAltitude] [int] NULL,
	[RecordAngle] [int] NULL,
	[RecordSatCount] [int] NULL,
	[Speed] [int] NULL,
	[Landmark] [nvarchar](255) NULL,
	[IgnitionStatus] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[prevDayData]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[prevDayData](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[carrierFId] [int] NOT NULL,
	[codecId] [int] NULL,
	[time] [datetime] NOT NULL,
	[priority] [int] NULL,
	[latitude] [float] NULL,
	[longitude] [float] NULL,
	[altitude] [float] NULL,
	[sat] [int] NULL,
	[speed] [float] NULL,
	[angle] [int] NULL,
	[Din1] [int] NULL,
	[Din2] [int] NULL,
	[Din3] [int] NULL,
	[Din4] [int] NULL,
	[Analog1] [float] NULL,
	[Analog2] [float] NULL,
	[Analog3] [float] NULL,
	[Analog4] [float] NULL,
	[GSMSignalStrength] [int] NULL,
	[CurrentProfile] [int] NULL,
	[GPSSpeed] [float] NULL,
	[BatteryVoltage] [float] NULL,
	[BatteryCurrent] [float] NULL,
	[PcbTemp] [float] NULL,
	[FuelCounter] [bigint] NULL,
	[MovementSensor] [int] NULL,
	[Dallas0] [float] NULL,
	[Dallas1] [float] NULL,
	[Dallas2] [float] NULL,
	[IButton] [bigint] NULL,
	[Odometer] [int] NULL,
	[addressFId] [int] NULL,
	[lbsLocation] [tinyint] NULL,
 CONSTRAINT [PK_prevDayData] PRIMARY KEY CLUSTERED 
(
	[carrierFId] ASC,
	[time] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[relCarrierGeofence]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[relCarrierGeofence](
	[GeofenceId] [bigint] IDENTITY(1,1) NOT NULL,
	[CarrierID] [bigint] NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[EndTime] [datetime] NOT NULL,
	[CalcDays] [int] NOT NULL,
	[AreaName] [varchar](240) NOT NULL,
	[GeoLatitude1] [float] NOT NULL,
	[GeoLongitude1] [float] NOT NULL,
	[GeoLatitude2] [float] NULL,
	[GeoLongitude2] [float] NULL,
	[GeoFenceAttribute] [int] NOT NULL,
	[IsCircularGF] [bit] NULL,
	[Radius] [int] NULL,
 CONSTRAINT [PK_relCarrierGeofence1] PRIMARY KEY CLUSTERED 
(
	[GeofenceId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  UserDefinedTableType [dbo].[rawDataTableFM42]    Script Date: 01/09/2017 11:10:02 ******/
CREATE TYPE [dbo].[rawDataTableFM42] AS TABLE(
	[imei] [bigint] NULL,
	[codecId] [int] NULL,
	[priority] [int] NULL,
	[latitude] [float] NULL,
	[longitude] [float] NULL,
	[altitude] [float] NULL,
	[sat] [int] NULL,
	[speed] [float] NULL,
	[angle] [int] NULL,
	[time] [datetime] NULL,
	[Din1] [int] NULL,
	[Din2] [int] NULL,
	[Din3] [int] NULL,
	[Din4] [int] NULL,
	[Analog1] [float] NULL,
	[Analog2] [float] NULL,
	[Analog3] [float] NULL,
	[Analog4] [float] NULL,
	[GSMSignalStrength] [int] NULL,
	[CurrentProfile] [int] NULL,
	[GPSSpeed] [float] NULL,
	[BatteryVoltage] [float] NULL,
	[BatteryCurrent] [float] NULL,
	[PcbTemp] [float] NULL,
	[FuelCounter] [bigint] NULL,
	[MovementSensor] [int] NULL,
	[Dallas0] [float] NULL,
	[Dallas1] [float] NULL,
	[Dallas2] [float] NULL,
	[Ibutton] [bigint] NULL,
	[Odometer] [int] NULL,
	[visited] [int] NULL
)
GO
/****** Object:  StoredProcedure [dbo].[insertInRawDataDT]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insertInRawDataDT]
  @dt AS dbo.rawDataTableFM42 readonly
AS
BEGIN
  SET NOCOUNT ON;
  
  Select *
Into   #Temp1
From   @dt

While EXISTS(SELECT * From #Temp1 where visited=0)
	Begin

	  INSERT into dbo.rawData(imei,codecId,priority,latitude,longitude,altitude,sat,speed,angle,time,Din1,Din2,Din3,Din4,Analog1,Analog2,Analog3,Analog4,GSMSignalStrength,CurrentProfile,GPSSpeed,BatteryVoltage,BatteryCurrent,PcbTemp,FuelCounter,MovementSensor,Dallas0,Dallas1,Dallas2,Ibutton,Odometer) 
	  SELECT top 1 imei,codecId,priority,latitude,longitude,altitude,sat,speed,angle,time,Din1,Din2,Din3,Din4,Analog1,Analog2,Analog3,Analog4,GSMSignalStrength,CurrentProfile,GPSSpeed,BatteryVoltage,BatteryCurrent,PcbTemp,FuelCounter,MovementSensor,Dallas0,Dallas1,Dallas2,Ibutton,Odometer FROM #Temp1 where visited=0;
	 
	  update top (1) #Temp1 set visited=1 where visited=0;
	end
END
GO
/****** Object:  UserDefinedTableType [dbo].[rawDataTable]    Script Date: 01/09/2017 11:10:02 ******/
CREATE TYPE [dbo].[rawDataTable] AS TABLE(
	[imei] [bigint] NULL,
	[codecId] [int] NULL,
	[priority] [int] NULL,
	[latitude] [float] NULL,
	[longitude] [float] NULL,
	[altitude] [float] NULL,
	[sat] [int] NULL,
	[speed] [float] NULL,
	[angle] [int] NULL,
	[time] [datetime] NULL,
	[Din1] [int] NULL,
	[Din2] [int] NULL,
	[Din3] [int] NULL,
	[Din4] [int] NULL,
	[Analog1] [float] NULL,
	[Analog2] [float] NULL,
	[Analog3] [float] NULL,
	[Analog4] [float] NULL,
	[GSMSignalStrength] [int] NULL,
	[CurrentProfile] [int] NULL,
	[GPSSpeed] [float] NULL,
	[BatteryVoltage] [float] NULL,
	[BatteryCurrent] [float] NULL,
	[PcbTemp] [float] NULL,
	[FuelCounter] [bigint] NULL,
	[MovementSensor] [int] NULL,
	[Dallas0] [float] NULL,
	[Dallas1] [float] NULL,
	[Dallas2] [float] NULL,
	[Ibutton] [bigint] NULL,
	[Odometer] [int] NULL,
	[addressFId] [int] NULL
)
GO
/****** Object:  StoredProcedure [dbo].[InsertMyDataTable]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertMyDataTable]
  @dt AS dbo.rawDataTable readonly
AS
BEGIN
  SET NOCOUNT ON;

  INSERT into dbo.rawData(imei,codecId,priority,latitude,longitude,altitude,sat,speed,angle,time,Din1,Din2,Din3,Din4,Analog1,Analog2,Analog3,Analog4,GSMSignalStrength,CurrentProfile,GPSSpeed,BatteryVoltage,BatteryCurrent,PcbTemp,FuelCounter,MovementSensor,Dallas0,Dallas1,Dallas2,Ibutton,Odometer) SELECT imei,codecId,priority,latitude,longitude,altitude,sat,speed,angle,time,Din1,Din2,Din3,Din4,Analog1,Analog2,Analog3,Analog4,GSMSignalStrength,CurrentProfile,GPSSpeed,BatteryVoltage,BatteryCurrent,PcbTemp,FuelCounter,MovementSensor,Dallas0,Dallas1,Dallas2,Ibutton,Odometer FROM @dt;
END
GO
/****** Object:  Table [dbo].[rawDataPointer]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rawDataPointer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[imei] [bigint] NOT NULL,
	[time] [datetime] NOT NULL,
	[latitude] [float] NULL,
	[longitude] [float] NULL,
	[altitude] [float] NULL,
	[sat] [int] NULL,
	[speed] [float] NULL,
	[hVersion] [varchar](50) NULL,
	[sVersion] [varchar](50) NULL,
	[pVersion] [varchar](50) NULL,
	[RFID] [varchar](50) NULL,
	[Din1] [varchar](10) NULL,
	[Din2] [varchar](10) NULL,
	[Din3] [varchar](10) NULL,
	[Din4] [varchar](10) NULL,
	[Analog1] [float] NULL,
	[Analog2] [float] NULL,
	[Analog3] [float] NULL,
	[Analog4] [float] NULL,
	[temperature] [float] NULL,
	[mileageCounter] [float] NULL,
	[direction] [float] NULL,
	[mcc] [int] NULL,
	[mnc] [int] NULL,
	[mci] [int] NULL,
	[lac] [int] NULL,
	[lbsLocation] [tinyint] NULL,
	[addressFId] [int] NULL,
 CONSTRAINT [PK_rawDataPointer] PRIMARY KEY CLUSTERED 
(
	[imei] ASC,
	[time] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rawDataCarSky]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rawDataCarSky](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[imei] [bigint] NOT NULL,
	[time] [datetime] NOT NULL,
	[latitude] [float] NULL,
	[longitude] [float] NULL,
	[speed] [float] NULL,
	[angle] [int] NULL,
	[GSMSignalStrength] [int] NULL,
	[CurrentProfile] [int] NULL,
	[GPSSpeed] [float] NULL,
	[BatteryVoltage] [float] NULL,
	[addressFId] [int] NULL,
	[cellId] [bigint] NULL,
	[operatorCode] [bigint] NULL,
	[lac] [float] NULL,
	[mcc] [float] NULL,
	[pdop] [float] NULL,
	[operateCode] [bigint] NULL,
 CONSTRAINT [PK_rawDataCarSky] PRIMARY KEY CLUSTERED 
(
	[imei] ASC,
	[time] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SOSGCMs]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SOSGCMs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GcmId] [nvarchar](950) NULL,
	[CarrierFId] [int] NULL,
	[Imei] [nvarchar](50) NULL,
 CONSTRAINT [PK_SOSGCMs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SOSAlerts]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SOSAlerts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CarrierFId] [int] NULL,
	[Time] [datetime] NULL,
 CONSTRAINT [PK_SOSAlerts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[smtpEmail]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[smtpEmail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[emailID] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[port] [varchar](50) NULL,
	[smtp] [varchar](50) NULL,
	[sp] [varchar](50) NULL,
 CONSTRAINT [PK_smtpEmail] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[oneWeekData]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[oneWeekData](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[carrierFId] [int] NOT NULL,
	[codecId] [int] NULL,
	[time] [datetime] NOT NULL,
	[priority] [int] NULL,
	[latitude] [float] NULL,
	[longitude] [float] NULL,
	[altitude] [float] NULL,
	[sat] [int] NULL,
	[speed] [float] NULL,
	[angle] [int] NULL,
	[Din1] [int] NULL,
	[Din2] [int] NULL,
	[Din3] [int] NULL,
	[Din4] [int] NULL,
	[Analog1] [float] NULL,
	[Analog2] [float] NULL,
	[Analog3] [float] NULL,
	[Analog4] [float] NULL,
	[GSMSignalStrength] [int] NULL,
	[CurrentProfile] [int] NULL,
	[GPSSpeed] [float] NULL,
	[BatteryVoltage] [float] NULL,
	[BatteryCurrent] [float] NULL,
	[PcbTemp] [float] NULL,
	[FuelCounter] [bigint] NULL,
	[MovementSensor] [int] NULL,
	[Dallas0] [float] NULL,
	[Dallas1] [float] NULL,
	[Dallas2] [float] NULL,
	[IButton] [bigint] NULL,
	[Odometer] [int] NULL,
	[addressFId] [int] NULL,
	[lbsLocation] [tinyint] NULL,
 CONSTRAINT [PK_weekDayData] PRIMARY KEY CLUSTERED 
(
	[carrierFId] ASC,
	[time] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PoliceStations]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PoliceStations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Lat] [float] NULL,
	[Lng] [float] NULL,
	[Name] [nvarchar](50) NULL,
	[Mobile] [nvarchar](50) NULL,
 CONSTRAINT [PK_PoliceStations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PoliceNotifications]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PoliceNotifications](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[VehicleFId] [int] NULL,
	[PhotoFront] [nvarchar](50) NULL,
	[PhotoBack] [nvarchar](50) NULL,
	[Time] [datetime] NULL,
 CONSTRAINT [PK_PoliceNotifications] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VehicleStatus]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VehicleStatus](
	[StatusID] [int] NOT NULL,
	[VehicleFID] [int] NULL,
	[Time] [datetime] NULL,
	[IgnitionStatus] [int] NULL,
	[DoorStatus] [int] NULL,
	[AcStatus] [int] NULL,
	[FuelStatus] [int] NULL,
	[RPM] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[loginID] [varchar](50) NOT NULL,
	[UserName] [varchar](50) NULL,
	[LoginPwd] [varchar](50) NOT NULL,
	[Role] [int] NOT NULL,
	[fk_OrgID] [int] NULL,
	[fk_CompanyID] [int] NULL,
	[Phone] [nvarchar](50) NULL,
	[Email] [varchar](160) NULL,
	[Details] [varchar](50) NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[expiresOn] [datetime] NULL,
	[DNNUserId] [int] NULL,
	[CompanyLimit] [int] NULL,
	[Status] [nchar](10) NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_users] ON [dbo].[users] 
(
	[loginID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[userRolesNew]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[userRolesNew](
	[roleId] [int] IDENTITY(1,1) NOT NULL,
	[roleName] [varchar](50) NOT NULL,
	[rolePriority] [int] NULL,
 CONSTRAINT [PK_userRole] PRIMARY KEY CLUSTERED 
(
	[roleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[userRoles]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[userRoles](
	[roleId] [int] IDENTITY(1,1) NOT NULL,
	[roleName] [varchar](50) NOT NULL,
	[rolePriority] [int] NULL,
 CONSTRAINT [PK_userRoles] PRIMARY KEY CLUSTERED 
(
	[roleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserDetails]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserDetails](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserAddr] [nvarchar](255) NULL,
	[UserType] [varchar](50) NULL,
 CONSTRAINT [PK_UserDetails] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[trackType]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[trackType](
	[trackTypeID] [int] IDENTITY(1,1) NOT NULL,
	[trackType] [varchar](50) NULL,
	[description] [varchar](550) NULL,
	[codecID] [int] NULL,
 CONSTRAINT [PK_trackType] PRIMARY KEY CLUSTERED 
(
	[trackTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[trackpoint_in]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[trackpoint_in](
	[UUID] [nvarchar](108) NOT NULL,
	[UNITID] [bigint] NOT NULL,
	[TRACKINGTIME] [datetime] NOT NULL,
	[GPSSTATUS] [nvarchar](1) NOT NULL,
	[LONGITUDE] [float] NOT NULL,
	[LATITUDE] [float] NOT NULL,
	[SPEED] [float] NOT NULL,
	[MILEAGE] [float] NULL,
	[DIRECTION] [float] NOT NULL,
	[ISTATUS] [nvarchar](255) NOT NULL,
	[SSTATUS] [nvarchar](1) NULL,
	[INPUTSTATUS] [nvarchar](60) NULL,
	[TT1] [float] NULL,
	[TT2] [float] NULL,
	[TT3] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[towingOn]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[towingOn](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[carrierFId] [int] NULL,
	[time] [datetime] NULL,
 CONSTRAINT [PK_towingOn] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[towerLocation]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[towerLocation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[mnc] [int] NULL,
	[mcc] [int] NULL,
	[lac] [int] NULL,
	[towerId] [int] NULL,
	[towerLat] [float] NULL,
	[towerlong] [float] NULL,
 CONSTRAINT [PK_towerLocation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[timeZone]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[timeZone](
	[zoneId] [int] IDENTITY(1,1) NOT NULL,
	[zoneOffsetHr] [int] NOT NULL,
	[zoneOffsetMin] [int] NOT NULL,
	[zoneOffsetSign] [int] NOT NULL,
	[zoneName] [varchar](150) NULL,
	[zone] [nvarchar](50) NULL,
 CONSTRAINT [PK_timeZoneOffset] PRIMARY KEY CLUSTERED 
(
	[zoneId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tikerFeed]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tikerFeed](
	[feedID] [int] IDENTITY(1,1) NOT NULL,
	[feed] [nchar](10) NULL,
	[feedTime] [datetime] NULL,
	[feedLat] [float] NULL,
	[feedlong] [float] NULL,
	[carrierFId] [int] NULL,
 CONSTRAINT [PK_tikerFeed] PRIMARY KEY CLUSTERED 
(
	[feedID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServiceProviderDetails]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceProviderDetails](
	[ServicePID] [int] NOT NULL,
	[ServicePName] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sentSms]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sentSms](
	[smsId] [int] IDENTITY(1,1) NOT NULL,
	[message] [varchar](50) NULL,
	[Number] [bigint] NULL,
	[sentTime] [datetime] NULL,
 CONSTRAINT [PK_sentSms] PRIMARY KEY CLUSTERED 
(
	[smsId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[prc_delete_record]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: monali
-- Create date: 12-3-2012
-- Description: deleet rec from any tbl
-- =============================================
--[prc_delete_record] 'tbl_Product_Group','pk_prod_gr',2
CREATE PROCEDURE [dbo].[prc_delete_record]
-- Add the parameters for the stored procedure here
@tbl_name varchar(150),
@key_name varchar(150),
@key_value int
AS
BEGIN
declare @query varchar(max)
set @query = ''
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
SET NOCOUNT ON;

-- Insert statements for procedure here
set @query = 'delete from '+@tbl_name+' where '+@key_name +' = '

exec (@query + @key_value)
END
--select * from tbl_Roll where pk_prod_gr =4;
--delete from tbl_Product_Group where pk_prod=4;
GO
/****** Object:  StoredProcedure [dbo].[prc_camp_search]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[prc_camp_search]
	-- Add the parameters for the stored procedure here
	@campnm varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	 SELECT    tbl_Compaign.pk_CompaignID,  tbl_Compaign.name, tbl_CompainStatus.name , tbl_CompaignType.name , tbl_Compaign.dateEnd, 
                    tbl_TeamMaster.name ,tbl_Users.userName, tbl_Users.isActive
	 FROM         tbl_Compaign INNER JOIN
                      tbl_CompaignType ON tbl_Compaign.fk_comTypeID = tbl_CompaignType.pk_CompaignTypeID Left Outer JOIN
                      tbl_CompainStatus ON tbl_Compaign.fk_comStatusID = tbl_CompainStatus.pk_ComStatus Left Outer JOIN
                      tbl_Users ON tbl_Compaign.fk_userID_AssignTO = tbl_Users.pk_userID Left Outer JOIN
                      tbl_Team on tbl_Team.fk_id= tbl_Compaign.pk_CompaignID   Left Outer JOIN
				      tbl_TeamMaster on tbl_Team.fk_teamID= tbl_TeamMaster.pk_id  
       WHERE     tbl_Compaign.name=@campnm
END
GO
/****** Object:  Table [dbo].[tb_Icons]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Icons](
	[iconId] [int] IDENTITY(1,1) NOT NULL,
	[OrgFid] [int] NULL,
	[Move] [nvarchar](max) NULL,
	[NonMove] [nvarchar](max) NULL,
	[Overspeed] [nvarchar](max) NULL,
	[LBS] [nvarchar](max) NULL,
	[Personal] [nvarchar](max) NULL,
	[Stop] [nvarchar](max) NULL
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[sp_alert_update]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_alert_update]
	-- Add the parameters for the stored procedure here
	@contactNumber bigint,
	@carrierFid int,
	@alertId int,
	@ContactId int,
	@active tinyint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update tb_alertNumbers set 
	contactNumber=@contactNumber,
	carrierFId=@carrierFid,
	alertFId=@alertId,
	active =@active
	
	where contactId =@ContactId
	
END
GO
/****** Object:  StoredProcedure [dbo].[sp_alert_ins]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_alert_ins]
	-- Add the parameters for the stored procedure here
	@ContactNo bigint,
	@CarrierFid int,
	@AlertFid int,
	@Active int
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into tb_alertNumbers values(@ContactNo,@CarrierFid,@AlertFid,@Active)
END
GO
/****** Object:  Table [dbo].[StolenVehicles]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StolenVehicles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StolenVehicle] [nvarchar](50) NULL,
	[OwnerName] [nvarchar](50) NULL,
	[OwnerNumber] [nvarchar](50) NULL,
	[OwnerAddress] [nvarchar](50) NULL,
	[Time] [datetime] NULL,
 CONSTRAINT [PK_StolenVehicles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[spCommonSelectStmt]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spCommonSelectStmt]
@TableName nvarchar(300),
@Condition nvarchar(200)
as
declare @str nvarchar(300)
set @str=''
set @str = @str + ' SELECT * FROM ' + @TableName
if @Condition <> '' 
set @str = @str + ' WHERE ' + @Condition + ' '
exec(@str)
GO
/****** Object:  StoredProcedure [dbo].[sp_Users_select]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Users_select]
@OrgID int=null
	
AS
BEGIN

select * from users  where fk_OrgID =@OrgID
	
END
GO
/****** Object:  StoredProcedure [dbo].[updateGCMIdPolice]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[updateGCMIdPolice]
	@carrierFId	int	,
	@GCMId nvarchar(1050)
	
AS
BEGIN
	insert into GCMPolice( GcmId, CarrierFId) values(@GCMId,@carrierFId);
	
	select 1;
END
GO
/****** Object:  StoredProcedure [dbo].[updateGCMId]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[updateGCMId]
	@carrierId	int	,
	@GCMId nvarchar(1050),
	@imei nvarchar(50)
	
AS
BEGIN
	if((select COUNT(*) from SOSGCMs where imei=@imei)>0)
	begin
		update SOSGCMs set GcmId=@GCMId,CarrierFId=@carrierId where Imei=@imei
	end
	else
	begin	
		insert into SOSGCMs( GcmId, CarrierFId,Imei) values(@GCMId,@carrierId,@imei);
	end
	select 1;
END
GO
/****** Object:  StoredProcedure [dbo].[prc_GPS_User_Update]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		
-- Create date: 
-- Description:	
-- =============================================
--prc_GPS_User_Manage 'pppp','oooo','pola','pp','oo','plo',1,54,3
CREATE PROCEDURE [dbo].[prc_GPS_User_Update]
	-- Add the parameters for the stored procedure here
    @ID int,
	@loginID varchar(50),
	@UserName varchar(50),
	@Email varchar(160),
	@LoginPwd varchar(50),
	@Details varchar(50),
	
	@fk_OrgID int
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
   
		begin
			update users set loginID =@loginID ,UserName =@UserName ,Email =@Email ,LoginPwd =@LoginPwd,
			Details =@Details , fk_OrgID =@fk_OrgID 
			where ID = @ID 
		end
END
GO
/****** Object:  StoredProcedure [dbo].[prc_GPS_User_Manage]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Vijay
-- Create date: 15-11-2011
-- Description:	Login User
-- =============================================
--prc_GPS_User_Manage 'pppp','oooo','pola','pp','oo','plo',1,54,3
CREATE PROCEDURE [dbo].[prc_GPS_User_Manage]
	-- Add the parameters for the stored procedure here
	@ID int,
	@loginID varchar(50),
	@UserName varchar(50),
	@Email varchar(160),
	@LoginPwd varchar(50),
	@Details varchar(50),
	@CreatedBy varchar(50),
	
	@Role int,
	@fk_OrgID int,
	@task int
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    if(@task = 1)
		begin
			insert into users (loginID ,UserName,Email ,LoginPwd ,Details ,CreatedBy ,CreatedOn ,Role,fk_OrgID  )
			values (@loginID ,@UserName ,@Email ,@LoginPwd ,@Details ,@CreatedBy ,SYSDATETIME() ,@Role,@fk_OrgID  )
		End
	else
		begin
			update users set loginID =@loginID ,UserName =@UserName ,Email =@Email ,LoginPwd =@LoginPwd,
			Details =@Details ,CreatedBy =@CreatedBy ,Role =@Role ,fk_OrgID =@fk_OrgID 
			where ID = @ID 
		end
END
GO
/****** Object:  StoredProcedure [dbo].[prc_fetch_Rolls]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Radhika
-- Create date: 15-02-2012
-- Description:	Get Crrier's Basic Attribute,Filter,Last Location and Last Alert Information using IMEI No
-- =============================================
--[Prc_Role_mgnt] 'Admin', 1
CREATE PROCEDURE [dbo].[prc_fetch_Rolls]

-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from userRoles  
END
GO
/****** Object:  StoredProcedure [dbo].[prc_Login_Test]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		virus	
-- Create date: 15-11-2011
-- Description:	Login User
-- =============================================
create PROCEDURE [dbo].[prc_Login_Test]
	-- Add the parameters for the stored procedure here
	@userID varchar(350),
	@passwd varchar(50),
	@task int
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    if(@task = 1)
		begin
			SELECT users.ID , users.loginID, users.UserName, users.Email , users.LoginPwd , users.Details , users.CreatedBy , users.CreatedOn , users.Role
			 ,users.fk_OrgID --, organisation.orgLogo 
     
			FROM  users 
			--inner join organisation on users.fk_OrgID = organisation.orgId 
			where loginID = @userID and LoginPwd  = @passwd 
		End
	else if(@task = 2)
		begin
				SELECT ID,UserName  ,loginID,expiresOn  ,Role  ,fk_OrgID  ,fk_CompanyID     
		 FROM  users where loginID = @userID and LoginPwd  = @passwd 
		End
	else
		begin
			update UserName set LoginPwd = @passwd where userName = @userID
		end
END
GO
/****** Object:  StoredProcedure [dbo].[prc_Rolls_Delete]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Radhika
-- Create date: 15-02-2012
-- Description:	Get Crrier's Basic Attribute,Filter,Last Location and Last Alert Information using IMEI No
-- =============================================
--[Prc_Role_mgnt] 'Admin', 1
CREATE PROCEDURE [dbo].[prc_Rolls_Delete]

-- Add the parameters for the stored procedure here
	@roleID varchar(250)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete from userRoles where roleId=@roleID 
END
GO
/****** Object:  StoredProcedure [dbo].[Prc_Role_mgnt]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Radhika
-- Create date: 19-01-2012
-- Description:	Get Crrier's Basic Attribute,Filter,Last Location and Last Alert Information using IMEI No
-- =============================================
CREATE PROCEDURE [dbo].[Prc_Role_mgnt] 

@roleName varchar(50),
@rolePriority int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;    

  Insert into userRoles (roleName,rolePriority) values (@roleName,@rolePriority)
         
END
GO
/****** Object:  StoredProcedure [dbo].[prc_User_role_update]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Radhika
-- Create date: 15-02-2012
-- Description:	Get Crrier's Basic Attribute,Filter,Last Location and Last Alert Information using IMEI No
-- =============================================
--[Prc_Role_mgnt] 'Admin', 1
CREATE PROCEDURE [dbo].[prc_User_role_update]

-- Add the parameters for the stored procedure here
	@roleid int,
	@userid int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update users set Role=@roleid where ID= @userid
END
GO
/****** Object:  StoredProcedure [dbo].[prc_Alert_Delete]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[prc_Alert_Delete]
@AlertMgmt_ID  int
AS
BEGIN
		Delete from AlertMgmt where AlertMgmt_ID=@AlertMgmt_ID
END
GO
/****** Object:  StoredProcedure [dbo].[prc_carrier_mgmt]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[prc_carrier_mgmt]
	-- Add the parameters for the stored procedure here
@tsk int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    if(@tsk=1)
	SELECT  trackTypeID,trackType from dbo.trackType 
END
GO
/****** Object:  StoredProcedure [dbo].[prc_CompanyFID_mgmt]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[prc_CompanyFID_mgmt]
	-- Add the parameters for the stored procedure here
@tsk int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    if(@tsk=1)
	SELECT companyID,companyName from dbo.Company 
END
GO
/****** Object:  StoredProcedure [dbo].[prc_Company_Search]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:	     Monali
-- Create date:  
-- Description:	 Search Bugs
-- =============================================
CREATE PROCEDURE [dbo].[prc_Company_Search]
    @companyName varchar(50)
   
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	if(@companyName='')
	set @companyName=null
	
	

    -- Insert statements for procedure here
	SELECT * from company
	     
	WHERE  company.companyName like '%'+ISNULL(@companyName,company.companyName )+'%'
	     --C.carrierName like '%'+ISNULL(@carrierName,C.carrierName)+'%'
	
	
END
GO
/****** Object:  StoredProcedure [dbo].[prc_company_management]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Abhijeet>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[prc_company_management] 
-- Add the parameters for the stored procedure here
@companyName nvarchar(255),
@website nvarchar(255),
@email varchar(50),
@contact bigint,
@address varchar(50),
@logo varchar(500),
@task int,
@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
if(@task=1)
     INSERT INTO [mts].[dbo].[Company]([companyName],[companyWebsite],[companyEmail],[companyContact],[companyAddr],[createdOn],[expiryOn],[logo])
     VALUES(@companyName,@website,@email,@contact,@address,SYSDATETIME(),SYSDATETIME(),@logo)

if(@task=2)
     UPDATE [mts].[dbo].[Company]
   SET [companyName] = @companyName
      ,[companyWebsite] = @website
      ,[companyEmail] =@email
      ,[companyContact] = @contact
      ,[companyAddr] = @address
      ,[createdOn] =SYSDATETIME()
      ,[expiryOn] = SYSDATETIME()
      ,[logo] =@logo
 WHERE companyID=@id 
     
     
END
GO
/****** Object:  StoredProcedure [dbo].[prc_CmpNameExist]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[prc_CmpNameExist]
	-- Add the parameters for the stored procedure here
	@companyName varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT companyID,companyName from Company  where companyName =@companyName
END
GO
/****** Object:  StoredProcedure [dbo].[prc_fetch_company_byID]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[prc_fetch_company_byID]
	-- Add the parameters for the stored procedure here
	@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from company where companyID=@id
END
GO
/****** Object:  StoredProcedure [dbo].[prc_fetch_Company]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Monali
-- Create date: 17-03-2012
-- Description:	Get data of Company
-- =============================================
--[Prc_Role_mgnt] 'Admin', 1
CREATE PROCEDURE [dbo].[prc_fetch_Company]

-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from company
END
GO
/****** Object:  StoredProcedure [dbo].[prc_Alert_SelectCarierByID]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[prc_Alert_SelectCarierByID]
@CarrierID int
AS
BEGIN
		Select CarrierID from AlertMgmt where CarrierID=@CarrierID
END
-- prc_Alert_SelectByID 4
GO
/****** Object:  StoredProcedure [dbo].[mts_User_Delete]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[mts_User_Delete]
	-- Add the parameters for the stored procedure here
		
           @userID int,
           @task int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
  
    begin
		if @task=1
		begin	    
			select 1;
		end
		else if @task=2
		begin
			delete from users where ID = @userID
			delete from carrierUsers where userID = @userID		
		end	
		
		
	 end  
           
END
GO
/****** Object:  Table [dbo].[MyTEst]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MyTEst](
	[ID] [int] NULL,
	[Speed] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[mts_Users_update]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		virus
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[mts_Users_update]
	-- Add the parameters for the stored procedure here
	@loginID nvarchar(50),
	@UserName nvarchar (50),
           @Email nvarchar(50),
           @LoginPwd nvarchar(50),
           @Details nvarchar(max),
           @CreatedBy nvarchar(50),
           @expiryon datetime,
           @Role int,
           @fk_OrgID int ,
           @UserId int
          
	
AS
BEGIN
	
   
	begin
		update users set
		
		UserName=@UserName
		   ,Email=@Email
		   ,LoginPwd=@LoginPwd
		   ,Details=@Details,
		   expiresOn=@expiryon
		   where loginID=@loginID
		
	end
	           
           

END
GO
/****** Object:  StoredProcedure [dbo].[mts_Users_ins]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		virus	
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[mts_Users_ins]
	-- Add the parameters for the stored procedure here
		@loginID nvarchar(50),
		@UserName nvarchar (50),
		 @LoginPwd nvarchar(50),
           @Email nvarchar(50),
          
           @Details nvarchar(max),
           @CreatedBy nvarchar(50),
           @CreatedOn datetime,
           @expiresOn datetime,
           @Role int,
           @fk_OrgID int ,
           @fk_CompanyID int
           
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
if @Role=50
begin
	INSERT INTO users(loginID,UserName
           ,Email
           ,LoginPwd
           ,Details
           ,CreatedBy
           ,CreatedOn,
           expiresOn
           ,Role
           ,fk_OrgID
           ,fk_CompanyID)
     VALUES
           (@loginID,
           @UserName,
           @Email,
           @LoginPwd,
           @Details,
           @CreatedBy,
           @CreatedOn,
           @expiresOn
           ,
           @Role,
           @fk_OrgID,
           @fk_CompanyID
           )
           
  SELECT SCOPE_IDENTITY()
end
else
begin
INSERT INTO users(loginID,UserName
           ,Email
           ,LoginPwd
           ,Details
           ,CreatedBy
           ,CreatedOn,
           expiresOn
           ,Role
           ,fk_OrgID
           ,fk_CompanyID)
     VALUES
           (@loginID,
           @UserName,
           @Email,
           @LoginPwd,
           @Details,
           @CreatedBy,
           @CreatedOn,
           @expiresOn
           ,
           @Role,
           @fk_OrgID,
           @fk_CompanyID
           )
           
  
end

END
GO
/****** Object:  StoredProcedure [dbo].[mts_userNormalSelectForEdit]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		virus	
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[mts_userNormalSelectForEdit]	
	@userID int
AS
BEGIN
	
	SET NOCOUNT ON;
  
  
  
  begin
	 select * from users 	
	 where users.ID=@userID;
	 
	 select * from carrierUsers where userID=@userID;
  end


  
  
END
GO
/****** Object:  Table [dbo].[smsAlerts]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[smsAlerts](
	[smsId] [int] IDENTITY(1,1) NOT NULL,
	[alertFid] [int] NOT NULL,
	[alertTime] [datetime] NULL,
	[carrierFid] [int] NULL,
	[lat] [float] NULL,
	[long] [float] NULL,
	[priority] [int] NULL,
	[timeout] [int] NULL,
	[smsType] [int] NULL,
	[fenceName] [varchar](400) NULL,
 CONSTRAINT [PK_smsAlerts] PRIMARY KEY CLUSTERED 
(
	[smsId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0 means other alerts 1 means geofence alerts' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'smsAlerts', @level2type=N'COLUMN',@level2name=N'smsType'
GO
/****** Object:  StoredProcedure [dbo].[sp_Company_ins]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Company_ins]
	-- Add the parameters for the stored procedure here
		   @companyName nvarchar(50),
           @companyWebsite nvarchar(50),
           @companyEmail nvarchar(50),
           @companyContact bigint ,
           @companyAddr nvarchar(250),
           @createdOn date,
           @expiryOn date,
           @logo nvarchar(250),
           @Status varchar(50),
           @OrgLimit int,
           @CarrierLimit int,
           @UsersLimit int,
           @UserID int,
           @Task int,
           @CompId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    if(@Task =1)
    begin
    
	INSERT INTO Company VALUES
           (
           @companyName,
           @companyWebsite,
           @companyEmail,
           @companyContact,
           @companyAddr,
           @createdOn,
           @expiryOn,
           @logo,
           @Status,
           @OrgLimit,
           @CarrierLimit,
           @UsersLimit,
           @UserID
           )
    end
    
    else if(@Task =2)
    
    begin
    
    update Company set 
    
		 companyName =  @companyName,
         companyWebsite = @companyWebsite,
         companyEmail =  @companyEmail,
         companyContact =  @companyContact,
         companyAddr = @companyAddr,
         createdOn = @createdOn,
         expiryOn = @expiryOn,
         logo = @logo,
         Status = @Status,
         OrganisationLimit=@OrgLimit,
         CarrierLimit=@CarrierLimit,
         UsersLimit=@UsersLimit,
         UserID=@UserID 
          
         where companyID = @CompId
    
    end
    
    else
    begin
    
    update Company set 
    
    Status = @Status
          
    where companyID = @CompId
    
    end
    
           
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Company_fetch]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================


CREATE PROCEDURE [dbo].[sp_Company_fetch]
	-- Add the parameters for the stored procedure here
	@companyID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from Company where companyID=@companyID
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Icons_ins]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Icons_ins]
	-- Add the parameters for the stored procedure here
	@orgFid int,
	@move nvarchar(max),
	@nonmove nvarchar(max),
	@overspeed nvarchar(max),
	@lbs nvarchar(max),
	@personal nvarchar(max),
	@stop nvarchar(max)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into tb_Icons values(
	@orgFid,
	@move,
	@nonmove,
	@overspeed,
	@lbs,
	@personal,
	@stop
	)
END
GO
/****** Object:  StoredProcedure [dbo].[prc_Zone_mgmt]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[prc_Zone_mgmt]
	-- Add the parameters for the stored procedure here
@tsk int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    if(@tsk=1)
	SELECT zoneId,zoneName from dbo.timeZone 
END
GO
/****** Object:  StoredProcedure [dbo].[prc_UserNameExist]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[prc_UserNameExist]
	-- Add the parameters for the stored procedure here
	@loginID varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT ID,loginID from users  where loginID = @loginID
END
GO
/****** Object:  StoredProcedure [dbo].[prc_User_Update]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		
-- Create date: 
-- Description:	
-- =============================================
--prc_GPS_User_Manage 'pppp','oooo','pola','pp','oo','plo',1,54,3
CREATE PROCEDURE [dbo].[prc_User_Update]
	-- Add the parameters for the stored procedure here
    @ID int,
	@loginID varchar(50),
	@UserName varchar(50),
	@Email varchar(160),
	@LoginPwd varchar(50),
	@Details varchar(50)

	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
   
		begin
			update users set loginID =@loginID ,UserName =@UserName ,Email =@Email ,LoginPwd =@LoginPwd,
			Details =@Details 
			where ID = @ID 
		end
END
GO
/****** Object:  Table [dbo].[DeviceDetails]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeviceDetails](
	[DeviceID] [int] IDENTITY(1,1) NOT NULL,
	[DeviceIMEI] [bigint] NOT NULL,
	[DeviceSerial] [nvarchar](255) NULL,
	[DeviceName] [nvarchar](255) NULL,
	[userFid] [int] NOT NULL,
 CONSTRAINT [PK_DeviceDetails] PRIMARY KEY CLUSTERED 
(
	[DeviceID] ASC,
	[DeviceIMEI] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[addStolenVehicle]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[addStolenVehicle]
	@vehicleNumber nvarchar(50),
	@Name nvarchar(50),
	@Number nvarchar(50),
	@Address nvarchar(50)
AS
BEGIN
	insert into dbo.StolenVehicles( StolenVehicle, OwnerName, OwnerNumber, OwnerAddress, Time) 
	values(@vehicleNumber,@Name,@Number,@Address,GETDATE());
END
GO
/****** Object:  StoredProcedure [dbo].[Demo_Fetch]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CReate proc [dbo].[Demo_Fetch]
		@trackTypeID int
		
AS
BEGIN  
		DECLARE @TrackType nvarchar(50)
		SET @TrackType = (SELECT trackType  FROM trackType WHERE trackTypeID = @trackTypeID)
		
		IF(@TrackType = 'Bike' or @TrackType = 'Car')
		BEGIN
		SELECT * FROM MTS_Reports
		END
		ELSE
		BEGIN
		SELECT * FROM MTS_Reports WHERE ReportName !='Fuel Monitoring' AND ReportName !='Speed' AND ReportName !='Overspeed' AND ReportName !='Working Hrs'
		END
END
GO
/****** Object:  StoredProcedure [dbo].[get_Alert]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		
-- Create date: <Create Date,,25-07-12>
-- Description:	<Description,,>
-- =============================================
--get_Driver

CREATE procedure [dbo].[get_Alert]

AS

BEGIN

		select * from alerts
END
GO
/****** Object:  Table [dbo].[organisation]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[organisation](
	[orgId] [int] IDENTITY(1,1) NOT NULL,
	[orgName] [varchar](50) NOT NULL,
	[companyFId] [int] NULL,
	[orgContact] [bigint] NULL,
	[orgEmail] [varchar](50) NULL,
	[orgAddr] [varchar](50) NULL,
	[createdOn] [datetime] NULL,
	[expiryOn] [datetime] NOT NULL,
	[logo] [nvarchar](max) NULL,
	[website] [varchar](50) NULL,
	[orgLogo] [varchar](100) NULL,
	[SmsNumberLimits] [int] NULL,
	[carrierLimit] [int] NULL,
	[UserId] [int] NULL,
	[Status] [char](1) NULL,
	[orgLimit] [int] NULL,
 CONSTRAINT [PK_organisation] PRIMARY KEY CLUSTERED 
(
	[orgId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[mts_insert_rawDataPointer]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		virus

-- =============================================



CREATE PROCEDURE [dbo].[mts_insert_rawDataPointer]	
	@imei bigint,
	@time datetime,
	@lat float,
	@lon float,
	@alt float,
	@sat int,
	@speed float,
	@hVersion varchar(50),
	@sVersion varchar(50),
	@versionID varchar(50),	
	@random varchar(50),
	
	@din1 varchar(10),
	@din2 varchar(10),
	@din3 varchar(10),
	@din4 varchar(10),
	
	@analog1 float,
	@analog2 float,
	@analog3 float,
	@analog4 float,
	
	@mileageCounter float,
	@direction float,
	
	
	@mcc int,
	@mnc int,
	@mci int,	
	@lac int,
	
	@lbsLocation tinyint
AS
BEGIN
	insert into rawDataPointer(imei,time,latitude,longitude,sat,altitude,speed,hVersion,sVersion,pVersion,RFID,Din1,Din2,Din3,Din4,Analog1,Analog2,Analog3,Analog4,mileageCounter,direction,mcc,mnc,mci,lac,lbsLocation)
		values(@imei,@time,@lat,@lon,@sat,@alt,@speed,@hVersion,@sVersion,@versionID,@random,@din1,@din2,@din3,@din4,@analog1,@analog2,@analog3,@analog4,@mileageCounter,@direction,@mcc,@mnc,@mci,@lac,@lbsLocation)	
	
END
GO
/****** Object:  StoredProcedure [dbo].[mts_carrierUsers_ins]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		virus
-- =============================================

--[Prc_CarrierLastLoc_Fetch] 2,0
CREATE PROCEDURE [dbo].[mts_carrierUsers_ins] 
@userID int,
@carrier carrierTab  READONLY



AS
BEGIN

DECLARE @temp as TABLE (carrierFID int);
insert into @temp select * from @carrier;
declare @carrierFID int ;

while((select COUNT(*) from @temp)>0)
begin
select top 1 @carrierFID=carrierFId from @temp
insert into carrierUsers(userID,carrierID) values(@userID,@carrierFID)  	
delete from @temp where carrierFID=@carrierFID;  
	
end



    
 
END
GO
/****** Object:  StoredProcedure [dbo].[mts_Company_select]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		virus	
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[mts_Company_select]
	
AS
BEGIN
	
	SET NOCOUNT ON;

  
	select * from Company
 
   
  
  
END
GO
/****** Object:  StoredProcedure [dbo].[mts_Company_ins]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[mts_Company_ins]
	-- Add the parameters for the stored procedure here
		   @companyName nvarchar(50),
           @companyWebsite nvarchar(50),
           @companyEmail nvarchar(50),
           @companyContact bigint ,
           @companyAddr nvarchar(250),
           @createdOn date,
           @expiryOn date,
           @logo nvarchar(250),
           @Status varchar(50),
           @OrgLimit int,
           @CarrierLimit int,
           @UsersLimit int,
           @UserID int,
           @Task int,
           @CompId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    if(@Task =1)
    begin
    
	INSERT INTO Company VALUES
           (
           @companyName,
           @companyWebsite,
           @companyEmail,
           @companyContact,
           @companyAddr,
           @createdOn,
           @expiryOn,
           @logo,
           @Status,
           @OrgLimit,
           @CarrierLimit,
           @UsersLimit,
           @UserID
           )
            SELECT SCOPE_IDENTITY()
    end
   
    else if(@Task =2)
    
    begin
    
    update Company set 
    
		 companyName =  @companyName,
         companyWebsite = @companyWebsite,
         companyEmail =  @companyEmail,
         companyContact =  @companyContact,
         companyAddr = @companyAddr,         
         expiryOn = @expiryOn,
         logo = @logo,
         Status = @Status,
         OrganisationLimit=@OrgLimit,
         CarrierLimit=@CarrierLimit,
         UsersLimit=@UsersLimit,
         UserID=@UserID 
          
         where companyID = @CompId
    select 1;
    end
    
    else
    begin
    
    update Company set 
    
    Status = @Status
          
    where companyID = @CompId
    
    end
    
           
END
GO
/****** Object:  StoredProcedure [dbo].[mts_AlertMgmt_ins_Update]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[mts_AlertMgmt_ins_Update]
	
		   @CarrierID int, 
		   @EmailID nvarchar(250), 
           @MobileNo1 nvarchar(250),      
           @MobileNo2 nvarchar(250), 
           @MobileNo3 nvarchar(250),
           @Task int,
           @AlertMgmt_ID int
          
	
	
AS
BEGIN	
    
    if(@Task =1)
    begin
    
		INSERT INTO AlertMgmt
		 (CarrierID,EmailID,Mobile1,Mobile2,Mobile3)	           
		 VALUES
		 (
		 @CarrierID,@EmailID,@MobileNo1,@MobileNo2,@MobileNo3
		 ) 	 	
	end    
    else if(@Task =2)
    begin
    update AlertMgmt set 
    
           CarrierID =   @CarrierID, 
           EmailID = @EmailID, 
           Mobile1 = @MobileNo1, 
           Mobile2 = @MobileNo2, 
           Mobile3= @MobileNo3
                
           where AlertMgmt_ID =@AlertMgmt_ID
    
    end
    
    
    
	
END
GO
/****** Object:  StoredProcedure [dbo].[MakeTransaction]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[MakeTransaction]
	@VehicleNumber nvarchar(50),
	@Location nvarchar(50)
	
AS
BEGIN
	if((select COUNT(*) from StolenVehicles where StolenVehicle=@VehicleNumber)>0)
	begin
		insert into dbo.DetectedVehicles(VehicleNumber, Time, Location)
		values(@VehicleNumber,GETDATE(),@Location);
		select * from users where Role=100
		select 1;
	end
	else
	begin
		select -1;
	end
END
GO
/****** Object:  StoredProcedure [dbo].[getDetectedVehicles]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getDetectedVehicles]	
AS
BEGIN
	select SV.Id, SV.OwnerName,SV.OwnerAddress,SV.StolenVehicle,
	SV.OwnerNumber, DV.Location,DV.Time
		from DetectedVehicles DV
	inner join dbo.StolenVehicles SV on SV.StolenVehicle=DV.VehicleNumber;	
END
GO
/****** Object:  StoredProcedure [dbo].[getStolenVehicles]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getStolenVehicles]
	
AS
BEGIN
	select * from StolenVehicles order by Id desc;
END
GO
/****** Object:  Table [dbo].[credentials]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[credentials](
	[accountId] [int] IDENTITY(1,1) NOT NULL,
	[uName] [varchar](50) NOT NULL,
	[uPass] [varchar](50) NOT NULL,
	[roleFId] [int] NULL,
	[createdOn] [datetime] NULL,
	[expiryOn] [datetime] NULL,
	[companyFId] [int] NULL,
	[orgFId] [int] NULL,
 CONSTRAINT [PK_credentials] PRIMARY KEY CLUSTERED 
(
	[uName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[mts_Company_AvailCarrierLimit]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		virus	
-- Create date: <Create Date,,>
-- Description:	<Description,,>

---				[dbo].[mts_Company_AvailCarrierLimit] 101
-- =============================================
CREATE PROCEDURE [dbo].[mts_Company_AvailCarrierLimit]
	@companyID int
AS
BEGIN
	
	SET NOCOUNT ON;
	
	declare @CarrierLimit int;
	declare @count int;
	
	
	select @CarrierLimit=company.CarrierLimit from Company where companyID=@companyID;	
	select @count=sum(CarrierLimit) from organisation where companyFId=@companyID and Status='A'		
 
	select ISNULL(@CarrierLimit,0)-ISNULL(@count,0);
   
  
  
END
GO
/****** Object:  StoredProcedure [dbo].[mts_checkOrgLimit]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		virus
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[mts_checkOrgLimit]
	-- Add the parameters for the stored procedure here
	@fk_CompanyID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	declare @count int;
	declare @limit int;
	select @count=count(*) from organisation where companyFId=@fk_CompanyID and Status='A';
	select @limit=OrganisationLimit from Company where companyID=@fk_CompanyID;
	
    if ISNULL(@count,0)<ISNULL(@limit,0)
	begin
      
		select 1;
	
	end
	else
	begin
		select 0;
	end
	
      
END
GO
/****** Object:  StoredProcedure [dbo].[mts_Organisation_ins]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[mts_Organisation_ins]
	-- Add the parameters for the stored procedure here
	
		   @orgName nvarchar(50),
           @orgContact bigint,
           @orgEmail nvarchar(50),
           @orgAddr nvarchar(50),
           @createdOn date,
           @expiryOn date,
           @logo nvarchar(max), 
           @website nvarchar(50), 
           @companyFId int,
           @CarrierLimit int,
           @UID int,
           @Task int,
           @orId int,
           @Status char(1)
          
     
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
if(@Task =1)
begin
    -- Insert statements for procedure here
	INSERT INTO organisation(orgName ,orgContact ,orgEmail ,orgAddr ,createdOn ,expiryOn ,logo ,website ,companyFId,carrierLimit,UserId ,Status)      
     VALUES
           (@orgName,
           @orgContact,
           @orgEmail,
           @orgAddr,
           @createdOn,
           @expiryOn,
           @logo, 
           @website, 
           @companyFId,
           @CarrierLimit,
           @UID,
           @Status
          )
           SELECT SCOPE_IDENTITY()
end

else if(@Task =2)
begin
update organisation set 
		 orgName =   @orgName,
         orgContact =   @orgContact,
         orgEmail =   @orgEmail,
         orgAddr =  @orgAddr,
         createdOn =  @createdOn,
         expiryOn =  @expiryOn,
         logo =  @logo, 
         website =  @website, 
         companyFId =  @companyFId,
         carrierLimit=@CarrierLimit ,
         UserId =  @UID,
         Status=@Status
         
         where orgId =@orId;
         
		select 1;
end
else if(@Task =3)
begin
update organisation set 
		 Status=@Status
         
         where orgId =@orId

end

          
END
GO
/****** Object:  Table [dbo].[carrier]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[carrier](
	[carrierID] [int] IDENTITY(1,1) NOT NULL,
	[carrierName] [varchar](50) NOT NULL,
	[deviceImei] [varchar](150) NOT NULL,
	[carrierTypeFId] [int] NULL,
	[orgFId] [int] NULL,
	[companyFId] [int] NULL,
	[zoneFId] [int] NULL,
	[fleetFid] [int] NULL,
	[gsmNumber] [bigint] NOT NULL,
	[Status] [char](1) NULL,
	[overSpeedThreshold] [float] NULL,
	[din2Logic] [tinyint] NULL,
	[digIgnitionUsed] [tinyint] NULL,
	[VehicleChassisNumber] [varchar](50) NULL,
	[VehicleRunning] [int] NULL,
	[VehicleFuelCapacity] [int] NULL,
	[VehicleAverage] [int] NULL,
	[VehicleTyreCount] [int] NULL,
	[LastServicingDate] [datetime] NULL,
	[LastServicingDetails] [nvarchar](255) NULL,
	[apnName] [varchar](50) NULL,
	[apnUserName] [varchar](50) NULL,
	[apnPassword] [varchar](50) NULL,
	[deviceType] [varchar](50) NULL,
	[simServiceType] [varchar](50) NULL,
	[CalibrationType] [tinyint] NULL,
	[UserId] [int] NULL,
	[Move] [nvarchar](max) NULL,
	[NonMove] [nvarchar](max) NULL,
	[Overspeed] [nvarchar](max) NULL,
	[LBS] [nvarchar](max) NULL,
	[Personal] [nvarchar](max) NULL,
	[Stop] [nvarchar](max) NULL,
	[createdOn] [datetime] NULL,
	[expiresOn] [datetime] NULL,
 CONSTRAINT [PK_VehicleDetails] PRIMARY KEY CLUSTERED 
(
	[carrierID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_carrier] ON [dbo].[carrier] 
(
	[deviceImei] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0 means negative logic 1 means positive logic' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'carrier', @level2type=N'COLUMN',@level2name=N'din2Logic'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1 if Din1 connected else 0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'carrier', @level2type=N'COLUMN',@level2name=N'digIgnitionUsed'
GO
/****** Object:  StoredProcedure [dbo].[SendPoliceNotification]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SendPoliceNotification]
	@Id int
AS
BEGIN
	Declare @lat float;
	Declare @lng float;
	
	SELECT @lat=latitude,@lng=longitude from lastLog 
	where carrierFId=(select VehicleFId from dbo.PoliceNotifications where Id=@id)
	
	select top 1 *  from dbo.PoliceStations 	
	order by dbo.getDistance(@lat,@lng,Lat,Lng) asc ;
	 
	select carrierName,@lat as lat,@lng as lng from carrier 
	where carrierID=(select VehicleFId from dbo.PoliceNotifications where Id=@id)
	
	select * from dbo.PoliceNotifications where Id=@Id;
	
	
END
GO
/****** Object:  StoredProcedure [dbo].[rpt_prc_WorkTimeNew]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		virus
-- =============================================


CREATE PROCEDURE [dbo].[rpt_prc_WorkTimeNew]
	@carrier_id int,
	@dateStart varchar(50), 
	@dateStop varchar(50)
	
AS
BEGIN
	select time,speed,Din1  from mts.dbo.mts where carrierFId=@carrier_id and  time between @dateStart and @dateStop order by time asc;	  
	select digIgnitionUsed from carrier where carrierID=@carrier_id
END
GO
/****** Object:  StoredProcedure [dbo].[rpt_prc_Temp]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
-- rpt_prc_Temp '2012-02-06 00:00:00.000','2012-02-06 23:59:59.000',
CREATE PROCEDURE [dbo].[rpt_prc_Temp]
	-- Add the parameters for the stored procedure here
	@dateStart varchar(50),
	@dateStop varchar(50),
	@vehicle int,
	@spid int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	
	SELECT  ROW_NUMBER() OVER (ORDER BY [Id]) As SrNo,mts.time, /*carrier.carrierName ,*/ mts.Din1 as ignition,  (mts.BatteryVoltage / 1000) as BatteryVoltage, (mts.PcbTemp/ 10 ) as temp
    FROM         mts INNER JOIN
                      carrier ON mts.carrierFId = carrier.carrierID
                      
                      where carrier. carrierID  = @vehicle and mts.time between @dateStart and @dateStop
	

 --   -- Insert statements for procedure here
	--SELECT  ROW_NUMBER() OVER (ORDER BY [Id]) As SrNo,mts.time, /*carrier.carrierName ,*/ mts.Din1 as ignition,  (mts.BatteryVoltage / 1000) as BatteryVoltage, (mts.PcbTemp/ 10 ) as temp
 --   FROM         mts INNER JOIN
 --                     carrier ON mts.carrierFId = carrier.carrierID
                      
 --                     where carrier.carrierName = @vehicle and mts.time between @dateStart and @dateStop
    
    
 
END
GO
/****** Object:  StoredProcedure [dbo].[rpt_prc_KMtravelNew]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

--rpt_prc_KMtravel 1,'2012-01-01 00:00:00.000','2012-01-01 24:56:12.000'
--rpt_prc_KMtravel 9,'2012/02/06 00:00:00','2012/02/06 23:59:59' , 1 --1 day
--rpt_prc_KMtravel 9,'2012-02-01 00:00:00.000','2012-02-06 23:59:59.000' --2 day
--rpt_prc_KMtravel 4,'2012-02-29 00:00:00.000','2012-02-29 14:59:59.000',0 --1 month
create PROCEDURE [dbo].[rpt_prc_KMtravelNew]
	-- Add the parameters for the stored procedure here
	@carrier_id int,
	@dateStart varchar(100),
	@dateStop varchar(100),
	@task int,			--0 for single  vehicle 1 for multiple vehicle
	@carrier carrierTab readonly
	
	
AS
begin
	if @task=0
	begin
		
		 select latitude as lat , longitude as long ,time FROM [mts].[dbo].[mts]where carrierFId=@carrier_id  and mts.time between @dateStart and @dateStop and latitude!=0 order by time asc;
		 select carrier.carrierName from carrier where carrierID=@carrier_id ;
	end
	else if @task=1
	begin
		select latitude as lat , longitude as long ,time FROM [mts].[dbo].[mts]		
		where carrierFId in (select carrierFId from @carrier)  and mts.time between @dateStart and @dateStop and latitude!=0  order by time asc;
		select carrier.carrierName from carrier where carrierID in (select carrierFId from @carrier);
	end
end

--	Declare @trackresult as table
--	(	
--		SrNo int,lat float, long float , speed float , time varchar(100)
--	)
	
--	 insert into @trackresult 
--	 select  ROW_NUMBER() OVER (ORDER BY [Id]) As SrNo, latitude as lat , longitude as long , speed as speed, time as time FROM [mts].[dbo].[mts]
--	 where carrierFId=@carrier_id  and mts.time between @dateStart and @dateStop and latitude!=0 and longitude!=0
	 
--	select * from @trackresult
--end

--else
--begin

--/* vijay 6-2-2012*/

--Declare @cnt as int
--Declare @counter as int

--Declare @temp as table
--(
--SrNo int,lat float, long float 
--)

--Declare @result as table
--(
--SrNo int,lat float, long float 
--)




--	-- SET NOCOUNT ON added to prevent extra result sets from
--	-- interfering with SELECT statements.
--	SET NOCOUNT ON;
			
--    -- adding data to temp table
--    insert into @temp 
--	 select  ROW_NUMBER() OVER (ORDER BY [Id]) As SrNo, latitude as lat , longitude as long FROM [mts].[dbo].[mts]
--	 where carrierFId=@carrier_id  and Din1=1 and latitude>0 and longitude>0 and mts.time between @dateStart and @dateStop
	 
	 
	 
--	 set @cnt=(select COUNT(SrNo)from @temp )
--	 set @counter =1
	 
--	 -- skipping row / adding alternate records
--	 while(@counter<=@cnt)
--	 begin
--		insert into @result 
--		select * from @temp where SrNo=@counter
--		--select ROW_NUMBER() OVER (ORDER BY [SrNo]) As SrNo,lat,long from @temp where SrNo=@counter
--		set @counter= @counter + 2
	 
--	 end
	 
--	 -- reset counters
--	 set @cnt=(select COUNT(SrNo)from @result )
--	 set @counter =1
--	 --empty @temp table to reuse
--	 delete from @temp
--	 -- skipping same lat/long recordings
--	 while(@counter<=@cnt)
--	 begin
--		if((select lat from @result where SrNo = @counter) = (select lat from @result where SrNo = (@counter + 2)))
--		begin
--			set @counter = @counter + 2
--		end
--		else
--		begin 
--			insert into @temp 
--				select * from @result where SrNo = @counter
--			set @counter = @counter + 2
--		end
--	 end
	 
	 
--	 --select COUNT(srNo) as result from @result 
--	 --select COUNT(srNo) as temp from @temp
--	 --select * from @result
--	 select lat , long from @temp 
--end	 
--	 --select * from @result
	 
	
--	 -- select lat , long from @result
--	-- set @counter= @counter + 6
--	--end



--/* vijay 6-2-2012
--Declare @cnt as int
--Declare @counter as int

--Declare @temp as table
--(
--SrNo int,lat float, long float 
--)

--Declare @result as table
--(
--SrNo int,lat float, long float 
--)


--	-- SET NOCOUNT ON added to prevent extra result sets from
--	-- interfering with SELECT statements.
--	SET NOCOUNT ON;
	
--	--set @tot = (select COUNT(*) from [mts].[dbo].[mts]  where carrierFId=1  and Din1=1)
	
--	--while (@counter<=@tot)
--	--Begin
	
--    -- Insert statements for procedure here
--    insert into @temp 
--	 select  ROW_NUMBER() OVER (ORDER BY [Id]) As SrNo, latitude as lat , longitude as long FROM [mts].[dbo].[mts]
--	 where carrierFId=@carrier_id  and Din1=1 and mts.time between @dateStart and @dateStop
	 
--	 set @cnt=(select COUNT(SrNo)from @temp )
--	 set @counter =0
	 
--	 while(@counter<=@cnt)
--	 begin
--		insert into @result 
--		select * from @temp where SrNo=@counter
--		set @counter= @counter + 1
	 
--	 end
	 
--	 select COUNT(srNo) from @temp
--	 select COUNT(srNo) from @result 
--	 select * from @result 
--	-- set @counter= @counter + 6
--	--end
--	*/
GO
/****** Object:  StoredProcedure [dbo].[rpt_prc_KMtravelMultiple]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		virus
-- =============================================

CREATE PROCEDURE [dbo].[rpt_prc_KMtravelMultiple]
	@carrier_id int,
	@dateStart varchar(100),
	@dateStop varchar(100),	
	@carrier carrierTab readonly,
	@fleet fleetTab readonly
	
	
AS
begin
	
		select mts.carrierFId, mts.latitude as lat , longitude as long ,time,carrier.carrierName FROM [mts].[dbo].[mts]		
		inner join carrier on carrier.carrierID=carrierFId
		where (carrierFId in (select carrierFId from @carrier) or carrier.fleetFid in(select fleetFid from @fleet)) and mts.time between @dateStart and @dateStop and latitude!=0 and speed>0 order by carrierFId,time asc  
		
	
end

--	Declare @trackresult as table
--	(	
--		SrNo int,lat float, long float , speed float , time varchar(100)
--	)
	
--	 insert into @trackresult 
--	 select  ROW_NUMBER() OVER (ORDER BY [Id]) As SrNo, latitude as lat , longitude as long , speed as speed, time as time FROM [mts].[dbo].[mts]
--	 where carrierFId=@carrier_id  and mts.time between @dateStart and @dateStop and latitude!=0 and longitude!=0
	 
--	select * from @trackresult
--end

--else
--begin

--/* vijay 6-2-2012*/

--Declare @cnt as int
--Declare @counter as int

--Declare @temp as table
--(
--SrNo int,lat float, long float 
--)

--Declare @result as table
--(
--SrNo int,lat float, long float 
--)




--	-- SET NOCOUNT ON added to prevent extra result sets from
--	-- interfering with SELECT statements.
--	SET NOCOUNT ON;
			
--    -- adding data to temp table
--    insert into @temp 
--	 select  ROW_NUMBER() OVER (ORDER BY [Id]) As SrNo, latitude as lat , longitude as long FROM [mts].[dbo].[mts]
--	 where carrierFId=@carrier_id  and Din1=1 and latitude>0 and longitude>0 and mts.time between @dateStart and @dateStop
	 
	 
	 
--	 set @cnt=(select COUNT(SrNo)from @temp )
--	 set @counter =1
	 
--	 -- skipping row / adding alternate records
--	 while(@counter<=@cnt)
--	 begin
--		insert into @result 
--		select * from @temp where SrNo=@counter
--		--select ROW_NUMBER() OVER (ORDER BY [SrNo]) As SrNo,lat,long from @temp where SrNo=@counter
--		set @counter= @counter + 2
	 
--	 end
	 
--	 -- reset counters
--	 set @cnt=(select COUNT(SrNo)from @result )
--	 set @counter =1
--	 --empty @temp table to reuse
--	 delete from @temp
--	 -- skipping same lat/long recordings
--	 while(@counter<=@cnt)
--	 begin
--		if((select lat from @result where SrNo = @counter) = (select lat from @result where SrNo = (@counter + 2)))
--		begin
--			set @counter = @counter + 2
--		end
--		else
--		begin 
--			insert into @temp 
--				select * from @result where SrNo = @counter
--			set @counter = @counter + 2
--		end
--	 end
	 
	 
--	 --select COUNT(srNo) as result from @result 
--	 --select COUNT(srNo) as temp from @temp
--	 --select * from @result
--	 select lat , long from @temp 
--end	 
--	 --select * from @result
	 
	
--	 -- select lat , long from @result
--	-- set @counter= @counter + 6
--	--end



--/* vijay 6-2-2012
--Declare @cnt as int
--Declare @counter as int

--Declare @temp as table
--(
--SrNo int,lat float, long float 
--)

--Declare @result as table
--(
--SrNo int,lat float, long float 
--)


--	-- SET NOCOUNT ON added to prevent extra result sets from
--	-- interfering with SELECT statements.
--	SET NOCOUNT ON;
	
--	--set @tot = (select COUNT(*) from [mts].[dbo].[mts]  where carrierFId=1  and Din1=1)
	
--	--while (@counter<=@tot)
--	--Begin
	
--    -- Insert statements for procedure here
--    insert into @temp 
--	 select  ROW_NUMBER() OVER (ORDER BY [Id]) As SrNo, latitude as lat , longitude as long FROM [mts].[dbo].[mts]
--	 where carrierFId=@carrier_id  and Din1=1 and mts.time between @dateStart and @dateStop
	 
--	 set @cnt=(select COUNT(SrNo)from @temp )
--	 set @counter =0
	 
--	 while(@counter<=@cnt)
--	 begin
--		insert into @result 
--		select * from @temp where SrNo=@counter
--		set @counter= @counter + 1
	 
--	 end
	 
--	 select COUNT(srNo) from @temp
--	 select COUNT(srNo) from @result 
--	 select * from @result 
--	-- set @counter= @counter + 6
--	--end
--	*/
GO
/****** Object:  StoredProcedure [dbo].[rpt_prc_Fual1]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
-- rpt_prc_Fual 1,'2012-01-24 00:00:00.000','2012-01-24 23:59:59.000',0
CREATE PROCEDURE [dbo].[rpt_prc_Fual1]
	@vehicle int, -- id
	@dateStart varchar(50),
	@dateStop varchar(50),
	@spid tinyint -- 0/1
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets froms
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare @Fuel as int
    -- Insert statements for procedure here
	/****** Script for SelectTopNRows command from SSMS  ******/
	declare @temp table (fual float,speed float,dates datetime) 
	declare @result table (fual float,speed float,dates datetime) 
	declare @count as int,@cnt as int
	 
	 if((select CalibrationType from carrier where carrierID = @vehicle) = 0 )
		 begin
			insert into @temp	
				SELECT    /* carrierFId, (mts.Analog1/1000 ) AS Fuel,*/
												 ( CASE 
														 WHEN (mts.Analog1/1000 ) between	0		and 0.829	THEN	0
														WHEN (mts.Analog1/1000 ) between	0.83	and	1.659	THEN	0.291
														WHEN (mts.Analog1/1000 ) between	1.66	and	2.489	THEN	0.582
														WHEN (mts.Analog1/1000 ) between	2.49	and	3.319	THEN	0.873
														WHEN (mts.Analog1/1000 ) between	3.32	and	4.149	THEN	1.164
														WHEN (mts.Analog1/1000 ) between	4.15	and	4.979	THEN	1.455
														WHEN (mts.Analog1/1000 ) between	4.98	and	5.809	THEN	1.746
														WHEN (mts.Analog1/1000 ) between	5.81	and	6.639	THEN	2.037
														WHEN (mts.Analog1/1000 ) between	6.64	and	7.469	THEN	2.328
														WHEN (mts.Analog1/1000 ) between	7.47	and	8.299	THEN	2.619
														WHEN (mts.Analog1/1000 ) between	8.3		and	9.129	THEN	2.91
														WHEN (mts.Analog1/1000 ) between	9.13	and	9.959	THEN	3.201
														WHEN (mts.Analog1/1000 ) between	9.96	and	10.789	THEN	3.492
														WHEN (mts.Analog1/1000 ) between	10.79	and	11.619	THEN	3.783
														WHEN (mts.Analog1/1000 ) between	11.62	and	12.449	THEN	4.074
														WHEN (mts.Analog1/1000 ) between	12.45	and	13.279	THEN	4.365
														WHEN (mts.Analog1/1000 ) between	13.28	and	14.109	THEN	4.656
														WHEN (mts.Analog1/1000 ) between	14.11	and	14.939	THEN	4.947
														WHEN (mts.Analog1/1000 ) between	14.94	and	15.769	THEN	5.238
														WHEN (mts.Analog1/1000 ) between	15.77	and	16.599	THEN	5.529
														WHEN (mts.Analog1/1000 ) between	16.6	and	17.429	THEN	5.82
														WHEN (mts.Analog1/1000 ) between	17.43	and	18.259	THEN	6.111
														WHEN (mts.Analog1/1000 ) between	18.26	and	19.089	THEN	6.402
														WHEN (mts.Analog1/1000 ) between	19.09	and	19.919	THEN	6.693
														WHEN (mts.Analog1/1000 ) between	19.92	and	20.749	THEN	6.984
														WHEN (mts.Analog1/1000 ) between	20.75	and	21.579	THEN	7.275
														WHEN (mts.Analog1/1000 ) between	21.58	and	22.409	THEN	7.566
														WHEN (mts.Analog1/1000 ) between	22.41	and	23.239	THEN	7.857
														WHEN (mts.Analog1/1000 ) between	23.24	and	24.069	THEN	8.148
														WHEN (mts.Analog1/1000 ) between	24.07	and	24.899	THEN	8.439
														WHEN (mts.Analog1/1000 ) between	24.9	and	25.729	THEN	8.73
														WHEN (mts.Analog1/1000 ) between	25.73	and	26.559	THEN	9.021
														WHEN (mts.Analog1/1000 ) between	26.56	and	27.389	THEN	9.312
														WHEN (mts.Analog1/1000 ) between	27.39	and	28.219	THEN	9.603
														WHEN (mts.Analog1/1000 ) between	28.22	and	29.049	THEN	9.894
														WHEN (mts.Analog1/1000 ) between	29.05	and	29.879	THEN	10.185
														WHEN (mts.Analog1/1000 ) between	29.88	and	30.709	THEN	10.476
														WHEN (mts.Analog1/1000 ) between	30.71	and	31.539	THEN	10.767
														WHEN (mts.Analog1/1000 ) between	31.54	and	32.369	THEN	11.058
														WHEN (mts.Analog1/1000 ) between	32.37	and	33.199	THEN	11.349
														WHEN (mts.Analog1/1000 ) between	33.2	and	34.029	THEN	11.64
														WHEN (mts.Analog1/1000 ) between	34.03	and	34.859	THEN	11.931
														WHEN (mts.Analog1/1000 ) between	34.86	and	35.689	THEN	12.222
														WHEN (mts.Analog1/1000 ) between	35.69	and	36.519	THEN	12.513
														WHEN (mts.Analog1/1000 ) between	36.52	and	37.349	THEN	12.804
														WHEN (mts.Analog1/1000 ) between	37.35	and	38.179	THEN	13.095
														WHEN (mts.Analog1/1000 ) between	38.18	and	39.009	THEN	13.386
														WHEN (mts.Analog1/1000 ) between	39.01	and	39.839	THEN	13.677
														WHEN (mts.Analog1/1000 ) between	39.84	and	40.669	THEN	13.968
														WHEN (mts.Analog1/1000 ) between	40.67	and	41.499	THEN	14.259
														WHEN (mts.Analog1/1000 ) between	41.5	and	42.329	THEN	14.55
														WHEN (mts.Analog1/1000 ) between	42.33	and	43.159	THEN	14.841
														WHEN (mts.Analog1/1000 ) between	43.16	and	43.989	THEN	15.132
														WHEN (mts.Analog1/1000 ) between	43.99	and	44.819	THEN	15.423
														WHEN (mts.Analog1/1000 ) between	44.82	and	45.649	THEN	15.714
														WHEN (mts.Analog1/1000 ) between	45.65	and	46.479	THEN	16.005
														WHEN (mts.Analog1/1000 ) between	46.48	and	47.309	THEN	16.296
														WHEN (mts.Analog1/1000 ) between	47.31	and	48.139	THEN	16.587
														WHEN (mts.Analog1/1000 ) between	48.14	and	48.969	THEN	16.878
														WHEN (mts.Analog1/1000 ) between	48.97	and	49.799	THEN	17.169
														WHEN (mts.Analog1/1000 ) between	49.8	and	50.629	THEN	17.46
														WHEN (mts.Analog1/1000 ) between	50.63	and	51.459	THEN	17.751
														WHEN (mts.Analog1/1000 ) between	51.46	and	52.289	THEN	18.042
														WHEN (mts.Analog1/1000 ) between	52.29	and	53.119	THEN	18.333
														WHEN (mts.Analog1/1000 ) between	53.12	and	53.949	THEN	18.624
														WHEN (mts.Analog1/1000 ) between	53.95	and	54.779	THEN	18.915
														WHEN (mts.Analog1/1000 ) between	54.78	and	55.609	THEN	19.206
														WHEN (mts.Analog1/1000 ) between	55.61	and	56.439	THEN	19.497
														WHEN (mts.Analog1/1000 ) between	56.44	and	57.269	THEN	19.788
														WHEN (mts.Analog1/1000 ) between	57.27	and	58.099	THEN	20.079
														WHEN (mts.Analog1/1000 ) between	58.1	and	58.929	THEN	20.37
														WHEN (mts.Analog1/1000 ) between	58.93	and	59.759	THEN	20.661
														WHEN (mts.Analog1/1000 ) between	59.76	and	60.589	THEN	20.952
														WHEN (mts.Analog1/1000 ) between	60.59	and	61.419	THEN	21.243
														WHEN (mts.Analog1/1000 ) between	61.42	and	62.249	THEN	21.534
														WHEN (mts.Analog1/1000 ) between	62.25	and	63.079	THEN	21.825
														WHEN (mts.Analog1/1000 ) between	63.08	and	63.909	THEN	22.116
														WHEN (mts.Analog1/1000 ) between	63.91	and	64.739	THEN	22.407
														WHEN (mts.Analog1/1000 ) between	64.74	and	65.569	THEN	22.698
														WHEN (mts.Analog1/1000 ) between	65.57	and	66.399	THEN	22.989
														WHEN (mts.Analog1/1000 ) between	66.4	and	67.229	THEN	23.28
														WHEN (mts.Analog1/1000 ) between	67.23	and	68.059	THEN	23.571
														WHEN (mts.Analog1/1000 ) between	68.06	and	68.889	THEN	23.862
														WHEN (mts.Analog1/1000 ) between	68.89	and	69.719	THEN	24.153
														WHEN (mts.Analog1/1000 ) between	69.72	and	70.549	THEN	24.444
														WHEN (mts.Analog1/1000 ) between	70.55	and	71.379	THEN	24.735
														WHEN (mts.Analog1/1000 ) between	71.38	and	72.209	THEN	25.026
														WHEN (mts.Analog1/1000 ) between	72.21	and	73.039	THEN	25.317
														WHEN (mts.Analog1/1000 ) between	73.04	and	73.869	THEN	25.608
														WHEN (mts.Analog1/1000 ) between	73.87	and	74.699	THEN	25.899
														WHEN (mts.Analog1/1000 ) between	74.7	and	75.529	THEN	26.19
														WHEN (mts.Analog1/1000 ) between	75.53	and	76.359	THEN	26.481
														WHEN (mts.Analog1/1000 ) between	76.36	and	77.189	THEN	26.772
														WHEN (mts.Analog1/1000 ) between	77.19	and	78.019	THEN	27.063
														WHEN (mts.Analog1/1000 ) between	78.02	and	78.849	THEN	27.354
														WHEN (mts.Analog1/1000 ) between	78.85	and	79.679	THEN	27.645
														WHEN (mts.Analog1/1000 ) between	79.68	and	80.509	THEN	27.936
														WHEN (mts.Analog1/1000 ) between	80.51	and	81.339	THEN	28.227
														WHEN (mts.Analog1/1000 ) between	81.34	and	82.169	THEN	28.518
														WHEN (mts.Analog1/1000 ) between	82.17	and	82.999	THEN	28.809
														WHEN (mts.Analog1/1000 ) between	83		and	83.829	THEN	29.1
														WHEN (mts.Analog1/1000 ) between	83.83	and	84.659	THEN	29.391
														WHEN (mts.Analog1/1000 ) between	84.66	and	85.489	THEN	29.682
														WHEN (mts.Analog1/1000 ) between	85.49	and	86.319	THEN	29.973
														WHEN (mts.Analog1/1000 ) between	86.32	and	87.149	THEN	30.264
														WHEN (mts.Analog1/1000 ) between	87.15	and	87.979	THEN	30.555
														WHEN (mts.Analog1/1000 ) between	87.98	and	88.809	THEN	30.846
														WHEN (mts.Analog1/1000 ) between	88.81	and	89.639	THEN	31.137
														WHEN (mts.Analog1/1000 ) between	89.64	and	90.469	THEN	31.428
														WHEN (mts.Analog1/1000 ) between	90.47	and	91.299	THEN	31.719
														WHEN (mts.Analog1/1000 ) between	91.3	and	92.129	THEN	32.01
														WHEN (mts.Analog1/1000 ) between	92.13	and	92.959	THEN	32.301
														WHEN (mts.Analog1/1000 ) between	92.96	and	93.789	THEN	32.592
														WHEN (mts.Analog1/1000 ) between	93.79	and	94.619	THEN	32.883
														WHEN (mts.Analog1/1000 ) between	94.62	and	95.449	THEN	33.174
														WHEN (mts.Analog1/1000 ) between	95.45	and	96.279	THEN	33.465
														WHEN (mts.Analog1/1000 ) between	96.28	and	97.109	THEN	33.756
														WHEN (mts.Analog1/1000 ) between	97.11	and	97.939	THEN	34.047
														WHEN (mts.Analog1/1000 ) between	97.94	and	98.769	THEN	34.338
														WHEN (mts.Analog1/1000 ) between	98.77	and	99.599	THEN	34.629
														WHEN (mts.Analog1/1000 ) between	99.6	and	100		THEN	34.92

														 ELSE 9999
													  END) as Fuel	
												, mts.speed, mts.time
					FROM         mts
					where carrierFId = @vehicle and mts.time between @dateStart and @dateStop
		 End
	  else
		 begin
			insert into @temp	
				SELECT    /* carrierFId, (mts.Analog1/1000 ) AS Fuel,*/
												 ( CASE 
														WHEN (mts.Analog1/1000 ) between	0	and 	0.829	THEN	0.291
														WHEN (mts.Analog1/1000 ) between	0.83	and	1.659	THEN	0.582
														WHEN (mts.Analog1/1000 ) between	1.66	and	2.489	THEN	0.873
														WHEN (mts.Analog1/1000 ) between	2.49	and	3.319	THEN	1.164
														WHEN (mts.Analog1/1000 ) between	3.32	and	4.149	THEN	1.455
														WHEN (mts.Analog1/1000 ) between	4.15	and	4.979	THEN	1.746
														WHEN (mts.Analog1/1000 ) between	4.98	and	5.809	THEN	2.037
														WHEN (mts.Analog1/1000 ) between	5.81	and	6.639	THEN	2.328
														WHEN (mts.Analog1/1000 ) between	6.64	and	7.469	THEN	2.619
														WHEN (mts.Analog1/1000 ) between	7.47	and	8.299	THEN	2.91
														WHEN (mts.Analog1/1000 ) between	8.3	and	9.129	THEN	3.201
														WHEN (mts.Analog1/1000 ) between	9.13	and	9.959	THEN	3.492
														WHEN (mts.Analog1/1000 ) between	9.96	and	10.789	THEN	3.783
														WHEN (mts.Analog1/1000 ) between	10.79	and	11.619	THEN	4.074
														WHEN (mts.Analog1/1000 ) between	11.62	and	12.449	THEN	4.365
														WHEN (mts.Analog1/1000 ) between	12.45	and	13.279	THEN	4.656
														WHEN (mts.Analog1/1000 ) between	13.28	and	14.109	THEN	4.947
														WHEN (mts.Analog1/1000 ) between	14.11	and	14.939	THEN	5.238
														WHEN (mts.Analog1/1000 ) between	14.94	and	15.769	THEN	5.529
														WHEN (mts.Analog1/1000 ) between	15.77	and	16.599	THEN	5.82
														WHEN (mts.Analog1/1000 ) between	16.6	and	17.429	THEN	6.111
														WHEN (mts.Analog1/1000 ) between	17.43	and	18.259	THEN	6.402
														WHEN (mts.Analog1/1000 ) between	18.26	and	19.089	THEN	6.693
														WHEN (mts.Analog1/1000 ) between	19.09	and	19.919	THEN	6.984
														WHEN (mts.Analog1/1000 ) between	19.92	and	20.749	THEN	7.275
														WHEN (mts.Analog1/1000 ) between	20.75	and	21.579	THEN	7.566
														WHEN (mts.Analog1/1000 ) between	21.58	and	22.409	THEN	7.857
														WHEN (mts.Analog1/1000 ) between	22.41	and	23.239	THEN	8.148
														WHEN (mts.Analog1/1000 ) between	23.24	and	24.069	THEN	8.439
														WHEN (mts.Analog1/1000 ) between	24.07	and	24.899	THEN	8.73
														WHEN (mts.Analog1/1000 ) between	24.9	and	25.729	THEN	9.021
														WHEN (mts.Analog1/1000 ) between	25.73	and	26.559	THEN	9.312
														WHEN (mts.Analog1/1000 ) between	26.56	and	27.389	THEN	9.603
														WHEN (mts.Analog1/1000 ) between	27.39	and	28.219	THEN	9.894
														WHEN (mts.Analog1/1000 ) between	28.22	and	29.049	THEN	10.185
														WHEN (mts.Analog1/1000 ) between	29.05	and	29.879	THEN	10.476
														WHEN (mts.Analog1/1000 ) between	29.88	and	30.709	THEN	10.767
														WHEN (mts.Analog1/1000 ) between	30.71	and	31.539	THEN	11.058
														WHEN (mts.Analog1/1000 ) between	31.54	and	32.369	THEN	11.349
														WHEN (mts.Analog1/1000 ) between	32.37	and	33.199	THEN	11.64
														WHEN (mts.Analog1/1000 ) between	33.2	and	34.029	THEN	11.931
														WHEN (mts.Analog1/1000 ) between	34.03	and	34.859	THEN	12.222
														WHEN (mts.Analog1/1000 ) between	34.86	and	35.689	THEN	12.513
														WHEN (mts.Analog1/1000 ) between	35.69	and	36.519	THEN	12.804
														WHEN (mts.Analog1/1000 ) between	36.52	and	37.349	THEN	13.095
														WHEN (mts.Analog1/1000 ) between	37.35	and	38.179	THEN	13.386
														WHEN (mts.Analog1/1000 ) between	38.18	and	39.009	THEN	13.677
														WHEN (mts.Analog1/1000 ) between	39.01	and	39.839	THEN	13.968
														WHEN (mts.Analog1/1000 ) between	39.84	and	40.669	THEN	14.259
														WHEN (mts.Analog1/1000 ) between	40.67	and	41.499	THEN	14.55
														WHEN (mts.Analog1/1000 ) between	41.5	and	42.329	THEN	14.841
														WHEN (mts.Analog1/1000 ) between	42.33	and	43.159	THEN	15.132
														WHEN (mts.Analog1/1000 ) between	43.16	and	43.989	THEN	15.423
														WHEN (mts.Analog1/1000 ) between	43.99	and	44.819	THEN	15.714
														WHEN (mts.Analog1/1000 ) between	44.82	and	45.649	THEN	16.005
														WHEN (mts.Analog1/1000 ) between	45.65	and	46.479	THEN	16.296
														WHEN (mts.Analog1/1000 ) between	46.48	and	47.309	THEN	16.587
														WHEN (mts.Analog1/1000 ) between	47.31	and	48.139	THEN	16.878
														WHEN (mts.Analog1/1000 ) between	48.14	and	48.969	THEN	17.169
														WHEN (mts.Analog1/1000 ) between	48.97	and	49.799	THEN	17.46
														WHEN (mts.Analog1/1000 ) between	49.8	and	50.629	THEN	17.751
														WHEN (mts.Analog1/1000 ) between	50.63	and	51.459	THEN	18.042
														WHEN (mts.Analog1/1000 ) between	51.46	and	52.289	THEN	18.333
														WHEN (mts.Analog1/1000 ) between	52.29	and	53.119	THEN	18.624
														WHEN (mts.Analog1/1000 ) between	53.12	and	53.949	THEN	18.915
														WHEN (mts.Analog1/1000 ) between	53.95	and	54.779	THEN	19.206
														WHEN (mts.Analog1/1000 ) between	54.78	and	55.609	THEN	19.497
														WHEN (mts.Analog1/1000 ) between	55.61	and	56.439	THEN	19.788
														WHEN (mts.Analog1/1000 ) between	56.44	and	57.269	THEN	20.079
														WHEN (mts.Analog1/1000 ) between	57.27	and	58.099	THEN	20.37
														WHEN (mts.Analog1/1000 ) between	58.1	and	58.929	THEN	20.661
														WHEN (mts.Analog1/1000 ) between	58.93	and	59.759	THEN	20.952
														WHEN (mts.Analog1/1000 ) between	59.76	and	60.589	THEN	21.243
														WHEN (mts.Analog1/1000 ) between	60.59	and	61.419	THEN	21.534
														WHEN (mts.Analog1/1000 ) between	61.42	and	62.249	THEN	21.825
														WHEN (mts.Analog1/1000 ) between	62.25	and	63.079	THEN	22.116
														WHEN (mts.Analog1/1000 ) between	63.08	and	63.909	THEN	22.407
														WHEN (mts.Analog1/1000 ) between	63.91	and	64.739	THEN	22.698
														WHEN (mts.Analog1/1000 ) between	64.74	and	65.569	THEN	22.989
														WHEN (mts.Analog1/1000 ) between	65.57	and	66.399	THEN	23.28
														WHEN (mts.Analog1/1000 ) between	66.4	and	67.229	THEN	23.571
														WHEN (mts.Analog1/1000 ) between	67.23	and	68.059	THEN	23.862
														WHEN (mts.Analog1/1000 ) between	68.06	and	68.889	THEN	24.153
														WHEN (mts.Analog1/1000 ) between	68.89	and	69.719	THEN	24.444
														WHEN (mts.Analog1/1000 ) between	69.72	and	70.549	THEN	24.735
														WHEN (mts.Analog1/1000 ) between	70.55	and	71.379	THEN	25.026
														WHEN (mts.Analog1/1000 ) between	71.38	and	72.209	THEN	25.317
														WHEN (mts.Analog1/1000 ) between	72.21	and	73.039	THEN	25.608
														WHEN (mts.Analog1/1000 ) between	73.04	and	73.869	THEN	25.899
														WHEN (mts.Analog1/1000 ) between	73.87	and	74.699	THEN	26.19
														WHEN (mts.Analog1/1000 ) between	74.7	and	75.529	THEN	26.481
														WHEN (mts.Analog1/1000 ) between	75.53	and	76.359	THEN	26.772
														WHEN (mts.Analog1/1000 ) between	76.36	and	77.189	THEN	27.063
														WHEN (mts.Analog1/1000 ) between	77.19	and	78.019	THEN	27.354
														WHEN (mts.Analog1/1000 ) between	78.02	and	78.849	THEN	27.645
														WHEN (mts.Analog1/1000 ) between	78.85	and	79.679	THEN	27.936
														WHEN (mts.Analog1/1000 ) between	79.68	and	80.509	THEN	28.227
														WHEN (mts.Analog1/1000 ) between	80.51	and	81.339	THEN	28.518
														WHEN (mts.Analog1/1000 ) between	81.34	and	82.169	THEN	28.809
														WHEN (mts.Analog1/1000 ) between	82.17	and	82.999	THEN	29.1
														WHEN (mts.Analog1/1000 ) between	83	and	83.829	THEN	29.391
														WHEN (mts.Analog1/1000 ) between	83.83	and	84.659	THEN	29.682
														WHEN (mts.Analog1/1000 ) between	84.66	and	85.489	THEN	29.973
														WHEN (mts.Analog1/1000 ) between	85.49	and	86.319	THEN	30.264
														WHEN (mts.Analog1/1000 ) between	86.32	and	87.149	THEN	30.555
														WHEN (mts.Analog1/1000 ) between	87.15	and	87.979	THEN	30.846
														WHEN (mts.Analog1/1000 ) between	87.98	and	88.809	THEN	31.137
														WHEN (mts.Analog1/1000 ) between	88.81	and	89.639	THEN	31.428
														WHEN (mts.Analog1/1000 ) between	89.64	and	90.469	THEN	31.719
														WHEN (mts.Analog1/1000 ) between	90.47	and	91.299	THEN	32.01
														WHEN (mts.Analog1/1000 ) between	91.3	and	92.129	THEN	32.301
														WHEN (mts.Analog1/1000 ) between	92.13	and	92.959	THEN	32.592
														WHEN (mts.Analog1/1000 ) between	92.96	and	93.789	THEN	32.883
														WHEN (mts.Analog1/1000 ) between	93.79	and	94.619	THEN	33.174
														WHEN (mts.Analog1/1000 ) between	94.62	and	95.449	THEN	33.465
														WHEN (mts.Analog1/1000 ) between	95.45	and	96.279	THEN	33.756
														WHEN (mts.Analog1/1000 ) between	96.28	and	97.109	THEN	34.047
														WHEN (mts.Analog1/1000 ) between	97.11	and	97.939	THEN	34.338
														WHEN (mts.Analog1/1000 ) between	97.94	and	98.769	THEN	34.629
														WHEN (mts.Analog1/1000 ) between	98.77	and	99.599	THEN	34.92
														WHEN (mts.Analog1/1000 ) between	99.6	and	100	THEN	35.211

														 ELSE 9999
													  END) as Fuel,mts.speed, mts.time
					FROM mts
					where carrierFId = @vehicle and mts.time between @dateStart and @dateStop
		 
		 end
	  
			set @count = (select COUNT(fual) from @temp)
			set @cnt = 0
			
			--while(@)
			--select * from @temp
			
			if(@spid = 0)
			begin
				insert into @result
					select * from @temp where speed < 1 
			end
			else 
			begin
				insert into @result
					select * from @temp where speed > 1 
			end
			
			select ROW_NUMBER() OVER (ORDER BY [dates]) As SrNo,(select Convert(varchar(20),dates,103))as Date, fual as Fuel, speed as Speed  from @result
END
GO
/****** Object:  StoredProcedure [dbo].[rpt_prc_Fual]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
-- rpt_prc_Fual 631,'2014-10-27 00:00:00.000','2014-11-02 15:35:59.000',0
CREATE PROCEDURE [dbo].[rpt_prc_Fual]
	@vehicle int, -- id
	@dateStart varchar(50),
	@dateStop varchar(50),
	@spid tinyint -- 0/1
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets froms
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare @Fuel as int
    -- Insert statements for procedure here
	/****** Script for SelectTopNRows command from SSMS  ******/
	declare @temp table (fual float,speed float,dates datetime) 
	declare @result table (fual float,speed float,dates datetime) 
	declare @count as int,@cnt as int
	 
	 if((select CalibrationType from carrier where carrierID = @vehicle) = 0 )
		 begin
			insert into @temp	
				SELECT    /* carrierFId, (mts.Analog1/1000 ) AS Fuel,*/
												 ( CASE 
WHEN (mts.Analog1/1000 ) between 	0	and	0.1	THEN	3.34
WHEN (mts.Analog1/1000 ) between 	0.11	and	0.2	THEN	6.68
WHEN (mts.Analog1/1000 ) between 	0.21	and	0.3	THEN	10.02
WHEN (mts.Analog1/1000 ) between 	0.31	and	0.4	THEN	13.36
WHEN (mts.Analog1/1000 ) between 	0.41	and	0.5	THEN	16.7
WHEN (mts.Analog1/1000 ) between 	0.51	and	0.6	THEN	20.04
WHEN (mts.Analog1/1000 ) between 	0.61	and	0.7	THEN	23.38
WHEN (mts.Analog1/1000 ) between 	0.71	and	0.8	THEN	26.72
WHEN (mts.Analog1/1000 ) between 	0.81	and	0.9	THEN	30.06
WHEN (mts.Analog1/1000 ) between 	0.91	and	1	THEN	33.4
WHEN (mts.Analog1/1000 ) between 	1.01	and	1.1	THEN	36.74
WHEN (mts.Analog1/1000 ) between 	1.11	and	1.2	THEN	40.08
WHEN (mts.Analog1/1000 ) between 	1.21	and	1.3	THEN	43.42
WHEN (mts.Analog1/1000 ) between 	1.31	and	1.4	THEN	46.76
WHEN (mts.Analog1/1000 ) between 	1.41	and	1.5	THEN	50.1
WHEN (mts.Analog1/1000 ) between 	1.51	and	1.6	THEN	53.44
WHEN (mts.Analog1/1000 ) between 	1.61	and	1.7	THEN	56.78
WHEN (mts.Analog1/1000 ) between 	1.71	and	1.8	THEN	60.12
WHEN (mts.Analog1/1000 ) between 	1.81	and	1.9	THEN	63.46
WHEN (mts.Analog1/1000 ) between 	1.91	and	2	THEN	66.8
WHEN (mts.Analog1/1000 ) between 	2.01	and	2.1	THEN	70.14
WHEN (mts.Analog1/1000 ) between 	2.11	and	2.2	THEN	73.48
WHEN (mts.Analog1/1000 ) between 	2.21	and	2.3	THEN	76.82
WHEN (mts.Analog1/1000 ) between 	2.31	and	2.4	THEN	80.16
WHEN (mts.Analog1/1000 ) between 	2.41	and	2.5	THEN	83.5
WHEN (mts.Analog1/1000 ) between 	2.51	and	2.6	THEN	86.84
WHEN (mts.Analog1/1000 ) between 	2.61	and	2.7	THEN	90.18
WHEN (mts.Analog1/1000 ) between 	2.71	and	2.8	THEN	93.52
WHEN (mts.Analog1/1000 ) between 	2.81	and	2.9	THEN	96.86
WHEN (mts.Analog1/1000 ) between 	2.91	and	3	THEN	100.2
WHEN (mts.Analog1/1000 ) between 	3.01	and	3.1	THEN	103.54
WHEN (mts.Analog1/1000 ) between 	3.11	and	3.2	THEN	106.88
WHEN (mts.Analog1/1000 ) between 	3.21	and	3.3	THEN	110.22
WHEN (mts.Analog1/1000 ) between 	3.31	and	3.4	THEN	113.56
WHEN (mts.Analog1/1000 ) between 	3.41	and	3.5	THEN	116.9
WHEN (mts.Analog1/1000 ) between 	3.51	and	3.6	THEN	120.24
WHEN (mts.Analog1/1000 ) between 	3.61	and	3.7	THEN	123.58
WHEN (mts.Analog1/1000 ) between 	3.71	and	3.8	THEN	126.92
WHEN (mts.Analog1/1000 ) between 	3.81	and	3.9	THEN	130.26
WHEN (mts.Analog1/1000 ) between 	3.91	and	4	THEN	133.6
WHEN (mts.Analog1/1000 ) between 	4.01	and	4.1	THEN	136.94
WHEN (mts.Analog1/1000 ) between 	4.11	and	4.2	THEN	140.28
WHEN (mts.Analog1/1000 ) between 	4.21	and	4.3	THEN	143.62
WHEN (mts.Analog1/1000 ) between 	4.31	and	4.4	THEN	146.96
WHEN (mts.Analog1/1000 ) between 	4.41	and	4.5	THEN	150.3
WHEN (mts.Analog1/1000 ) between 	4.51	and	4.6	THEN	153.64
WHEN (mts.Analog1/1000 ) between 	4.61	and	4.7	THEN	156.98
WHEN (mts.Analog1/1000 ) between 	4.71	and	4.8	THEN	160.32
WHEN (mts.Analog1/1000 ) between 	4.81	and	4.9	THEN	163.66
WHEN (mts.Analog1/1000 ) between 	4.91	and	5	THEN	167
WHEN (mts.Analog1/1000 ) between 	5.01	and	5.1	THEN	170.34
WHEN (mts.Analog1/1000 ) between 	5.11	and	5.2	THEN	173.68
WHEN (mts.Analog1/1000 ) between 	5.21	and	5.3	THEN	177.02
WHEN (mts.Analog1/1000 ) between 	5.31	and	5.4	THEN	180.36

														 ELSE 0
													  END) as Fuel	
												, mts.speed, mts.time
					FROM         mts
					where carrierFId = @vehicle and mts.time between @dateStart and @dateStop
		 End
	  else
		 begin
			insert into @temp	
				SELECT    /* carrierFId, (mts.Analog1/1000 ) AS Fuel,*/
												 ( CASE 
WHEN (mts.Analog1/1000 ) between 	0	and	0.1	THEN	3.34
WHEN (mts.Analog1/1000 ) between 	0.11	and	0.2	THEN	6.68
WHEN (mts.Analog1/1000 ) between 	0.21	and	0.3	THEN	10.02
WHEN (mts.Analog1/1000 ) between 	0.31	and	0.4	THEN	13.36
WHEN (mts.Analog1/1000 ) between 	0.41	and	0.5	THEN	16.7
WHEN (mts.Analog1/1000 ) between 	0.51	and	0.6	THEN	20.04
WHEN (mts.Analog1/1000 ) between 	0.61	and	0.7	THEN	23.38
WHEN (mts.Analog1/1000 ) between 	0.71	and	0.8	THEN	26.72
WHEN (mts.Analog1/1000 ) between 	0.81	and	0.9	THEN	30.06
WHEN (mts.Analog1/1000 ) between 	0.91	and	1	THEN	33.4
WHEN (mts.Analog1/1000 ) between 	1.01	and	1.1	THEN	36.74
WHEN (mts.Analog1/1000 ) between 	1.11	and	1.2	THEN	40.08
WHEN (mts.Analog1/1000 ) between 	1.21	and	1.3	THEN	43.42
WHEN (mts.Analog1/1000 ) between 	1.31	and	1.4	THEN	46.76
WHEN (mts.Analog1/1000 ) between 	1.41	and	1.5	THEN	50.1
WHEN (mts.Analog1/1000 ) between 	1.51	and	1.6	THEN	53.44
WHEN (mts.Analog1/1000 ) between 	1.61	and	1.7	THEN	56.78
WHEN (mts.Analog1/1000 ) between 	1.71	and	1.8	THEN	60.12
WHEN (mts.Analog1/1000 ) between 	1.81	and	1.9	THEN	63.46
WHEN (mts.Analog1/1000 ) between 	1.91	and	2	THEN	66.8
WHEN (mts.Analog1/1000 ) between 	2.01	and	2.1	THEN	70.14
WHEN (mts.Analog1/1000 ) between 	2.11	and	2.2	THEN	73.48
WHEN (mts.Analog1/1000 ) between 	2.21	and	2.3	THEN	76.82
WHEN (mts.Analog1/1000 ) between 	2.31	and	2.4	THEN	80.16
WHEN (mts.Analog1/1000 ) between 	2.41	and	2.5	THEN	83.5
WHEN (mts.Analog1/1000 ) between 	2.51	and	2.6	THEN	86.84
WHEN (mts.Analog1/1000 ) between 	2.61	and	2.7	THEN	90.18
WHEN (mts.Analog1/1000 ) between 	2.71	and	2.8	THEN	93.52
WHEN (mts.Analog1/1000 ) between 	2.81	and	2.9	THEN	96.86
WHEN (mts.Analog1/1000 ) between 	2.91	and	3	THEN	100.2
WHEN (mts.Analog1/1000 ) between 	3.01	and	3.1	THEN	103.54
WHEN (mts.Analog1/1000 ) between 	3.11	and	3.2	THEN	106.88
WHEN (mts.Analog1/1000 ) between 	3.21	and	3.3	THEN	110.22
WHEN (mts.Analog1/1000 ) between 	3.31	and	3.4	THEN	113.56
WHEN (mts.Analog1/1000 ) between 	3.41	and	3.5	THEN	116.9
WHEN (mts.Analog1/1000 ) between 	3.51	and	3.6	THEN	120.24
WHEN (mts.Analog1/1000 ) between 	3.61	and	3.7	THEN	123.58
WHEN (mts.Analog1/1000 ) between 	3.71	and	3.8	THEN	126.92
WHEN (mts.Analog1/1000 ) between 	3.81	and	3.9	THEN	130.26
WHEN (mts.Analog1/1000 ) between 	3.91	and	4	THEN	133.6
WHEN (mts.Analog1/1000 ) between 	4.01	and	4.1	THEN	136.94
WHEN (mts.Analog1/1000 ) between 	4.11	and	4.2	THEN	140.28
WHEN (mts.Analog1/1000 ) between 	4.21	and	4.3	THEN	143.62
WHEN (mts.Analog1/1000 ) between 	4.31	and	4.4	THEN	146.96
WHEN (mts.Analog1/1000 ) between 	4.41	and	4.5	THEN	150.3
WHEN (mts.Analog1/1000 ) between 	4.51	and	4.6	THEN	153.64
WHEN (mts.Analog1/1000 ) between 	4.61	and	4.7	THEN	156.98
WHEN (mts.Analog1/1000 ) between 	4.71	and	4.8	THEN	160.32
WHEN (mts.Analog1/1000 ) between 	4.81	and	4.9	THEN	163.66
WHEN (mts.Analog1/1000 ) between 	4.91	and	5	THEN	167
WHEN (mts.Analog1/1000 ) between 	5.01	and	5.1	THEN	170.34
WHEN (mts.Analog1/1000 ) between 	5.11	and	5.2	THEN	173.68
WHEN (mts.Analog1/1000 ) between 	5.21	and	5.3	THEN	177.02
WHEN (mts.Analog1/1000 ) between 	5.31	and	5.4	THEN	180.36
														
														 ELSE 0
													  END) as Fuel,mts.speed, mts.time
					FROM mts
					where carrierFId = @vehicle and mts.time between @dateStart and @dateStop
		 
		 end
	  
			set @count = (select COUNT(fual) from @temp)
			set @cnt = 0
			
			--while(@)
			--select * from @temp
			
			if(@spid = 0)
			begin
				insert into @result
					select * from @temp where speed < 1 
			end
			else 
			begin
				insert into @result
					select * from @temp where speed > 1 
			end
			--select * from @temp order by fual
			select ROW_NUMBER() OVER (ORDER BY [dates]) As SrNo,(select Convert(varchar(20),dates,103))as Date, fual as Fuel from @result
END

--, speed as Speed
GO
/****** Object:  StoredProcedure [dbo].[rpt_prc_fleetactivity]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		virus
-- =============================================
CREATE PROCEDURE [dbo].[rpt_prc_fleetactivity] 
@id int,
@startDate datetime,
@endDate datetime,
@carrier carrierTab readonly,
@fleet fleetTab readonly

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;    
	
	if DATEDIFF(DAY,@startDate,@endDate)>1
	begin
		SELECT  mts.carrierFId as CarrierId,carrier.carrierName as CarrierName,mts.time ,speed,mts_geonames.DBO.address.address   
	 from mts INNER JOIN
	 carrier on carrier.carrierID = mts.carrierFId left outer JOIN    
    mts_geonames.dbo.address on mts.addressFId=mts_geonames.dbo.address.Id
    where (carrierFId in (select carrierFId from @carrier) or carrier.fleetFid in(select fleetFid from @fleet)) and  DATEDIFF(day,time,@startDate)=0  order by carrierFId, time asc;
	--WHERE mts.carrierFId=@id  and DATEDIFF(day,time,@startDate)=0 order by time asc;
	end
	else
	begin
		SELECT  mts.carrierFId as CarrierId,carrier.carrierName as CarrierName, mts.time ,speed,mts_geonames.DBO.address.address
		  
		 from mts INNER JOIN
		 carrier on carrier.carrierID = mts.carrierFId left outer JOIN    
    mts_geonames.dbo.address on mts.addressFId=mts_geonames.dbo.address.Id
    where (carrierFId in (select carrierFId from @carrier) or carrier.fleetFid in(select fleetFid from @fleet)) and time between @startDate and @endDate   order by carrierFId,time asc
	--	WHERE mts.carrierFId=@id  and time between @startDate and @endDate order by time asc
	end

END
GO
/****** Object:  StoredProcedure [dbo].[rpt_prc_activity]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		virus
-- =============================================
CREATE PROCEDURE [dbo].[rpt_prc_activity] 
@id int,
@startDate datetime,
@endDate datetime

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;    
	
	if DATEDIFF(DAY,@startDate,@endDate)>1
	begin
		SELECT  mts.carrierFId as CarrierId,carrier.carrierName as CarrierName,mts.time ,speed,mts_geonames.DBO.address.address   
	 from mts INNER JOIN
	 carrier on carrier.carrierID = mts.carrierFId left outer JOIN    
    mts_geonames.dbo.address on mts.addressFId=mts_geonames.dbo.address.Id
	WHERE mts.carrierFId=@id  and DATEDIFF(day,time,@startDate)=0 order by time asc;
	end
	else
	begin
		SELECT  mts.carrierFId as CarrierId,carrier.carrierName as CarrierName, mts.time ,speed,mts_geonames.DBO.address.address
		  
		 from mts INNER JOIN
		 carrier on carrier.carrierID = mts.carrierFId left outer JOIN    
    mts_geonames.dbo.address on mts.addressFId=mts_geonames.dbo.address.Id
		WHERE mts.carrierFId=@id  and time between @startDate and @endDate order by time asc
	end

END
GO
/****** Object:  StoredProcedure [dbo].[rpt_overSpeed]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		virus

-- =============================================

-- rpt_overSpeed 6,'02/23/2014 12:00 AM','02/28/2014 12:00 AM'

CREATE PROCEDURE [dbo].[rpt_overSpeed]
	@carrier_id int,
	@dateStart varchar(50), -- '2012-01-22'  
	@dateStop varchar(50)  
	
	
AS
BEGIN
	declare @overSpeedThershold int;
	select @overSpeedThershold=carrier.overSpeedThreshold  from carrier where carrier.carrierID=@carrier_id
	if @overSpeedThershold=0
	begin
		select @overSpeedThershold=75;
	end
	if(@overSpeedThershold=null)
	begin
		select @overSpeedThershold=75;
	end
	select  mts.time as 'Date & Time',mts.speed, mts_geonames.DBO.address.address as 'Location' from mts.dbo.mts 
	left outer JOIN    	
		 mts_geonames.dbo.address on mts.addressFId=mts_geonames.dbo.address.Id
	where carrierFId=@carrier_id and speed>=@overSpeedThershold and time between @dateStart and @dateStop  
	---------------------------------------------------------------------------------------------------
	--declare @overSpeedThershold int;
	--select @overSpeedThershold=carrier.overSpeedThreshold  from carrier where carrier.carrierID=@carrier_id
	--if @overSpeedThershold=0
	--begin
	--	select @overSpeedThershold=75;
	--end
	--if(@overSpeedThershold=null)
	--begin
	--	select @overSpeedThershold=75;
	--end
	--select  mts.time,mts.speed from mts 	
	--where carrierFId=@carrier_id and speed>=@overSpeedThershold and time between @dateStart and @dateStop 
	
END

-- rpt_overSpeed 391,'2/3/2014','2/8/2014'

--select * from mts
GO
/****** Object:  Table [dbo].[rawDataK10]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rawDataK10](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[imei] [bigint] NOT NULL,
	[time] [datetime] NOT NULL,
	[latitude] [float] NULL,
	[longitude] [float] NULL,
	[speed] [float] NULL,
	[angle] [float] NULL,
	[power] [tinyint] NULL,
	[signal] [tinyint] NULL,
	[receivedAt] [datetime] NULL,
	[gpsAvail] [tinyint] NULL,
 CONSTRAINT [PK_rawDataK10] PRIMARY KEY CLUSTERED 
(
	[imei] ASC,
	[time] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[Prc_LastlogFetch]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Radhika
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

-- [Prc_LastlogFetch] 1
CREATE PROCEDURE [dbo].[Prc_LastlogFetch] 
	-- Add the parameters for the stored procedure here
	
	@task int  -- task 1 for moving vechile  , task 2 for non moving (else part) , 3 for vechile having lat long value 0 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	--SET NOCOUNT ON;

    -- Insert statements for procedure here
    --@task 1 for circular, @task= 0 for square
    
    if(@task=1) --task 1 for moving carrier
    begin
              select carrier.carrierName , lastLog.[time],lastLog.[latitude],lastLog.[longitude],lastLog.[altitude],lastLog.[speed],lastLog.[Din1]
              from lastLog  inner join carrier on carrier.carrierID=lastLog.carrierFId   where lastLog.speed>1 and DATEPART (dd, time) = DATEPART (dd,SYSDATETIME ()) and DATEDIFF(MI ,time , SYSDATETIME ())<10
	end
	if(@task =3)
	begin
	       select carrier.carrierName , lastLog.[time],lastLog.[latitude],lastLog.[longitude],lastLog.[altitude],lastLog.[speed],lastLog.[Din1]
              from lastLog  inner join carrier on carrier.carrierID=lastLog.carrierFId   where lastLog.latitude=0 and longitude=0
	end
	if(@task=2)
	begin
	     select carrier.carrierName , lastLog.[time],lastLog.[latitude],lastLog.[longitude],lastLog.[altitude],lastLog.[speed],lastLog.[Din1]
              from lastLog  inner join carrier on carrier.carrierID=lastLog.carrierFId   where lastLog.speed<1 or DATEPART (dd, time) != DATEPART (dd,SYSDATETIME ()) and DATEDIFF(MI ,time , SYSDATETIME ())>10
	end
	
	
END
GO
/****** Object:  StoredProcedure [dbo].[prc_getKmTravelled]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		virus
-- =============================================
/* 


declare @carrier as carrierTab
insert into @carrier values(231)
insert into @carrier values(6)
insert into @carrier values(7)

exec prc_getKmTravelled  @carrier, '10/2/2012', '10/6/2012',1



*/


CREATE PROCEDURE [dbo].[prc_getKmTravelled]
	@carrierTab carrierTab readonly,
	@startDate date,
	@endDate  date,	
	
	
	@isDateWise int	--1 to get datewise km, 0 for total km for duration given
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets froms
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
			
	declare @cnt as int	
	declare @i as int	
	declare @distance as float
	declare @Lat1 as float
	declare @Long1 as  float
	declare @Lat2  as float
	declare @Long2  as float
	
	DECLARE @TempTable as TABLE (SrNo int,latitude float,longitude float,time Datetime)
	DECLARE @result as TABLE ( distance float,date date)
	declare @nonDateWiseResult as table(carrierName varchar(50),Distance float)
	declare @carrier as carrierTab
	select @cnt=1;
	select @distance=0;
	
	
	if @isDateWise=0
	begin	
		insert into @carrier select * from @carrierTab
		
		while (select COUNT(*) from @carrier)>0
		begin
			delete from @TempTable
			Insert into @TempTable
			select ROW_NUMBER() OVER (ORDER BY time desc) As SrNo, latitude,longitude,time
			from mts 
			where carrierFId=(Select top 1 carrierFId from @carrier) and (time between @startDate and @EndDate) and latitude!=0 and speed>3 and (lbsLocation=0 or lbsLocation is null) order by time desc;
			
			while ((select COUNT(*) from @TempTable) >@cnt )
			begin
				select @Lat1=latitude,@Long1=longitude from @TempTable where SrNo=@cnt
				select @Lat2=latitude,@Long2=longitude from @TempTable where SrNo=(@cnt+1)
				
				select @distance=@distance+[dbo].getkmFun( @Lat1, @Long1, @Lat2, @Long2);			
				select @cnt=@cnt+1;
			end
			insert into @nonDateWiseResult
			select (select carrier.carrierName from carrier where carrierID=(select top 1 carrierFId from @carrier)) as carrierName,(select @distance+(@distance*5/100) as distance) as distance;
			select @distance=0;
			select @cnt=0;
			delete from @carrier where carrierFId=(select top 1 carrierFId from @carrier)
		end
		select * from @nonDateWiseResult			
	end
	else 
	if @isDateWise=1
	begin		
		declare @dateCntr as date
		insert into @carrier select * from @carrierTab
		
		while (select COUNT(*) from @carrier)>0
		begin	
			select @dateCntr=@startDate	
			while @dateCntr<=@EndDate
			begin
				delete from @TempTable;
				Insert into @TempTable
				select ROW_NUMBER() OVER (ORDER BY time desc) As SrNo, latitude,longitude,time
				from mts 
				where carrierFId=(Select top 1 carrierFId from @carrier) and time between @dateCntr and (select DATEADD(day,1,@dateCntr)) and latitude!=0 and speed>3 and (lbsLocation=0 or lbsLocation is null) order by time desc;
				select @cnt=1	
				while ((select COUNT(*) from @TempTable) >=@cnt )
				begin
					select @Lat1=latitude,@Long1=longitude from @TempTable where SrNo=@cnt
					select @Lat2=latitude,@Long2=longitude from @TempTable where SrNo=(@cnt+1)
					select @distance=@distance+[dbo].getkmFun( @Lat1, @Long1, @Lat2, @Long2);			
					select @cnt=@cnt+1;
				end			
				insert into @result select round((@distance*5/100)+@distance,2) as distance,@dateCntr as date;					
				select @distance=0				
				select @dateCntr= DATEADD(day,1,@dateCntr)
			end	
			
			insert into @nonDateWiseResult							
			select (select carrier.carrierName from carrier where carrierID=(select top 1 carrierFId from @carrier)),round((5*SUM(distance)/100)+SUM(distance),2) from @result
			
			select (select carrier.carrierName from carrier where carrierID=(select top 1 carrierFId from @carrier)) as carrierName,round((5*SUM(distance)/100)+SUM(distance),2) from @result as totalDistance
			select * from @result
			
			
			delete from @result
			delete from @TempTable
			delete from @carrier where carrierFId=(select top 1 carrierFId from @carrier)
		end	
		select * from @nonDateWiseResult;
	end
END
GO
/****** Object:  StoredProcedure [dbo].[Prc_CarrierLastLoc_FetchByString]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		virus
-- Create date: 19-01-2012
-- Description:	Get Crrier's Basic Attribute,Filter,Last Location and Last Alert Information using IMEI No
-- =============================================

--[Prc_CarrierLastLoc_Fetch] 2,0
CREATE PROCEDURE [dbo].[Prc_CarrierLastLoc_FetchByString] 

@role varchar(1000)


AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	-- task 0 for user login and task =1 for admin

	
	SELECT lastLog.carrierFID 
    from lastLog
    INNER JOIN
    carrier on carrier.carrierID = lastLog.carrierFId  
    where carrier.FleetFId in (select SplitText
from dbo.fnSplit(@role,','))   
   
    
         
END
GO
/****** Object:  StoredProcedure [dbo].[Prc_CarrierLastLoc_FetchBY_CarrierID]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Radhika
-- Create date: 19-01-2012
-- Description:	Get Crrier's Basic Attribute,Filter,Last Location and Last Alert Information using IMEI No
-- =============================================
CREATE PROCEDURE [dbo].[Prc_CarrierLastLoc_FetchBY_CarrierID] 
@id int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;    
	
	
	SELECT  lastLog.carrierFId as CarrierId,carrier.carrierName as CarrierName,codecId,lbsLocation, carrier.orgFId as OrgId,
 lastLog.latitude ,lastLog.longitude ,lastLog.time , lastLog.Din1 , lastLog.speed, organisation.orgName, lastLog.sat,
 lastLog.BatteryVoltage,lastlog.PcbTemp ,lastLog.Din2,mts_geonames.DBO.address.address
 
 from lastLog INNER JOIN
 carrier on carrier.carrierID = lastLog.carrierFId INNER JOIN
 organisation on carrier.orgFId = organisation.orgId left outer join
 mts_geonames.dbo.address on lastLog.addressFId=mts_geonames.dbo.address.Id
WHERE lastLog.carrierFId=@id

    --SELECT CarrierLastLoc.AccountId,CarrierLastLoc.CarrierId,CarrierLastLoc.CarrierName,CarrierLastLoc.OrgId,CarrierLastLoc.DeviceType,
    --CarrierLastLoc.GofenceInsideList,CarrierLastLoc.Invalid_logs_count,CarrierLastLoc.IMEI,CarrierLastLoc.IsGpsAvailable,CarrierLastLoc.IsPanicAcknowledged,
    --CarrierLastLoc.IsPanicAcknowledged,CarrierLastLoc.LastDateTime,CarrierLastLoc.LastEmailAlertDateTime,CarrierLastLoc.lastLat,
    --CarrierLastLoc.LastLocDateTime,CarrierLastLoc.LastLocLatVal,CarrierLastLoc.LastLocLongVal,CarrierLastLoc.LastLocSpeed,CarrierLastLoc.lastLong,
    --CarrierLastLoc.LastLocLatVal,CarrierLastLoc.LastLocLongVal,CarrierLastLoc.LogReceivedServerTime,CarrierLastLoc.Speed,
    --CarrierLastLoc.OfflineLogDataLength,CarrierLastLoc.Speed,accounts.AccountName,organisation.OrgName,trackInfo.DI1 , trackInfo.DI2,trackInfo.DI3 ,
    --trackInfo.DI4,trackInfo.A1 ,trackInfo.A2,CarrierLastLoc.LastLowBatteryLatVal,CarrierLastLoc.LastOverSpeedLatVal,trackInfo.IsBatteryLow,trackInfo.IsOverSpeeding
    --From CarrierLastLoc INNER JOIN
    --     accounts on CarrierLastLoc.AccountId = accounts.AccountID INNER JOIN
    --     organisation on CarrierLastLoc.OrgId = organisation.OrgID  INNER JOIN
    --     trackInfo on trackInfo.CarrierId= CarrierLastLoc.CarrierId 
         
    -- WHERE CarrierLastLoc.CarrierId=@id
END
GO
/****** Object:  StoredProcedure [dbo].[Prc_CarrierLastLoc_Fetch_Grid]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		virus
-- =============================================

--[Prc_CarrierLastLoc_Fetch] 2,0
CREATE PROCEDURE [dbo].[Prc_CarrierLastLoc_Fetch_Grid] 

@role varchar(1000)


AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	-- task 0 for user login and task =1 for admin

	
	SELECT lastLog.carrierFId as CarrierId,carrier.carrierName as CarrierName, carrier.carrierTypeFId, carrier.orgFId as OrgId, time,
    lastLog.latitude ,lastLog.longitude , lastLog.Din1,carrier.carrierTypeFId ,lastLog.Din2,PcbTemp,sat, lastLog.speed, lastLog.BatteryVoltage,mts_geonames.DBO.address.address
 
    from lastLog  INNER JOIN
    carrier on carrier.carrierID = lastLog.carrierFId left outer JOIN    
    mts_geonames.dbo.address on lastLog.addressFId=mts_geonames.dbo.address.Id
    where carrierFId in (select SplitText
from dbo.fnSplit(@role,','))   
   
    
         
END
GO
/****** Object:  StoredProcedure [dbo].[Prc_CarrierCount]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Radhika
-- Create date: 19-01-2012
-- Description:	Get Crrier's Basic Attribute,Filter,Last Location and Last Alert Information using IMEI No
-- =============================================
CREATE PROCEDURE [dbo].[Prc_CarrierCount] 

@role int,
@task int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;    

if(@task=0)
 begin
  select  carrierFId From  lastLog INNER JOIN
    carrier on carrier.carrierID = lastLog.carrierFId INNER JOIN
    organisation on carrier.orgFId = organisation.orgId 
     where carrier.orgFId= @role
  end
  else
  begin
  select carrierFId From lastLog  
  end
         
END
GO
/****** Object:  StoredProcedure [dbo].[mts_rpt_prc_TrackcarrierGPSLBSReplay]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		virus
-- =============================================


create PROCEDURE [dbo].[mts_rpt_prc_TrackcarrierGPSLBSReplay]
	-- Add the parameters for the stored procedure here
	@carrier_id int,
	@dateStart datetime,
	@dateStop datetime
	
	
AS
BEGIN

	select latitude,longitude,speed,time,angle,Din1,Din2,lbsLocation
	,address.address
	from mts 
	left outer join mts_geonames.dbo.address on mts_geonames.dbo.address.Id=mts.addressFId
	
	where carrierFId=@carrier_id and latitude!=0  and time between @dateStart and @dateStop order by time asc;
	select carrier.overSpeedThreshold as maxSpeed ,carrierTypeFId from carrier where carrierID=@carrier_id;



	----Select latitude as lat,longitude as long, time, speed from mts where time between @dateStart and @dateStop and carrierFId=@carrier_id order by time asc
	--select latitude,longitude,speed,time,angle from mts where carrierFId=@carrier_id and latitude!=0 and (lbsLocation=0 or lbsLocation is null) and time between @dateStart and @dateStop order by time asc;
	--select carrier.overSpeedThreshold as maxSpeed,carrierTypeFId from carrier where carrierID=@carrier_id;
	
	--select latitude,longitude,speed,angle,time from mts where carrierFId=@carrier_id and latitude!=0 and lbsLocation=1 and time>= @dateStart and time<=@dateStop order by time asc;
	
END
GO
/****** Object:  StoredProcedure [dbo].[mts_rpt_prc_TrackcarrierGPSLBS]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		virus
-- =============================================



CREATE PROCEDURE [dbo].[mts_rpt_prc_TrackcarrierGPSLBS]
	-- Add the parameters for the stored procedure here
	@carrier_id int,
	@dateStart datetime,
	@dateStop datetime
	
	
AS
BEGIN


	--Select latitude as lat,longitude as long, time, speed from mts where time between @dateStart and @dateStop and carrierFId=@carrier_id order by time asc
	select latitude,longitude,speed,time,angle from mts where carrierFId=@carrier_id and latitude!=0 and (lbsLocation=0 or lbsLocation is null) and time between @dateStart and @dateStop order by time asc;
	select carrier.overSpeedThreshold as maxSpeed,carrierTypeFId from carrier where carrierID=@carrier_id;
	
	select latitude,longitude,speed,angle,time from mts where carrierFId=@carrier_id and latitude!=0 and lbsLocation=1 and time>= @dateStart and time<=@dateStop order by time asc;
	
END
GO
/****** Object:  StoredProcedure [dbo].[mts_rpt_prc_Trackcarrier]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		virus
-- =============================================



CREATE PROCEDURE [dbo].[mts_rpt_prc_Trackcarrier]
	-- Add the parameters for the stored procedure here
	@carrier_id int,
	@dateStart varchar(100),
	@dateStop varchar(100)
	
	
AS
BEGIN


	--Select latitude as lat,longitude as long, time, speed from mts where time between @dateStart and @dateStop and carrierFId=@carrier_id order by time asc
	select latitude,longitude,speed,time,angle from mts where carrierFId=@carrier_id and latitude!=0 and (lbsLocation=0 or lbsLocation is null) and time between @dateStart and @dateStop order by time asc;
	select carrier.overSpeedThreshold as maxSpeed,carrierTypeFId from carrier where carrierID=@carrier_id;

END
GO
/****** Object:  StoredProcedure [dbo].[mts_rpt_prc_ReplayOnMap]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		virus
-- =============================================
/*




[dbo].[mts_rpt_prc_ReplayOnMap] 358,"2013-01-24",'2013-01-25'





*/

CREATE PROCEDURE [dbo].[mts_rpt_prc_ReplayOnMap]
	-- Add the parameters for the stored procedure here
	@carrier_id int,
	@dateStart varchar(100),
	@dateStop varchar(100)
	
	
AS
BEGIN
	
	select latitude,longitude,speed,time,angle,Din1,Din2,lbsLocation
	,address.address
	from mts 
	left outer join mts_geonames.dbo.address on mts_geonames.dbo.address.Id=mts.addressFId
	
	where carrierFId=@carrier_id and latitude!=0 and (lbsLocation=0 or lbsLocation is null) and time between @dateStart and @dateStop order by time asc;
	select carrier.overSpeedThreshold as maxSpeed ,carrierTypeFId from carrier where carrierID=@carrier_id;

END
GO
/****** Object:  StoredProcedure [dbo].[getDetailsForSos]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getDetailsForSos]
	@carrierId int,
	@frontPhoto nvarchar(50),
	@backPhoto nvarchar(50)
AS
BEGIN
	
	insert into dbo.PoliceNotifications(VehicleFId, PhotoFront, PhotoBack, Time)	
	values(@carrierId,@frontPhoto,@backPhoto,GETDATE());
	
	select * from carrier where carrierID=@carrierId;
	select * from lastLog where carrierFId=@carrierId;
	
	
	
END
GO
/****** Object:  StoredProcedure [dbo].[fn_CarrierMtsLoc_FetchBY_CarrierID]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		virus
-- =============================================
create PROCEDURE [dbo].[fn_CarrierMtsLoc_FetchBY_CarrierID] 
@id int,
@time datetime

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;    
	
	
	SELECT  mts.carrierFId as CarrierId,carrier.carrierName as CarrierName, carrier.orgFId as OrgId,
 mts.latitude ,mts.longitude ,mts.time , mts.Din1 , mts.speed, mts.sat,
 mts.BatteryVoltage,mts.PcbTemp ,mts.Din2
 
 from mts INNER JOIN
 carrier on carrier.carrierID = mts.carrierFId 
WHERE mts.carrierFId=@id  and mts.time>= @time
END
GO
/****** Object:  Table [dbo].[fleet]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[fleet](
	[fleetID] [int] IDENTITY(1,1) NOT NULL,
	[fleetName] [varchar](100) NOT NULL,
	[orgFId] [int] NOT NULL,
	[description] [varchar](150) NULL,
	[fleetArea] [varchar](100) NULL,
 CONSTRAINT [PK_fleet] PRIMARY KEY CLUSTERED 
(
	[fleetName] ASC,
	[orgFId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[Prc_FetchCarrierFleetLastLoc]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		virus
-- =============================================

--[Prc_CarrierLastLoc_Fetch] 2,0
CREATE PROCEDURE [dbo].[Prc_FetchCarrierFleetLastLoc] 

@carrier carrierTab  READONLY,
@fleet fleetTab READONLY


AS
BEGIN
	   
    
 
   SELECT  lastLog.carrierFId as CarrierId,carrier.carrierTypeFId,carrier.carrierName as CarrierName,carrier.Move,carrier.NonMove,carrier.Overspeed,carrier.LBS ,carrier .Personal,carrier .Stop,codecId,lbsLocation,
 lastLog.latitude ,lastLog.longitude ,lastLog.time , lastLog.Din1 , lastLog.speed, lastLog.sat,lastLog.angle,
 lastLog.BatteryVoltage,lastlog.PcbTemp,lastlog.FuelCounter,Odometer ,lastLog.Din2,lastLog.Din3, mts_geonames.DBO.address.address
 
 from lastLog INNER JOIN
 carrier on carrier.carrierID = lastLog.carrierFId  left outer join
 mts_geonames.dbo.address on lastLog.addressFId=mts_geonames.dbo.address.Id
WHERE lastLog.carrierFId in (select carrierFId from @carrier) ;
        
        
 
SELECT  lastLog.carrierFId as CarrierId,carrier.carrierTypeFId,carrier.carrierName as CarrierName,carrier.Move,carrier.NonMove,carrier.Overspeed,carrier.LBS ,carrier .Personal,carrier .Stop,codecId,lbsLocation,
 lastLog.latitude ,lastLog.longitude ,lastLog.time , lastLog.Din1 , lastLog.speed, lastLog.sat,lastLog.angle,
 lastLog.BatteryVoltage,lastlog.PcbTemp ,lastlog.FuelCounter,Odometer ,lastLog.Din2,lastLog.Din3,mts_geonames.DBO.address.address
 
 from lastLog INNER JOIN
 carrier on carrier.carrierID = lastLog.carrierFId INNER JOIN
 fleet on fleet.fleetID = carrier.fleetFid left outer join
 mts_geonames.dbo.address on lastLog.addressFId=mts_geonames.dbo.address.Id
WHERE fleet.fleetID in (select fleetFid from @fleet)
         
END
GO
/****** Object:  StoredProcedure [dbo].[Prc_CarrierLastLoc_Fetch_Test]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		virus
-- Description:	Get Crrier's Basic Attribute,Filter,Last Location and Last Alert Information using IMEI No
-- =============================================

--[Prc_CarrierLastLoc_Fetch] 2,0
create PROCEDURE [dbo].[Prc_CarrierLastLoc_Fetch_Test] 
@role int,
@task int,
@orgId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	-- task 0 for user login and task =1 for admin
	
	if(@task=0)
	Begin
		SELECT lastLog.carrierFId as CarrierId,carrier.carrierName as CarrierName, carrier.carrierTypeFId, carrier.orgFId as OrgId, time,
		lastLog.latitude ,lastLog.longitude ,lastLog.time , lastLog.Din1 , lastLog.speed, organisation.orgName 
	 
		from lastLog INNER JOIN
		carrier on carrier.carrierID = lastLog.carrierFId INNER JOIN
		organisation on carrier.orgFId = organisation.orgId
				where carrier.orgFId= @role
					
		
		SELECT fleet.fleetID, fleet.fleetName from fleet    
		where fleet.orgFId= @role
    End
    
    else
    
    begin
		SELECT  lastLog.carrierFId as CarrierId,carrier.carrierName as CarrierName,carrier.carrierTypeFId, carrier.orgFId as OrgId,time,
		lastLog.latitude ,lastLog.longitude ,lastLog.time , lastLog.Din1 , lastLog.speed, organisation.orgName 
	 
		from lastLog INNER JOIN
		carrier on carrier.carrierID = lastLog.carrierFId INNER JOIN
		organisation on carrier.orgFId = organisation.orgId 
		
		SELECT fleet.fleetID, fleet.fleetName from fleet 
    End   
END
GO
/****** Object:  StoredProcedure [dbo].[Prc_CarrierLastLoc_Fetch]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		virus
-- Description:	Get Crrier's Basic Attribute,Filter,Last Location and Last Alert Information using IMEI No
-- =============================================

--[Prc_CarrierLastLoc_Fetch] 2,0
CREATE PROCEDURE [dbo].[Prc_CarrierLastLoc_Fetch] 

@role int,
@task int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	-- task 0 for user login and task =1 for admin
	
	if(@task=0)
	Begin
		SELECT lastLog.carrierFId as CarrierId,carrier.carrierName as CarrierName, carrier.carrierTypeFId, carrier.orgFId as OrgId, time,
		lastLog.latitude ,lastLog.longitude ,lastLog.time , lastLog.Din1 , lastLog.speed, organisation.orgName 
	 
		from lastLog INNER JOIN
		carrier on carrier.carrierID = lastLog.carrierFId INNER JOIN
		organisation on carrier.orgFId = organisation.orgId 
	    
		where carrier.orgFId= @role
		
		
		SELECT fleet.fleetID, fleet.fleetName from fleet    
		where fleet.orgFId= @role
    End
    
    else
    
    begin
		SELECT  lastLog.carrierFId as CarrierId,carrier.carrierName as CarrierName,carrier.carrierTypeFId, carrier.orgFId as OrgId,time,
		lastLog.latitude ,lastLog.longitude ,lastLog.time , lastLog.Din1 , lastLog.speed, organisation.orgName 
	 
		from lastLog INNER JOIN
		carrier on carrier.carrierID = lastLog.carrierFId INNER JOIN
		organisation on carrier.orgFId = organisation.orgId 
		
		SELECT fleet.fleetID, fleet.fleetName from fleet 
    End   
END
GO
/****** Object:  StoredProcedure [dbo].[mts_CarrierLastLoc_Fetch]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		virus
-- Description:	Get Crrier's Basic Attribute,Filter,Last Location and Last Alert Information using IMEI No
-- =============================================

--[Prc_CarrierLastLoc_Fetch] 2,0
CREATE PROCEDURE [dbo].[mts_CarrierLastLoc_Fetch] 

@role int,
@compID int,
@orgID int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	-- task 0 for user login and task =1 for admin
	
	if(@role=1)
	Begin
		SELECT lastLog.carrierFId as CarrierId,carrier.carrierName as CarrierName, carrier.carrierTypeFId, carrier.orgFId as OrgId, time,gsmNumber,
		lastLog.latitude ,lastLog.longitude ,lastLog.time , lastLog.Din1 , lastLog.speed, organisation.orgName 
	 
		from lastLog INNER JOIN
		carrier on carrier.carrierID = lastLog.carrierFId INNER JOIN
		organisation on carrier.orgFId = organisation.orgId  
		
		SELECT fleet.fleetID, fleet.fleetName from fleet   
		
		
		 
		
    End
    
    else if(@role=10)
    
    begin
		SELECT  lastLog.carrierFId as CarrierId,carrier.carrierName as CarrierName,carrier.carrierTypeFId, carrier.orgFId as OrgId,time,
		lastLog.latitude ,lastLog.longitude ,lastLog.time , lastLog.Din1 , lastLog.speed, organisation.orgName 
	 
		from lastLog INNER JOIN
		carrier on carrier.carrierID = lastLog.carrierFId INNER JOIN
		organisation on carrier.orgFId = organisation.orgId 
		where carrier.companyFId=@compID
		
		SELECT fleet.fleetID, fleet.fleetName from fleet 
		where fleet.orgFId in(select orgId from organisation where companyFId=@compID);
    End   
    else if(@role=50)   
    begin    
		SELECT  lastLog.carrierFId as CarrierId,carrier.carrierName as CarrierName,carrier.carrierTypeFId, carrier.orgFId as OrgId,time,
		lastLog.latitude ,lastLog.longitude ,lastLog.time , lastLog.Din1 , lastLog.speed
	 
		from lastLog INNER JOIN
		carrier on carrier.carrierID = lastLog.carrierFId INNER JOIN
		carrierUsers on carrierUsers.carrierID=lastLog.carrierFId
		where carrierUsers.userID=@compID
		
		SELECT fleet.fleetID, fleet.fleetName from fleet 
		where fleet.orgFId=@orgID;
    end
    else
     
    begin
		SELECT  lastLog.carrierFId as CarrierId,carrier.carrierName as CarrierName,carrier.carrierTypeFId, carrier.orgFId as OrgId,time,
		lastLog.latitude ,lastLog.longitude ,lastLog.time , lastLog.Din1 , lastLog.speed, organisation.orgName 
	 
		from lastLog INNER JOIN
		carrier on carrier.carrierID = lastLog.carrierFId INNER JOIN
		organisation on carrier.orgFId = organisation.orgId 
		where carrier.orgFId=@orgID
		
		SELECT fleet.fleetID, fleet.fleetName from fleet 
		where fleet.orgFId=@orgID;
    End  
END
GO
/****** Object:  StoredProcedure [dbo].[prc_User_Search]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:	     Monali
-- Create date: 
-- Description:	 Search Bugs
-- =============================================
CREATE PROCEDURE [dbo].[prc_User_Search]
    @UserName varchar(50)
   
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	if(@UserName='')
	set @UserName=null
	
	

    -- Insert statements for procedure here
	select users.ID,
 users.loginID ,
 users.UserName,
 users.LoginPwd ,
 users.Details ,
 users.CreatedBy,
 users.Email,
 users.fk_OrgID,
 users.Role,
  
 userRoles.roleName,
 organisation.orgName  
 from users left outer join  userRoles on userRoles.roleId=users.Role
	left outer join organisation on organisation.orgId  = users.fk_OrgID
	    WHERE  users.UserName like '%'+ISNULL(@UserName,users.UserName )+'%'
	--WHERE ISNULL(@UserName,users.UserName )= users.UserName
	     --tbl_Accounts.acName like '%'+ISNULL(@accountName,tbl_Accounts.acName)+'%'
	
	
END
GO
/****** Object:  StoredProcedure [dbo].[mts_User_Select]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		virus	
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[mts_User_Select]
	@role int ,
	@fk_CompanyID int,
	@fk_OrgID int,
	@userID int
AS
BEGIN
	
	SET NOCOUNT ON;
  
  
  if @role=1
  begin
	select * from users   
  end


  if @role=10
  begin
	 select * from users 
	 inner join 
	 organisation on organisation.orgId=users.fk_OrgID
	 where organisation.companyFId=@fk_CompanyID;
  end


  if @role=20
  begin
   select * from users 
   where fk_OrgID=@fk_OrgID
  end


  if @role=50
  begin
	   select * from users 
	   where ID=@userID
  end	
  
  
END
GO
/****** Object:  StoredProcedure [dbo].[Prc_User_getdata]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
--
-- =============================================
CREATE PROCEDURE [dbo].[Prc_User_getdata] 

@ID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;    

 select users.ID,
 users.loginID ,
 users.UserName,
 users.LoginPwd ,
 users.Details ,
 users.CreatedBy,
 users.Email,
 users.fk_OrgID,
 users.Role,
 userRoles.roleId ,
 organisation.orgId,
 userRoles.roleName,
 organisation.orgName  
 from users Inner join  userRoles on users.Role= userRoles.roleId
	Inner join organisation on users.fk_OrgID=organisation.orgId  
	where users.ID =@ID          
END
GO
/****** Object:  StoredProcedure [dbo].[prc_OrgNameExist]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[prc_OrgNameExist]
	-- Add the parameters for the stored procedure here
	@orgName varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT orgId,orgName from organisation where orgName =@orgName
END
GO
/****** Object:  StoredProcedure [dbo].[Prc_OrgLogoSave]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Radhika
-- Create date: 19-01-2012
-- Description:	Get Crrier's Basic Attribute,Filter,Last Location and Last Alert Information using IMEI No
-- =============================================
CREATE PROCEDURE [dbo].[Prc_OrgLogoSave] 

@orgId int,
@orgName varchar(50),
@orgContact bigint,
@orgEmail varchar(50),

@orgAddr varchar(50),
@website varchar(50),
@companyFId int,

@orgLogo varchar(100),
@task int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;    
if(@task=1)
begin

INSERT INTO organisation (orgName,orgContact,orgEmail,orgAddr,createdOn,expiryOn,logo,website,companyFId,orgLogo) 
                  values (@orgName,@orgContact,@orgEmail,@orgAddr,SYSDATETIME() , SYSDATETIME(),null,@website,@companyFId, @orgLogo) 
end
else 
BEGIN
		update organisation set
		orgName =@orgName ,
		 
		orgLogo=@orgLogo,
		orgContact =@orgContact ,
		orgAddr =@orgAddr ,
		orgEmail =@orgEmail ,
		companyFId= @companyFId  ,
		website= @website 
		
		 where orgId=@orgId 
END


                   
END
GO
/****** Object:  StoredProcedure [dbo].[prc_OrgFetch]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================


CREATE PROCEDURE [dbo].[prc_OrgFetch] 
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	--SET NOCOUNT ON;
	SELECT orgId, orgName  from organisation 
END
GO
/****** Object:  StoredProcedure [dbo].[prc_Organisation_Search]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:	     Ashwini
-- Create date:  30-11-11
-- Description:	 Search Bugs
-- =============================================
CREATE PROCEDURE [dbo].[prc_Organisation_Search]
    @orgName varchar(50)
   
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	if(@orgName='')
	set @orgName=null
	
	

    -- Insert statements for procedure here
	SELECT organisation.orgId,
	 organisation.orgName,
	 organisation.orgAddr ,
	 organisation.orgContact ,
	 organisation.orgEmail,
	 organisation.website,
	 organisation.companyFId,
	 Company.companyName
	 
	from organisation
	   left outer  join Company on Company.companyID=organisation.companyFId 
	     
	WHERE organisation.orgName like '%'+ ISNULL(@orgName,organisation.orgName)+'%'
	    --company.companyName like '%'+ISNULL(@companyName,company.companyName )+'%' 
	--WHERE @Bug_No = tbl_BugTracker.bugNo  and @sub = tbl_BugTracker.subject 
	
END
GO
/****** Object:  StoredProcedure [dbo].[prc_org_mgmt]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[prc_org_mgmt]
	-- Add the parameters for the stored procedure here
@tsk int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    if(@tsk=1)
	SELECT orgId,orgName from dbo.organisation 
END
GO
/****** Object:  StoredProcedure [dbo].[prc_Login]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		virus	
-- Create date: 15-11-2011
-- Description:	Login User		[dbo].[prc_Login] 'PoliceAdmin','PoliceAdmin',2
-- =============================================
CREATE PROCEDURE [dbo].[prc_Login]
	-- Add the parameters for the stored procedure here
	@userID varchar(350),
	@passwd varchar(50),
	@task int
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    if(@task = 1)
		begin
			SELECT users.ID , users.loginID, users.UserName, users.Email , users.LoginPwd , users.Details , users.CreatedBy , users.CreatedOn , users.Role
			 ,users.fk_OrgID , organisation.orgLogo 
     
			FROM  users inner join organisation on users.fk_OrgID = organisation.orgId 
			where loginID = @userID and LoginPwd  = @passwd 
		End
	else if(@task = 2)
		begin
		
				SELECT ID,UserName  ,loginID,expiresOn  ,Role  ,fk_OrgID  ,fk_CompanyID     
		 FROM  users where loginID = @userID and LoginPwd  = @passwd 
		End
	else
		begin
			update UserName set LoginPwd = @passwd where userName = @userID
		end
END
GO
/****** Object:  StoredProcedure [dbo].[prc_Load_Organisation]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		monali
-- Create date: 19-3-12
-- Description:	<Description,,>
-- =============================================


CREATE PROCEDURE [dbo].[prc_Load_Organisation] 
	-- Add the parameters for the stored procedure here
	 @orgId int
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	--SET NOCOUNT ON;
	SELECT organisation.orgId ,
	 organisation.orgName,
	 organisation.orgAddr ,
	 organisation.orgContact ,
	 organisation.orgEmail,
	organisation. website,
	Company.companyID ,
	 Company .companyName ,
	 organisation.orgLogo
	 
	 
	   from organisation
	   Inner join Company on Company.companyID=organisation.companyFId 
	   where orgId =@orgId
END
GO
/****** Object:  StoredProcedure [dbo].[prc_fetch_Organisation]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================


CREATE PROCEDURE [dbo].[prc_fetch_Organisation] 
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	--SET NOCOUNT ON;
	SELECT orgId,
	 orgName,
	 orgAddr ,
	 orgContact ,
	 orgEmail,
	 website,
	 companyFId,
	 companyName
	 
	   from organisation
	   left outer join Company on Company.companyID=organisation.companyFId 
END
GO
/****** Object:  StoredProcedure [dbo].[prc_ForgotPassword]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Vijay
-- Create date: 15-11-2011
-- Description:	Login User
-- =============================================
CREATE PROCEDURE [dbo].[prc_ForgotPassword]
	-- Add the parameters for the stored procedure here
	@userID varchar(350)

	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
 
			SELECT users.ID , users.loginID, users.UserName, users.Email , users.LoginPwd , users.Details , users.CreatedBy , users.CreatedOn , users.Role
			 ,users.fk_OrgID , organisation.orgLogo 
     
			FROM  users inner join organisation on users.fk_OrgID = organisation.orgId 
			where userName = @userID 
	
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Organisation_select]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Organisation_select]
	-- Add the parameters for the stored procedure here
	@CompID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    if(@CompID =0)
   begin
      
	SELECT orgId as 'ID',orgName as 'Name',orgContact as 'Contact No',orgEmail as 'Email',orgAddr as 'Address',createdOn as 'Crteated On',expiryOn as 'Expiry On',website as 'Website',Status as 'Status' from organisation 
	end
	
	else
	
	begin
	
	SELECT orgId as 'ID',orgName as 'Name',orgContact as 'Contact No',orgEmail as 'Email',orgAddr as 'Address',createdOn as 'Crteated On',expiryOn as 'Expiry On',website as 'Website',Status as 'Status' from organisation 
	where companyFId =@CompID  
	
	end
	
      
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Organisation_ins]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Organisation_ins]
	-- Add the parameters for the stored procedure here
	
		   @orgName nvarchar(50),
           @orgContact bigint,
           @orgEmail nvarchar(50),
           @orgAddr nvarchar(50),
           @createdOn date,
           @expiryOn date,
           @logo nvarchar(max), 
           @website nvarchar(50), 
           @companyFId int,
           @CarrierLimit int,
           @UID int,
           @Task int,
           @orId int,
           @Status char(1)
          
     
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
if(@Task =1)
begin
    -- Insert statements for procedure here
	INSERT INTO organisation(orgName ,orgContact ,orgEmail ,orgAddr ,createdOn ,expiryOn ,logo ,website ,companyFId,carrierLimit,UserId ,Status)      
     VALUES
           (@orgName,
           @orgContact,
           @orgEmail,
           @orgAddr,
           @createdOn,
           @expiryOn,
           @logo, 
           @website, 
           @companyFId,
           @CarrierLimit,
           @UID,
           @Status
          )
end

else if(@Task =2)
begin
update organisation set 
		 orgName =   @orgName,
         orgContact =   @orgContact,
         orgEmail =   @orgEmail,
         orgAddr =  @orgAddr,
         createdOn =  @createdOn,
         expiryOn =  @expiryOn,
         logo =  @logo, 
         website =  @website, 
         companyFId =  @companyFId,
         carrierLimit=@CarrierLimit ,
         UserId =  @UID,
         Status=@Status
         
         where orgId =@orId
         

end
else if(@Task =3)
begin
update organisation set 
		 Status=@Status
         
         where orgId =@orId

end

          
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Users_ins]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Users_ins]
	-- Add the parameters for the stored procedure here
	@loginID nvarchar(50),
	@UserName nvarchar (50),
           @Email nvarchar(50),
           @LoginPwd nvarchar(50),
           @Details nvarchar(max),
           @CreatedBy nvarchar(50),
           @CreatedOn datetime,
           @Role int,
           @fk_OrgID int ,
           @UserId int
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare @companyFID int;
	select @companyFID=companyFId from organisation where orgId=@fk_OrgID
    -- Insert statements for procedure here
	INSERT INTO users(loginID,UserName
           ,Email
           ,LoginPwd
           ,Details
           ,CreatedBy
           ,CreatedOn
           ,Role
           ,fk_OrgID,
           fk_CompanyID
           ,DNNUserId)
     VALUES
           (@loginID,
           @UserName,
           @Email,
           @LoginPwd,
           @Details,
           @CreatedBy,
           @CreatedOn,
           @Role,
           @fk_OrgID,
           @companyFID,
           @UserId
           )
           
           

END
GO
/****** Object:  StoredProcedure [dbo].[tikerDataFetch]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		virus
-- =============================

--[Prc_CarrierLastLoc_Fetch] 2,0
CREATE PROCEDURE [dbo].[tikerDataFetch] 

@role int,
@task int,
@date datetime

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	-- task 0 for user login and task =1 for admin
	
	if(@task=0)
	Begin
	SELECT tikerFeed.feedId, feed, feedTime ,feedlat,feedlong,tikerFeed.carrierFId,carrier.carrierName as carrierName from tikerFeed     
    INNER JOIN
    carrier on carrier.carrierID = tikerFeed.carrierFId INNER JOIN
    organisation on carrier.orgFId = organisation.orgId 
    where carrier.orgFId= @role and DATEDIFF(MINUTE,tikerFeed.feedTime,@date)<1
    order by feedTime desc;
    End
    else
    
    begin
   SELECT tikerFeed.feedId, feed, feedTime, feedlat,feedlong,tikerFeed.carrierFId, carrier.carrierName as carrierName from tikerFeed        
    INNER JOIN
    carrier on carrier.carrierID = tikerFeed.carrierFId INNER JOIN
    organisation on carrier.orgFId = organisation.orgId     
    where  DATEDIFF(MINUTE,tikerFeed.feedTime,@date)<1
    order by feedTime desc;
    end
    
 
    --SELECT top 10 CarrierLastLoc.AccountId,CarrierLastLoc.CarrierId,CarrierLastLoc.CarrierName,CarrierLastLoc.OrgId,
    --CarrierLastLoc.DeviceType,CarrierLastLoc.GofenceInsideList,CarrierLastLoc.Invalid_logs_count,CarrierLastLoc.IMEI,
    --CarrierLastLoc.IsGpsAvailable,CarrierLastLoc.IsPanicAcknowledged,
    --CarrierLastLoc.IsPanicAcknowledged,CarrierLastLoc.LastDateTime,CarrierLastLoc.LastEmailAlertDateTime,
    --CarrierLastLoc.lastLat,CarrierLastLoc.LastLocDateTime,CarrierLastLoc.LastLocLatVal,CarrierLastLoc.LastLocLongVal,
    --CarrierLastLoc.LastLocSpeed,CarrierLastLoc.lastLong,CarrierLastLoc.LastLocLatVal,CarrierLastLoc.LastLocLongVal,
    --CarrierLastLoc.OfflineLogDataLength,CarrierLastLoc.Speed,accounts.AccountName,organisation.OrgName
           
    --From CarrierLastLoc INNER JOIN
    --     accounts on CarrierLastLoc.AccountId = accounts.AccountID INNER JOIN
    --     organisation on CarrierLastLoc.OrgId = organisation.OrgID  
         
END
GO
/****** Object:  StoredProcedure [dbo].[prc_get_Carrier_Data]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

--prc_get_Carrier_Data
CREATE PROCEDURE [dbo].[prc_get_Carrier_Data]
	-- Add the parameters for the stored procedure here
	
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

SELECT
    C.carrierID,
    C.carrierName,
    C.companyFId,
    C.orgFId,
    C.zoneFId ,
    C.carrierTypeFId, 
    C.deviceImei,
    C.gsmNumber,
    C.simServiceType,
    CC.companyName,
    CO.orgName,
    CZ.zoneName,
    CT.trackType
    
FROM
    carrier C
     
  left outer join Company CC on CC.companyID=C.companyFId
   left outer join organisation CO on CO.orgId=C.orgFId 
   left outer join timeZone CZ on CZ.zoneId =C.zoneFId  
   left outer join trackType CT on CT.trackTypeID =C.carrierTypeFId
    
    END
GO
/****** Object:  StoredProcedure [dbo].[Prc_FleetLastLoc_Fetch]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		virus
-- =============================

--[Prc_CarrierLastLoc_Fetch] 2,0
CREATE PROCEDURE [dbo].[Prc_FleetLastLoc_Fetch] 

@role int,
@task int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	-- task 0 for user login and task =1 for admin
	
	if(@task=0)
	Begin
		SELECT fleet.fleetID, fleet.fleetName from fleet    
		where fleet.orgFId= @role
    End
    else
    begin
		SELECT fleet.fleetID, fleet.fleetName from fleet 
    end
    
 
    --SELECT top 10 CarrierLastLoc.AccountId,CarrierLastLoc.CarrierId,CarrierLastLoc.CarrierName,CarrierLastLoc.OrgId,
    --CarrierLastLoc.DeviceType,CarrierLastLoc.GofenceInsideList,CarrierLastLoc.Invalid_logs_count,CarrierLastLoc.IMEI,
    --CarrierLastLoc.IsGpsAvailable,CarrierLastLoc.IsPanicAcknowledged,
    --CarrierLastLoc.IsPanicAcknowledged,CarrierLastLoc.LastDateTime,CarrierLastLoc.LastEmailAlertDateTime,
    --CarrierLastLoc.lastLat,CarrierLastLoc.LastLocDateTime,CarrierLastLoc.LastLocLatVal,CarrierLastLoc.LastLocLongVal,
    --CarrierLastLoc.LastLocSpeed,CarrierLastLoc.lastLong,CarrierLastLoc.LastLocLatVal,CarrierLastLoc.LastLocLongVal,
    --CarrierLastLoc.OfflineLogDataLength,CarrierLastLoc.Speed,accounts.AccountName,organisation.OrgName
           
    --From CarrierLastLoc INNER JOIN
    --     accounts on CarrierLastLoc.AccountId = accounts.AccountID INNER JOIN
    --     organisation on CarrierLastLoc.OrgId = organisation.OrgID  
         
END
GO
/****** Object:  StoredProcedure [dbo].[prc_fleet_management]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Pradip>
-- Create date: <Create Date,25-07-12,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[prc_fleet_management] 
-- Add the parameters for the stored procedure here
@fleetID int,
@fleetName varchar(100),
@orgFId int,
@description varchar(150),
@fleetArea nvarchar(100),
@task int



AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
if(@task=1)
   INSERT INTO fleet values(@fleetName,@orgFId,@description,@fleetArea)

if(@task=2)
     UPDATE fleet
     
   SET 
	  fleetName= @fleetName,
	  orgFId= @orgFId,
	  description= @description,
	  fleetArea= @fleetArea
   
	WHERE 
	  fleetID= @fleetID
 
     
     
END
GO
/****** Object:  StoredProcedure [dbo].[Prc_FetchReoprtName]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Prc_FetchReoprtName]
		--@trackTypeID int
		@CarrierName varchar(50)
AS
BEGIN  

		DECLARE @trackTypeID int
       set @trackTypeID=(  select carrierTypeFId from carrier where carrierName =@CarrierName)
		
		
		DECLARE @TrackType nvarchar(50)
		SET @TrackType = (SELECT trackType  FROM trackType WHERE trackTypeID = @trackTypeID)
		
		IF(@TrackType = 'Bike' or @TrackType = 'Car')
		BEGIN
		SELECT * FROM MTS_Reports
		END
		ELSE
		BEGIN
		SELECT * FROM MTS_Reports WHERE ReportName !='Fuel Monitoring' AND ReportName !='Speed' AND ReportName !='Overspeed' AND ReportName !='Working Hrs'
		END
END

-- Demo_Fetch 'Sandeep Madiwal'

--select carrierTypeFId from carrier where carrierName = 'Sandeep Madiwal'
GO
/****** Object:  StoredProcedure [dbo].[prc_Load_Carrier]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

--prc_Load_Carrier 1

CREATE PROCEDURE [dbo].[prc_Load_Carrier]
	-- Add the parameters for the stored procedure here
@carrierID int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

SELECT
    C.carrierName,
    C.carrierTypeFId,
	C.deviceImei,
	C.gsmNumber,
    C.orgFId,
    C.zoneFId,
    C.simServiceType,
    C.CalibrationType,
    C.companyFId,
    CT.trackTypeID,
    CO.orgId ,
    CZ.zoneId ,
    CC.companyID 
    FROM
    carrier C
    left outer join trackType CT on CT.trackTypeID  =C.carrierTypeFId 
     left outer join organisation  CO on CO.orgId =C.orgFId 
     left outer join timeZone CZ on CZ.zoneId =C.zoneFId 
     left outer join Company CC on CC.companyID =C.companyFId 
   
    WHERE carrierID = @carrierID
           
   END
GO
/****** Object:  StoredProcedure [dbo].[Prc_User_Fetch]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Monali
-- Create date: 
-- Description:	Get Crrier's Basic Attribute,Filter,Last Location and Last Alert Information using IMEI No
-- =============================================
CREATE PROCEDURE [dbo].[Prc_User_Fetch] 


AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;    

 select  distinct users.ID,
 users.loginID ,
 users.UserName,
 users.LoginPwd ,
 users.Details ,
 users.CreatedBy,
 users.Email,
 users.fk_OrgID,
 users.Role,
 userRoles.roleName,
 organisation.orgName,
 organisation.orgId,
 (select COUNT(carrier.carrierID) from carrier where users.fk_OrgID  = carrier.orgFId )as TotalCarrier 
 
 from users left outer join  userRoles on userRoles.roleId=users.Role
	left outer join organisation on organisation.orgId  = users.fk_OrgID left outer join
					carrier on carrier.orgFId= organisation.orgId 
END
GO
/****** Object:  StoredProcedure [dbo].[prc_save_carriers]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[prc_save_carriers]
   
	@carrierID int,
	@carrierName varchar(50),
	@carrierTypeFId int,
	@VehicleChassisNumber varchar(50),
	@VehicleRunning int,
	@VehicleFuelCapacity int,
	@VehicleAverage int,
	@VehicleTyreCount int,
	@LastServicingDate datetime,
	@LastServicingDetails nvarchar(255),
	@deviceImei bigint,
	@gsmNumber bigint,
	@apnName varchar(50),
	@apnUserName varchar(50),
	@apnPassword varchar(50),
	@deviceType varchar(50),
	@orgFId int,
	@simServiceType varchar(50),
	@zoneFId int,
	@CalibrationType int,
	@companyFId int,
	@fleetFid int,
	@task int
AS
BEGIN

  if(@LastServicingDate=0)
  set @LastServicingDate=null

  if(@VehicleChassisNumber=0)
  set @VehicleChassisNumber =null
  
  if(@VehicleRunning=0)
  set @VehicleRunning =null
  
  if(@VehicleFuelCapacity=0)
  set @VehicleFuelCapacity =null
  
  if(@VehicleAverage=0)
  set @VehicleAverage =null
  
  if(@VehicleTyreCount=0)
  set @VehicleTyreCount =null

  if(@LastServicingDetails=0)
  set @LastServicingDetails =null

  if(@apnName=0)
  set @apnName =null

  if(@apnUserName=0)
  set @apnUserName =null
  
  if(@apnPassword=0)
  set @apnPassword =null
  
  if(@deviceType=0)
  set @deviceType =null

	
if(@task=1)
	begin
    insert into carrier(carrierName,carrierTypeFId,VehicleChassisNumber,VehicleRunning,VehicleFuelCapacity,
    VehicleAverage,VehicleTyreCount,LastServicingDate,LastServicingDetails,deviceImei,gsmNumber,apnName,apnUserName,apnPassword,
    deviceType,orgFId,simServiceType,zoneFId,CalibrationType,companyFId,fleetFid)
    values(@carrierName,@carrierTypeFId,@VehicleChassisNumber,@VehicleRunning,@VehicleFuelCapacity,@VehicleAverage,
    @VehicleTyreCount,@LastServicingDate,@LastServicingDetails,@deviceImei,@gsmNumber,@apnName,@apnUserName,@apnPassword,
    @deviceType,@orgFId,@simServiceType,@zoneFId,@CalibrationType,@companyFId,@fleetFid)
   
		end
else if(@task=2)
begin	
UPDATE [carrier] 
			SET carrierName =@carrierName,
			carrierTypeFId =@carrierTypeFId,
			VehicleChassisNumber =@VehicleChassisNumber, 
			VehicleRunning =@VehicleRunning, 
			VehicleFuelCapacity =@VehicleFuelCapacity,
			VehicleAverage=@VehicleAverage,
			VehicleTyreCount=@VehicleTyreCount,
			LastServicingDate=@LastServicingDate,
			LastServicingDetails=@LastServicingDetails,
			deviceImei=@deviceImei,
			gsmNumber=@gsmNumber,
			apnName=@apnName,
			apnUserName=@apnUserName,
			apnPassword=@apnPassword,  
			deviceType=@deviceType,
			orgFId=@orgFId,
			simServiceType=@simServiceType,
			zoneFId=@zoneFId, 
			CalibrationType=@CalibrationType,
			companyFId=@companyFId,
			fleetFid=@fleetFid
			  
			WHERE carrierID=@carrierID  
end

		
END
GO
/****** Object:  StoredProcedure [dbo].[mts_Select_Carriers]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		virus
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[mts_Select_Carriers]
	-- Add the parameters for the stored procedure here
	@role int,
	@fk_CompanyID int,
	@fk_OrgID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    if(@role =1)
		begin
	      
			SELECT carrierID as 'ID',carrierName as 'Name',trackType.trackType as 'Track Type' ,deviceImei as 'IMEI',gsmNumber as 'GSM No',organisation .orgName 'Organisation Name',timeZone .zone as 'Zone Name',carrier .Status as 'Status'
		   
			FROM carrier INNER JOIN
			organisation  on organisation.orgId  =carrier .orgFId inner join
			timeZone on timeZone .zoneId =carrier .zoneFId  inner join
			trackType on trackType .trackTypeID =carrier .carrierTypeFId 
		end
	
	else if(@role=10)
	
		begin
			SELECT carrierID as 'ID',carrierName as 'Name',trackType.trackType as 'Track Type' ,deviceImei as 'IMEI',gsmNumber as 'GSM No',organisation .orgName 'Organisation Name',timeZone .zone as 'Zone Name',carrier .Status as 'Status'
		   
			FROM carrier INNER JOIN
			organisation  on organisation.orgId  =carrier .orgFId inner join
			timeZone on timeZone .zoneId =carrier .zoneFId  inner join
			trackType on trackType .trackTypeID =carrier .carrierTypeFId 
		 where (carrier.Status='A' or carrier.Status='a') and carrier.companyFId=@fk_CompanyID;
		end
	else if(@role=20)
		begin 
			SELECT carrierID as 'ID',carrierName as 'Name',trackType.trackType as 'Track Type' ,deviceImei as 'IMEI',gsmNumber as 'GSM No',organisation .orgName 'Organisation Name',timeZone .zone as 'Zone Name',carrier .Status as 'Status'
		   
			FROM carrier INNER JOIN
			organisation  on organisation.orgId  =carrier .orgFId inner join
			timeZone on timeZone .zoneId =carrier .zoneFId  inner join
			trackType on trackType .trackTypeID =carrier .carrierTypeFId 
			 where (carrier.Status='A' or carrier.Status='a') and orgFId=@fk_OrgID;
		end
      
END
GO
/****** Object:  StoredProcedure [dbo].[parserinsertInGeofenceAlerts]    Script Date: 01/09/2017 11:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		virus
-- Create date: 22 june 2012
-- Description:	inserts geofence alerts
-- =============================================
CREATE PROCEDURE [dbo].[parserinsertInGeofenceAlerts] 
	@time datetime,
	@carrierId int,
	@alertId int,
	@fenceName varchar(60)
	
AS
BEGIN
	declare @message varchar(150);
	declare @timeStr varchar(150);
	declare @hrOffset int;
	declare @minOffset int;
	declare @magnitude int; 
	declare @zoneFId	int;
	select @message=carrierName from carrier where carrierID=@carrierId;
	
	select @zoneFId=zoneFId from carrier where carrierID=@carrierId;
	select @hrOffset=zoneOffsetHr, @minOffset=zoneOffsetMin,@magnitude=zoneOffsetSign from timeZone where zoneId=@zoneFId;
	select @hrOffset=(@hrOffset*@magnitude);
	select @minOffset=(@minOffset*@magnitude);		
	select @time=dateadd(hour,@hrOffset,@time);
	select @time=dateadd(minute,@minOffset,@time);
	
		
	
	INSERT INTO smsAlerts(alertFid,alertTime,carrierFid,smsType,fenceName,priority,timeout) values (@alertId,@time,@carrierId,1,@fenceName,1,5) ;
END
GO
/****** Object:  StoredProcedure [dbo].[prc_Alert_SelectByID]    Script Date: 01/09/2017 11:10:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[prc_Alert_SelectByID]
@AlertMgmt_ID int
AS
BEGIN
		Select AlertMgmt.*, carrier.carrierID as carrierID1,carrier.carrierName from AlertMgmt inner join
		carrier on carrier.carrierID=AlertMgmt.CarrierID where AlertMgmt.AlertMgmt_ID=@AlertMgmt_ID
END
-- prc_Alert_SelectByID 4
GO
/****** Object:  StoredProcedure [dbo].[prc_Alert_Select]    Script Date: 01/09/2017 11:10:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[prc_Alert_Select]

AS
BEGIN
		Select AlertMgmt.*, carrier.carrierID,carrier.carrierName from AlertMgmt inner join
		carrier on carrier.carrierID=AlertMgmt.CarrierID
END
GO
/****** Object:  StoredProcedure [dbo].[Prc_Dashboard_GetDeviceType]    Script Date: 01/09/2017 11:10:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Prc_Dashboard_GetDeviceType]
@VehName varchar(50)
AS
BEGIN  
	SELECT carrierName,carrierTypeFId from carrier where carrierName=@VehName
END
GO
/****** Object:  StoredProcedure [dbo].[prc_CarrierNameExist]    Script Date: 01/09/2017 11:10:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[prc_CarrierNameExist]
	-- Add the parameters for the stored procedure here
	@carrierName varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT carrierID,carrierName from carrier  where carrierName =@carrierName
END
GO
/****** Object:  StoredProcedure [dbo].[prc_Carrier_Search]    Script Date: 01/09/2017 11:10:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:	     Monali
-- Create date:  
-- Description:	 Search Carrier
-- =============================================
CREATE PROCEDURE [dbo].[prc_Carrier_Search]
    @carrierName varchar(50)
   
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	if(@carrierName='')
	set @carrierName=null
	
	
select
    -- Insert statements for procedure here
	C.carrierID,
    C.carrierName,
    C.companyFId,
    C.orgFId,
    C.zoneFId ,
    C.carrierTypeFId, 
    C.deviceImei,
    C.gsmNumber,
    C.simServiceType,
    CC.companyName,
    CO.orgName,
    CZ.zoneName,
    CT.trackType
    FROM
    carrier C
     
   left outer join Company CC on CC.companyID=C.companyFId
   left outer join organisation CO on CO.orgId=C.orgFId 
   left outer join timeZone CZ on CZ.zoneId =C.zoneFId  
   left outer join trackType CT on CT.trackTypeID =C.carrierTypeFId
	     
	WHERE  C.carrierName like '%'+ISNULL(@carrierName,C.carrierName)+'%'
	--WHERE  users.UserName like '%'+ISNULL(@UserName,users.UserName )+'%'	     
	
	
END
GO
/****** Object:  StoredProcedure [dbo].[prc_Carrier_ImeiExist]    Script Date: 01/09/2017 11:10:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[prc_Carrier_ImeiExist]
	-- Add the parameters for the stored procedure here
	@deviceImei bigint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT carrierID , deviceImei  from carrier  where deviceImei  = @deviceImei 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_getTotalCount]    Script Date: 01/09/2017 11:10:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_getTotalCount]
@UserID int
as


begin


select SUM(carrierLimit) as 'Sum' from organisation where UserId=@UserID 

select count(carrierID) as 'Count' from carrier where orgFId =@UserID 

end
GO
/****** Object:  StoredProcedure [dbo].[sp_getCarrierForAdmin]    Script Date: 01/09/2017 11:10:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_getCarrierForAdmin]
	-- Add the parameters for the stored procedure here
	@companyId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT carrier.carrierName from carrier where carrier.orgFId in( select orgId from organisation where companyFId=@companyId)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Company_select]    Script Date: 01/09/2017 11:10:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>		[dbo].[sp_Company_select] 
-- =============================================
CREATE PROCEDURE [dbo].[sp_Company_select]
	-- Add the parameters for the stored procedure here


AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT companyID as 'ID' ,companyName as 'Name',companyWebsite as 'Website',companyEmail as 'Email' ,companyContact as 'Contact' ,companyAddr as 'Address' ,createdOn as 'Created On'  ,expiryOn as 'Expiry On',Status as 'Status'
		  ,CarrierLimit as totalLicense,(select COUNT(*) from carrier where companyFId=Company.companyID) as usedLicense, (CarrierLimit-(select COUNT(*) from carrier where companyFId=Company.companyID))  as remainingLicnese
  FROM Company
  
END
GO
/****** Object:  StoredProcedure [dbo].[sp_carrier_select]    Script Date: 01/09/2017 11:10:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================


CREATE PROCEDURE [dbo].[sp_carrier_select]
	-- Add the parameters for the stored procedure here
	@UID int=null,
	@CompID int=null
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    if(@UID =0)
   begin
    
	SELECT carrierID as 'ID',carrierName as 'Name',trackType.trackType as 'Track Type' ,deviceImei as 'IMEI',gsmNumber as 'GSM No',organisation .orgName 'Organisation Name',timeZone .zoneName as 'Zone Name',carrier .Status as 'Status'
	   
    FROM carrier INNER JOIN
	organisation  on organisation.orgId  =carrier .orgFId inner join
	timeZone on timeZone .zoneId =carrier .zoneFId  inner join
	trackType on trackType .trackTypeID =carrier .carrierTypeFId 
	end
	
	else
	
	begin
	
	SELECT carrierID as 'ID',carrierName as 'Name',trackType.trackType as 'Track Type' ,deviceImei as 'IMEI',gsmNumber as 'GSM No',organisation .orgName 'Organisation Name',timeZone .zoneName as 'Zone Name',carrier .Status as 'Status'
	   
    FROM carrier INNER JOIN
	organisation  on organisation.orgId  =carrier .orgFId inner join
	timeZone on timeZone .zoneId =carrier .zoneFId  inner join
	trackType on trackType .trackTypeID =carrier .carrierTypeFId  where carrier . UserId =@UID 
	end
  
  
   SELECT carrierID as 'ID',carrierName as 'Name',trackType.trackType as 'Track Type' ,deviceImei as 'IMEI',gsmNumber as 'GSM No',organisation .orgName 'Organisation Name',timeZone .zoneName as 'Zone Name',carrier .Status as 'Status'
	   
    FROM carrier INNER JOIN
	organisation  on organisation.orgId  =carrier .orgFId inner join
	timeZone on timeZone .zoneId =carrier .zoneFId  inner join
	trackType on trackType .trackTypeID =carrier .carrierTypeFId  where carrier .companyFId  =@CompID 
  
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Carrier_Details]    Script Date: 01/09/2017 11:10:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
--sp_Carrier_Details 
CREATE PROCEDURE [dbo].[sp_Carrier_Details]
	-- Add the parameters for the stored procedure here
	@CarId int
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select carrierName ,VehicleChassisNumber,VehicleRunning
      ,VehicleFuelCapacity
      ,VehicleAverage
      ,VehicleTyreCount
      ,deviceImei
      ,gsmNumber
      ,apnName
      ,apnUserName
      ,apnPassword
      ,simServiceType 
      ,trackType .trackType as 'track type' 
      ,organisation .orgName as 'org name'
      ,timeZone .zoneName as 'zone name'
      ,Company .companyName as 'comp name'
      
  from carrier inner join 
  
  trackType on trackType .trackTypeID=carrier.carrierTypeFId   inner Join 
  organisation on organisation .orgId=carrier.orgFId  inner Join
  timeZone on timeZone .zoneId=carrier .zoneFId  inner Join
  Company on Company .companyID=carrier .companyFId
  
  where carrierID =@CarId 


             
      
END
GO
/****** Object:  StoredProcedure [dbo].[demo]    Script Date: 01/09/2017 11:10:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[demo]
@Name nvarchar(250)
AS
BEGIN
	 select * from carrier where carrierName like '%' + @Name + '%'
END
GO
/****** Object:  Table [dbo].[alertNumbers]    Script Date: 01/09/2017 11:10:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[alertNumbers](
	[contactId] [int] IDENTITY(1,1) NOT NULL,
	[contactNumber] [bigint] NOT NULL,
	[carrierFId] [int] NOT NULL,
	[alertFId] [int] NOT NULL,
	[active] [tinyint] NULL,
 CONSTRAINT [PK_Contacts] PRIMARY KEY CLUSTERED 
(
	[contactNumber] ASC,
	[carrierFId] ASC,
	[alertFId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmailContacts]    Script Date: 01/09/2017 11:10:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmailContacts](
	[EmailId] [int] IDENTITY(1,1) NOT NULL,
	[EmailAddr] [nvarchar](50) NOT NULL,
	[carrierFId] [int] NULL,
 CONSTRAINT [PK_EmailContacts] PRIMARY KEY CLUSTERED 
(
	[EmailId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Geofencing]    Script Date: 01/09/2017 11:10:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Geofencing](
	[fenceId] [int] IDENTITY(1,1) NOT NULL,
	[fenceName] [nvarchar](255) NOT NULL,
	[fenceType] [int] NULL,
	[centerLat] [float] NULL,
	[centerLong] [float] NULL,
	[fenceRadius] [float] NULL,
	[carrierFId] [int] NULL,
	[alertStartTime] [datetime] NULL,
	[alertStopTime] [datetime] NULL,
	[lastStatus] [int] NULL,
 CONSTRAINT [PK_Geofencing] PRIMARY KEY CLUSTERED 
(
	[fenceId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0 means out of the geofence 1 means inside the geofence' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Geofencing', @level2type=N'COLUMN',@level2name=N'lastStatus'
GO
/****** Object:  StoredProcedure [dbo].[mts_rpt_prc_CarrierName]    Script Date: 01/09/2017 11:10:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================


--rpt_prc_Trackcarrier 16,'2012-02-29 00:00:00.000','2012-02-29 23:59:59.000'
create PROCEDURE [dbo].[mts_rpt_prc_CarrierName]
	-- Add the parameters for the stored procedure here
	@carrier_id int
	
AS
BEGIN


	--Select latitude as lat,longitude as long, time, speed from mts where time between @dateStart and @dateStop and carrierFId=@carrier_id order by time asc
	--select latitude,longitude,speed,time from mts where carrierFId=@carrier_id and latitude!=0 and time between @dateStart and @dateStop order by time asc;
	select carrierName from carrier where carrierID=@carrier_id;
END
GO
/****** Object:  StoredProcedure [dbo].[mts_Organisation_select]    Script Date: 01/09/2017 11:10:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		virus
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[mts_Organisation_select]
	-- Add the parameters for the stored procedure here
	@role int,
	@fk_CompanyID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    if(@role =1)
   begin
      
	SELECT orgId as 'ID',orgName as 'Name',orgContact as 'Contact No',orgEmail as 'Email',
	orgAddr as 'Address',organisation.createdOn as 'Crteated On',organisation.expiryOn as 'Expiry On',
	organisation.website as 'Website',organisation.Status as 'Status',companyName,organisation.carrierLimit ,
	(select COUNT(*) from carrier where orgFId=organisation.orgId) as usedLicense,
	(organisation.carrierLimit-(select COUNT(*) from carrier where orgFId=organisation.orgId))  as remainingLicnese
	from organisation 
	inner join Company on Company.companyID= organisation.companyFId;
	end
	
	else
	
	begin
	
	SELECT orgId as 'ID',orgName as 'Name',orgContact as 'Contact No',orgEmail as 'Email',
	orgAddr as 'Address',createdOn as 'Crteated On',expiryOn as 'Expiry On',
	website as 'Website',Status as 'Status',organisation.carrierLimit from organisation 
	where (Status!='d' or Status!='D') and  companyFId =@fk_CompanyID  
	
	end
	
      
END
GO
/****** Object:  StoredProcedure [dbo].[mts_Organisation_GetLicenseDetails]    Script Date: 01/09/2017 11:10:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		virus
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[mts_Organisation_GetLicenseDetails]   
	-- Add the parameters for the stored procedure here
	@orgID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	declare @carrierLimit int;	
	declare @registerCarrier int;
	
	select @carrierLimit=carrierLimit from organisation where orgId=@orgID;		
	select @registerCarrier=count(*) from carrier where orgFId=@orgID; 
	select @registerCarrier,@carrierLimit;
      
END
GO
/****** Object:  StoredProcedure [dbo].[mts_Organisation_delete]    Script Date: 01/09/2017 11:10:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		virus
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[mts_Organisation_delete]
	-- Add the parameters for the stored procedure here
	
	@orgId int,
	@task int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
if @task=1
begin

	update organisation set Status='D' where orgId=@orgId;
	update carrier set 		    
	Status = 'D'		          
	where carrier.orgFId = @orgId

	update users 
	 set Status = 'D'
	where users.fk_OrgID = @orgId
end

else
if @task=2
begin
	delete from organisation where orgId=@orgId;
end
      
END
GO
/****** Object:  StoredProcedure [dbo].[mts_Fleet_select]    Script Date: 01/09/2017 11:10:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		virus
-- Description:	Get Crrier's Basic Attribute,Filter,Last Location and Last Alert Information using IMEI No
-- =============================================

--[Prc_CarrierLastLoc_Fetch] 2,0
create PROCEDURE [dbo].[mts_Fleet_select] 

@role int,
@compID int,
@orgID int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	-- task 0 for user login and task =1 for admin
	
	if(@role=1)
	Begin
		select * from fleet
    End
    
    else if(@role=10)
    
    begin
		select * from fleet		
		where fleet.orgFId=(select orgId from organisation where companyFId=@compID);
    End   
    else     
    begin
		select * from fleet		
		where fleet.orgFId=@orgID;
    End  
END
GO
/****** Object:  StoredProcedure [dbo].[mts_Company_GetLicenseDetails]    Script Date: 01/09/2017 11:10:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		virus
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[mts_Company_GetLicenseDetails]   
	-- Add the parameters for the stored procedure here
	@companyID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	declare @orglimit int;
	declare @carrierLimit int;
	declare @registerOrgs int;	
	declare @registerCarrier int;	
	select @orglimit=OrganisationLimit,@carrierLimit=CarrierLimit from Company where companyID=@companyID;	
	select @registerOrgs=count(*) from organisation where companyFId=@companyID;
	select @registerCarrier=count(*) from carrier where companyFId=@companyID; 
	
	
	select @registerCarrier,@carrierLimit,@registerOrgs,@orglimit;
      
END
GO
/****** Object:  StoredProcedure [dbo].[mts_Company_delete]    Script Date: 01/09/2017 11:10:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[mts_Company_delete]
	-- Add the parameters for the stored procedure here
		
           @CompId int,
           @task int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
  
    begin
		if @task=1
		begin	    
			update Company set 		    
			Status = 'D'		          
			where companyID = @CompId
			
			update organisation set 		    
			Status = 'D'		          
			where organisation.companyFId = @CompId
			
			update carrier set 		    
			Status = 'D'		          
			where carrier.companyFId = @CompId
			
			update users 
			 set Status = 'D'	from users
			 INNER JOIN organisation ON organisation.orgId=users.fk_OrgID			          
			where organisation.companyFId = @CompId
		end
		else if @task=2
		begin
			delete from Company where companyID = @CompId		
		end	
		
		
	 end  
           
END
GO
/****** Object:  StoredProcedure [dbo].[mts_checkCarrierLimit]    Script Date: 01/09/2017 11:10:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		virus
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[mts_checkCarrierLimit]   
	-- Add the parameters for the stored procedure here
	@fk_OrgID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	declare @count int;
	declare @limit int;
		
	select @count=count(*) from carrier where orgFId=@fk_OrgID  and Status='A';
	select @limit=CarrierLimit from organisation where orgId=@fk_OrgID;
	
    if ISNULL(@count,0)<ISNULL(@limit,0)
	begin
      
		select 1;
	
	end
	else
	begin
		select 0;
	end
	
      
END
GO
/****** Object:  StoredProcedure [dbo].[getPoliceNotifications]    Script Date: 01/09/2017 11:10:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getPoliceNotifications]
AS
BEGIN
	select PN.*,C.carrierName from dbo.PoliceNotifications PN	
	inner join dbo.carrier C on C.carrierID=PN.VehicleFId	
	order by Time desc
END
GO
/****** Object:  StoredProcedure [dbo].[mts_CarrierFromCarriers_Fetch]    Script Date: 01/09/2017 11:10:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		virus
-- Description:	Get Crrier's Basic Attribute,Filter,Last Location and Last Alert Information using IMEI No
-- =============================================

--[Prc_CarrierLastLoc_Fetch] 2,0
CREATE PROCEDURE [dbo].[mts_CarrierFromCarriers_Fetch] 

@role int,
@orgID int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	-- task 0 for user login and task =1 for admin
	
	if(@role=20)	    
    begin
		SELECT  carrier.carrierID as CarrierId,carrier.carrierName as CarrierName
		from carrier INNER JOIN		
		organisation on carrier.orgFId = organisation.orgId 
		where carrier.orgFId=@orgID	and carrier.Status='A'	
		
    End  
END
GO
/****** Object:  StoredProcedure [dbo].[mts_Carrier_ins]    Script Date: 01/09/2017 11:10:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[mts_Carrier_ins]
	-- Add the parameters for the stored procedure here
		   @carrierName nvarchar(50), 
		   @userID int,
           @carrierTypeFId int, 
           @deviceImei bigint, 
           @gsmNumber bigint,
           @orgFId bigint,  
           @simServiceType nvarchar(50), 
           @zoneFId int,
           
           @VehicleChassisNumber nvarchar(50), 
           @VehicleRunning int, 
           @VehicleFuelCapacity int, 
           
           
           @VehicleAverage int, 
           @VehicleTyreCount int, 
           @LastServicingDate Datetime, 
           @LastServicingDetails nvarchar(250), 
          
          
           @apnName nvarchar(50) ,
           @apnUserName nvarchar(50), 
           @apnPassword nvarchar(50), 
        
           
           @overSpeedThreshold float,
           @din2Logic tinyint,
           @fleetFid int, 
           @digIgnitionUsed tinyInt,
           
           @Status char(1),
           @Task int,
           @CarID int
          
	
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    
    declare @companyFId int
    select @companyFId=companyFId from organisation where orgId=@orgFId;
    
    if(@Task =1)
    begin
    
		INSERT INTO carrier
		 (		
		  carrierName,carrierTypeFId,VehicleChassisNumber,VehicleRunning,VehicleFuelCapacity,VehicleAverage,VehicleTyreCount,
		  LastServicingDate,LastServicingDetails,deviceImei,gsmNumber,apnName,apnUserName,apnPassword,orgFId,simServiceType,zoneFId,companyFId,overSpeedThreshold,din2Logic,fleetFid,digIgnitionUsed,Status
		  )
	           
		 VALUES
		 (
		 @carrierName,@carrierTypeFId,@VehicleChassisNumber,@VehicleRunning,@VehicleFuelCapacity,@VehicleAverage,@VehicleTyreCount,
		 @LastServicingDate,@LastServicingDetails,@deviceImei,@gsmNumber,@apnName,@apnUserName,@apnPassword,@orgFId,@simServiceType,@zoneFId,@companyFId, @overSpeedThreshold,@din2Logic,@fleetFid,@digIgnitionUsed,@Status
		 )
		 declare @carrierIDNew int
		 SELECT @carrierIDNew=SCOPE_IDENTITY();
		 
		 if @userID!=0
		 begin
			insert into carrierUsers(userID,carrierID) values(@userID,@carrierIDNew)  		 
		 end
		 
    end
    
    else if(@Task =2)
    begin
    update carrier set 
    
           carrierName =   @carrierName, 
           carrierTypeFId = @carrierTypeFId, 
           VehicleChassisNumber = @VehicleChassisNumber, 
           VehicleRunning = @VehicleRunning, 
           VehicleFuelCapacity =  @VehicleFuelCapacity, 
           VehicleAverage =  @VehicleAverage,
           VehicleTyreCount = @VehicleTyreCount, 
           LastServicingDate = @LastServicingDate, 
           LastServicingDetails = @LastServicingDetails, 
           deviceImei =    @deviceImei, 
           gsmNumber = @gsmNumber, 
           apnName = @apnName,
           apnUserName = @apnUserName, 
           apnPassword = @apnPassword, 
          
           orgFId = @orgFId, 
           simServiceType = @simServiceType, 
           zoneFId = @zoneFId,
           
           companyFId = @companyFId,
           overSpeedThreshold = @overSpeedThreshold,
           din2Logic = @din2Logic,
           fleetFid = @fleetFid, 
           digIgnitionUsed = @digIgnitionUsed,         
           status= @Status           
           where carrierID =@CarID
    
    end
    
    else if(@Task =3)
    --for deactivate (delete) carrier
    begin
     update carrier set 
      status= @Status
      where  carrierID =@CarID
    
    end
    
	
END
GO
/****** Object:  StoredProcedure [dbo].[mts_Carrier_delete]    Script Date: 01/09/2017 11:10:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[mts_Carrier_delete]
	-- Add the parameters for the stored procedure here
		   
           @CarID int
          
	
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   update carrier set Status='D' where carrierID=@CarID
    
    
    
	
END
GO
/****** Object:  StoredProcedure [dbo].[getVehicleAlerts]    Script Date: 01/09/2017 11:10:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getVehicleAlerts] 
AS
BEGIN
	select * from carrier;
	select * from alerts;
	
END
GO
/****** Object:  StoredProcedure [dbo].[get_Fleet]    Script Date: 01/09/2017 11:10:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Pradip>
-- Create date: <Create Date,,25-07-12>
-- Description:	<Description,,>
-- =============================================
--get_Driver

CREATE procedure [dbo].[get_Fleet]

AS

BEGIN

		select  fleetID, fleetName from fleet
END
GO
/****** Object:  StoredProcedure [dbo].[get_Carrier]    Script Date: 01/09/2017 11:10:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Pradip>
-- Create date: <Create Date,,25-07-12>
-- Description:	<Description,,>
-- =============================================
--get_Driver

CREATE procedure [dbo].[get_Carrier]

AS

BEGIN

		select  carrierID, carrierName from carrier
END
GO
/****** Object:  Table [dbo].[Ignition_OnOff]    Script Date: 01/09/2017 11:10:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ignition_OnOff](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[carrierFId] [int] NOT NULL,
	[time] [datetime] NOT NULL,
	[latitude] [float] NULL,
	[longitude] [float] NULL,
	[speed] [float] NULL,
	[Din1] [int] NULL,
 CONSTRAINT [PK_Ignition_OnOff] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [index_igonoffcarrierid] ON [dbo].[Ignition_OnOff] 
(
	[carrierFId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[prc_daySummary]    Script Date: 01/09/2017 11:10:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Vijay
-- Create date: 10-02-2012
-- Description:	<Description,,>
-- =============================================
-- prc_daySummary 19,'2012-03-18 00:00:00.000','2012-03-18 23:59:59.000'
-- prc_daySummary 9,'2012-02-09 00:00:00.000','2012-02-09 23:59:59.000'
-- prc_daySummary 4,'2012-03-13 00:00:00.000','2012-03-13 23:59:59.000'
CREATE PROCEDURE [dbo].[prc_daySummary]
	-- Add the parameters for the stored procedure here
	@vehID int,
	@dateStart datetime,
	@dateEnd datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Declare @temp as table
	(
		SrNo int,dates datetime,lat float,long float
	)
	
	Declare @result as table
	(
		SrNo int,dateOn datetime,latOn float,longOn float,dateOff datetime,latOff float,longOff float,MaxSpeed float,KmsTravelled float
	)
	
	
	
	Insert into @result (SrNo,dateOn,latOn,longOn,MaxSpeed)
    select top 1 ROW_Number() over(order by id),time,latitude,longitude,(select MAX(speed) from [mts].[dbo].[mts] where [carrierFId] = @vehID and (time between @dateStart and @dateEnd)) from [mts].[dbo].[Ignition_OnOff] where [carrierFId] = @vehID and (time between @dateStart and @dateEnd)
	   -- select top 1 ROW_Number() over(order by id),time,latitude,longitude,(select MAX(speed) from [mts].[dbo].[Ignition_OnOff] where carrierFId = '4' and (time between '2012-03-13 00:00:00.000' and '2012-03-13 23:59:59.000')) from [mts].[dbo].[Ignition_OnOff] where [carrierFId] = 4 and (time between '2012-03-13 00:00:00.000' and '2012-03-13 23:59:59.000')
	
	
	--declare @dt1 datetime, @dt2 datetime
	--set @dt1  = (select top 1 time from [Ignition_OnOff] where (time between @dateStart and @dateEnd) and Din1 = 0 and [carrierFId] = 9 order by time desc)
	--set @dt2 =  (select top 1 time from [Ignition_OnOff] where (time between @dateStart and @dateEnd) and Din1 = 0 and [carrierFId] = 9 order by time desc)
	
	--update @result set KmsTravelled = (select sum(datediff(mi,@dt1,@dt2)))
	
	update @result set dateOff =(select top 1 time from [Ignition_OnOff] where [carrierFId] = @vehID and (time between @dateStart  and @dateEnd ) order by time desc), 
					   latOff = (select top 1 latitude from [Ignition_OnOff] where   [carrierFId] = @vehID and (time between @dateStart  and @dateEnd ) order by time desc),
					   longOff = (select top 1 longitude from [Ignition_OnOff] where  [carrierFId] = @vehID and (time between @dateStart  and @dateEnd ) order by time desc)
					   where srno = 1
						

	--insert into @temp
	--	select  ROW_Number() over(order by id),time,latitude,longitude from [Ignition_OnOff] where speed > 4
		
	--select  dateOn as DateStart ,dateOff as DateOff ,MaxSpeed  from @result
	select  * from @result
		
	
END
GO
/****** Object:  StoredProcedure [dbo].[getSOS]    Script Date: 01/09/2017 11:10:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getSOS]
	
AS
BEGIN
	select C.carrierName,SG.GcmId,Time from SOSAlerts SA
	inner join carrier C on C.carrierID=SA.CarrierFId
	inner join SOSGCMs SG on  SA.CarrierFId=SG.CarrierFId
	
	--delete from SOSAlerts;
	
END
GO
/****** Object:  StoredProcedure [dbo].[insertAlertNumber]    Script Date: 01/09/2017 11:10:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[insertAlertNumber] 
	@vehicleFId int,
	@alertId int,
	@number nvarchar(50)
AS
BEGIN
	insert into alertNumbers(carrierFId,contactNumber,alertFId,active)
	values(@vehicleFId,@number,@alertId,1);
	
END
GO
/****** Object:  StoredProcedure [dbo].[getSmsAlerts]    Script Date: 01/09/2017 11:10:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getSmsAlerts]
AS
BEGIN
	select smsId, alertMessage,alertTime,c.carrierName,An.contactNumber,lat,long from smsAlerts SA
	inner join alerts A on A.alertId=SA.alertFid
	inner join carrier C on C.carrierID=SA.carrierFid
	inner join alertNumbers An on An.carrierFId =SA.carrierFid and An.alertFId=SA.alertFid
	WHERE An.active=1;
	
	
	
END
GO
/****** Object:  Table [dbo].[geoStatus]    Script Date: 01/09/2017 11:10:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[geoStatus](
	[rptId] [int] IDENTITY(1,1) NOT NULL,
	[geoFId] [int] NULL,
	[time] [datetime] NULL,
	[lat] [float] NULL,
	[long] [float] NULL,
	[geoStat] [int] NULL,
	[insertTime] [datetime] NULL,
 CONSTRAINT [PK_geoStatus] PRIMARY KEY CLUSTERED 
(
	[rptId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[geoPoints]    Script Date: 01/09/2017 11:10:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[geoPoints](
	[pointId] [int] IDENTITY(1,1) NOT NULL,
	[geoFId] [int] NULL,
	[geoSerial] [int] NULL,
	[lat] [float] NULL,
	[long] [float] NULL,
	[width] [float] NULL,
 CONSTRAINT [PK_geoPoints] PRIMARY KEY CLUSTERED 
(
	[pointId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[emailAlerts]    Script Date: 01/09/2017 11:10:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[emailAlerts](
	[emailId] [int] IDENTITY(1,1) NOT NULL,
	[emailFId] [int] NOT NULL,
	[alertFId] [int] NOT NULL,
	[alertTime] [date] NULL,
	[carrierFid] [int] NULL,
 CONSTRAINT [PK_emailAlerts] PRIMARY KEY CLUSTERED 
(
	[emailId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[rpt_prc_WorkingTime]    Script Date: 01/09/2017 11:10:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		vijay
-- Create date: 03-02-2012
-- Description:	<Description,,>
-- =============================================
/* 
	rpt_prc_WorkingTime 4,'2012-03-12 00:00:00','2012-03-12 23:59:59',1
	rpt_prc_WorkingTime 4,'2012-02-09 00:00:00','2012-02-09 23:59:59',0
*/

CREATE PROCEDURE [dbo].[rpt_prc_WorkingTime]
	@carrier_id int,
	@dateStart varchar(50), -- '2012-01-22'  
	@dateStop varchar(50), -- '2012-01-22'  
	@onOff int
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets froms
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	/*07-02-2012 Vijay */
	-- -- OLD Version
	--Declare @cnt as int
	--Declare @counter as int

	--Declare @temp as table
	--(
	--	SrNo int,dates datetime 
	--)

	--Declare @result as table
	--(
	--	SrNo int,dates datetime,dates2 datetime	
	--)
	
	---- adding data to temp table
 --   insert into @temp 
	-- select  ROW_NUMBER() OVER (ORDER BY [Id]) As SrNo, time FROM Ignition_OnOff
	-- where carrierFId=@carrier_id  and Din1=@onOff and Ignition_OnOff.time between @dateStart and @dateStop order by time asc
	 
	-- set @cnt=(select COUNT(SrNo)from @temp )
	-- set @counter =1
	 
	-- while(@cnt> @counter)
	-- begin
	--	insert into @result 
	--		select SrNo,dates,(select dates from @temp where SrNo = @counter+1)from @temp where SrNo = @counter
			
	--	set @counter = @counter + 1
	-- end
	
	----calculate time
			
	--	--select * from @temp	
	--	--select * from @result	
			
	--	SELECT Cast(Floor(Cast(dates As Float)) As DateTime) as Date,sum(DATEDIFF(mi,dates,dates2)) as workingTime
	--	FROM @result
	--	group by Cast(Floor(Cast(dates As Float)) As DateTime)

 ---- End old
	
	---new
	
	Declare @cnt1 as int
	Declare @counter1 as int
	Declare @UpID int

	Declare @result1 as table
	(
		SrNo int,dateOn datetime ,latOn float,longOn float,dateOff datetime ,latOff float,longOff float
	)

	Declare @temp1 as table
	(
		SrNo int,dates datetime,lat float,long float
	)
	
	insert into @temp1	
	   SELECT ROW_NUMBER() OVER (ORDER BY [Id]) As SrNo,[time],[latitude],[longitude]
	   FROM [mts].[dbo].[Ignition_OnOff]
	   where  [carrierFId] = @carrier_id and ([time] between @dateStart and @dateStop) order by time asc

	set @counter1 = (select COUNT(SrNo) from @temp1)
	set @cnt1 = 1
	
	while(@counter1 >= @cnt1)
	begin
		if(@cnt1%2 != 0)
		begin
			insert into @result1(SrNo,dateOn,latOn,longOn)
				select SrNo,dates,lat,long from @temp1 where SrNo = @cnt1
			set @UpID = @cnt1 
			set @cnt1 = @cnt1 + 1
		end
		else
		begin
			update @result1 set dateOff = (select dates from @temp1 where SrNo = @cnt1 ),
			latOff = (select lat from @temp1 where SrNo = @cnt1 ),
			longOff = (select long from @temp1 where SrNo = @cnt1 ) where SrNo = @UpID
			set @cnt1 = @cnt1 + 1
		end
	end
	
	--select * from @temp
	--select * from @result
	
	--select dateOn ,latOn,longOn,latOff,longOff,dateOff,sum(DATEDIFF(mi,dateOn,dateOff))as WorkingTime 
	--from @result1
	--Group by dateOn,latOn,longOn,dateOff,latOff,longOff
	

	select  Cast(Floor(Cast(dateOn  As Float)) As DateTime) as Date,sum(DATEDIFF(mi,dateOn,dateOff))as WorkingTime 
	from @result1
	Group by Cast(Floor(Cast(dateOn  As Float)) As DateTime)
		
  
END
GO
/****** Object:  StoredProcedure [dbo].[rpt_prc_BoldStop]    Script Date: 01/09/2017 11:10:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		vijay
-- Create date: 03-02-2012
-- Description:	<Description,,>
-- =============================================
/* 
	rpt_prc_BoldStop 9,'2012-02-06 00:00:00','2012-02-07 23:59:59'
	
*/

CREATE PROCEDURE [dbo].[rpt_prc_BoldStop]
	@carrier_id int,
	@dateStart varchar(50), -- '2012-01-22'  
	@dateStop varchar(50) -- '2012-01-22'  
	
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets froms
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	/*07-02-2012 Vijay */
	
	Declare @cnt as int
	Declare @counter as int

	Declare @temp as table
	(
		SrNo int,dates datetime,ign int , lat float, lng float
	)

	Declare @result as table
	(
		SrNo int,dates datetime,dates2 datetime	
	)
	
	-- adding data to temp table
    insert into @temp 
	 select  ROW_NUMBER() OVER (ORDER BY [Id]) As SrNo, time ,Din1 , latitude, longitude  FROM Ignition_OnOff
	 where carrierFId=@carrier_id   and Ignition_OnOff.time between @dateStart and @dateStop
	 
	 set @cnt=(select COUNT(SrNo)from @temp )
	 set @counter =1
	 
	 while(@cnt> @counter)
	 begin
		insert into @result 
			select SrNo,dates,(select dates from @temp where SrNo = @counter+1)from @temp where SrNo = @counter
			
		set @counter = @counter + 1
	 end
	
	--calculate time
			
		SELECT Cast(Floor(Cast(dates As Float)) As DateTime) as dateT,sum(DATEDIFF(mi,dates,dates2)) as workingTime
		FROM @result
		group by Cast(Floor(Cast(dates As Float)) As DateTime)
		
	select * from @temp
		
	
	--select * from @temp
	--select * from @result
		
  
END
GO
/****** Object:  StoredProcedure [dbo].[parserGetgeofence]    Script Date: 01/09/2017 11:10:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		virus
-- Create date: 22 june 2012
-- Description:	selects all geofences for a carrier
-- =============================================
CREATE PROCEDURE [dbo].[parserGetgeofence] 
	
	@carrierId int
AS
BEGIN
	SELECT fenceId,fenceName,fenceType,centerlat,centerlong,fenceRadius,lastStatus FROM Geofencing WHERE carrierFId=@carrierId;
END
GO
/****** Object:  StoredProcedure [dbo].[parserUpdateGeofenceStatus]    Script Date: 01/09/2017 11:10:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		virus
-- Create date: 22 june 2012
-- Description:	update geofence Status
-- =============================================
create PROCEDURE [dbo].[parserUpdateGeofenceStatus] 
	@status int,
	@fenceId int
	
AS
BEGIN
	UPDATE Geofencing
SET lastStatus=@status
WHERE fenceId=@fenceId	
END
GO
/****** Object:  StoredProcedure [dbo].[prc_relCarrierGeofence_manage]    Script Date: 01/09/2017 11:10:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

-- [FetchGofenceData] 16 0
CREATE PROCEDURE [dbo].[prc_relCarrierGeofence_manage]
	-- Add the parameters for the stored procedure here
	
	   @fenceId int,
       @fenceName varchar(50),
       @fenceType int,
       @centerLat float,
       @centerLong float,
       @fenceRadius float,
       @carrierFId int,
       @starttime varchar(50),
       @endtime varchar(50),
       @task int, --task 1 for insert ,2 for update & 3 for delete
       
       --output parameter
       @ret int OUTPUT
       
AS
BEGIN
if(@centerLat= 0)
set @centerLat=null

if(@centerLong=0)
set @centerLong=null

if(@fenceRadius =0)
set @fenceRadius=null

if(@starttime='0')
set @starttime= null 

if(@endtime='0')
set @endtime= null 


	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	--SET NOCOUNT ON;

    -- Insert statements for procedure here

    if(@task=1)
    begin
    insert into Geofencing(fenceName,fenceType,centerLat,centerLong,fenceRadius,carrierFId,alertStartTime,alertStopTime)
    values(@fenceName,@fenceType,@centerLat,@centerLong,@fenceRadius,@carrierFId,@starttime,@endtime)
	set @ret = SCOPE_IDENTITY()		
	end
	
	if(@task = 2)
	begin
	update Geofencing set fenceName=@fenceName, fenceRadius=@fenceRadius   ,centerLat=@centerLat ,centerLong=@centerLong, alertStartTime=@starttime where fenceId=@fenceId
	end
	else
	delete Geofencing where fenceId=@fenceId
  
	
	
END
GO
/****** Object:  StoredProcedure [dbo].[prc_NewrelCarrierGeofence_manage]    Script Date: 01/09/2017 11:10:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

-- [FetchGofenceData] 16 0
CREATE PROCEDURE [dbo].[prc_NewrelCarrierGeofence_manage]
	-- Add the parameters for the stored procedure here
	
	   @fenceId int,
       @fenceName varchar(50),
       @fenceType int,
       @centerLat float,
       @centerLong float,
       @fenceRadius float,
       @carrierFId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	--SET NOCOUNT ON;

    -- Insert statements for procedure here

    
    insert into Geofencing(fenceName,fenceType,centerLat,centerLong,fenceRadius,carrierFId)
    values(@fenceName,@fenceType,@centerLat,@centerLong,@fenceRadius,@carrierFId)
	
	
	
END
GO
/****** Object:  StoredProcedure [dbo].[prc_FetchCiruclarGEopoint]    Script Date: 01/09/2017 11:10:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Radhika
-- Create date: 
-- Description:	
-- =============================================

-- prc_FetchCiruclarGEopoint 4,1,123

CREATE PROCEDURE [dbo].[prc_FetchCiruclarGEopoint]
	-- Add the parameters for the stored procedure here
	@carrierFId int,
	@task int,
	@id int
	

	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
			SELECT * FROM  Geofencing 
			where carrierFId = @carrierFId and fenceType = @task and fenceId=@id 

END
GO
/****** Object:  StoredProcedure [dbo].[prc_IgnitionOnOffSeq]    Script Date: 01/09/2017 11:10:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

-- [prc_IgnitionOnOffSeq] 1,'2012-02-04 00:00:00.000','2012-02-04 23:59:59.000',9
CREATE PROCEDURE [dbo].[prc_IgnitionOnOffSeq]
	-- Add the parameters for the stored procedure here
	
	@dateStart datetime,
	@dateEnd datetime,
	@vehID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   SELECT [Id]
      
      ,[latitude]
      ,[longitude]
      ,[time]      
      ,[speed]
      ,[Din1]
  FROM [mts].[dbo].[Ignition_OnOff]
  where   [carrierFId] = @vehID  and([time] between @dateStart and @dateEnd)


	
END
GO
/****** Object:  StoredProcedure [dbo].[prc_Geopoint_manage]    Script Date: 01/09/2017 11:10:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

-- [FetchGofenceData] 16 0
CREATE PROCEDURE [dbo].[prc_Geopoint_manage]
	-- Add the parameters for the stored procedure here
	
	    @geoFId int,
       @geoSerial int, 
       @lat float,
       @long float,
       @width float,
       
       @task int,
       @pointid int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	--SET NOCOUNT ON;

    -- Insert statements for procedure here
    if(@geoFId=0)
    set @geoFId= null
    
     if(@geoSerial=0)
    set @geoSerial= null
    
     if(@lat=0.0)
    set @lat= null
    
     if(@long=0.0)
    set @long= null
    
     if(@width=0.0)
    set @width= null
    

    if(@task=1)
    begin
      insert into geoPoints (geoFId,geoSerial,lat,long,width) values(@geoFId ,@geoSerial,@lat,@long ,@width )
    end
   if(@task=2)
   begin
	 update geoPoints set lat=@lat, long= @long where pointId= @pointid
   end
   else
   begin
	 delete geoPoints where geoFId=@geoFId
   end
	
	
	
END
GO
/****** Object:  StoredProcedure [dbo].[prc_Geoint_manage]    Script Date: 01/09/2017 11:10:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

-- [prc_Geoint_manage] 112 , 1,11.11,11.11,1,1,0
CREATE PROCEDURE [dbo].[prc_Geoint_manage]
	-- Add the parameters for the stored procedure here
	
	   @geoFId int,
       @geoSerial int, 
       @lat float,
       @long float,
       @width float,
       @task int,
       @id int
      
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	--SET NOCOUNT ON;

    -- Insert statements for procedure here

   if(@task=1)
   begin
   insert into geoPoints (geoFId,geoSerial,lat,long,width) values(@geoFId,@geoSerial,@lat,@long,@width)
   end
   
   if(@task=2)
   begin
   update geoPoints set geoSerial=@geoSerial,lat=@lat,long=@long ,width=@width where pointId =@id
   end
   
   if(@task=3)
   
   begin
   delete from geopoints  where geoFId=@geoFId 
   end
	
	
	
END
GO
/****** Object:  StoredProcedure [dbo].[prc_Fetchpolygeo]    Script Date: 01/09/2017 11:10:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Radhika
-- Create date: 
-- Description:	
-- =============================================

-- prc_Fetchpolygeo 1,3

CREATE PROCEDURE [dbo].[prc_Fetchpolygeo]
	-- Add the parameters for the stored procedure here
	
	@carrierFId int,
	@task int,
	@fence_id int
	
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	if(@task = 3)
	begin 
		select geoPoints.pointId, Geofencing.fenceName ,Geofencing.fenceId, geoPoints.lat , geoPoints.long from geoPoints inner join Geofencing ON
			geoPoints.geoFId = Geofencing.fenceId and Geofencing.carrierFId= @carrierFId and fenceType = @task and fenceId=@fence_id
	end
	else	begin
	select distinct  Geofencing.fenceName, Geofencing.fenceId  from geoPoints inner join Geofencing ON
			geoPoints.geoFId = Geofencing.fenceId and Geofencing.carrierFId= @carrierFId and fenceType = 3
	end
	
END
GO
/****** Object:  StoredProcedure [dbo].[prc_FetchCiruclarGEo]    Script Date: 01/09/2017 11:10:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Radhika
-- Create date: 
-- Description:	
-- =============================================

-- prc_FetchCiruclarGEo 4,2

CREATE PROCEDURE [dbo].[prc_FetchCiruclarGEo]
	
	@carrierFId int,
	@task int
	

	
AS
BEGIN
	SET NOCOUNT ON;    
	if(@task = 1)
	begin
			SELECT * FROM  Geofencing 
			where carrierFId = @carrierFId and fenceType = 1
	end
		else
	begin
			select geoPoints.pointId , Geofencing.fenceName ,Geofencing.fenceId, geoPoints.lat , geoPoints.long from geoPoints inner join Geofencing ON
			geoPoints.geoFId = Geofencing.fenceId and Geofencing.carrierFId= @carrierFId and fenceType = @task
	end		
	
END
GO
/****** Object:  StoredProcedure [dbo].[parserGetGeoPoints]    Script Date: 01/09/2017 11:10:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		virus
-- Create date: 22 june 2012
-- Description:	selects all geopoints for a fenceId
-- =============================================
CREATE PROCEDURE [dbo].[parserGetGeoPoints] 
	
	@fenceId int
AS
BEGIN
	SELECT pointId,geoSerial,lat,long FROM geoPoints where geoFId=@fenceId
END
GO
/****** Object:  Default [DF_rawDataGS503_lbsLocation]    Script Date: 01/09/2017 11:10:01 ******/
ALTER TABLE [dbo].[rawDataGS503] ADD  CONSTRAINT [DF_rawDataGS503_lbsLocation]  DEFAULT ((0)) FOR [lbsLocation]
GO
/****** Object:  Default [DF_users_CompanyLimit]    Script Date: 01/09/2017 11:10:02 ******/
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [DF_users_CompanyLimit]  DEFAULT ((1)) FOR [CompanyLimit]
GO
/****** Object:  Default [DF_users_Status]    Script Date: 01/09/2017 11:10:02 ******/
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [DF_users_Status]  DEFAULT ('A') FOR [Status]
GO
/****** Object:  Default [DF_organisation_SmsNumberLimits]    Script Date: 01/09/2017 11:10:02 ******/
ALTER TABLE [dbo].[organisation] ADD  CONSTRAINT [DF_organisation_SmsNumberLimits]  DEFAULT ((2)) FOR [SmsNumberLimits]
GO
/****** Object:  Default [DF_organisation_orgLimit]    Script Date: 01/09/2017 11:10:02 ******/
ALTER TABLE [dbo].[organisation] ADD  CONSTRAINT [DF_organisation_orgLimit]  DEFAULT ((1)) FOR [orgLimit]
GO
/****** Object:  Default [DF_carrier_digIgnitionUsed]    Script Date: 01/09/2017 11:10:02 ******/
ALTER TABLE [dbo].[carrier] ADD  CONSTRAINT [DF_carrier_digIgnitionUsed]  DEFAULT ((0)) FOR [digIgnitionUsed]
GO
/****** Object:  Default [DF_Geofencing_lastStatus]    Script Date: 01/09/2017 11:10:03 ******/
ALTER TABLE [dbo].[Geofencing] ADD  CONSTRAINT [DF_Geofencing_lastStatus]  DEFAULT ((0)) FOR [lastStatus]
GO
/****** Object:  ForeignKey [FK_lastLog_carrier]    Script Date: 01/09/2017 11:10:01 ******/
ALTER TABLE [dbo].[lastLog]  WITH CHECK ADD  CONSTRAINT [FK_lastLog_carrier] FOREIGN KEY([carrierFId])
REFERENCES [dbo].[carrier] ([carrierID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[lastLog] CHECK CONSTRAINT [FK_lastLog_carrier]
GO
/****** Object:  ForeignKey [FK_smsAlerts_alerts]    Script Date: 01/09/2017 11:10:02 ******/
ALTER TABLE [dbo].[smsAlerts]  WITH CHECK ADD  CONSTRAINT [FK_smsAlerts_alerts] FOREIGN KEY([alertFid])
REFERENCES [dbo].[alerts] ([alertId])
GO
ALTER TABLE [dbo].[smsAlerts] CHECK CONSTRAINT [FK_smsAlerts_alerts]
GO
/****** Object:  ForeignKey [FK_DeviceDetails_UserDetails]    Script Date: 01/09/2017 11:10:02 ******/
ALTER TABLE [dbo].[DeviceDetails]  WITH CHECK ADD  CONSTRAINT [FK_DeviceDetails_UserDetails] FOREIGN KEY([userFid])
REFERENCES [dbo].[UserDetails] ([UserID])
GO
ALTER TABLE [dbo].[DeviceDetails] CHECK CONSTRAINT [FK_DeviceDetails_UserDetails]
GO
/****** Object:  ForeignKey [FK_organisation_Company]    Script Date: 01/09/2017 11:10:02 ******/
ALTER TABLE [dbo].[organisation]  WITH CHECK ADD  CONSTRAINT [FK_organisation_Company] FOREIGN KEY([companyFId])
REFERENCES [dbo].[Company] ([companyID])
GO
ALTER TABLE [dbo].[organisation] CHECK CONSTRAINT [FK_organisation_Company]
GO
/****** Object:  ForeignKey [FK_credentials_Company]    Script Date: 01/09/2017 11:10:02 ******/
ALTER TABLE [dbo].[credentials]  WITH CHECK ADD  CONSTRAINT [FK_credentials_Company] FOREIGN KEY([companyFId])
REFERENCES [dbo].[Company] ([companyID])
GO
ALTER TABLE [dbo].[credentials] CHECK CONSTRAINT [FK_credentials_Company]
GO
/****** Object:  ForeignKey [FK_credentials_organisation]    Script Date: 01/09/2017 11:10:02 ******/
ALTER TABLE [dbo].[credentials]  WITH CHECK ADD  CONSTRAINT [FK_credentials_organisation] FOREIGN KEY([orgFId])
REFERENCES [dbo].[organisation] ([orgId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[credentials] CHECK CONSTRAINT [FK_credentials_organisation]
GO
/****** Object:  ForeignKey [FK_credentials_userRoles]    Script Date: 01/09/2017 11:10:02 ******/
ALTER TABLE [dbo].[credentials]  WITH CHECK ADD  CONSTRAINT [FK_credentials_userRoles] FOREIGN KEY([roleFId])
REFERENCES [dbo].[userRoles] ([roleId])
GO
ALTER TABLE [dbo].[credentials] CHECK CONSTRAINT [FK_credentials_userRoles]
GO
/****** Object:  ForeignKey [FK_carrier_Company]    Script Date: 01/09/2017 11:10:02 ******/
ALTER TABLE [dbo].[carrier]  WITH CHECK ADD  CONSTRAINT [FK_carrier_Company] FOREIGN KEY([companyFId])
REFERENCES [dbo].[Company] ([companyID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[carrier] CHECK CONSTRAINT [FK_carrier_Company]
GO
/****** Object:  ForeignKey [FK_carrier_organisation]    Script Date: 01/09/2017 11:10:02 ******/
ALTER TABLE [dbo].[carrier]  WITH CHECK ADD  CONSTRAINT [FK_carrier_organisation] FOREIGN KEY([orgFId])
REFERENCES [dbo].[organisation] ([orgId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[carrier] CHECK CONSTRAINT [FK_carrier_organisation]
GO
/****** Object:  ForeignKey [FK_carrier_timeZone]    Script Date: 01/09/2017 11:10:02 ******/
ALTER TABLE [dbo].[carrier]  WITH CHECK ADD  CONSTRAINT [FK_carrier_timeZone] FOREIGN KEY([zoneFId])
REFERENCES [dbo].[timeZone] ([zoneId])
GO
ALTER TABLE [dbo].[carrier] CHECK CONSTRAINT [FK_carrier_timeZone]
GO
/****** Object:  ForeignKey [FK_carrier_trackType]    Script Date: 01/09/2017 11:10:02 ******/
ALTER TABLE [dbo].[carrier]  WITH CHECK ADD  CONSTRAINT [FK_carrier_trackType] FOREIGN KEY([carrierTypeFId])
REFERENCES [dbo].[trackType] ([trackTypeID])
GO
ALTER TABLE [dbo].[carrier] CHECK CONSTRAINT [FK_carrier_trackType]
GO
/****** Object:  ForeignKey [FK_fleet_organisation]    Script Date: 01/09/2017 11:10:02 ******/
ALTER TABLE [dbo].[fleet]  WITH CHECK ADD  CONSTRAINT [FK_fleet_organisation] FOREIGN KEY([orgFId])
REFERENCES [dbo].[organisation] ([orgId])
GO
ALTER TABLE [dbo].[fleet] CHECK CONSTRAINT [FK_fleet_organisation]
GO
/****** Object:  ForeignKey [FK_alertNumbers_alerts]    Script Date: 01/09/2017 11:10:03 ******/
ALTER TABLE [dbo].[alertNumbers]  WITH CHECK ADD  CONSTRAINT [FK_alertNumbers_alerts] FOREIGN KEY([alertFId])
REFERENCES [dbo].[alerts] ([alertId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[alertNumbers] CHECK CONSTRAINT [FK_alertNumbers_alerts]
GO
/****** Object:  ForeignKey [FK_alertNumbers_carrier]    Script Date: 01/09/2017 11:10:03 ******/
ALTER TABLE [dbo].[alertNumbers]  WITH CHECK ADD  CONSTRAINT [FK_alertNumbers_carrier] FOREIGN KEY([carrierFId])
REFERENCES [dbo].[carrier] ([carrierID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[alertNumbers] CHECK CONSTRAINT [FK_alertNumbers_carrier]
GO
/****** Object:  ForeignKey [FK_EmailContacts_carrier]    Script Date: 01/09/2017 11:10:03 ******/
ALTER TABLE [dbo].[EmailContacts]  WITH CHECK ADD  CONSTRAINT [FK_EmailContacts_carrier] FOREIGN KEY([carrierFId])
REFERENCES [dbo].[carrier] ([carrierID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EmailContacts] CHECK CONSTRAINT [FK_EmailContacts_carrier]
GO
/****** Object:  ForeignKey [FK_Geofencing_carrier]    Script Date: 01/09/2017 11:10:03 ******/
ALTER TABLE [dbo].[Geofencing]  WITH CHECK ADD  CONSTRAINT [FK_Geofencing_carrier] FOREIGN KEY([carrierFId])
REFERENCES [dbo].[carrier] ([carrierID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Geofencing] CHECK CONSTRAINT [FK_Geofencing_carrier]
GO
/****** Object:  ForeignKey [FK_Ignition_OnOff_carrier]    Script Date: 01/09/2017 11:10:03 ******/
ALTER TABLE [dbo].[Ignition_OnOff]  WITH CHECK ADD  CONSTRAINT [FK_Ignition_OnOff_carrier] FOREIGN KEY([carrierFId])
REFERENCES [dbo].[carrier] ([carrierID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Ignition_OnOff] CHECK CONSTRAINT [FK_Ignition_OnOff_carrier]
GO
/****** Object:  ForeignKey [FK_geoStatus_Geofencing]    Script Date: 01/09/2017 11:10:03 ******/
ALTER TABLE [dbo].[geoStatus]  WITH CHECK ADD  CONSTRAINT [FK_geoStatus_Geofencing] FOREIGN KEY([geoFId])
REFERENCES [dbo].[Geofencing] ([fenceId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[geoStatus] CHECK CONSTRAINT [FK_geoStatus_Geofencing]
GO
/****** Object:  ForeignKey [FK_geoPoints_Geofencing]    Script Date: 01/09/2017 11:10:03 ******/
ALTER TABLE [dbo].[geoPoints]  WITH CHECK ADD  CONSTRAINT [FK_geoPoints_Geofencing] FOREIGN KEY([geoFId])
REFERENCES [dbo].[Geofencing] ([fenceId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[geoPoints] CHECK CONSTRAINT [FK_geoPoints_Geofencing]
GO
/****** Object:  ForeignKey [FK_emailAlerts_alerts]    Script Date: 01/09/2017 11:10:03 ******/
ALTER TABLE [dbo].[emailAlerts]  WITH CHECK ADD  CONSTRAINT [FK_emailAlerts_alerts] FOREIGN KEY([alertFId])
REFERENCES [dbo].[alerts] ([alertId])
GO
ALTER TABLE [dbo].[emailAlerts] CHECK CONSTRAINT [FK_emailAlerts_alerts]
GO
/****** Object:  ForeignKey [FK_emailAlerts_EmailContacts]    Script Date: 01/09/2017 11:10:03 ******/
ALTER TABLE [dbo].[emailAlerts]  WITH CHECK ADD  CONSTRAINT [FK_emailAlerts_EmailContacts] FOREIGN KEY([emailFId])
REFERENCES [dbo].[EmailContacts] ([EmailId])
GO
ALTER TABLE [dbo].[emailAlerts] CHECK CONSTRAINT [FK_emailAlerts_EmailContacts]
GO
