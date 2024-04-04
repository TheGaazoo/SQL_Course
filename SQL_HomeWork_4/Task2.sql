/*
Имеется база данных – социальная сеть.

База данных содержит сущности:
users – пользователи;
messages – сообщения;
friend_requests – заявки на дружбу;
communities – сообщества;
users_communities – пользователи сообществ;
media_types – типы медиа;
media – медиа;
likes – лайки;
profiles – профили пользователя.

У сущности «пользователи» имеются следующие поля(атрибуты):
id – идентификатор;
firstname – имя;
lastname - фамилия;
email - адрес электронной почты.

У сущности «профиль пользователя» имеются следующие поля(атрибуты):
user_id – идентификатор;
gender – пол;
birthday - дата рождения;
photo_id - аватарка;
hometown - город.

Атрибут «пол» сущности «профиль пользователя» может принимать следующие значения:
'f' - женский;
'm' - мужской.

У сущности «лайки» имеются следующие поля(атрибуты):
id – идентификатор;
user_id – пользователь, который поставил лайк;
media_id - медиа, который лайкнули.

Найдите количество лайков, которые поставили пользователи женского пола и мужского пола.
Выведите название пола (преобразовав значение атрибута f в женский, а значение ‘m` - мужской)
 и количество, поставленных лайков, применив к количеству лайков сортировку по убыванию.
*/

SELECT 
CASE p.gender
WHEN 'f' THEN 'женский'
WHEN 'm' THEN 'мужской'
END AS gender, 
COUNT(*) AS cnt
FROM likes l 
JOIN profiles p on l.user_id = p.user_id
GROUP BY p.gender 
ORDER BY cnt DESC;

