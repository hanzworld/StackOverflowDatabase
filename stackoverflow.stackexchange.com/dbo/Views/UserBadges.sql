CREATE VIEW UserBadges
AS
SELECT
	b.Id AS BadgeId,
	b.Name,
	b.CreatedDateUTC,
	u.Id AS UserId,
	u.DisplayName
FROM
	[User] u 
	INNER JOIN Badge b on b.UserId = u.Id