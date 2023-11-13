-- ������������ ������� �5 Rudakov V.V.


--1. ������� ���������� �����, ����������� ������� ������ 10.


SELECT W.Name AS '������'
FROM Wards AS W
WHERE W.Places > 10


--2. ������� �������� �������� � ���������� ����� � ������
--   �� ���.


SELECT D.Building AS '�������� ��������', 
       COUNT (W.Name) AS '���-�� �����'
FROM Wards AS W JOIN Departments AS D ON D.Id=W.DepartmentId
GROUP BY D.Building


--3. ������� �������� ��������� � ���������� ����� � ������ �� ���.


SELECT D.Name AS '�������� ���������', 
       COUNT (W.Name) AS '���-�� �����'
FROM Wards AS W JOIN Departments AS D ON D.Id=W.DepartmentId
GROUP BY D.Name


--4. ������� �������� ��������� � ��������� ��������
--   ������ � ������ �� ���.


SELECT D.Name AS '�������� ���������',
       SUM (DO.Premium) AS '��������� ��������'
FROM Wards AS W JOIN Departments AS D ON D.Id=W.DepartmentId
                JOIN DoctorsExaminations AS DE ON W.Id=DE.WardId
				JOIN Doctors AS DO ON DO.Id=DE.DoctorId
GROUP BY D.Name


--5. ������� �������� ���������, � ������� �������� ������������ 5 � ����� ������.


SELECT D.Name AS '�������� ���������'
FROM Wards AS W JOIN Departments AS D ON D.Id=W.DepartmentId
                JOIN DoctorsExaminations AS DE ON W.Id=DE.WardId
				JOIN Doctors AS DO ON DO.Id=DE.DoctorId
WHERE DO.Id >= 5


--6. ������� ���������� ������ � �� ��������� ��������
--   (����� ������ � ��������).


SELECT COUNT (D.Id) AS '���-�� ������',
       SUM (D.Premium + D.Salary) AS '����. ��������'
FROM Doctors AS D


--7. ������� ������� �������� (����� ������ � ��������)
--   ������.


SELECT AVG (D.Premium + D.Salary) AS '������� ��������'
FROM Doctors AS D


--8. ������� �������� ����� � ����������� ����������������.


SELECT W.Name AS '�������� �����'
FROM Wards AS W
WHERE W.Places = 1


--9. ������� � ����� �� �������� 1, 6, 7 � 8, ��������� ���������� ���� � ������� ��������� 100. ��� ���� ���������
-- ������ ������ � ����������� ���� ������ 10.


SELECT D.Building AS '�������� ��������',
   SUM (W.Places) AS '���-�� �����'
FROM Wards AS W JOIN Departments AS D ON D.Id=W.DepartmentId
WHERE W.Places > 10
GROUP BY D.Building
HAVING D.Building IN (1,6,7,8) AND SUM (W.Places) > 100