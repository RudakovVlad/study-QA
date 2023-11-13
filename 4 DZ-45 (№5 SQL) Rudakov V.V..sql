-- Домашнее задание №5 Rudakov V.V.

--1. Вывести количество преподавателей “Кафедра микробиологии”.


SELECT COUNT(T.Id) AS 'Кол-во преподавателей'
FROM Groups AS G JOIN Departments AS D ON D.Id=G.DepartmentId
				 JOIN GroupsLectures AS GL ON G.Id=GL.GroupId
				 JOIN Lectures AS L ON L.Id=GL.LectureId
				 JOIN Teachers AS T ON T.Id=L.TeacherId
WHERE D.Name='Кафедра микробиологии'


--2. Вывести количество лекций, которые читает преподаватель
--   “Пустохвалова Алла”.


SELECT COUNT(S.Id) AS 'Кол-во лекций'
FROM Teachers AS T JOIN Lectures AS L ON T.Id=L.TeacherId
				   JOIN Subjects AS S ON S.Id=l.SubjectId
WHERE T.Surname +' '+ T.Name='Пустохвалова Алла'


--3. Вывести количество занятий, проводимых в аудитории
--   “D201”.


SELECT LectureRoom, COUNT(Lectures.Id)
FROM Lectures
WHERE LectureRoom='D201'
GROUP BY LectureRoom


--4. Вывести названия аудиторий и количество лекций, проводимых в них.


SELECT LectureRoom AS 'Аудитория',
	   COUNT(S.Id) AS 'Кол-во лекций'
FROM Subjects AS S JOIN Lectures AS L ON S.Id=L.SubjectId
GROUP BY LectureRoom


--5. Вывести количество студентов, посещающих лекции преподавателя “Пустохвалова Алла”.


SELECT COUNT(St.Id) AS 'Кол-во студентов'
FROM Students AS St JOIN Groups AS G ON G.Id=St.GroupId
					JOIN GroupsLectures AS GL ON G.Id=GL.GroupId
				    JOIN Lectures AS L ON L.Id=GL.LectureId
				    JOIN Teachers AS T ON T.Id=L.TeacherId
WHERE T.Surname +' '+ T.Name='Пустохвалова Алла'


--6. Вывести среднюю ставку преподавателей “Философский факультет”.


SELECT AVG(T.Salary) AS 'Средняя ставка'
FROM Faculties AS F JOIN Departments AS D ON F.Id=D.FacultyId
					JOIN Groups AS G ON D.Id=G.DepartmentId
				    JOIN GroupsLectures AS GL ON G.Id=GL.GroupId
				    JOIN Lectures AS L ON L.Id=GL.LectureId
				    JOIN Teachers AS T ON T.Id=L.TeacherId
WHERE F.Name='Философский факультет'


--7. Вывести минимальное и максимальное количество студентов среди всех групп.


SELECT MIN(t1.CS),
	   MAX(t1.CS)
FROM (SELECT Groups.Name,
	         COUNT(Students.Id) AS CS
	  FROM Students JOIN Groups ON Groups.Id=Students.GroupId
	  GROUP BY Groups.Name) AS t1


--8. Вывести средний фонд финансирования кафедр.


SELECT AVG(D.Financing) AS 'Средний фонд финансирования'
FROM Departments AS D

--9. Вывести полные имена преподавателей и количество читаемых ими дисциплин.


SELECT T.Surname +' '+ T.Name AS 'Преподаватели',
	   COUNT(S.Id) AS 'Кол-во дисциплин'
FROM Teachers AS T JOIN Lectures AS L ON T.Id=L.TeacherId
				   JOIN Subjects AS S ON S.Id=l.SubjectId
GROUP BY T.Surname +' '+ T.Name

--10. Вывести количество лекций в каждый день недели.


SELECT GL.DayOfWeek AS 'День недели',
	   COUNT(L.Id) AS 'Кол-во лекций'
FROM Lectures AS L JOIN GroupsLectures AS GL ON L.Id=GL.GroupId
				   JOIN Teachers AS T ON T.Id=L.TeacherId
GROUP BY GL.DayOfWeek


--11. Вывести номера аудиторий и количество кафедр, чьи лекции в них читаются.


SELECT L.LectureRoom AS 'Номер аудитории',
	   COUNT(D.Id) AS 'Кол-во кафедр'
FROM Groups AS G JOIN Departments AS D ON D.Id=G.DepartmentId
				 JOIN GroupsLectures AS GL ON G.Id=GL.GroupId
				 JOIN Lectures AS L ON L.Id=GL.LectureId
GROUP BY L.LectureRoom

--12. Вывести названия факультетов и количество дисциплин,
--    которые на них читаются.


SELECT D.Name AS 'Название факультетов',
	   COUNT(S.Id) AS 'Кол-во дисциплин'
FROM Groups AS G JOIN Departments AS D ON D.Id=G.DepartmentId
				 JOIN GroupsLectures AS GL ON G.Id=GL.GroupId
				 JOIN Lectures AS L ON L.Id=GL.LectureId
				 JOIN Subjects AS S ON S.Id=l.SubjectId
GROUP BY D.Name


--13. Вывести количество лекций для каждой пары преподаватель-аудитория.


SELECT t.Surname +' '+ t.Name AS 'ФИ преподавателя',
	   l.LectureRoom AS 'Аудитория', 
	   COUNT(s.Id) AS 'Кол-во лекций'
FROM Teachers AS t JOIN Lectures AS l ON t.Id=l.TeacherId
				   JOIN Subjects AS s ON l.SubjectId=s.Id
GROUP BY t.Surname,
		 t.Name, 
		 l.LectureRoom
