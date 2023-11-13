-- Домашнее задание №4 Rudakov V.V.

--1. Вывести все возможные пары строк преподавателей и групп.


SELECT *
FROM Teachers, Groups


--2. Вывести названия факультетов, фонд финансирования
--   кафедр которых превышает фонд финансирования факультета.


SELECT Faculties.Name AS 'Факультеты'
FROM Faculties JOIN Departments ON Departments.FacultyId=Faculties.Id
WHERE Departments.Financing > Faculties.Financing


--3. Вывести фамилии кураторов групп и названия групп, которые они курируют.


SELECT Curators.Surname AS 'Фамилии Кураторов', 
	   Groups.Name AS 'Группы'
FROM Curators JOIN GroupsCurators ON GroupsCurators.CuratorId=Curators.Id
			  JOIN Groups ON GroupsCurators.GroupId=Groups.Id


--4. Вывести имена и фамилии преподавателей, которые читают
--	 лекции у группы “ПриСоц”.


SELECT Teachers.Surname +' '+ Teachers.Name AS 'ФИ Преподавателей'
FROM Groups JOIN GroupsLectures ON GroupsLectures.GroupId=Groups.Id
			JOIN Lectures ON GroupsLectures.LectureId=Lectures.Id
			JOIN Teachers ON Lectures.TeacherId=Teachers.Id
WHERE Groups.Name LIKE 'ПриСоц%'


--5. Вывести фамилии преподавателей и названия факультетов
--   на которых они читают лекции.


SELECT Teachers.Surname AS 'Преподаватель', 
	   Departments.Name AS 'Факультет'
FROM Faculties JOIN Departments ON Departments.FacultyId=Faculties.Id
			   JOIN Groups ON Groups.DepartmentId=Departments.Id
			   JOIN GroupsLectures ON GroupsLectures.GroupId=Groups.Id
			   JOIN Lectures ON GroupsLectures.LectureId=Lectures.Id
			   JOIN Teachers ON Lectures.TeacherId=Teachers.Id 


--6. Вывести названия кафедр и названия групп, которые к
--   ним относятся.


SELECT Departments.Name AS 'Кафедры', 
	   Groups.Name AS 'Группы'
FROM Departments JOIN Groups ON Groups.DepartmentId=Departments.Id


--7. Вывести названия дисциплин, которые читает преподаватель “Комнатный Егор”.


SELECT Subjects.Name AS 'Предмет', 
	   Teachers.Surname +' '+ Teachers.Name AS 'ФИ Преподавателя'
FROM Teachers JOIN Lectures ON Lectures.TeacherId=Teachers.Id
			  JOIN Subjects ON Lectures.SubjectId=Subjects.Id
WHERE Teachers.Surname +' '+ Teachers.Name LIKE 'Комнатный Егор'


--8. Вывести названия кафедр, на которых читается дисциплина
--   “Химия”.


SELECT Departments.Name AS 'Кафедры'
FROM Departments JOIN Groups ON Groups.DepartmentId=Departments.Id
			     JOIN GroupsLectures ON GroupsLectures.GroupId=Groups.Id
			     JOIN Lectures ON GroupsLectures.LectureId=Lectures.Id
			     JOIN Subjects ON Lectures.SubjectId=Subjects.Id 
WHERE Subjects.Name LIKE 'Химия'


--9. Вывести названия групп, которые относятся к факультету
--   “Факультет иностранных языков”.


SELECT Groups.Name AS 'Группы'
FROM Faculties JOIN Departments ON Departments.FacultyId=Faculties.Id
			   JOIN Groups ON Groups.DepartmentId=Departments.Id
			   JOIN GroupsLectures ON GroupsLectures.GroupId=Groups.Id
WHERE Faculties.Name LIKE 'Факультет иностранных языков'


--10. Вывести названия групп 5-го курса, а также название факультетов, к которым они относятся.


SELECT Groups.Name AS 'Группы', 
	   Faculties.Name AS 'Факультеты'
FROM Faculties JOIN Departments ON Departments.FacultyId=Faculties.Id
			   JOIN Groups ON Groups.DepartmentId=Departments.Id
			   JOIN GroupsLectures ON GroupsLectures.GroupId=Groups.Id
WHERE Groups.Year IN (5)


--11. Вывести полные имена преподавателей и лекции, которые
--    они читают (названия дисциплин и групп), причем отобрать
--	  только те лекции, которые читаются в “Аудитория иностранных языков”.


SELECT Teachers.Surname +' '+ Teachers.Name AS 'ФИ Преподавателей',
	   Subjects.Name AS 'Предметы'
FROM Teachers JOIN Lectures ON Lectures.TeacherId=Teachers.Id
			  JOIN Subjects ON Lectures.SubjectId=Subjects.Id
WHERE Lectures.LectureRoom LIKE 'Аудитория иностранных языков'

