-- �������� ������� �4 Rudakov V.V.

--1. ������� ��� ��������� ���� ����� �������������� � �����.


SELECT *
FROM Teachers, Groups


--2. ������� �������� �����������, ���� ��������������
--   ������ ������� ��������� ���� �������������� ����������.


SELECT Faculties.Name AS '����������'
FROM Faculties JOIN Departments ON Departments.FacultyId=Faculties.Id
WHERE Departments.Financing > Faculties.Financing


--3. ������� ������� ��������� ����� � �������� �����, ������� ��� ��������.


SELECT Curators.Surname AS '������� ���������', 
	   Groups.Name AS '������'
FROM Curators JOIN GroupsCurators ON GroupsCurators.CuratorId=Curators.Id
			  JOIN Groups ON GroupsCurators.GroupId=Groups.Id


--4. ������� ����� � ������� ��������������, ������� ������
--	 ������ � ������ ��������.


SELECT Teachers.Surname +' '+ Teachers.Name AS '�� ��������������'
FROM Groups JOIN GroupsLectures ON GroupsLectures.GroupId=Groups.Id
			JOIN Lectures ON GroupsLectures.LectureId=Lectures.Id
			JOIN Teachers ON Lectures.TeacherId=Teachers.Id
WHERE Groups.Name LIKE '������%'


--5. ������� ������� �������������� � �������� �����������
--   �� ������� ��� ������ ������.


SELECT Teachers.Surname AS '�������������', 
	   Departments.Name AS '���������'
FROM Faculties JOIN Departments ON Departments.FacultyId=Faculties.Id
			   JOIN Groups ON Groups.DepartmentId=Departments.Id
			   JOIN GroupsLectures ON GroupsLectures.GroupId=Groups.Id
			   JOIN Lectures ON GroupsLectures.LectureId=Lectures.Id
			   JOIN Teachers ON Lectures.TeacherId=Teachers.Id 


--6. ������� �������� ������ � �������� �����, ������� �
--   ��� ���������.


SELECT Departments.Name AS '�������', 
	   Groups.Name AS '������'
FROM Departments JOIN Groups ON Groups.DepartmentId=Departments.Id


--7. ������� �������� ���������, ������� ������ ������������� ���������� ����.


SELECT Subjects.Name AS '�������', 
	   Teachers.Surname +' '+ Teachers.Name AS '�� �������������'
FROM Teachers JOIN Lectures ON Lectures.TeacherId=Teachers.Id
			  JOIN Subjects ON Lectures.SubjectId=Subjects.Id
WHERE Teachers.Surname +' '+ Teachers.Name LIKE '��������� ����'


--8. ������� �������� ������, �� ������� �������� ����������
--   �������.


SELECT Departments.Name AS '�������'
FROM Departments JOIN Groups ON Groups.DepartmentId=Departments.Id
			     JOIN GroupsLectures ON GroupsLectures.GroupId=Groups.Id
			     JOIN Lectures ON GroupsLectures.LectureId=Lectures.Id
			     JOIN Subjects ON Lectures.SubjectId=Subjects.Id 
WHERE Subjects.Name LIKE '�����'


--9. ������� �������� �����, ������� ��������� � ����������
--   ���������� ����������� ������.


SELECT Groups.Name AS '������'
FROM Faculties JOIN Departments ON Departments.FacultyId=Faculties.Id
			   JOIN Groups ON Groups.DepartmentId=Departments.Id
			   JOIN GroupsLectures ON GroupsLectures.GroupId=Groups.Id
WHERE Faculties.Name LIKE '��������� ����������� ������'


--10. ������� �������� ����� 5-�� �����, � ����� �������� �����������, � ������� ��� ���������.


SELECT Groups.Name AS '������', 
	   Faculties.Name AS '����������'
FROM Faculties JOIN Departments ON Departments.FacultyId=Faculties.Id
			   JOIN Groups ON Groups.DepartmentId=Departments.Id
			   JOIN GroupsLectures ON GroupsLectures.GroupId=Groups.Id
WHERE Groups.Year IN (5)


--11. ������� ������ ����� �������������� � ������, �������
--    ��� ������ (�������� ��������� � �����), ������ ��������
--	  ������ �� ������, ������� �������� � ���������� ����������� ������.


SELECT Teachers.Surname +' '+ Teachers.Name AS '�� ��������������',
	   Subjects.Name AS '��������'
FROM Teachers JOIN Lectures ON Lectures.TeacherId=Teachers.Id
			  JOIN Subjects ON Lectures.SubjectId=Subjects.Id
WHERE Lectures.LectureRoom LIKE '��������� ����������� ������'

