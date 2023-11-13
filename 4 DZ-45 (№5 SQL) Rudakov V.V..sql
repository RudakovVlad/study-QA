-- �������� ������� �5 Rudakov V.V.

--1. ������� ���������� �������������� �������� �������������.


SELECT COUNT(T.Id) AS '���-�� ��������������'
FROM Groups AS G JOIN Departments AS D ON D.Id=G.DepartmentId
				 JOIN GroupsLectures AS GL ON G.Id=GL.GroupId
				 JOIN Lectures AS L ON L.Id=GL.LectureId
				 JOIN Teachers AS T ON T.Id=L.TeacherId
WHERE D.Name='������� �������������'


--2. ������� ���������� ������, ������� ������ �������������
--   ������������� �����.


SELECT COUNT(S.Id) AS '���-�� ������'
FROM Teachers AS T JOIN Lectures AS L ON T.Id=L.TeacherId
				   JOIN Subjects AS S ON S.Id=l.SubjectId
WHERE T.Surname +' '+ T.Name='������������ ����'


--3. ������� ���������� �������, ���������� � ���������
--   �D201�.


SELECT LectureRoom, COUNT(Lectures.Id)
FROM Lectures
WHERE LectureRoom='D201'
GROUP BY LectureRoom


--4. ������� �������� ��������� � ���������� ������, ���������� � ���.


SELECT LectureRoom AS '���������',
	   COUNT(S.Id) AS '���-�� ������'
FROM Subjects AS S JOIN Lectures AS L ON S.Id=L.SubjectId
GROUP BY LectureRoom


--5. ������� ���������� ���������, ���������� ������ ������������� ������������� �����.


SELECT COUNT(St.Id) AS '���-�� ���������'
FROM Students AS St JOIN Groups AS G ON G.Id=St.GroupId
					JOIN GroupsLectures AS GL ON G.Id=GL.GroupId
				    JOIN Lectures AS L ON L.Id=GL.LectureId
				    JOIN Teachers AS T ON T.Id=L.TeacherId
WHERE T.Surname +' '+ T.Name='������������ ����'


--6. ������� ������� ������ �������������� ������������ ���������.


SELECT AVG(T.Salary) AS '������� ������'
FROM Faculties AS F JOIN Departments AS D ON F.Id=D.FacultyId
					JOIN Groups AS G ON D.Id=G.DepartmentId
				    JOIN GroupsLectures AS GL ON G.Id=GL.GroupId
				    JOIN Lectures AS L ON L.Id=GL.LectureId
				    JOIN Teachers AS T ON T.Id=L.TeacherId
WHERE F.Name='����������� ���������'


--7. ������� ����������� � ������������ ���������� ��������� ����� ���� �����.


SELECT MIN(t1.CS),
	   MAX(t1.CS)
FROM (SELECT Groups.Name,
	         COUNT(Students.Id) AS CS
	  FROM Students JOIN Groups ON Groups.Id=Students.GroupId
	  GROUP BY Groups.Name) AS t1


--8. ������� ������� ���� �������������� ������.


SELECT AVG(D.Financing) AS '������� ���� ��������������'
FROM Departments AS D

--9. ������� ������ ����� �������������� � ���������� �������� ��� ���������.


SELECT T.Surname +' '+ T.Name AS '�������������',
	   COUNT(S.Id) AS '���-�� ���������'
FROM Teachers AS T JOIN Lectures AS L ON T.Id=L.TeacherId
				   JOIN Subjects AS S ON S.Id=l.SubjectId
GROUP BY T.Surname +' '+ T.Name

--10. ������� ���������� ������ � ������ ���� ������.


SELECT GL.DayOfWeek AS '���� ������',
	   COUNT(L.Id) AS '���-�� ������'
FROM Lectures AS L JOIN GroupsLectures AS GL ON L.Id=GL.GroupId
				   JOIN Teachers AS T ON T.Id=L.TeacherId
GROUP BY GL.DayOfWeek


--11. ������� ������ ��������� � ���������� ������, ��� ������ � ��� ��������.


SELECT L.LectureRoom AS '����� ���������',
	   COUNT(D.Id) AS '���-�� ������'
FROM Groups AS G JOIN Departments AS D ON D.Id=G.DepartmentId
				 JOIN GroupsLectures AS GL ON G.Id=GL.GroupId
				 JOIN Lectures AS L ON L.Id=GL.LectureId
GROUP BY L.LectureRoom

--12. ������� �������� ����������� � ���������� ���������,
--    ������� �� ��� ��������.


SELECT D.Name AS '�������� �����������',
	   COUNT(S.Id) AS '���-�� ���������'
FROM Groups AS G JOIN Departments AS D ON D.Id=G.DepartmentId
				 JOIN GroupsLectures AS GL ON G.Id=GL.GroupId
				 JOIN Lectures AS L ON L.Id=GL.LectureId
				 JOIN Subjects AS S ON S.Id=l.SubjectId
GROUP BY D.Name


--13. ������� ���������� ������ ��� ������ ���� �������������-���������.


SELECT t.Surname +' '+ t.Name AS '�� �������������',
	   l.LectureRoom AS '���������', 
	   COUNT(s.Id) AS '���-�� ������'
FROM Teachers AS t JOIN Lectures AS l ON t.Id=l.TeacherId
				   JOIN Subjects AS s ON l.SubjectId=s.Id
GROUP BY t.Surname,
		 t.Name, 
		 l.LectureRoom
