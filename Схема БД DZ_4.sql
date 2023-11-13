--Скрипты создания и наполнения таблиц базы данных Academy:
--CREATE DATABASE Academy_DZ_4


CREATE TABLE Curators ( 
Id int NOT NULL IDENTITY(1,1) PRIMARY KEY,
Name NVARCHAR(max) NOT NULL DEFAULT 'Иван',
Surname NVARCHAR(max) NOT NULL DEFAULT 'Иванов')

CREATE TABLE Faculties (
Id int NOT NULL IDENTITY(1,1) PRIMARY KEY,
Financing money NOT NULL CHECK (Financing>=0) DEFAULT 0,
Name NVARCHAR(100) NOT NULL DEFAULT 'Факультет' UNIQUE)

CREATE TABLE Departments (
Id int NOT NULL IDENTITY(1,1) PRIMARY KEY,
Financing money NOT NULL CHECK (Financing>=0) DEFAULT 0,
Name NVARCHAR(100) NOT NULL DEFAULT 'Кафедра' UNIQUE,
FacultyId int NOT NULL FOREIGN KEY REFERENCES Faculties (Id))

CREATE TABLE Groups (
Id int NOT NULL IDENTITY(1,1) PRIMARY KEY,
Name NVARCHAR(100) NOT NULL DEFAULT 'Группа' UNIQUE,
Year int NOT NULL CHECK (Year >= 1 AND Year <=5),
DepartmentId int NOT NULL FOREIGN KEY REFERENCES Departments (Id))

CREATE TABLE GroupsCurators (
Id int NOT NULL IDENTITY(1,1) PRIMARY KEY,
CuratorId int NOT NULL FOREIGN KEY REFERENCES Curators (Id),
GroupId int NOT NULL FOREIGN KEY REFERENCES Groups (Id))

CREATE TABLE Subjects (
Id int NOT NULL IDENTITY(1,1) PRIMARY KEY,
Name NVARCHAR(100) NOT NULL DEFAULT 'Дисцилина' UNIQUE)

CREATE TABLE Teachers ( 
Id int NOT NULL IDENTITY(1,1) PRIMARY KEY,
Name NVARCHAR(max) NOT NULL DEFAULT 'Иван',
Salary money NOT NULL CHECK (Salary>0),
Surname NVARCHAR(max) NOT NULL DEFAULT 'Иванов')


CREATE TABLE Lectures (
Id int NOT NULL IDENTITY(1,1) PRIMARY KEY,
LectureRoom NVARCHAR(max) NOT NULL DEFAULT 'Аудитория',
SubjectId int NOT NULL FOREIGN KEY REFERENCES Subjects (Id),
TeacherId int NOT NULL FOREIGN KEY REFERENCES Teachers (Id))


CREATE TABLE GroupsLectures (
Id int NOT NULL IDENTITY(1,1) PRIMARY KEY,
GroupId int NOT NULL FOREIGN KEY REFERENCES Groups (Id),
LectureId int NOT NULL FOREIGN KEY REFERENCES Lectures (Id))





INSERT INTO Faculties (Financing, Name)
VALUES (150000, 'Биологический факультет'),
	   (140000, 'Географический факультет'),
	   (155000, 'Геологический факультет'),
	   (138000, 'Механико-математический факультет'),
	   (178000, 'Социологический факультет'),
	   (256000, 'Факультет иностранных языков'),
	   (350000, 'Факультет компьютерных наук и информационных технологий'),
	   (125350, 'Факультет психологии'),
	   (400000, 'Факультет фундаментальной медицины'),
	   (125000, 'Философский факультет'),
	   (166000, 'Экономический факультет'),
	   (178000, 'Юридический факультет'),
	   (149000, 'Факультет истории');

INSERT INTO Departments(Financing, Name, FacultyId)
VALUES (75000, 'Кафедра биохимии и биофизики', 1),
	   (55000, 'Кафедра ботаники и экологии', 1),
	   (68000, 'Кафедра геоморфологии и геоэкологии', 2),
	   (32000, 'Кафедра метеорологии и климатологии', 2),
	   (25000, 'Кафедра геологии и геохимии горючих ископаемых', 3),
	   (38000, 'Кафедра геофизики', 3),
	   (100000, 'Кафедра компьютерной алгебры и теории чисел', 4),
	   (80000, 'Кафедра математики и методики ее преподавания', 4),
	   (98000, 'Кафедра прикладной социологии', 5),
	   (80000, 'Кафедра социологии регионов', 5),
	   (128000, 'Кафедра немецкого языка', 6),
	   (110000, 'Кафедра английского языка', 6),
	   (175000, 'Кафедра математической кибернетики и информационных наук', 7),
	   (100000, 'Кафедра информационных систем', 7),
	   (62350, 'Кафедра общей и социальной психологии', 8),
	   (60000, 'Кафедра педагогики', 8),
	   (200000, 'Кафедра медицинской кибернетики', 9),
	   (200000, 'Кафедра основ медицины и медицинских технологий', 9),
	   (65000, 'Кафедра теологии и религиоведения', 10),
	   (60000, 'Кафедра теоретической и социальной философии', 10),
	   (160000, 'Кафедра экономической теории', 11),
	   (6000, 'Кафедра менеджмента и маркетинга', 11),
	   (98000, 'Кафедра социальных коммуникаций', 12),
	   (80000, 'Кафедра таможенного права', 12),
	   (79000, 'Кафедра истории России и археологии', 13),
	   (70000, 'Кафедра истории древнего мира', 13);

INSERT INTO Curators (Name, Surname)
VALUES ('Дарья', 'Иванова'),
	   ('Снежанна', 'Стулова'),
	   ('Анна', 'Исаева'),
	   ('Сергей', 'Субботин'),
	   ('Иван', 'Котов'),
	   ('Александр', 'Кашин'),
	   ('Артемий', 'Безроднов'),
	   ('Ирина', 'Тимофеева'),
	   ('Алексей', 'Научный'),
	   ('Олеся', 'Горная'),
	   ('Светлана', 'Мышкина')

INSERT INTO Teachers (Name, Surname, Salary)
VALUES
('Егор','Комнатный', 1440),
('Петр','Имнатов', 500),
('Иван','Бобровских', 1000),
('Алексей','Штатный', 720),
('Юрий','Внештатный', 1052),
('Елена','Кривоногова', 2230),
('Кристина','Иванова', 720), 
('Эльвира','Квадратова', 1500), 
('Анна','Овалова', 580),
('Алла','Овалова', 1300),
('Егор','Крылатов', 1440),
('Петр','Мохнатов', 500), 
('Иван','Иголкин', 1000),
('Алексей','Морковкин', 720),
('Юрий','Прямой', 1052),
('Елена','Кривошеева', 2230),
('Инга','Кислина', 620),
('Эльвира','Казакова', 1440),
('Анна','Игошина', 900),
('Алла','Пустохвалова', 1302);



INSERT INTO Subjects (Name)
VALUES ('Биология'),
		('Химия'),
		('Геология'),
		('География'),
		('Информатика'),
		('Высшая математика'),
		('Английский'),
		('Немецкий'),
		('История России'),
		('История древнего мира'),
		('Экономика')

INSERT INTO Lectures (LectureRoom, SubjectId, TeacherId)
VALUES ('Аудитория иностранных языков', 7, 1),
	   ('Аудитория иностранных языков', 8, 1),
		('Аудитория биологии', 1, 2),
		('Аудитория химии', 2, 2),
		('Аудитория геологии и географии', 3, 3),
		('Аудитория геологии и географии', 4, 4),
		('Кабинет информатики', 5, 5),
		('Кабинет высшей математики', 6, 6),
		('Кабинет истории', 9, 7),
		('Кабинет истории', 10, 8),
	    ('Аудитории экономики', 11, 11)

INSERT INTO Groups (Name, Year, DepartmentId)
 VALUES ('БиБ', 1, 1),
	   ('БиЭ', 1, 2),
		('ГиГ', 2, 3),
		('МиК', 2, 4),
		('ГиГГИ', 3, 5),
		('ГеоФ', 4, 6),
		('КАТЧ', 5, 7),
		('МиМ', 4, 8),
		('ПриСоц', 1, 9),
		('СоцРег', 1, 10),
		('ИнЯЗ1', 2, 11),
		('ИнЯЗ2', 2, 12)

INSERT INTO GroupsCurators (CuratorId, GroupId)
VALUES (1, 1),
	   (2, 2),
	   (3, 3),
	   (4, 4),
	   (5, 5),
	   (6, 6),
	   (7, 7),
	   (8, 8),
	   (9, 9),
	   (10, 10),
	   (11, 11),
	   (11, 12)

INSERT INTO GroupsLectures (GroupId, LectureId)
VALUES (1, 3),
	   (2, 4),
	   (3, 5),
	   (4, 8),
	   (5, 6),
	   (6, 6),
	   (7, 8),
	   (8, 4),
	   (9, 9),
	   (10, 9),
	   (11, 2),
	   (12, 2)


