CREATE PROCEDURE usp_generate_sn (
	-- 輸入
	@Model varchar(20),
	-- 輸出
	@RtnCode varchar(1) output,
	@RtnDesc varchar(100) output
) AS
BEGIN
	-- 系統時間的西元年4碼
	DECLARE @DateCode varchar(4);
	SET @DateCode = YEAR(GETDATE());

	-- 1395開頭
	IF @Model like '1395%'
		SELECT @RtnCode = 1, @RtnDesc = 'IEC Model' + @DateCode
	-- WB開頭
	ELSE IF @Model like 'WB%'
		SELECT @RtnCode = 1, @RtnDesc = 'Ship Model' + @DateCode
	-- 二者皆否
	ELSE
		SELECT @RtnCode = 0, @RtnDesc = 'None Model Info.'
END

/*
DECLARE @Model varchar(20), @RtnCode varchar(1), @RtnDesc varchar(100);

EXEC usp_generate_sn '1395123', @RtnCode output, @RtnDesc output;
PRINT '@RtnCode=' + @RtnCode + ', @RtnDesc=' + @RtnDesc;

EXEC usp_generate_sn 'WB123', @RtnCode output, @RtnDesc output;
PRINT '@RtnCode=' + @RtnCode + ', @RtnDesc=' + @RtnDesc;

EXEC usp_generate_sn 'FSFEEF', @RtnCode output, @RtnDesc output;
PRINT '@RtnCode=' + @RtnCode + ', @RtnDesc=' + @RtnDesc;
*/