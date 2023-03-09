# Вывести в алфавитном порядке фамилии и инициалы тех сотрудников, которые были в командировке в Москве.
SELECT DISTINCT name
  FROM trip
 WHERE city = 'Москва'
 ORDER BY name;

# Для каждого города посчитать, сколько раз сотрудники в нем были.  Информацию вывести в отсортированном в
# алфавитном порядке по названию городов. Вычисляемый столбец назвать Количество.
SELECT city,
       COUNT(city) AS Количество
  FROM trip
 GROUP BY city
 ORDER BY city;