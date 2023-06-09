-- CASE in SELECT
SELECT CONCAT('Conversation ', ROW_NUMBER() OVER (ORDER BY c.id)) AS conversations,
       CASE WHEN m.message_count > 10 THEN 'Plus de 10 messages'
            ELSE 'Moins de 10 messages'
       END AS status
FROM conversations c
LEFT JOIN (
  SELECT conversation_id, COUNT(id) AS message_count
  FROM messages
  GROUP BY conversation_id
) m ON c.id = m.conversation_id;


-- IF in SELECT 
SELECT CONCAT('Conversation ', ROW_NUMBER() OVER (ORDER BY c.id)) AS conversations,
       IF(m.message_count > 10, 'Plus de 10 messages', 'Moins de 10 messages') AS status
FROM conversations c
LEFT JOIN (
  SELECT conversation_id, COUNT(id) AS message_count
  FROM messages
  GROUP BY conversation_id
) m ON c.id = m.conversation_id;


-- CREATE user with all PRIVILEGES
CREATE USER 'admintest'@'%' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON *.* TO 'admintest'@'%';
FLUSH PRIVILEGES;

-- CREATE user with readonly
CREATE USER 'usertest'@'%' IDENTIFIED BY 'password';
GRANT SELECT ON *.* TO 'usertest'@'%';
FLUSH PRIVILEGES;


-- Joined VIEW
CREATE VIEW messages_with_username AS SELECT messages.content, users.username FROM messages INNER JOIN users ON messages.user_id = users.id;

-- Simple VIEW
CREATE VIEW messages_view AS SELECT * FROM messages WHERE user_id = 1