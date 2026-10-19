WITH User1Friends AS
(
    SELECT user2_id AS user_id
    FROM Friendship
    WHERE user1_id = 1

    UNION ALL

    SELECT user1_id as user_id
    FROM Friendship
    WHERE user2_id = 1
)

SELECT DISTINCT l.page_id AS recommended_page
FROM User1Friends AS u1f
INNER JOIN Likes AS l
    ON u1f.user_id = l.user_id
WHERE NOT EXISTS
(
    SELECT 1
    FROM Likes AS u1l
    WHERE u1l.user_id = 1
        AND u1l.page_id = l.page_id
);