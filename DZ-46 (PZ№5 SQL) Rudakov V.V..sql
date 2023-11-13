-- Практическое задание №5 Rudakov V.V.


--1. Вывести количество палат, вместимость которых больше 10.


SELECT W.Name AS 'Палаты'
FROM Wards AS W
WHERE W.Places > 10


--2. Вывести названия корпусов и количество палат в каждом
--   из них.


SELECT D.Building AS 'Названия Корпусов', 
       COUNT (W.Name) AS 'Кол-во Палат'
FROM Wards AS W JOIN Departments AS D ON D.Id=W.DepartmentId
GROUP BY D.Building


--3. Вывести названия отделений и количество палат в каждом из них.


SELECT D.Name AS 'Названия Отделений', 
       COUNT (W.Name) AS 'Кол-во Палат'
FROM Wards AS W JOIN Departments AS D ON D.Id=W.DepartmentId
GROUP BY D.Name


--4. Вывести названия отделений и суммарную надбавку
--   врачей в каждом из них.


SELECT D.Name AS 'Названия Отделений',
       SUM (DO.Premium) AS 'Суммарная надбавка'
FROM Wards AS W JOIN Departments AS D ON D.Id=W.DepartmentId
                JOIN DoctorsExaminations AS DE ON W.Id=DE.WardId
				JOIN Doctors AS DO ON DO.Id=DE.DoctorId
GROUP BY D.Name


--5. Вывести названия отделений, в которых проводят обследования 5 и более врачей.


SELECT D.Name AS 'Названия Отделений'
FROM Wards AS W JOIN Departments AS D ON D.Id=W.DepartmentId
                JOIN DoctorsExaminations AS DE ON W.Id=DE.WardId
				JOIN Doctors AS DO ON DO.Id=DE.DoctorId
WHERE DO.Id >= 5


--6. Вывести количество врачей и их суммарную зарплату
--   (сумма ставки и надбавки).


SELECT COUNT (D.Id) AS 'Кол-во Врачей',
       SUM (D.Premium + D.Salary) AS 'Сумм. Зарплата'
FROM Doctors AS D


--7. Вывести среднюю зарплату (сумма ставки и надбавки)
--   врачей.


SELECT AVG (D.Premium + D.Salary) AS 'Средняя Зарплата'
FROM Doctors AS D


--8. Вывести названия палат с минимальной вместительностью.


SELECT W.Name AS 'Названия Палат'
FROM Wards AS W
WHERE W.Places = 1


--9. Вывести в каких из корпусов 1, 6, 7 и 8, суммарное количество мест в палатах превышает 100. При этом учитывать
-- только палаты с количеством мест больше 10.


SELECT D.Building AS 'Названия Корпусов',
   SUM (W.Places) AS 'Кол-во Палат'
FROM Wards AS W JOIN Departments AS D ON D.Id=W.DepartmentId
WHERE W.Places > 10
GROUP BY D.Building
HAVING D.Building IN (1,6,7,8) AND SUM (W.Places) > 100