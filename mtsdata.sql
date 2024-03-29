﻿USE [mts]
GO
/****** Object:  Table [dbo].[users]  
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
/****** Object:  Table [dbo].[userRoles]   
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
/****** Object:  Default [DF_users_CompanyLimit]   
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [DF_users_CompanyLimit]  DEFAULT ((1)) FOR [CompanyLimit]
GO
/****** Object:  Default [DF_users_Status]    
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [DF_users_Status]  DEFAULT ('A') FOR [Status]
GO
