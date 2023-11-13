-- �������� ������� �7 Rudakov V.V.


--1. ������� �������� ���������, � ������� ������ ������
--   ������������� ����������� �����.


SELECT LR.Name AS '�������� ���������'
FROM LectureRoom AS LR JOIN Schedules AS SD ON LR.Id=SD.LectureRoomId
					   JOIN Lectures AS L ON SD.LectureId=L.Id
					   JOIN Teachers AS T ON L.TeacherId=T.Id
WHERE T.Surname +' '+ T.name LIKE '���������� �����'
GROUP BY LR.Name;


--2. ������� ������� ��������������, �������� ������ � ������
--   �QA-222�.


SELECT T.Surname AS '������� ��������������'
FROM Teachers AS T JOIN Lectures AS L ON T.Id=L.TeacherId
				   JOIN GroupsLectures AS GL ON L.Id=GL.LectureId
				   JOIN Groups AS G ON G.Id=GL.GroupId
WHERE G.Name LIKE 'QA-222';


--3. ������� ����������, ������� ������ �������������
--   ����������� ����� ��� ����� 5-�� �����.


SELECT S.Name AS '����������'
FROM Teachers AS T JOIN Lectures AS L ON T.Id=L.TeacherId
				   JOIN Subjects AS S ON S.Id=L.SubjectId
				   JOIN GroupsLectures AS GL ON L.Id=GL.LectureId
				   JOIN Groups AS G ON G.Id=GL.GroupId
WHERE T.Surname +' '+ T.name LIKE '���������� �����'
  AND G.Year = '5';


--4. ������� ������� ��������������, ������� �� ������
--   ������ �� �������������.


SELECT T.Surname AS '������� ��������������'
FROM Schedules AS SD JOIN Lectures AS L ON SD.LectureId=L.Id
					 JOIN Teachers AS T ON L.TeacherId=T.Id
WHERE SD.DayOfWeek = 1;


--5. ������� �������� ���������, � ��������� �� ��������,
--   � ������� ��� ������ � ����� ������ ������ �� �������
--   ����.


SELECT DISTINCT LR.Name AS '���������', 
				LR.Building AS '������'
FROM LectureRoom AS LR JOIN Schedules AS SD ON LR.Id=SD.LectureRoomId
WHERE NOT EXISTS (SELECT *
			  FROM Schedules AS SD
			  WHERE SD.DayOfWeek = 3
				AND SD.Week = 2
				AND SD.Class = 3);


--6. ������� ������ ����� �������������� ���������� �������������� ���������,
--   ������� �� �������� ������ ������� �������� �������������.


SELECT DISTINCT T.Surname +' '+ T.Name AS '�������������'
FROM Teachers AS T JOIN Deans AS D ON T.Id=D.TeacherId
				   JOIN Faculties AS F ON D.Id=F.DeanId
				   JOIN Departments AS DT ON F.Id=DT.FacultyId
				   JOIN Groups AS G ON DT.Id=G.DepartmentId
WHERE NOT EXISTS (SELECT *
					FROM Teachers AS T
				   WHERE F.Name LIKE '������������� ���������' 
			         AND DT.Name LIKE '������� �������������');


--7. ������� ������ ������� ���� ��������, ������� �������
--   � �������� �����������, ������ � ���������.


SELECT DISTINCT Building AS '������ �������'
FROM Faculties AS F
UNION�ALL
SELECT DISTINCT Building�
FROM Departments AS D
UNION��ALL
SELECT DISTINCT Building�
FROM LectureRoom AS LR;


--8. ������� ������ ����� �������������� � ��������� �������: 
--   ������ �����������, ���������� ���������, �������������,
--   ��������, ����������.


SELECT T.Surname + ' ' + T.Name
FROM Teachers AS T� JOIN Deans AS D On T.Id=D.TeacherId
������������������� JOIN Faculties AS F ON D.Id = F.DeanId
UNION ALL
SELECT T.Surname + ' ' + T.Name
FROM Teachers AS T JOIN Deans AS D ON T.Id = D.TeacherId
������������������ JOIN Faculties AS F ON D.Id = F.DeanId
������������������ JOIN Departments AS Dep ON F.Id = Dep.Id
������������������ JOIN Heads AS H ON Dep.Id = H.Id
UNION ALL
SELECT T.Surname + ' ' + T.Name�
FROM Teachers AS T
UNION ALL
SELECT Surname + ' ' + T.Name�
FROM Teachers AS T JOIN Curators AS C� ON T.Id = C.TeacherId
UNION ALL
SELECT Surname + ' ' + T.Name�
FROM Teachers AS T JOIN Assistants AS A ON T.Id = A.TeacherId


--9. ������� ��� ������ (��� ����������), � ������� �������
--   ������� � ���������� ��001� � ��077� ������� 5.


SELECT DISTINCT SD.DayOfWeek AS '��� ������'
FROM Schedules AS SD JOIN LectureRoom AS LR ON LR.Id=SD.LectureRoomId
					 JOIN Lectures AS L ON SD.LectureId=L.Id
WHERE LR.Building = 5 AND LR.Name LIKE '�001'
UNION ALL
SELECT DISTINCT SD.DayOfWeek
FROM Schedules AS SD JOIN LectureRoom AS LR ON LR.Id=SD.LectureRoomId
					 JOIN Lectures AS L ON SD.LectureId=L.Id
WHERE LR.Building = 5 AND LR.Name LIKE '�077'

