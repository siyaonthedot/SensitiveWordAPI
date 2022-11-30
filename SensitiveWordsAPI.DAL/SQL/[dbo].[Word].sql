USE [SensitivewordsDB]
GO

CREATE TABLE [dbo].[Word](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[WordContext] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


