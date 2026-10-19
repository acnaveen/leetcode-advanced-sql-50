SELECT DISTINCT a.account_id
FROM LogInfo AS a
INNER JOIN LogInfo AS b
    ON a.account_id = b.account_id
    AND a.ip_address != b.ip_address
    AND b.login <= a.logout
    AND b.logout >= a.login;