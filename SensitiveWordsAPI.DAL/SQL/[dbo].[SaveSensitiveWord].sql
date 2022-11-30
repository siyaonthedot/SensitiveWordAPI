USE [SensitivewordsDB]
GO


CREATE PROCEDURE [dbo].[SaveSensitiveWord]
				@Id int
              , @WordContext  VARCHAR(max)
              , @ReturnCode    VARCHAR(20) OUTPUT AS 
BEGIN 

BEGIN
IF EXISTS
(
       SELECT
              1
       FROM
              WORD
       WHERE
              WordContext = @WordContext
)
BEGIN
    SET @ReturnCode = 'C201'
    RETURN
END
INSERT INTO Word
       (WordContext
       )
       VALUES
       (@WordContext
       )
       SET @ReturnCode = 'C200'
   END
END
GO


