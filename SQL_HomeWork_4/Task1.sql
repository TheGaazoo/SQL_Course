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

У сущности «лайки» имеются следующие поля(атрибуты): id – идентификатор;
user_id – пользователь, который поставил лайк;
media_id - медиа, который лайкнули.

У сущности «медиа» имеются следующие поля(атрибуты):
id – идентификатор;
user_id – пользователь – владелец медиа;
body - содержимое;
filename – ссылка на файл;
created_at - дата создания;
updated_at - дата последнего обновления.

Найдите общее количество лайков, которые получили пользователи женского пола.
*/
SELECT COUNT(*) -- количество лайков
FROM likes l
JOIN media m ON l.media_id = m.id
JOIN profiles p ON p.user_id = m.user_id
WHERE p.gender = 'f';
