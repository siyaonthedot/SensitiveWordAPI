USE [master]
CREATE DATABASE [SensitivewordsDB2];
GO

USE [SensitivewordsDB2]
GO

CREATE TABLE [dbo].[Word](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[WordContext] [varchar](250) NOT NULL,
	PRIMARY KEY (Id)
) 
GO

--------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------
USE [SensitivewordsDB2]
GO

CREATE PROCEDURE [dbo].[SaveSensitiveWord]
				@Id int
              , @WordContext  VARCHAR(250)
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

-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------
USE [SensitivewordsDB2]
GO

CREATE PROCEDURE [dbo].[UpdatedSensitiveWord] 
				@Id INT
              , @WordContext                  VARCHAR(250)
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

--
---
USE [SensitivewordsDB2]
GO

CREATE PROCEDURE [dbo].[GetSensitiveWords]

AS
BEGIN

   select * from dbo.Word

END
GO

---------------------------------------------------
---------------------------------------------------
USE [SensitivewordsDB2]
GO

CREATE PROCEDURE [dbo].[GetSensitiveWordByID]
	 @Id int 
AS
BEGIN

   SELECT Id,WordContext FROM dbo.Word
   WHERE Id = @Id

END
GO

---------------------------------------------
--------------------------------------------
USE [SensitivewordsDB2]
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

--------
---------
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'ACTION' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'ADD' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'ALL' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'ALLOCATE' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'ANY' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'APPLICATION' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'ARE' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'AREA' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'ASC' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'ASSERTION' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'ATOMIC' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'AUTHORIZATION' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'AVG' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'BY' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'CALL' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'CASCADE' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'CASCADED' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'CATALOG' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'CHECK' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'CLOSE' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'COLUMN' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'COMMIT' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'COMPRESS' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'CONNECT' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'CONNECTION' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'CONSTRAINT' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'CONSTRAINTS' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'CONTINUE' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'CONVERT' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'CORRESPONDING' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'CREATE' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'CROSS' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'CURRENT' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'CURRENT_PATH' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'CURRENT_SCHEMA' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'CURRENT_SCHEMAID' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'CURRENT_USER' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'CURRENT_USER' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'CURSOR' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'CURSOR' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'DEALLOCATE' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'DECLARE' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'DEFAULT' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'DEFERRABLE' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'DEFERRED' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'DELETE' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'DESC' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'DESCRIBE' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'DESCRIBE' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'DESCRIPTOR' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'DETERMINISTIC')
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'DIAGNOSTICS')
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'DIRECTORY' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'DISCONNECT')
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'DISTINCT')
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'DO')
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'DOMAIN' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'DOUBLEATTRIBUTE')
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'DROP')
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'EACH' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'EXCEPTION' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'DESCRIBE' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'EXEC' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'EXECUTE' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'EXTERNAL')
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'FETCH' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'FLOAT')
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'FOREIGN' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'FOUND' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'FULL' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'FUNCTION' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'GET' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'GLOBAL' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'GO' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'GOTO' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'GRANT' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'GROUP' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'HANDLER' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'IDENTITY')
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'DESCRIBE' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'IMMEDIATE' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'INDEX' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'INDEXED')
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'INDICATOR' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'INITIALLY' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'INNER')
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'INOUT')
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'INPUT' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'INSENSITIVE' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'INSERT' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'INTERSECT' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'DESCRIBE' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'ISOLATION' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'JOIN' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'KEY' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'LANGUAGE' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'LAST' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'LEAVE' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'LEVEL' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'LOCAL')
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'LONGATTRIBUTE')
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'LOOP' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'MODIFIES' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'MODULE' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'NAMES')
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'NATURAL')
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'DESCRIBE' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'NEXT')
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'NULLIF')
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'ON' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'ONLY' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'OPEN')
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'OPTION' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'ORDER')
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'OUT' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'OUTER' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'OUTPUT' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'OVERLAPS' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'OWNER')
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'PARTIAL')
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'PATH' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'PRECISION')
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'PREPARE')
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'PRESERVE' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'PRIMARY')
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'PRIOR' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'PRIVILEGES')
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'PROCEDURE')
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'PUBLIC' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'READ' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'READS' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'REFERENCES')
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'RELATIVE' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'REPEAT' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'RESIGNAL')
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'RESTRICT' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'RETURN')
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'RETURNS' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'REVOKE' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'ROLLBACK' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'ROUTINE' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'ROW')
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'SCHEMA' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'SCROLL' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'SECTION' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'SELECT' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'SEQ' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'SEQUENCE' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'SESSION' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'SESSION_USER')
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'SESSION_USERID' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'SET')
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'SIGNAL')
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'SOME' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'SPACE' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'SPECIFIC')
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'SQL' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'SQLCODE')
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'SQLERROR')
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'SQLEXCEPTION')
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'SQLSTATE' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'SQLWARNING' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'STATEMENT' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'STRINGATTRIBUTE' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'SUM' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'SYSACC' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'SYSHGH' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'SYSLNK')
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'SYSNIX' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'SYSTBLDEF' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'SYSTBLDSC' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'SYSTBT' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'SYSTBTATT' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'SYSTBTDEF')
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'SYSUSR' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'SYSTEM_USER' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'SYSVIW')
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'SYSVIWCOL' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'TABLE' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'TABLETYPE' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'TEMPORARY')
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'TRANSACTION' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'TRANSLATE' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'TRANSLATION')
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'TRIGGER' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'UNDO' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'UNION' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'UNIQUE')
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'UNTIL')
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'UPDATE' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'USAGE' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'USER' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'USING')
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'VALUES')
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'DESCRIBE' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'VIEW' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'WHERE' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'WHILE')
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'WITH' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'WORK' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'WRITE' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'ALLSCHEMAS')
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'ALLTABLES' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'ALLVIEWS' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'ALLVIEWTEXTS')
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'ALLCOLUMNS')
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'ALLINDEXES')
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'ALLINDEXCOLS')
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'ALLUSERS')
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'ALLTBTS')
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'TABLEPRIVILEGES' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'TBTPRIVILEGES')
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'MYSCHEMAS' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'MYTABLES' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'MYTBTS')
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'MYVIEWS' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'SCHEMAVIEWS' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'DUAL' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'SCHEMAPRIVILEGES')
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'SCHEMATABLES')
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'STATISTICS' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'USRTBL' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'STRINGTABLE' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'LONGTABLE')
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'DOUBLETABLE' )
	INSERT   INTO DBO.WORD (WordContext)  VALUES ( 'SELECT * FROM')