-- Домашнее задание №7 Rudakov V.V.


--1. Вывести названия аудиторий, в которых читает лекции
--   преподаватель “Книголюбов Марат”.


SELECT LR.Name AS 'Названия аудиторий'
FROM LectureRoom AS LR JOIN Schedules AS SD ON LR.Id=SD.LectureRoomId
					   JOIN Lectures AS L ON SD.LectureId=L.Id
					   JOIN Teachers AS T ON L.TeacherId=T.Id
WHERE T.Surname +' '+ T.name LIKE 'Книголюбов Марат'
GROUP BY LR.Name;


--2. Вывести фамилии преподавателей, читающих лекции в группе
--   “QA-222”.


SELECT T.Surname AS 'Фамилии преподавателей'
FROM Teachers AS T JOIN Lectures AS L ON T.Id=L.TeacherId
				   JOIN GroupsLectures AS GL ON L.Id=GL.LectureId
				   JOIN Groups AS G ON G.Id=GL.GroupId
WHERE G.Name LIKE 'QA-222';


--3. Вывести дисциплины, которые читает преподаватель
--   “Книголюбов Марат” для групп 5-го курса.


SELECT S.Name AS 'Дисциплины'
FROM Teachers AS T JOIN Lectures AS L ON T.Id=L.TeacherId
				   JOIN Subjects AS S ON S.Id=L.SubjectId
				   JOIN GroupsLectures AS GL ON L.Id=GL.LectureId
				   JOIN Groups AS G ON G.Id=GL.GroupId
WHERE T.Surname +' '+ T.name LIKE 'Книголюбов Марат'
  AND G.Year = '5';


--4. Вывести фамилии преподавателей, которые не читают
--   лекции по понедельникам.


SELECT T.Surname AS 'Фамилии преподавателей'
FROM Schedules AS SD JOIN Lectures AS L ON SD.LectureId=L.Id
					 JOIN Teachers AS T ON L.TeacherId=T.Id
WHERE SD.DayOfWeek = 1;


--5. Вывести названия аудиторий, с указанием их корпусов,
--   в которых нет лекций в среду второй недели на третьей
--   паре.


SELECT DISTINCT LR.Name AS 'Аудитории', 
				LR.Building AS 'Корпус'
FROM LectureRoom AS LR JOIN Schedules AS SD ON LR.Id=SD.LectureRoomId
WHERE NOT EXISTS (SELECT *
			  FROM Schedules AS SD
			  WHERE SD.DayOfWeek = 3
				AND SD.Week = 2
				AND SD.Class = 3);


--6. Вывести полные имена преподавателей факультета “Биологический факультет”,
--   которые не курируют группы кафедры “Кафедра микробиологии”.


SELECT DISTINCT T.Surname +' '+ T.Name AS 'Преподаватели'
FROM Teachers AS T JOIN Deans AS D ON T.Id=D.TeacherId
				   JOIN Faculties AS F ON D.Id=F.DeanId
				   JOIN Departments AS DT ON F.Id=DT.FacultyId
				   JOIN Groups AS G ON DT.Id=G.DepartmentId
WHERE NOT EXISTS (SELECT *
					FROM Teachers AS T
				   WHERE F.Name LIKE 'Биологический факультет' 
			         AND DT.Name LIKE 'Кафедра микробиологии');


--7. Вывести список номеров всех корпусов, которые имеются
--   в таблицах факультетов, кафедр и аудиторий.


SELECT DISTINCT Building AS 'Список номеров'
FROM Faculties AS F
UNION ALL
SELECT DISTINCT Building 
FROM Departments AS D
UNION  ALL
SELECT DISTINCT Building 
FROM LectureRoom AS LR;


--8. Вывести полные имена преподавателей в следующем порядке: 
--   деканы факультетов, заведующие кафедрами, преподаватели,
--   кураторы, ассистенты.


SELECT T.Surname + ' ' + T.Name
FROM Teachers AS T  JOIN Deans AS D On T.Id=D.TeacherId
                    JOIN Faculties AS F ON D.Id = F.DeanId
UNION ALL
SELECT T.Surname + ' ' + T.Name
FROM Teachers AS T JOIN Deans AS D ON T.Id = D.TeacherId
                   JOIN Faculties AS F ON D.Id = F.DeanId
                   JOIN Departments AS Dep ON F.Id = Dep.Id
                   JOIN Heads AS H ON Dep.Id = H.Id
UNION ALL
SELECT T.Surname + ' ' + T.Name 
FROM Teachers AS T
UNION ALL
SELECT Surname + ' ' + T.Name 
FROM Teachers AS T JOIN Curators AS C  ON T.Id = C.TeacherId
UNION ALL
SELECT Surname + ' ' + T.Name 
FROM Teachers AS T JOIN Assistants AS A ON T.Id = A.TeacherId


--9. Вывести дни недели (без повторений), в которые имеются
--   занятия в аудиториях “С001” и “К077” корпуса 5.


SELECT DISTINCT SD.DayOfWeek AS 'Дни недели'
FROM Schedules AS SD JOIN LectureRoom AS LR ON LR.Id=SD.LectureRoomId
					 JOIN Lectures AS L ON SD.LectureId=L.Id
WHERE LR.Building = 5 AND LR.Name LIKE 'С001'
UNION ALL
SELECT DISTINCT SD.DayOfWeek
FROM Schedules AS SD JOIN LectureRoom AS LR ON LR.Id=SD.LectureRoomId
					 JOIN Lectures AS L ON SD.LectureId=L.Id
WHERE LR.Building = 5 AND LR.Name LIKE 'К077'

