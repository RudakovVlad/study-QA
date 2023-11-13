-- Экзаменационная работа по SQL Rudakov V.V.


--1. Показать все книги, количество страниц в которых больше
--   500, но меньше 650.


SELECT B.Name AS 'Книги'
FROM Books AS B
WHERE B.Pages BETWEEN 500 AND 650


--2. Показать все книги, в которых первая буква названия либо
--   «А», либо «З».


SELECT B.Name AS 'Книги'
FROM Books AS B
WHERE B.Name LIKE 'А%'
   OR B.Name LIKE 'З%'


--3. Показать все книги жанра «Детектив», количество проданных книг более 30 экземпляров.


SELECT B.Name AS 'Книги'
FROM Books AS B JOIN Themes AS T ON T.Id=B.ThemeId
                JOIN Sales AS S ON B.Id=S.BookId
WHERE T.Name LIKE 'Детектив'
  AND S.Quantity > 30


--4. Показать все книги, в названии которых есть слово «Microsoft», но нет слова «Windows».


SELECT B.Name AS 'Книги'
FROM Books AS B
WHERE B.Name LIKE '%Microsoft%'
  AND B.Name NOT LIKE '%Windows%'


--5. Показать все книги (название, тематика, полное имя автора
--   в одной ячейке), цена одной страницы которых меньше 65 копеек.


SELECT B.Name +' '+ 
       T.Name +' '+ 
	   A.Surname +' '+ 
	   A.Name AS 'Название, тематика, полное имя автора'
FROM Books AS B JOIN Themes AS T ON T.Id=B.ThemeId
                JOIN Sales AS S ON B.Id=S.BookId
				JOIN Authors AS A ON A.Id=B.AuthorId
WHERE (B.Price / B.Pages) < 0.65


--6. Показать все книги, название которых состоит из 4 слов.


SELECT B.Name AS 'Книги'
FROM Books AS B
WHERE B.Name LIKE '% % % %'


--7. Показать информацию о продажах в следующем виде:
--▷ Название книги, но, чтобы оно не содержало букву «А».
--▷ Тематика, но, чтобы не «Программирование».
--▷ Автор, но, чтобы не «Герберт Шилдт».
--▷ Цена, но, чтобы в диапазоне от 10 до 20 гривен.
--▷ Количество продаж, но не менее 8 книг.
--▷ Название магазина, который продал книгу, но он не
--  должен быть в Украине или России.


SELECT B.Name AS 'Книги',
       T.Name AS 'Тематика',
	   A.Name AS 'Автор',
	   B.Price AS 'Цена',
	   S.Quantity AS 'Количество продаж',
	   SH.Name AS 'Название магазина'
FROM Books AS B JOIN Themes AS T ON T.Id=B.ThemeId
                JOIN Sales AS S ON B.Id=S.BookId
				JOIN Authors AS A ON A.Id=B.AuthorId
				JOIN Countries AS C ON C.Id=A.CountryId
				JOIN Shops AS SH ON C.Id=SH.CountryId
WHERE B.Name NOT LIKE '%А%'
  AND T.Name NOT LIKE '%Программирование%'
  AND A.Name NOT LIKE '%Герберт Шилдт%'
  AND B.Price BETWEEN 100 AND 200
  AND S.Quantity < 8
  AND SH.CountryId NOT LIKE 'Украина'
  AND SH.CountryId NOT LIKE 'Россия'


--8. Показать следующую информацию в два столбца (числа
--   в правом столбце приведены в качестве примера):
--▷ Количество авторов: 14
--▷ Количество книг: 47
--▷ Средняя цена продажи: 85.43 грн.
--▷ Среднее количество страниц: 650.6.


SELECT 'Количество авторов', COUNT(A.Id)
FROM Authors AS A
UNION ALL
SELECT 'Количество книг', COUNT(B.Id)
FROM Books AS B
UNION ALL
SELECT 'Средняя цена продажи', AVG(S.Price)
FROM Sales AS S
UNION ALL
SELECT 'Среднее количество страниц', AVG(B.Pages)
FROM Books AS B


--9. Показать тематики книг и сумму страниц всех книг по
--   каждой из них.


SELECT T.Name AS 'Тематика',
       B.ThemeId AS 'Кол-во книг в тематике',
   SUM (B.Pages) AS 'Сумма страниц'
FROM Themes AS T JOIN Books AS B ON T.Id=B.ThemeId
GROUP BY T.Name, B.ThemeId


--10. Показать количество всех книг и сумму страниц этих книг
--    по каждому из авторов.


SELECT DISTINCT A.Name + ' '+ A.Surname AS 'Автор',
          COUNT (B.AuthorId) AS 'Кол-во книг у автора',
			SUM (B.Pages) AS 'Сумма страниц'
FROM Books AS B JOIN Authors AS A ON A.Id=B.AuthorId
GROUP BY A.Name, A.Surname, B.AuthorId


--11. Показать книгу тематики «Программирование» с наибольшим количеством страниц.


SELECT B.Name AS 'Книга'
FROM Books AS B JOIN Themes AS T ON T.Id=B.ThemeId
 AND B.Pages = (SELECT MAX (B.Pages)
                  FROM Books AS B JOIN Themes AS T ON T.Id=B.ThemeId
			     WHERE T.Name LIKE 'Программирование')


--12. Показать среднее количество страниц по каждой тематике,
--    которое не превышает 400.


SELECT T.Name AS 'Тематика',
   AVG (B.Pages) AS 'Кол-во страниц'
FROM Books AS B JOIN Themes AS T ON T.Id=B.ThemeId
WHERE B.Pages < 400
GROUP BY T.Name


--13. Показать сумму страниц по каждой тематике, учитывая
--    только книги с количеством страниц более 400, и чтобы
--    тематики были «Программирование», «Администрирование» и «Дизайн».


SELECT T.Name AS 'Тематика',
   SUM (B.Pages) AS 'Кол-во страниц'
FROM Books AS B JOIN Themes AS T ON T.Id=B.ThemeId
WHERE B.Pages > 400
  AND T.Name IN ('Программирование', 
                 'Администрирование', 
				 'Дизайн')
GROUP BY T.Name


--14. Показать информацию о работе магазинов: что, где, кем,
--    когда и в каком количестве было продано.


SELECT B.Name AS 'Что продали',
	   C.Name AS 'Где продали',
	   SH.Name AS 'Кем продано',
	   S.SaleDate AS 'Когда продано',
	   S.Quantity AS 'Кол-во'
FROM Shops AS SH JOIN Sales AS S ON SH.Id=S.ShopId
                 JOIN Books AS B ON B.Id=S.BookId
				 JOIN Countries AS C ON C.Id=SH.CountryId


--15. Показать самый прибыльный магазин.


SELECT SH.Name AS 'Магазин'   
FROM Shops AS SH JOIN Sales AS S ON SH.Id=S.ShopId
WHERE (S.Price * S.Quantity)
    = (SELECT MAX (S.Price * S.Quantity)
         FROM Shops AS SH JOIN Sales AS S ON SH.Id=S.ShopId)
