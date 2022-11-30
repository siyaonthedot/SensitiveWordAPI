USE [SensitivewordsDB]
GO
CREATE PROCEDURE [dbo].[DeletSensitiveWord]
	 @Id INT,
	 @ReturnCode VARCHAR(20) OUTPUT
AS
BEGIN
SET @ReturnCode ='C203'
IF NOT EXISTS(SELECT 1 FROM Word WHERE Id = @Id)
   BEGIN
        SET @ReturnCode ='C203'
		SELECT @ReturnCode
        RETURN
    END
	   ELSE
    BEGIN
        DELETE FROM Word WHERE Id = @Id
        SET @ReturnCode = 'C200'
		SELECT @ReturnCode
        RETURN
    END

END
GO


