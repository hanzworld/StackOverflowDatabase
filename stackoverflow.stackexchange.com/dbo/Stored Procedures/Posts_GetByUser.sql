CREATE PROCEDURE Posts_GetByUser (@UserId int)
As
SELECT
	p.Id AS PostId,
	p.Title,
	p.AnswerCount,
	p.CommentCount,
	p.FavouriteCount,
	p.Score,
	p.ViewCount,
	pt.Name AS PostTypeName
FROM
	Post p
	INNER JOIN PostType pt on pt.Id = p.PostTypeId
WHERE
	p.OwnerUserId = @UserId