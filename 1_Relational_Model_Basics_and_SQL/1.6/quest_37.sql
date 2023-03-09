# Вывести название месяца и количество командировок для каждого месяца. Считаем, что командировка относится
# к некоторому месяцу, если она началась в этом месяце. Информацию вывести сначала в отсортированном по
# убыванию количества, а потом в алфавитном порядке по названию месяца виде.  Название столбцов – Месяц и
# Количество.
SELECT MONTHNAME(date_first) AS Месяц,
       COUNT(date_first)     AS Количество
  FROM trip
 GROUP BY 1
 ORDER BY 2 DESC, 1;

# Вывести сумму суточных (произведение количества дней командировки и размера суточных) для командировок,
# первый день которых пришелся на февраль или март 2020 года.  Значение суточных для каждой командировки
# занесено в столбец per_diem. Вывести фамилию и инициалы сотрудника, город,  первый день командировки и
# сумму суточных.  Последний столбец назвать Сумма. Информацию отсортировать сначала  в алфавитном порядке
# по фамилиям сотрудников, а затем по убыванию суммы суточных.
SELECT name,
       city,
       date_first,
       SUM((DATEDIFF(date_last, date_first) + 1) * per_diem) AS Сумма
  FROM trip
 WHERE MONTHNAME(date_first) IN ('February', 'March')
   AND YEAR(date_first) = 2020
 GROUP BY name, city, date_first
 ORDER BY name, Сумма DESC;

# Вывести фамилию с инициалами и общую сумму суточных, полученных за все командировки для тех сотрудников,
# которые были в командировках больше чем 3 раза, в отсортированном по убыванию сумм суточных виде.
# Последний столбец назвать Сумма.
SELECT name,
       SUM((DATEDIFF(date_last, date_first) + 1) * per_diem) AS Сумма
  FROM trip
 GROUP BY name
HAVING COUNT(name) > 3
 ORDER BY Сумма DESC;