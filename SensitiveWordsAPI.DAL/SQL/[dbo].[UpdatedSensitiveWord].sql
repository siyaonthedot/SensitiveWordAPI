USE [SensitivewordsDB]
GO

CREATE PROCEDURE [dbo].[UpdatedSensitiveWord] 
				@Id INT
              , @WordContext                  VARCHAR(max)
              , @ReturnCode                   VARCHAR(20) OUTPUT 
AS
BEGIN BEGIN

IF EXISTS(SELECT   1 FROM dbo.WORD WHERE Id = @Id and WordContext = @WordContext)
BEGIN
    SET @ReturnCode = 'C201'
	SELECT @ReturnCode
    RETURN
END

IF NOT EXISTS(SELECT  1 FROM dbo.WORD WHERE Id = @Id)
BEGIN
    SET @ReturnCode = 'C203'
	SELECT @ReturnCode
    RETURN
END

UPDATE dbo.WORD
SET WordContext = @WordContext
where Id = @Id

SET @ReturnCode = 'C200'
SELECT @ReturnCode

END

END
GO


