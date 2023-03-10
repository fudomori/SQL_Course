# Вывести суммарную стоимость книг каждого автора.
SELECT author,
       SUM(amount * price) AS стоимость
  FROM book
 GROUP BY author;

# Найти среднюю цену книг каждого автора.
SELECT author,
       ROUND(AVG(price), 2) AS средняя_цена
  FROM book
 GROUP BY author;

# Для каждого автора вычислить суммарную стоимость книг S (имя столбца Стоимость), а также вычислить налог
# на добавленную стоимость  для полученных сумм (имя столбца НДС ) , который включен в стоимость и
# составляет k = 18%,  а также стоимость книг  (Стоимость_без_НДС) без него. Значения округлить до двух
# знаков после запятой.
SELECT author,
       ROUND(SUM(amount * price), 2)                 AS стоимость,
       ROUND((SUM(amount * price) * 0.18) / 1.18, 2) AS ндс,
       ROUND(SUM(amount * price) / 1.18, 2)          AS стоимость_без_ндс
  FROM book
 GROUP BY author;
