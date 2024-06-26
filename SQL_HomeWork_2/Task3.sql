/*
Имеется таблица (сущность) с мобильными телефонами mobile_phones.
У сущности имеются следующие поля(атрибуты):
id – идентификатор;
product_name – название;
manufacturer – производитель;
product_count – количество;
price – цена.

Сущность mobile_phones имеет следующие записи:
id 	product_name 	manufacturer 	product_count 	price
1 	iPhone X 	Apple 	156 	76000
2 	iPhone 8 	Apple 	180 	51000
3 	Galaxy S9 	Samsung 	21 	56000
4 	Galaxy S8 	Samsung 	124 	41000
5 	P20 Pro 	Huawei 	341 	36000

Имеется таблица-справочник (сущность) производителей manufacturer.
У сущности имеются следующие поля(атрибуты):
id – идентификатор;
name – название.

Сущность manufacturer имеет следующие записи:
id 	name
1 	Apple
2 	Samsung
3 	Huawei

Создайте для сущности mobile_phones внешний ключ manufacturer_id 
(идентификатор производителя), направленный на атрибут id сущности manufacturer.
 Установите каскадное обновление - CASCADE, а при удалении записи из 
 сущности manufacturer – SET NULL.

Используя CRUD-операцию UPDATE обновите данные в атрибуте manufacturer_id 
сущности mobile_phones согласно значений, имеющихся в атрибуте manufacturer.

Удалите атрибут manufacturer из сущности mobile_phones.

Выведите идентификатор, название и идентификатор производителя сущности 
mobile_phones.
*/

-- Добавление внешнего ключа в таблицу mobile_phones
ALTER TABLE mobile_phones
ADD COLUMN manufacturer_id BIGINT,
ADD CONSTRAINT fk_manufacturer
    FOREIGN KEY (manufacturer_id)
    REFERENCES manufacturers(id)
    ON UPDATE CASCADE ON DELETE SET NULL;

-- Обновление значения manufacturer_id в таблице mobile_phones на основе поля manufacturer
UPDATE mobile_phones SET manufacturer_id = 1 WHERE manufacturer = 'Apple';
UPDATE mobile_phones SET manufacturer_id = 2 WHERE manufacturer = 'Samsung';
UPDATE mobile_phones SET manufacturer_id = 3 WHERE manufacturer = 'Huawei';

-- Удаление атрибута manufacturer из таблицы mobile_phones
ALTER TABLE mobile_phones
DROP COLUMN manufacturer;

-- Вывод id, product_name и manufacturer_id из таблицы mobile_phones
SELECT id, product_name, manufacturer_id FROM mobile_phones;

