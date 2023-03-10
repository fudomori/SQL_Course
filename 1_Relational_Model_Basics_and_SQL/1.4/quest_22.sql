# Вывести информацию о книгах, количество экземпляров которых отличается от среднего количества экземпляров
# книг на складе более чем на 3. То есть нужно вывести и те книги, количество экземпляров которых меньше
# среднего на 3, или больше среднего на 3.
SELECT title,
       author,
       amount
  FROM book
 WHERE ABS(amount - (SELECT AVG(amount) FROM book)) > 3;

# Вывести информацию (автора, название и цену) о тех книгах, цены которых превышают минимальную цену книги
# на складе не более чем на 150 рублей в отсортированном по возрастанию цены виде.
SELECT author,
       title,
       price
  FROM book
 WHERE price <= (SELECT MIN(price) + 150 FROM book)
 ORDER BY price;