IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID(N'CreateShip') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE CreateShip
GO

CREATE PROCEDURE CreateShip
(
    @shipName nvarchar(max),
    @tonnage decimal
)
AS
BEGIN

declare @shipId int

INSERT INTO Ship (
	ShipName
	, Tonnage
	)
VALUES (
	@shipName
	, @tonnage
	)
	
SELECT @shipId = SCOPE_IDENTITY()

INSERT INTO ShipHistory (
	ShipId
	, ShipName
	, Tonnage
	)
VALUES (
    @shipId
	, @shipName
	, @tonnage
	)

select @shipId

END
