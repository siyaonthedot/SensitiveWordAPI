USE [SensitivewordsDB]
GO

CREATE PROCEDURE [dbo].[GetSensitiveWordByID]
	 @Id int 
AS
BEGIN

   SELECT Id,WordContext FROM dbo.Word
   WHERE Id = @Id

END
GO


