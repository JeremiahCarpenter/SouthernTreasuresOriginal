USE [master]
GO
/****** Object:  Database [SouthernTreasures]    Script Date: 5/8/2019 16:59:01 ******/
CREATE DATABASE [SouthernTreasures]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SouthernTreasures', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\SouthernTreasures.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SouthernTreasures_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\SouthernTreasures_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SouthernTreasures] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SouthernTreasures].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SouthernTreasures] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SouthernTreasures] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SouthernTreasures] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SouthernTreasures] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SouthernTreasures] SET ARITHABORT OFF 
GO
ALTER DATABASE [SouthernTreasures] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SouthernTreasures] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SouthernTreasures] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SouthernTreasures] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SouthernTreasures] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SouthernTreasures] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SouthernTreasures] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SouthernTreasures] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SouthernTreasures] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SouthernTreasures] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SouthernTreasures] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SouthernTreasures] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SouthernTreasures] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SouthernTreasures] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SouthernTreasures] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SouthernTreasures] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SouthernTreasures] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SouthernTreasures] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SouthernTreasures] SET  MULTI_USER 
GO
ALTER DATABASE [SouthernTreasures] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SouthernTreasures] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SouthernTreasures] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SouthernTreasures] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [SouthernTreasures] SET DELAYED_DURABILITY = DISABLED 
GO
USE [SouthernTreasures]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 5/8/2019 16:59:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LogTrace]    Script Date: 5/8/2019 16:59:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogTrace](
	[[LOG ID] [int] IDENTITY(1,1) NOT NULL,
	[Message] [nvarchar](250) NULL,
	[Trace] [nvarchar](max) NULL,
	[Time] [datetime] NULL,
 CONSTRAINT [PK_LogTrace] PRIMARY KEY CLUSTERED 
(
	[[LOG ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Offers]    Script Date: 5/8/2019 16:59:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Offers](
	[OfferID] [int] IDENTITY(1,1) NOT NULL,
	[OfferPrice] [decimal](18, 2) NOT NULL,
	[UserID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[OfferInfo] [int] NOT NULL,
 CONSTRAINT [PK_Offers] PRIMARY KEY CLUSTERED 
(
	[OfferID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Products]    Script Date: 5/8/2019 16:59:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](50) NOT NULL,
	[ProductDescription] [nvarchar](max) NOT NULL,
	[MinimumPrice] [decimal](18, 2) NOT NULL,
	[CategoryID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 5/8/2019 16:59:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(100,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Role] [nvarchar](50) NOT NULL,
	[EmailAddress] [nvarchar](50) NOT NULL,
	[CreditInfo] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (1, N'Books')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (2, N'Magazines')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (3, N'Apparel')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (4, N'Miscelleaneous')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (6, N'AllesMoegliche')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (10, N'DVD')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (11, N'CD ROM')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (15, N'more')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (19, N'Records')
SET IDENTITY_INSERT [dbo].[Categories] OFF
SET IDENTITY_INSERT [dbo].[LogTrace] ON 

INSERT [dbo].[LogTrace] ([[LOG ID], [Message], [Trace], [Time]) VALUES (1, N'The DELETE statement conflicted with the REFERENCE constraint "FK_Offers_Users". The conflict occurred in database "SouthernTreasures", table "dbo.Offers", column ''UserID''.
The statement has been terminated.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at SouthernTreasuresDAL.DALContext.DeleteUser(Int32 UserId) in C:\Users\Onshore\source\repos\SouthernTreasuresDAL\SouthernTreasuresDAL\DALContext.cs:line 259', CAST(N'2019-05-02T16:14:03.400' AS DateTime))
INSERT [dbo].[LogTrace] ([[LOG ID], [Message], [Trace], [Time]) VALUES (2, N'The DELETE statement conflicted with the REFERENCE constraint "FK_Offers_Users". The conflict occurred in database "SouthernTreasures", table "dbo.Offers", column ''UserID''.
The statement has been terminated.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at SouthernTreasuresDAL.DALContext.DeleteUser(Int32 UserId) in C:\Users\Onshore\source\repos\SouthernTreasuresDAL\SouthernTreasuresDAL\DALContext.cs:line 264
   at SouthernTreasuresBLL.BLLContext.DeleteUser(Int32 UserID) in C:\Users\Onshore\source\repos\SouthernTreasuresDAL\SouthernTreasuresBLL\BLLContext.cs:line 199
   at SouthernTreasures.Controllers.UserController.Delete(Int32 id, UserBLL user) in C:\Users\Onshore\source\repos\SouthernTreasuresDAL\SouthernTreasures\Controllers\UserController.cs:line 128', CAST(N'2019-05-02T16:14:03.590' AS DateTime))
INSERT [dbo].[LogTrace] ([[LOG ID], [Message], [Trace], [Time]) VALUES (3, N'The DELETE statement conflicted with the REFERENCE constraint "FK_Offers_Users". The conflict occurred in database "SouthernTreasures", table "dbo.Offers", column ''UserID''.
The statement has been terminated.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at SouthernTreasuresDAL.DALContext.DeleteUser(Int32 UserId) in C:\Users\Onshore\source\repos\SouthernTreasuresDAL\SouthernTreasuresDAL\DALContext.cs:line 259', CAST(N'2019-05-02T16:26:04.820' AS DateTime))
INSERT [dbo].[LogTrace] ([[LOG ID], [Message], [Trace], [Time]) VALUES (4, N'The DELETE statement conflicted with the REFERENCE constraint "FK_Offers_Users". The conflict occurred in database "SouthernTreasures", table "dbo.Offers", column ''UserID''.
The statement has been terminated.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at SouthernTreasuresDAL.DALContext.DeleteUser(Int32 UserId) in C:\Users\Onshore\source\repos\SouthernTreasuresDAL\SouthernTreasuresDAL\DALContext.cs:line 264
   at SouthernTreasuresBLL.BLLContext.DeleteUser(Int32 UserID) in C:\Users\Onshore\source\repos\SouthernTreasuresDAL\SouthernTreasuresBLL\BLLContext.cs:line 199
   at SouthernTreasures.Controllers.UserController.Delete(Int32 id, UserBLL user) in C:\Users\Onshore\source\repos\SouthernTreasuresDAL\SouthernTreasures\Controllers\UserController.cs:line 128', CAST(N'2019-05-02T16:26:04.840' AS DateTime))
INSERT [dbo].[LogTrace] ([[LOG ID], [Message], [Trace], [Time]) VALUES (5, N'This is the custom error message only seen by administrators', N'   at SouthernTreasures.Controllers.SharedController.Error() in C:\Users\Onshore\source\repos\SouthernTreasuresDAL\SouthernTreasures\Controllers\SharedController.cs:line 20', CAST(N'2019-05-02T16:34:20.193' AS DateTime))
INSERT [dbo].[LogTrace] ([[LOG ID], [Message], [Trace], [Time]) VALUES (6, N'This is the custom error message only seen by administrators', N'   at SouthernTreasures.Controllers.SharedController.Error() in C:\Users\Onshore\source\repos\SouthernTreasuresDAL\SouthernTreasures\Controllers\SharedController.cs:line 20', CAST(N'2019-05-02T16:35:29.727' AS DateTime))
INSERT [dbo].[LogTrace] ([[LOG ID], [Message], [Trace], [Time]) VALUES (7, N'This is the custom error message only seen by administrators', N'   at SouthernTreasures.Controllers.SharedController.Error() in C:\Users\Onshore\source\repos\SouthernTreasuresDAL\SouthernTreasures\Controllers\SharedController.cs:line 20', CAST(N'2019-05-02T16:35:54.560' AS DateTime))
INSERT [dbo].[LogTrace] ([[LOG ID], [Message], [Trace], [Time]) VALUES (1006, N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Offers_Products". The conflict occurred in database "SouthernTreasures", table "dbo.Products", column ''ProductID''.
The statement has been terminated.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at SouthernTreasuresDAL.DALContext.InsertOffer(Int32 OfferID, Decimal OfferPrice, Int32 UserID, Int32 ProductID, DateTime StartTime, Int32 OfferInfo) in C:\Users\Onshore\source\repos\SouthernTreasuresDAL\SouthernTreasuresDAL\DALContext.cs:line 475', CAST(N'2019-05-08T08:22:12.810' AS DateTime))
INSERT [dbo].[LogTrace] ([[LOG ID], [Message], [Trace], [Time]) VALUES (1007, N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Offers_Products". The conflict occurred in database "SouthernTreasures", table "dbo.Products", column ''ProductID''.
The statement has been terminated.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at SouthernTreasuresDAL.DALContext.InsertOffer(Int32 OfferID, Decimal OfferPrice, Int32 UserID, Int32 ProductID, DateTime StartTime, Int32 OfferInfo) in C:\Users\Onshore\source\repos\SouthernTreasuresDAL\SouthernTreasuresDAL\DALContext.cs:line 480
   at SouthernTreasuresBLL.BLLContext.InsertOffer(Int32 OfferID, Decimal OfferPrice, Int32 UserID, Int32 ProductID, DateTime StartTime, Int32 OfferInfo) in C:\Users\Onshore\source\repos\SouthernTreasuresDAL\SouthernTreasuresBLL\BLLContext.cs:line 157
   at SouthernTreasures.Controllers.ProductsController.MakeOffer(Int32 id, OfferBLL offer) in C:\Users\Onshore\source\repos\SouthernTreasuresDAL\SouthernTreasures\Controllers\ProductsController.cs:line 207', CAST(N'2019-05-08T08:22:13.010' AS DateTime))
INSERT [dbo].[LogTrace] ([[LOG ID], [Message], [Trace], [Time]) VALUES (1008, N'SqlDateTime overflow. Must be between 1/1/1753 12:00:00 AM and 12/31/9999 11:59:59 PM.', N'   at System.Data.SqlClient.TdsParser.TdsExecuteRPC(SqlCommand cmd, _SqlRPC[] rpcArray, Int32 timeout, Boolean inSchema, SqlNotificationRequest notificationRequest, TdsParserStateObject stateObj, Boolean isCommandProc, Boolean sync, TaskCompletionSource`1 completion, Int32 startRpc, Int32 startParam)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at SouthernTreasuresDAL.DALContext.InsertOffer(Int32 OfferID, Decimal OfferPrice, Int32 UserID, Int32 ProductID, DateTime StartTime, Int32 OfferInfo) in C:\Users\Onshore\source\repos\SouthernTreasuresDAL\SouthernTreasuresDAL\DALContext.cs:line 475', CAST(N'2019-05-08T08:26:17.587' AS DateTime))
INSERT [dbo].[LogTrace] ([[LOG ID], [Message], [Trace], [Time]) VALUES (1009, N'SqlDateTime overflow. Must be between 1/1/1753 12:00:00 AM and 12/31/9999 11:59:59 PM.', N'   at System.Data.SqlClient.TdsParser.TdsExecuteRPC(SqlCommand cmd, _SqlRPC[] rpcArray, Int32 timeout, Boolean inSchema, SqlNotificationRequest notificationRequest, TdsParserStateObject stateObj, Boolean isCommandProc, Boolean sync, TaskCompletionSource`1 completion, Int32 startRpc, Int32 startParam)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at SouthernTreasuresDAL.DALContext.InsertOffer(Int32 OfferID, Decimal OfferPrice, Int32 UserID, Int32 ProductID, DateTime StartTime, Int32 OfferInfo) in C:\Users\Onshore\source\repos\SouthernTreasuresDAL\SouthernTreasuresDAL\DALContext.cs:line 480
   at SouthernTreasuresBLL.BLLContext.InsertOffer(Int32 OfferID, Decimal OfferPrice, Int32 UserID, Int32 ProductID, DateTime StartTime, Int32 OfferInfo) in C:\Users\Onshore\source\repos\SouthernTreasuresDAL\SouthernTreasuresBLL\BLLContext.cs:line 157
   at SouthernTreasures.Controllers.OfferController.Create(OfferBLL offer) in C:\Users\Onshore\source\repos\SouthernTreasuresDAL\SouthernTreasures\Controllers\OfferController.cs:line 49', CAST(N'2019-05-08T08:26:17.620' AS DateTime))
INSERT [dbo].[LogTrace] ([[LOG ID], [Message], [Trace], [Time]) VALUES (1010, N'Procedure or function ''SP_InsertProduct'' expects parameter ''@ProductName'', which was not supplied.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at SouthernTreasuresDAL.DALContext.InsertProduct(String ProductName, String ProductDescription, Decimal MinimumPrice, Int32 CategoryID, Int32 UserID) in C:\Users\Onshore\source\repos\SouthernTreasuresDAL\SouthernTreasuresDAL\DALContext.cs:line 358', CAST(N'2019-05-08T08:36:53.047' AS DateTime))
INSERT [dbo].[LogTrace] ([[LOG ID], [Message], [Trace], [Time]) VALUES (1011, N'Procedure or function ''SP_InsertProduct'' expects parameter ''@ProductName'', which was not supplied.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at SouthernTreasuresDAL.DALContext.InsertProduct(String ProductName, String ProductDescription, Decimal MinimumPrice, Int32 CategoryID, Int32 UserID) in C:\Users\Onshore\source\repos\SouthernTreasuresDAL\SouthernTreasuresDAL\DALContext.cs:line 363
   at SouthernTreasuresBLL.BLLContext.InsertProduct(String ProductName, String ProductDescription, Decimal MinimumPrice, Int32 CategoryID, Int32 UserID) in C:\Users\Onshore\source\repos\SouthernTreasuresDAL\SouthernTreasuresBLL\BLLContext.cs:line 105
   at SouthernTreasures.Controllers.ProductsController.Create(ProductsBLL products) in C:\Users\Onshore\source\repos\SouthernTreasuresDAL\SouthernTreasures\Controllers\ProductsController.cs:line 53', CAST(N'2019-05-08T08:36:53.120' AS DateTime))
INSERT [dbo].[LogTrace] ([[LOG ID], [Message], [Trace], [Time]) VALUES (1012, N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Products_Categories". The conflict occurred in database "SouthernTreasures", table "dbo.Categories", column ''CategoryID''.
The statement has been terminated.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at SouthernTreasuresDAL.DALContext.InsertProduct(String ProductName, String ProductDescription, Decimal MinimumPrice, Int32 CategoryID, Int32 UserID) in C:\Users\Onshore\source\repos\SouthernTreasuresDAL\SouthernTreasuresDAL\DALContext.cs:line 358', CAST(N'2019-05-08T10:44:46.597' AS DateTime))
INSERT [dbo].[LogTrace] ([[LOG ID], [Message], [Trace], [Time]) VALUES (1013, N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Products_Categories". The conflict occurred in database "SouthernTreasures", table "dbo.Categories", column ''CategoryID''.
The statement has been terminated.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at SouthernTreasuresDAL.DALContext.InsertProduct(String ProductName, String ProductDescription, Decimal MinimumPrice, Int32 CategoryID, Int32 UserID) in C:\Users\Onshore\source\repos\SouthernTreasuresDAL\SouthernTreasuresDAL\DALContext.cs:line 363
   at SouthernTreasuresBLL.BLLContext.InsertProduct(String ProductName, String ProductDescription, Decimal MinimumPrice, Int32 CategoryID, Int32 UserID) in C:\Users\Onshore\source\repos\SouthernTreasuresDAL\SouthernTreasuresBLL\BLLContext.cs:line 105
   at SouthernTreasures.Controllers.ProductsController.Create(ProductsBLL products) in C:\Users\Onshore\source\repos\SouthernTreasuresDAL\SouthernTreasures\Controllers\ProductsController.cs:line 53', CAST(N'2019-05-08T10:44:46.703' AS DateTime))
INSERT [dbo].[LogTrace] ([[LOG ID], [Message], [Trace], [Time]) VALUES (1014, N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Products_Categories". The conflict occurred in database "SouthernTreasures", table "dbo.Categories", column ''CategoryID''.
The statement has been terminated.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at SouthernTreasuresDAL.DALContext.InsertProduct(String ProductName, String ProductDescription, Decimal MinimumPrice, Int32 CategoryID, Int32 UserID) in C:\Users\Onshore\source\repos\SouthernTreasuresDAL\SouthernTreasuresDAL\DALContext.cs:line 358', CAST(N'2019-05-08T10:44:53.610' AS DateTime))
INSERT [dbo].[LogTrace] ([[LOG ID], [Message], [Trace], [Time]) VALUES (1015, N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Products_Categories". The conflict occurred in database "SouthernTreasures", table "dbo.Categories", column ''CategoryID''.
The statement has been terminated.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at SouthernTreasuresDAL.DALContext.InsertProduct(String ProductName, String ProductDescription, Decimal MinimumPrice, Int32 CategoryID, Int32 UserID) in C:\Users\Onshore\source\repos\SouthernTreasuresDAL\SouthernTreasuresDAL\DALContext.cs:line 363
   at SouthernTreasuresBLL.BLLContext.InsertProduct(String ProductName, String ProductDescription, Decimal MinimumPrice, Int32 CategoryID, Int32 UserID) in C:\Users\Onshore\source\repos\SouthernTreasuresDAL\SouthernTreasuresBLL\BLLContext.cs:line 105
   at SouthernTreasures.Controllers.ProductsController.Create(ProductsBLL products) in C:\Users\Onshore\source\repos\SouthernTreasuresDAL\SouthernTreasures\Controllers\ProductsController.cs:line 53', CAST(N'2019-05-08T10:44:53.633' AS DateTime))
INSERT [dbo].[LogTrace] ([[LOG ID], [Message], [Trace], [Time]) VALUES (1016, N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Products_Categories". The conflict occurred in database "SouthernTreasures", table "dbo.Categories", column ''CategoryID''.
The statement has been terminated.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at SouthernTreasuresDAL.DALContext.InsertProduct(String ProductName, String ProductDescription, Decimal MinimumPrice, Int32 CategoryID, Int32 UserID) in C:\Users\Onshore\source\repos\SouthernTreasuresDAL\SouthernTreasuresDAL\DALContext.cs:line 358', CAST(N'2019-05-08T10:44:59.923' AS DateTime))
INSERT [dbo].[LogTrace] ([[LOG ID], [Message], [Trace], [Time]) VALUES (1017, N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Products_Categories". The conflict occurred in database "SouthernTreasures", table "dbo.Categories", column ''CategoryID''.
The statement has been terminated.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at SouthernTreasuresDAL.DALContext.InsertProduct(String ProductName, String ProductDescription, Decimal MinimumPrice, Int32 CategoryID, Int32 UserID) in C:\Users\Onshore\source\repos\SouthernTreasuresDAL\SouthernTreasuresDAL\DALContext.cs:line 363
   at SouthernTreasuresBLL.BLLContext.InsertProduct(String ProductName, String ProductDescription, Decimal MinimumPrice, Int32 CategoryID, Int32 UserID) in C:\Users\Onshore\source\repos\SouthernTreasuresDAL\SouthernTreasuresBLL\BLLContext.cs:line 105
   at SouthernTreasures.Controllers.ProductsController.Create(ProductsBLL products) in C:\Users\Onshore\source\repos\SouthernTreasuresDAL\SouthernTreasures\Controllers\ProductsController.cs:line 53', CAST(N'2019-05-08T10:44:59.953' AS DateTime))
INSERT [dbo].[LogTrace] ([[LOG ID], [Message], [Trace], [Time]) VALUES (1018, N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Products_Users". The conflict occurred in database "SouthernTreasures", table "dbo.Users", column ''UserID''.
The statement has been terminated.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at SouthernTreasuresDAL.DALContext.InsertProduct(String ProductName, String ProductDescription, Decimal MinimumPrice, Int32 CategoryID, Int32 UserID) in C:\Users\Onshore\source\repos\SouthernTreasuresDAL\SouthernTreasuresDAL\DALContext.cs:line 358', CAST(N'2019-05-08T10:59:56.030' AS DateTime))
INSERT [dbo].[LogTrace] ([[LOG ID], [Message], [Trace], [Time]) VALUES (1019, N'The DELETE statement conflicted with the REFERENCE constraint "FK_Offers_Products". The conflict occurred in database "SouthernTreasures", table "dbo.Offers", column ''ProductID''.
The statement has been terminated.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at SouthernTreasuresDAL.DALContext.DeleteCategory(Int32 ExistingCategoryId) in C:\Users\Onshore\source\repos\SouthernTreasuresDAL\SouthernTreasuresDAL\DALContext.cs:line 146', CAST(N'2019-05-08T11:25:35.903' AS DateTime))
INSERT [dbo].[LogTrace] ([[LOG ID], [Message], [Trace], [Time]) VALUES (1020, N'The DELETE statement conflicted with the REFERENCE constraint "FK_Offers_Products". The conflict occurred in database "SouthernTreasures", table "dbo.Offers", column ''ProductID''.
The statement has been terminated.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at SouthernTreasuresDAL.DALContext.DeleteCategory(Int32 ExistingCategoryId) in C:\Users\Onshore\source\repos\SouthernTreasuresDAL\SouthernTreasuresDAL\DALContext.cs:line 151
   at SouthernTreasuresBLL.BLLContext.DeleteCategory(Int32 CategoryID) in C:\Users\Onshore\source\repos\SouthernTreasuresDAL\SouthernTreasuresBLL\BLLContext.cs:line 48
   at SouthernTreasures.Controllers.CategoryController.Delete(Int32 id, CategoryBLL category) in C:\Users\Onshore\source\repos\SouthernTreasuresDAL\SouthernTreasures\Controllers\CategoryController.cs:line 115', CAST(N'2019-05-08T11:25:35.923' AS DateTime))
INSERT [dbo].[LogTrace] ([[LOG ID], [Message], [Trace], [Time]) VALUES (1021, N'The DELETE statement conflicted with the REFERENCE constraint "FK_Offers_Products". The conflict occurred in database "SouthernTreasures", table "dbo.Offers", column ''ProductID''.
The statement has been terminated.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at SouthernTreasuresDAL.DALContext.DeleteProduct(Int32 ExistingProductId) in C:\Users\Onshore\source\repos\SouthernTreasuresDAL\SouthernTreasuresDAL\DALContext.cs:line 402', CAST(N'2019-05-08T11:26:05.277' AS DateTime))
INSERT [dbo].[LogTrace] ([[LOG ID], [Message], [Trace], [Time]) VALUES (1022, N'The DELETE statement conflicted with the REFERENCE constraint "FK_Offers_Products". The conflict occurred in database "SouthernTreasures", table "dbo.Offers", column ''ProductID''.
The statement has been terminated.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at SouthernTreasuresDAL.DALContext.DeleteProduct(Int32 ExistingProductId) in C:\Users\Onshore\source\repos\SouthernTreasuresDAL\SouthernTreasuresDAL\DALContext.cs:line 407
   at SouthernTreasuresBLL.BLLContext.DeleteProduct(Int32 ProductID) in C:\Users\Onshore\source\repos\SouthernTreasuresDAL\SouthernTreasuresBLL\BLLContext.cs:line 89
   at SouthernTreasures.Controllers.ProductsController.Delete(Int32 id, ProductsBLL products) in C:\Users\Onshore\source\repos\SouthernTreasuresDAL\SouthernTreasures\Controllers\ProductsController.cs:line 119', CAST(N'2019-05-08T11:26:05.300' AS DateTime))
INSERT [dbo].[LogTrace] ([[LOG ID], [Message], [Trace], [Time]) VALUES (1023, N'The DELETE statement conflicted with the REFERENCE constraint "FK_Offers_Products". The conflict occurred in database "SouthernTreasures", table "dbo.Offers", column ''ProductID''.
The statement has been terminated.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at SouthernTreasuresDAL.DALContext.DeleteCategory(Int32 ExistingCategoryId) in C:\Users\Onshore\source\repos\SouthernTreasuresDAL\SouthernTreasuresDAL\DALContext.cs:line 146', CAST(N'2019-05-08T11:55:24.983' AS DateTime))
INSERT [dbo].[LogTrace] ([[LOG ID], [Message], [Trace], [Time]) VALUES (1024, N'The DELETE statement conflicted with the REFERENCE constraint "FK_Offers_Products". The conflict occurred in database "SouthernTreasures", table "dbo.Offers", column ''ProductID''.
The statement has been terminated.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at SouthernTreasuresDAL.DALContext.DeleteCategory(Int32 ExistingCategoryId) in C:\Users\Onshore\source\repos\SouthernTreasuresDAL\SouthernTreasuresDAL\DALContext.cs:line 151
   at SouthernTreasuresBLL.BLLContext.DeleteCategory(Int32 CategoryID) in C:\Users\Onshore\source\repos\SouthernTreasuresDAL\SouthernTreasuresBLL\BLLContext.cs:line 48
   at SouthernTreasures.Controllers.CategoryController.Delete(Int32 id, CategoryBLL category) in C:\Users\Onshore\source\repos\SouthernTreasuresDAL\SouthernTreasures\Controllers\CategoryController.cs:line 115', CAST(N'2019-05-08T11:55:25.020' AS DateTime))
INSERT [dbo].[LogTrace] ([[LOG ID], [Message], [Trace], [Time]) VALUES (1025, N'The DELETE statement conflicted with the REFERENCE constraint "FK_Offers_Users". The conflict occurred in database "SouthernTreasures", table "dbo.Offers", column ''UserID''.
The statement has been terminated.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at SouthernTreasuresDAL.DALContext.DeleteUser(Int32 UserId) in C:\Users\Onshore\source\repos\SouthernTreasuresDAL\SouthernTreasuresDAL\DALContext.cs:line 261', CAST(N'2019-05-08T11:59:32.740' AS DateTime))
INSERT [dbo].[LogTrace] ([[LOG ID], [Message], [Trace], [Time]) VALUES (1026, N'The DELETE statement conflicted with the REFERENCE constraint "FK_Offers_Users". The conflict occurred in database "SouthernTreasures", table "dbo.Offers", column ''UserID''.
The statement has been terminated.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at SouthernTreasuresDAL.DALContext.DeleteUser(Int32 UserId) in C:\Users\Onshore\source\repos\SouthernTreasuresDAL\SouthernTreasuresDAL\DALContext.cs:line 266
   at SouthernTreasuresBLL.BLLContext.DeleteUser(Int32 UserID) in C:\Users\Onshore\source\repos\SouthernTreasuresDAL\SouthernTreasuresBLL\BLLContext.cs:line 199
   at SouthernTreasures.Controllers.UserController.Delete(Int32 id, UserBLL user) in C:\Users\Onshore\source\repos\SouthernTreasuresDAL\SouthernTreasures\Controllers\UserController.cs:line 128', CAST(N'2019-05-08T11:59:32.783' AS DateTime))
INSERT [dbo].[LogTrace] ([[LOG ID], [Message], [Trace], [Time]) VALUES (1027, N'The DELETE statement conflicted with the REFERENCE constraint "FK_Offers_Products". The conflict occurred in database "SouthernTreasures", table "dbo.Offers", column ''ProductID''.
The statement has been terminated.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at SouthernTreasuresDAL.DALContext.DeleteProduct(Int32 ExistingProductId) in C:\Users\Onshore\source\repos\SouthernTreasuresDAL\SouthernTreasuresDAL\DALContext.cs:line 402', CAST(N'2019-05-08T14:49:25.030' AS DateTime))
INSERT [dbo].[LogTrace] ([[LOG ID], [Message], [Trace], [Time]) VALUES (1028, N'The DELETE statement conflicted with the REFERENCE constraint "FK_Offers_Products". The conflict occurred in database "SouthernTreasures", table "dbo.Offers", column ''ProductID''.
The statement has been terminated.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at SouthernTreasuresDAL.DALContext.DeleteProduct(Int32 ExistingProductId) in C:\Users\Onshore\source\repos\SouthernTreasuresDAL\SouthernTreasuresDAL\DALContext.cs:line 407
   at SouthernTreasuresBLL.BLLContext.DeleteProduct(Int32 ProductID) in C:\Users\Onshore\source\repos\SouthernTreasuresDAL\SouthernTreasuresBLL\BLLContext.cs:line 89
   at SouthernTreasures.Controllers.ProductsController.Delete(Int32 id, ProductsBLL products) in C:\Users\Onshore\source\repos\SouthernTreasuresDAL\SouthernTreasures\Controllers\ProductsController.cs:line 123', CAST(N'2019-05-08T14:49:25.187' AS DateTime))
SET IDENTITY_INSERT [dbo].[LogTrace] OFF
SET IDENTITY_INSERT [dbo].[Offers] ON 

INSERT [dbo].[Offers] ([OfferID], [OfferPrice], [UserID], [ProductID], [StartTime], [OfferInfo]) VALUES (1, CAST(15.00 AS Decimal(18, 2)), 5, 6, CAST(N'2019-04-25T10:45:01.000' AS DateTime), 0)
INSERT [dbo].[Offers] ([OfferID], [OfferPrice], [UserID], [ProductID], [StartTime], [OfferInfo]) VALUES (2, CAST(122.00 AS Decimal(18, 2)), 1, 10, CAST(N'2019-04-05T15:35:00.000' AS DateTime), 0)
INSERT [dbo].[Offers] ([OfferID], [OfferPrice], [UserID], [ProductID], [StartTime], [OfferInfo]) VALUES (7, CAST(255.00 AS Decimal(18, 2)), 7, 8, CAST(N'2019-04-05T10:05:00.000' AS DateTime), 1)
INSERT [dbo].[Offers] ([OfferID], [OfferPrice], [UserID], [ProductID], [StartTime], [OfferInfo]) VALUES (8, CAST(140.00 AS Decimal(18, 2)), 101, 7, CAST(N'2019-04-05T05:22:00.000' AS DateTime), 0)
INSERT [dbo].[Offers] ([OfferID], [OfferPrice], [UserID], [ProductID], [StartTime], [OfferInfo]) VALUES (1011, CAST(20.00 AS Decimal(18, 2)), 111, 5, CAST(N'2019-04-30T09:26:48.000' AS DateTime), 0)
INSERT [dbo].[Offers] ([OfferID], [OfferPrice], [UserID], [ProductID], [StartTime], [OfferInfo]) VALUES (2013, CAST(45.00 AS Decimal(18, 2)), 111, 6, CAST(N'2019-05-02T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Offers] ([OfferID], [OfferPrice], [UserID], [ProductID], [StartTime], [OfferInfo]) VALUES (2017, CAST(50.00 AS Decimal(18, 2)), 1125, 5, CAST(N'2019-05-02T16:05:35.887' AS DateTime), 0)
INSERT [dbo].[Offers] ([OfferID], [OfferPrice], [UserID], [ProductID], [StartTime], [OfferInfo]) VALUES (2018, CAST(115.00 AS Decimal(18, 2)), 2128, 5, CAST(N'2019-05-07T10:09:06.000' AS DateTime), 0)
INSERT [dbo].[Offers] ([OfferID], [OfferPrice], [UserID], [ProductID], [StartTime], [OfferInfo]) VALUES (2020, CAST(122.00 AS Decimal(18, 2)), 111, 2029, CAST(N'2019-05-08T08:53:03.000' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[Offers] OFF
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductDescription], [MinimumPrice], [CategoryID], [UserID]) VALUES (5, N'Star Wars Book Lot', N'Awesome lot of books from several different Star Wars series', CAST(19.50 AS Decimal(18, 2)), 1, 3)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductDescription], [MinimumPrice], [CategoryID], [UserID]) VALUES (6, N'Lego Club Magazine Lot', N'Large lot of Lego Club Magazines', CAST(15.00 AS Decimal(18, 2)), 2, 4)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductDescription], [MinimumPrice], [CategoryID], [UserID]) VALUES (7, N'Paperback Lot of 40 Westerns', N'Great Lot of 40 Westerns Paperbacks in gently used condition', CAST(16.00 AS Decimal(18, 2)), 1, 100)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductDescription], [MinimumPrice], [CategoryID], [UserID]) VALUES (8, N'German Children Book Lot', N'Lot of 25 German children''s books', CAST(29.00 AS Decimal(18, 2)), 1, 4)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductDescription], [MinimumPrice], [CategoryID], [UserID]) VALUES (10, N'Cat Lovers Magazine Lot', N'Lot of 18 magazines for cat lovers. Great condition! Never read.', CAST(12.00 AS Decimal(18, 2)), 15, 3)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductDescription], [MinimumPrice], [CategoryID], [UserID]) VALUES (14, N'Victorias Secret Hoodie Front-Zip', N'Lovely zipped hoodie by Victorias Secret, only worn two or three times', CAST(35.00 AS Decimal(18, 2)), 3, 3)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductDescription], [MinimumPrice], [CategoryID], [UserID]) VALUES (16, N'Adorable Marble Cheese Board', N'Check out this absolutely cute marble cheese board with metal feet in the shape of mice', CAST(10.00 AS Decimal(18, 2)), 4, 4)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductDescription], [MinimumPrice], [CategoryID], [UserID]) VALUES (1019, N'Qui-rin Chinese Hat', N'Lovely Chinese Qui-rin Hat in Cream colored wool, handmade and in hardly worn condition', CAST(25.00 AS Decimal(18, 2)), 3, 100)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductDescription], [MinimumPrice], [CategoryID], [UserID]) VALUES (1020, N'Lot of 8 Boys Jeans Size 12', N'Great Lot of 8 pairs of boy''s jeans in gently worn condition', CAST(15.75 AS Decimal(18, 2)), 3, 4)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductDescription], [MinimumPrice], [CategoryID], [UserID]) VALUES (1021, N'Nonsensical Empty Book 1', N'great gift for the person who already has everything', CAST(71.00 AS Decimal(18, 2)), 1, 3)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductDescription], [MinimumPrice], [CategoryID], [UserID]) VALUES (1025, N'Something else entirely', N'finally, my je ne sais quois!', CAST(121.00 AS Decimal(18, 2)), 3, 119)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductDescription], [MinimumPrice], [CategoryID], [UserID]) VALUES (2028, N'Elvis'' Greatest Hits Double Album on pink vinyl', N'great condition, no scratches', CAST(33.00 AS Decimal(18, 2)), 19, 119)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductDescription], [MinimumPrice], [CategoryID], [UserID]) VALUES (2029, N'Money For Nothing by Dire Straits', N'album is in good used condition without scratches', CAST(18.00 AS Decimal(18, 2)), 19, 119)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductDescription], [MinimumPrice], [CategoryID], [UserID]) VALUES (2030, N'Sky 2 Double Album', N'in very good condition without scratches', CAST(10.00 AS Decimal(18, 2)), 19, 119)
SET IDENTITY_INSERT [dbo].[Products] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [Name], [Password], [Role], [EmailAddress], [CreditInfo]) VALUES (1, N'Johnny Weismueller', N'passing', N'Buyer', N'wantcheapstuff@email.com', N'uptodate')
INSERT [dbo].[Users] ([UserID], [Name], [Password], [Role], [EmailAddress], [CreditInfo]) VALUES (3, N'Harry Bellafontaine', N'passed', N'Seller', N'dealers123@email.com', N'uptodate')
INSERT [dbo].[Users] ([UserID], [Name], [Password], [Role], [EmailAddress], [CreditInfo]) VALUES (4, N'Lucky Hunter', N'pass123', N'Seller', N'sellstuff@email.com', N'uptodate')
INSERT [dbo].[Users] ([UserID], [Name], [Password], [Role], [EmailAddress], [CreditInfo]) VALUES (5, N'Mad Seller', N'winner123', N'Administrator', N'hundredpercent@email.com', N'uptodate')
INSERT [dbo].[Users] ([UserID], [Name], [Password], [Role], [EmailAddress], [CreditInfo]) VALUES (6, N'Richard Gear', N'umsonst', N'Buyer', N'whatsup@email.com', N'uptodate')
INSERT [dbo].[Users] ([UserID], [Name], [Password], [Role], [EmailAddress], [CreditInfo]) VALUES (7, N'Riccardo Mutii', N'davinci', N'Buyer', N'bellaitalia@email.com', N'uptodate')
INSERT [dbo].[Users] ([UserID], [Name], [Password], [Role], [EmailAddress], [CreditInfo]) VALUES (100, N'Mitsiko Uchidaa', N'rembrandt', N'Seller', N'japanmozart@email.com', N'uptodate')
INSERT [dbo].[Users] ([UserID], [Name], [Password], [Role], [EmailAddress], [CreditInfo]) VALUES (101, N'Herbert von Karajann', N'dali', N'Buyer', N'maestro@email.com', N'uptodate')
INSERT [dbo].[Users] ([UserID], [Name], [Password], [Role], [EmailAddress], [CreditInfo]) VALUES (102, N'Johnny Dapper', N'kandinsky', N'Buyer', N'jack@email.com', N'uptodate')
INSERT [dbo].[Users] ([UserID], [Name], [Password], [Role], [EmailAddress], [CreditInfo]) VALUES (103, N'Valerie Night', N'mondrian', N'Buyer', N'valley45@email.com', N'uptodate')
INSERT [dbo].[Users] ([UserID], [Name], [Password], [Role], [EmailAddress], [CreditInfo]) VALUES (104, N'Vincent Donofrio', N'monet', N'Buyer', N'artiste34@email.com', N'uptodate')
INSERT [dbo].[Users] ([UserID], [Name], [Password], [Role], [EmailAddress], [CreditInfo]) VALUES (105, N'Gabrielle King', N'manet', N'Seller', N'quidditch@email.com', N'uptodate')
INSERT [dbo].[Users] ([UserID], [Name], [Password], [Role], [EmailAddress], [CreditInfo]) VALUES (106, N'Lucille Bell', N'renoir', N'Seller', N'happy345@email.com', N'uptodate')
INSERT [dbo].[Users] ([UserID], [Name], [Password], [Role], [EmailAddress], [CreditInfo]) VALUES (107, N'Christina Wagner', N'duerer', N'Buyer', N'saddie908@email.com', N'uptodate')
INSERT [dbo].[Users] ([UserID], [Name], [Password], [Role], [EmailAddress], [CreditInfo]) VALUES (108, N'Harriett Glover', N'hundertwasser', N'Buyer', N'freeforme@email.com', N'uptodate')
INSERT [dbo].[Users] ([UserID], [Name], [Password], [Role], [EmailAddress], [CreditInfo]) VALUES (109, N'EmilHaase', N'passme', N'Buyer', N'haasie@email.com', N'approved')
INSERT [dbo].[Users] ([UserID], [Name], [Password], [Role], [EmailAddress], [CreditInfo]) VALUES (111, N'Harry Potter', N'hermione', N'Buyer', N'magicwand@hogwarts.wiz', N'approved')
INSERT [dbo].[Users] ([UserID], [Name], [Password], [Role], [EmailAddress], [CreditInfo]) VALUES (114, N'uuu', N'anybodysguessornot', N'Buyer', N'xxxxx', N'rrrr')
INSERT [dbo].[Users] ([UserID], [Name], [Password], [Role], [EmailAddress], [CreditInfo]) VALUES (115, N'memyselfandi', N'anybodysguessornot', N'Buyer', N'xxxxx', N'yyyyy')
INSERT [dbo].[Users] ([UserID], [Name], [Password], [Role], [EmailAddress], [CreditInfo]) VALUES (118, N'Yoohoo', N'noname', N'Seller', N'yoohoo', N'nocredit')
INSERT [dbo].[Users] ([UserID], [Name], [Password], [Role], [EmailAddress], [CreditInfo]) VALUES (119, N'Bossy Chef', N'likenoother', N'Administrator', N'dumb', N'notmuchmoney')
INSERT [dbo].[Users] ([UserID], [Name], [Password], [Role], [EmailAddress], [CreditInfo]) VALUES (124, N'zzz', N'zzz', N'Buyer', N'zzz', N'approved')
INSERT [dbo].[Users] ([UserID], [Name], [Password], [Role], [EmailAddress], [CreditInfo]) VALUES (1125, N'Harry Potter', N'hermione', N'Buyer', N'magicwand@wizard.com', N'approved')
INSERT [dbo].[Users] ([UserID], [Name], [Password], [Role], [EmailAddress], [CreditInfo]) VALUES (2128, N'Maren', N'Pass', N'Buyer', N'mine@yoohoo.org', N'approved')
INSERT [dbo].[Users] ([UserID], [Name], [Password], [Role], [EmailAddress], [CreditInfo]) VALUES (2131, N'MarenC', N'hello', N'Seller', N'MarenC@gmail.com', N'12345')
SET IDENTITY_INSERT [dbo].[Users] OFF
ALTER TABLE [dbo].[Offers]  WITH CHECK ADD  CONSTRAINT [FK_Offers_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[Offers] CHECK CONSTRAINT [FK_Offers_Products]
GO
ALTER TABLE [dbo].[Offers]  WITH CHECK ADD  CONSTRAINT [FK_Offers_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Offers] CHECK CONSTRAINT [FK_Offers_Users]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Users]
GO
/****** Object:  StoredProcedure [dbo].[InsertLogItem]    Script Date: 5/8/2019 16:59:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Maren Creighton>
-- Create date: <05/02/2019,,>
-- Description:	<InsertLogItem>
-- =============================================
CREATE PROCEDURE [dbo].[InsertLogItem] 
	-- Add the parameters for the stored procedure here
	@message varchar(250),
	@stacktrace varchar(max)
AS
BEGIN
	insert into [dbo].[LogTrace]
	([Message]
	,[Trace]
	,[Time])
	Values
	(@message
	,@stacktrace
	,GETDATE())
END

GO
/****** Object:  StoredProcedure [dbo].[SP_DeleteCategory]    Script Date: 5/8/2019 16:59:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Maren Creighton
-- Create date: 04/11/2019
-- Description:	Categories
-- =============================================
Create PROCEDURE [dbo].[SP_DeleteCategory] 
	-- Add the parameters for the stored procedure here
@CategoryID int	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	delete from Categories
	where CategoryID = @CategoryID
	 

END

GO
/****** Object:  StoredProcedure [dbo].[SP_DeleteOffer]    Script Date: 5/8/2019 16:59:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Maren Creighton
-- Create date: 04/11/2019
-- Description:	Offers
-- =============================================
Create PROCEDURE [dbo].[SP_DeleteOffer] 
	-- Add the parameters for the stored procedure here
@OfferID int	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	delete from Offers
	where OfferID = @OfferID
	 

END

GO
/****** Object:  StoredProcedure [dbo].[SP_DeleteProduct]    Script Date: 5/8/2019 16:59:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Maren Creighton
-- Create date: 04/11/2019
-- Description:	Products
-- =============================================
Create PROCEDURE [dbo].[SP_DeleteProduct] 
	-- Add the parameters for the stored procedure here
@ProductID int	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	delete from Products
	where ProductID = @ProductID
	 

END

GO
/****** Object:  StoredProcedure [dbo].[SP_DeleteUser]    Script Date: 5/8/2019 16:59:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Maren Creighton
-- Create date: 04/11/2019
-- Description:	Users
-- =============================================
Create PROCEDURE [dbo].[SP_DeleteUser] 
	-- Add the parameters for the stored procedure here
@UserID int	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	delete from Users
	where UserID = @UserID
	 

END

GO
/****** Object:  StoredProcedure [dbo].[SP_InsertCategory]    Script Date: 5/8/2019 16:59:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ===========================================
-- Author:		Maren Creighton
-- Create date: 04/11/2019
-- Description:	Categories
-- =============================================
CREATE PROCEDURE [dbo].[SP_InsertCategory] 
	-- Add the parameters for the stored procedure here
	@CategoryName nvarchar(50),
	@CategoryID int output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Insert into [dbo].[Categories] (CategoryName)
	values (@CategoryName);
	select @CategoryID = @@IDENTITY

END

GO
/****** Object:  StoredProcedure [dbo].[SP_InsertOffer]    Script Date: 5/8/2019 16:59:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Maren Creighton
-- Create date: 04/11/2019
-- Description:	Offers
-- =============================================
CREATE PROCEDURE [dbo].[SP_InsertOffer] 
	-- Add the parameters for the stored procedure here
	@OfferPrice decimal,
	@UserID int output,
	@ProductID int,
	@StartTime datetime,
	@OfferID int output,
	@OfferInfo int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Insert into [dbo].[Offers] 
	(OfferPrice, UserID, ProductID, StartTime, OfferInfo)
	Values
	(@OfferPrice, @UserID, @ProductID, @StartTime, @OfferInfo);
	select @UserID = @@IDENTITY

END

GO
/****** Object:  StoredProcedure [dbo].[SP_InsertProduct]    Script Date: 5/8/2019 16:59:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Maren Creighton
-- Create date: 04/11/2019
-- Description:	Products
-- =============================================
CREATE PROCEDURE [dbo].[SP_InsertProduct] 
	-- Add the parameters for the stored procedure here
	@ProductName nvarchar(50),
	@ProductDescription nvarchar(max),
	@MinimumPrice decimal(18,2),
	@CategoryID int,
	@ProductID int output,
	@UserID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Insert into [dbo].[Products] 
	(ProductName, ProductDescription, MinimumPrice, CategoryID, UserID)
	Values
	(@ProductName, @ProductDescription, @MinimumPrice, @CategoryID, @UserID);
	select @ProductID = @@IDENTITY

END

GO
/****** Object:  StoredProcedure [dbo].[SP_InsertUser]    Script Date: 5/8/2019 16:59:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Maren Creighton
-- Create date: 04/11/2019
-- Description:	Users
-- =============================================
CREATE PROCEDURE [dbo].[SP_InsertUser] 
	-- Add the parameters for the stored procedure here
	@Name nvarchar(50),
	@Password nvarchar(50),
	@Role nvarchar(50),
	@EmailAddress nvarchar(50),
	@CreditInfo nvarchar(50),
	@UserID int output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Insert into [dbo].[Users] 
	(Name, Password, Role, EmailAddress, CreditInfo)
	Values
	(@Name, @Password, @Role, @EmailAddress, @CreditInfo);
	select @UserID = @@IDENTITY

END

GO
/****** Object:  StoredProcedure [dbo].[SP_ReadAllCategories]    Script Date: 5/8/2019 16:59:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Maren Creighton
-- Create date: 04/11/2019
-- Description:	Users
-- =============================================
Create PROCEDURE [dbo].[SP_ReadAllCategories] 
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select
	CategoryId, CategoryName from Categories
	 

END

GO
/****** Object:  StoredProcedure [dbo].[SP_ReadAllOffers]    Script Date: 5/8/2019 16:59:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Maren Creighton
-- Create date: 04/11/2019
-- Description:	Offers
-- =============================================
CREATE PROCEDURE [dbo].[SP_ReadAllOffers] 
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select
	OfferId, OfferPrice, UserID, ProductID, StartTime, OfferInfo from Offers
	 

END

GO
/****** Object:  StoredProcedure [dbo].[SP_ReadAllProducts]    Script Date: 5/8/2019 16:59:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Maren Creighton
-- Create date: 04/11/2019
-- Description:	Products
-- =============================================
CREATE PROCEDURE [dbo].[SP_ReadAllProducts] 
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select
	ProductId, ProductName, ProductDescription, MinimumPrice, CategoryID, UserID from Products
	 

END

GO
/****** Object:  StoredProcedure [dbo].[SP_ReadAllUsers]    Script Date: 5/8/2019 16:59:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Maren Creighton
-- Create date: 04/11/2019
-- Description:	Users
-- =============================================
create PROCEDURE [dbo].[SP_ReadAllUsers] 
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select
	UserId, Name, Password, Role, EmailAddress, CreditInfo from Users
	 

END

GO
/****** Object:  StoredProcedure [dbo].[SP_ReadOffersBySpecificSeller]    Script Date: 5/8/2019 16:59:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Maren Creighton
-- Create date: 04/11/2019
-- Description:	Offers
-- =============================================
create PROCEDURE [dbo].[SP_ReadOffersBySpecificSeller] 
	-- Add the parameters for the stored procedure here
	@EmailAddress nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select
	OfferId, OfferPrice, Offers.UserID, Offers.ProductID, StartTime, OfferInfo  from Offers inner join products on Offers.ProductID = Products.ProductID
	inner join Users on Products.UserID = Users.UserID
	where
	EmailAddress = @EmailAddress
	 

END

GO
/****** Object:  StoredProcedure [dbo].[SP_ReadOffersBySpecificUser]    Script Date: 5/8/2019 16:59:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Maren Creighton
-- Create date: 04/11/2019
-- Description:	Offers
-- =============================================
CREATE PROCEDURE [dbo].[SP_ReadOffersBySpecificUser] 
	-- Add the parameters for the stored procedure here
	@EmailAddress nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select
	OfferId, OfferPrice, Offers.UserID, ProductID, StartTime, OfferInfo from Offers 
	Inner Join Users on Offers.UserID = Users.UserID
	Where
	EmailAddress = @EmailAddress
	 

END

GO
/****** Object:  StoredProcedure [dbo].[SP_ReadSpecificCategory]    Script Date: 5/8/2019 16:59:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Maren Creighton
-- Create date: 04/11/2019
-- Description:	Categories
-- =============================================
Create PROCEDURE [dbo].[SP_ReadSpecificCategory] 
	-- Add the parameters for the stored procedure here
	@CategoryID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT CategoryID, CategoryName from Categories
	Where CategoryID = @CategoryID
END

GO
/****** Object:  StoredProcedure [dbo].[SP_ReadSpecificOffer]    Script Date: 5/8/2019 16:59:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Maren Creighton
-- Create date: 04/11/2019
-- Description:	Offers
-- =============================================
CREATE PROCEDURE [dbo].[SP_ReadSpecificOffer] 
	-- Add the parameters for the stored procedure here
	@OfferID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT OfferID, OfferPrice, UserID, ProductID, StartTime, OfferInfo
	 from Offers
	Where OffERID = @OfferID
END

GO
/****** Object:  StoredProcedure [dbo].[SP_ReadSpecificProduct]    Script Date: 5/8/2019 16:59:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Maren Creighton
-- Create date: 04/11/2019
-- Description:	Products
-- =============================================
CREATE PROCEDURE [dbo].[SP_ReadSpecificProduct] 
	-- Add the parameters for the stored procedure here
	@ProductID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT ProductID, ProductName, ProductDescription, MinimumPrice, CategoryID, UserID
	 from Products
	Where ProductID = @ProductID
END

GO
/****** Object:  StoredProcedure [dbo].[SP_ReadSpecificUser]    Script Date: 5/8/2019 16:59:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Maren Creighton
-- Create date: 04/11/2019
-- Description:	Users
-- =============================================
CREATE PROCEDURE [dbo].[SP_ReadSpecificUser] 
	-- Add the parameters for the stored procedure here
	@UserID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT UserID, Name, Password, Role, EmailAddress, CreditInfo from Users
	Where USERID = @UserID
END

GO
/****** Object:  StoredProcedure [dbo].[SP_ReadSpecificUserByEmailAddress]    Script Date: 5/8/2019 16:59:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Maren Creighton
-- Create date: 04/11/2019
-- Description:	Users
-- =============================================
CREATe PROCEDURE [dbo].[SP_ReadSpecificUserByEmailAddress] 
	-- Add the parameters for the stored procedure here
	@EmailAddress nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT UserID, Name, Password, Role, EmailAddress, CreditInfo from Users
	Where EmailAddress = @EmailAddress
END

GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateCategory]    Script Date: 5/8/2019 16:59:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Maren Creighton
-- Create date: 04/11/2019
-- Description:	Categories
-- =============================================
Create PROCEDURE [dbo].[SP_UpdateCategory] 
	-- Add the parameters for the stored procedure here
	@CategoryID int,
	@NewCategoryName nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Update Categories
	SET CategoryName = @NewCategoryName
	Where CategoryID = @CategoryID
END

GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateOffer]    Script Date: 5/8/2019 16:59:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Maren Creighton
-- Create date: 04/11/2019
-- Description:	Offers
-- =============================================
CREATE PROCEDURE [dbo].[SP_UpdateOffer] 
	-- Add the parameters for the stored procedure here
	@OfferID int,
	@NewOfferPrice decimal,
	@NewUserID int,
	@NewProductID int,
	@NewStartTime datetime, 
	@NewOfferInfo int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Update Offers
	SET OfferPrice = @NewOfferPrice,
	UserID = @NewUserID,
	ProductID = @NewProductID,
	StartTime =@NewStartTime,
	OfferInfo = @NewOfferInfo
	
	
	Where OFFERID = @OfferID
END

GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateProduct]    Script Date: 5/8/2019 16:59:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Maren Creighton
-- Create date: 04/11/2019
-- Description:	Products
-- =============================================
CREATE PROCEDURE [dbo].[SP_UpdateProduct] 
	-- Add the parameters for the stored procedure here
	@ProductID int,
	@NewProductName nvarchar(50) ,
	@NewProductDescription nvarchar(max),
	@NewMinimumPrice decimal(18,2),
	@NewCategoryID int,
	@NewUserID int
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Update Products
	SET ProductName = @NewProductName,
	ProductDescription = @NewProductDescription,
	MinimumPrice = @NewMinimumPrice,
	CategoryID = @NewCategoryID,
	UserID = @NewUserID

	
	Where ProductID = @ProductID
END

GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateUser]    Script Date: 5/8/2019 16:59:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Maren Creighton
-- Create date: 04/11/2019
-- Description:	Users
-- =============================================
CREATE PROCEDURE [dbo].[SP_UpdateUser] 
	-- Add the parameters for the stored procedure here
	@UserID int,
	@Name nvarchar(50),
	@Password nvarchar(50),
	@Role nvarchar(50),
	@EmailAddress nvarchar(50),
	@CreditInfo nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Update Users
	SET Name = @Name,
	Password = @Password,
	Role = @Role,
	EmailAddress = @EmailAddress,
	CreditInfo = @CreditInfo
	Where USERID = @UserID
END

GO
USE [master]
GO
ALTER DATABASE [SouthernTreasures] SET  READ_WRITE 
GO
