--create database AcademyDZ7;
--go

use AcademyDZ7; 
go

create table [Assistants]
(
	[Id] int not null identity (1,1) primary key,
	[TeacherId] int not null
);
go

create table [Curators]
(
	[Id] int not null identity(1, 1) primary key,
	[TeacherId] int not null 
);
go

create table [Deans]
(
	[Id] int not null identity(1, 1) primary key,
	[TeacherId] int not null 
);
go

create table [Departments]
(
	[Id] int not null identity(1, 1) primary key,
	[Building] int not null check ([Building] between 1 and 5),
	[Name] nvarchar(100) not null unique check ([Name] <> N''),
	[FacultyId] int not null ,
	[HeadId] int not null 
);
go

create table [Faculties]
(
	[Id] int not null identity(1, 1) primary key,
	[Building] int not null check ([Building] between 1 and 5),
	[Name] nvarchar(100) not null unique check ([Name] <> N''),
	[DeanId] int not null
);
go

create table [Groups]
(
	[Id] int not null identity(1, 1) primary key,
	[Name] nvarchar(100) not null unique check ([Name] <> N''),
	[Year] int not null check ([Year] between 1 and 5),
	[DepartmentId] int not null
);
go

create table [GroupsCurators]
(
	[id] int not null identity(1, 1) primary key,
	[CuratorId] int not null,
	[GroupId] int not null
);
go

create table [GroupsLectures]
(
	[Id] int not null identity(1, 1) primary key,
	[GroupId] int not null,
	[LectureId] int not null
);
go

create table [Heads]
(
	[Id] int not null identity(1, 1) primary key,
	[TeacherId] int not null
);
go

create table [LectureRoom]
(
	[Id] int not null identity(1, 1) primary key,
	[Building] int not null check ([Building] between 1 and 5),
	[Name] nvarchar(10) not null check ([Name] <> N'')
);
go

create table [Lectures]
(
	[Id] int not null identity(1, 1) primary key,
	[SubjectId] int not null,
	[TeacherId] int not null
);
go

create table [Schedules]
(
	[Id] int not null identity(1, 1) primary key,
	[Class] int not null check ([Class] between 1 and 8),
	[DayOfWeek] int not null check ([DayOfWeek] between 1 and 7),
	[Week] int not null check ([Week] between 1 and 52),
	[LectureId] int not null,
	[LectureRoomId] int not null
);
go

create table [Subjects]
(
	[Id] int not null identity(1, 1) primary key,
	[Name] nvarchar(100) not null unique check ([Name] <> N'')
);
go

create table [Teachers]
(
	[Id] int not null identity(1, 1) primary key,
	[Name] nvarchar(max) not null check ([Name] <> N''),
	[Surname] nvarchar(max) not null check ([Surname] <> N''),
);
go

alter table[Assistants]
add foreign key ([TeacherId]) references [Teachers]([Id]);
go

alter table [Curators]
add foreign key ([TeacherId]) references [Teachers]([Id]);
go

alter table [Deans]
add foreign key ([TeacherId]) references [Teachers]([Id]);
go

alter table [Departments]
add foreign key ([FacultyId]) references [Faculties]([Id]);
go

alter table [Departments]
add foreign key ([HeadId]) references [Heads]([Id]);
go

alter table [Faculties]
add foreign key ([DeanId]) references [Deans]([Id]);
go

alter table [Groups]
add foreign key ([DepartmentId]) references [Departments]([Id]);
go

alter table[GroupsCurators]
add foreign key ([CuratorId]) references [Curators]([Id]);
go

alter table[GroupsCurators]
add foreign key ([GroupId]) references [Groups]([Id]);
go

alter table [GroupsLectures]
add foreign key ([GroupId]) references [Groups]([Id]);
go

alter table [GroupsLectures]
add foreign key ([LectureId]) references [Lectures]([Id]);
go

alter table [Heads]
add foreign key ([TeacherId]) references [Teachers]([Id]);
go

alter table [Lectures]
add foreign key ([SubjectId]) references [Subjects]([Id]);
go

alter table [Lectures]
add foreign key ([TeacherId]) references [Teachers]([Id]);
go

alter table [Schedules]
add foreign key ([LectureId]) references [Lectures]([Id]);
go

alter table [Schedules]
add foreign key ([LectureRoomId]) references [LectureRoom]([Id]);
go	

insert into [Teachers] ([Name], [Surname]) 
VALUES
('����','���������'),('����','�������'),('����','����������'),('�������','�������'),('����','����������'),('�����','�����������'),('��������','�������'), ('�������','����������'), 
('����','�������'),('����','�������'),('����','��������'),('����','��������'), ('����','�������'),('�������','���������'),('����','������'),('�����','����������'),
('����','�������'),('�������','��������'),('����','�������'),('����','������������'),('�������','������'),('������','��������'),('��������','����������'),('�����','����������'),
('��������','��������'),('�����','�������'),('������','������'),('����','��������'),('������','�������'),('������','�������'),('�������','�������������'),('�����','��������'),
('�����','���������'),('����','��������'),('������','������'),('�����','������'),('��������','��������'),('����������','������'),('����','���������'),('����','�������'),
('����','��������'),('�����','��������'),('�����','���������'),('����','��������'),('��������','����������'),('�������','�������'),('������','�������'),('�����','�������'),
('������','����������'),('������','�������'),('�������','�������'),('������','��������'),('�����','��������'),('�������','��������'),('�����','�������'),('���������','��������'),
('�����','������'),('������','������'),('������','��������'),('�����','����������');
go

insert into [Assistants] ([TeacherId])
VALUES
(25),(30),(32),(45),(46),(48),(49),(50),(51),(54),(55),(56),(57),(58),(59),(60);
go

insert into [Curators] ([TeacherId])
VALUES
(12),(18),(20),(21),(23),(26),(27),(31),(33),(34),(35),(36),(40),(41),(42),(45);
go

insert into [Deans] ([TeacherId])
VALUES
(1),(2),(3),(4),(5),(6),(7),(8),(9),(10);
go

insert into [Heads] ([TeacherId])
VALUES
(11),(13),(14),(15),(16),(17),(19),(22),(24),(47),
(25),(28),(29),(31),(33),(37),(38),(39),(43),(44),
(52),(53),(12),(18),(20),(21),(25),(26);
go

insert into [Faculties] ([Name],[Building],[DeanId]) 
values
('��������-�������������� ���������',1,10), 
('����������� ���������',2,9), 
('��������� ������������ ���� � �������������� ����������',3,8), 
('�������� ������',4,7), 
('������� ����������������',5,1),
('�������� ������� � ������������� ���������',1,2), 
('��������� ��������������� �������� � ����������� ����������',2,3), 
('��������� ����������� ������ � ���������������',3,4), 
('�������� �����',4,5), 
('������������� ���������',5,6);
go

insert into  [Departments] ([Building],[Name],[FacultyId],[HeadId])
values 
(1,'������� ������������ ������ �� ���� �� ��� ���',4,1),
(2,'������� ���������� ���������� � �������������� ����������',1,2),
(3,'������� ���������������� ��������� � �������������� ���������',1,3),
(4,'������� ����������� � ����������������',3,4),
(5,'������� �������������� ������ � ���������� � ��������',3,5),
(5,'������� �������',6,6),
(4,'������� ������������ ������� � ������ �����',1,7),
(3,'������� ������������ ����',3,8),
(2,'������� ������������ ������ � ��������������',3,9),
(1,'������� ����������, �����������, ������',1,28),
(1,'������� �������������� ����� ����������� � ������������ ����������������',5,10),
(2,'������� ��������������� �������',1,11),
(3,'������� ��������������� � ������������� �������������',1,12),
(4,'������� ��������������� ����������� �������������� ���������� � �������������� ������',3,13),
(5,'������� �������������� ����������� � ������������ ����',3,14),
(1,'������� �������������� ������ � �������������� ����������',1,15),
(2,'������� ����������� �����������',7,16),
(3,'������� ������������� ��������� � ������� �������� ������',8,17),
(4,'������� ����������� � �����������',2,18),
(5,'������� ����������� � ����������',6,19),
(5,'������� ����� ���������� � �����������',1,20),
(4,'������� ���������� ������������ �����������',3,21),
(3,'������� ������� ������',4,22),
(2,'������� �������� ����� � ����������',2,23),
(1,'������� ����������� ����',6,24),
(5,'������� ������������� �����',9,25),
(1,'������� ���������� ����������',9,26),
(3,'������� �������������',10,27);
go

insert into [Groups]  ([Name], [Year], [DepartmentId]) 
values
('QA-130', 1, 1), ('QA-129', 1,6),('QA-128', 1,11),('QA-127', 1,16),('QA-126', 1,21),('QA-125', 1,26),
('QA-224', 2, 2), ('QA-223', 2,7),('QA-222', 2,12),('QA-221', 2,17),('QA-220', 2,22),('QA-219', 2,27),
('QA-318', 3, 3), ('QA-317', 3,8),('QA-316', 3,13),('QA-315', 3,18),('QA-314', 3,23),('QA-313', 3,28),
('QA-412', 4, 4), ('QA-411', 4,9),('QA-410', 4,14),('QA-409', 4,19),('QA-408', 4,24),('QA-407', 4,5),
('QA-506', 5, 5), ('QA-505', 5,10),('QA-504', 5,15),('QA-503', 5,20),('QA-502', 5,25),('QA-501', 5,16);
go

insert into [GroupsCurators] ([CuratorId],[GroupId])
values
(16,1),(15,2),(14,3),(13,4),(12,5),(11,6),(10,7),(9,8),(8,9),(7,10),(5,11),(4,12),(3,13),(2,14),(1,15),(16,16),(15,17),(14,18),(13,19),(12,20),
(11,21),(10,22),(9,23),(8,24),(7,25),(5,26),(4,27),(3,28),(2,29),(1,30);
go

insert into [LectureRoom] ([Name],[Building]) 
values
('�054', 1), ('�101',2), ('�106',3), ('�224',4), ('�001',5), ('�022',1),
('�055', 1), ('�102',2), ('�107',3), ('�225',4), ('�002',5), ('�011',2),
('�056', 1), ('�103',2), ('�108',3), ('�226',4), ('�003',5), ('�033',3),
('�057', 1), ('�104',2), ('�109',3), ('�227',4), ('�004',5), ('�044',4),
('�068', 1), ('�105',2), ('D201',3), ('�230',4), ('�005',5), ('�077',5);
go

insert into [Subjects] ([Name]) 
values
('�������'), ('���� ������'), ('��������'), ('���������'), ('���������� ����������'), ('����������� ����'), 
('����������� � ����������������'), ('�����������'), ('�����������'), ('�������� ����'), ('����������'), 
('���������'), ('�������������� ������ � ������ ����������'), ('�������������� ������'), 
('����������������'), ('������� ����'), ('������'), ('���������'), ('�����'), ('������� ������'); 
go

insert into [Lectures] ([SubjectId],[TeacherId])
values
(1,60),(2,45),(3,38),(4,27),(5,54),(6,16),(7,23),(8,22),(9,27),(10,57),(11,1),(12,2),(13,3),(14,4),(15,5),(16,6),(17,7),(18,8),(19,9),(20,10),
(1,58),(2,48),(3,49),(4,39),(5,29),(6,19),(7,35),(8,32),(9,27),(10,28),(11,3),(12,56),(13,18),(14,8),(15,36),(16,47),(17,55),(18,56),(19,4),(20,8);
go

insert into [GroupsLectures] ([GroupId],[LectureId]) 
values
(1,30),(2,29),(3,28),(4,27),(5,26),(6,25),(7,24),(8,23),(9,21),(10,20),(11,19),(12,18),(13,17),(14,16),(15,15),(16,14),(17,13),(18,12),(19,11),(20,10),(21,9),
(22,8),(23,7),(24,6),(25,5),(26,4),(27,3),(28,2),(29,1),(30,22),(1,16),(2,17),(3,18),(4,19),(5,20),(6,21),(7,22),(8,30),(9,29),(10,28),(11,27),(12,26),
(13,25),(14,24),(15,23),(16,1),(17,2),(18,3),(19,4),(20,5),(21,6),(22,7),(23,8),(24,9),(25,10),(26,11),(27,12),(28,13),(29,14),(30,15);
go

insert into [Schedules] ([Class],[DayOfWeek],[Week],[LectureId],[LectureRoomId]) 
values
(1,7,1,30,30),(2,6,2,29,29),(3,5,3,28,28),(4,4,4,27,27),(5,3,5,26,26),(5,2,6,25,25),(5,1,7,24,24),(2,7,8,23,23),(3,6,9,21,21),(4,5,35,20,20),(5,4,11,19,19),(6,3,37,18,18),(6,2,13,17,17),(6,1,14,16,16),
(3,7,15,15,15),(4,6,16,14,14),(5,5,17,13,13),(6,4,18,12,12),(7,3,19,11,11),(7,2,20,10,10),(7,1,21,9,9),(4,1,22,8,8),(5,2,23,7,7),(6,3,24,6,6),(7,4,25,5,5),(8,5,26,4,4),(8,6,40,3,3),(8,7,28,2,2),
(5,1,29,1,1),(6,2,30,22,22),(7,3,52,16,16),(8,4,2,17,17),(1,5,3,18,18),(1,6,4,19,19),(1,7,33,20,20),(6,1,6,21,21),(7,2,7,22,22),(8,3,45,30,30),(1,4,9,29,29),(2,5,10,28,28),(2,6,11,27,27),(2,7,34,26,26),
(7,7,13,25,25),(8,6,14,24,24),(1,5,15,23,23),(2,4,16,1,1),(3,3,17,2,2),(3,2,18,3,3),(3,1,19,4,4),(8,1,20,5,5),(1,2,21,6,6),(2,3,22,7,7),(3,4,23,8,8),(4,5,24,9,9),(4,6,25,10,10),(4,7,26,11,11),
(1,4,27,12,12),(2,3,28,13,13),(3,2,29,14,14),(4,1,30,15,15);
go
