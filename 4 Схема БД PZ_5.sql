create table [Departments]
(
	[Id] int not null identity(1, 1) primary key,
	[Building] int not null check ([Building] between 1 and 5),
	[Name] nvarchar(100) not null unique check ([Name] <> N'')
);
go 

create table [Doctors]
(
	[Id] int not null identity(1, 1) primary key,
	[Name] nvarchar(max) not null check ([Name] <> N''),
	[Premium] money not null check ([Premium] >= 0) default 0,
	[Salary] money not null check ([Salary] > 0),
	[Surname] nvarchar(max) not null check ([Surname] <> N'')
);
go

create table [Wards]
(
	[Id] int not null identity(1, 1) primary key,
	[Name] nvarchar(20) not null unique check([Name] <> N''),
	[Places] int not null check ([Places]>=1),
	[DepartmentId] int not null
);
go

create table [Examinations]
(
	[Id] int not null identity(1, 1) primary key,
	[Name] nvarchar(100) not null unique check([Name] <> N'')
);
go

create table [DoctorsExaminations]
(
	[Id] int not null identity(1, 1) primary key,
	[EndTime] time not null,
	[StartTime] time not null check ([StartTime] between '08:00' and '18:00'),
	[DoctorId] int not null,
	[ExaminationId] int not null,
	[WardId] int not null,
	check ([StartTime] < [EndTime])
);
go

alter table [DoctorsExaminations]
add foreign key ([DoctorId]) references [Doctors]([Id]);
go

alter table [DoctorsExaminations]
add foreign key ([ExaminationId]) references [Examinations]([Id]);
go

alter table [DoctorsExaminations]
add foreign key ([WardId]) references [Wards]([Id]);
go

alter table [Wards]
add foreign key ([DepartmentId]) references [Departments]([Id]);
go





INSERT INTO Doctors (Name, Premium, Salary, Surname)
VALUES 
('Галина', 5000, 25000, 'Светкина'),('Анна', 3500, 18000, 'Ишкина'),
('Наталья', 15000, 35000, 'Волошина'),
('Андрей', 25000, 35000, 'Аникин'),
('Анна', 16000, 32000, 'Ильина'),
('Сергей', 26500, 54000, 'Новиков'),
('Армен', 13000, 27000, 'Петросян'),
('Марина', 7500, 33000, 'Дорохова'),
('Лариса', 3000, 23000, 'Котова'),
('Ульяна', 65000, 30000, 'Васильева'),
('Ян',  1500, 15000, 'Коньков'),
('Иннокентий', 2300, 25500, 'Усов'),
('Иван',1000,5000, 'Сыроедов'),
('Семен',1500,2000, 'Гарин'),
('Виктор',5000,7000, 'Мишлев'),
('Станислав',4700,100,'Уточкин'),
('Валерия', 900, 8000, 'Аляпьева'),
('Елена', 5000, 1000, 'Савелова');
go


INSERT INTO Examinations (Name)
Values ('Общее'),
('Ежедневный обход'),
('Стационар'),
('Полное'),
('Перевязка'),
('Консультация'),
('Анализы'),
('Общий клинический анализ крови'),
('Общий анализ мочи'),
('Биохимический анализ крови'),
('Анализ крови на сахар'),
('Электрокардиограмма'),
('Флюорография'),
('Осмотр офтальмолога'),
('Осмотр гинеколога'),
('Осмотр проктолог');
go


insert into  [Departments] ([Building], [Name])
VALUES 
(1,'Приемное отделение'),
(2,'Палатные отделения'),
(2,'Лечебно-диагностические отделения'),
(5,'Лаборатории'),
(4,'Центральное стерилизационное отделение'),
(1,'Аптека'),
(3,'Служба приготовления пищи'),
(4,'Патанатомическое отделение'),
(3,'Административно-хозяйственная служба'),
(5,'Прачечные'),
(2, 'Кардиологическое отделение'),
(2, 'Хирургическое отделение'),
(3, 'Терапевтическое отделение'),
(3, 'Травмотологическое отделение'),
(3, 'Ортопедическое отделение'),
(4, 'Кабинет стоматолога'),
(4, 'Кабинет офтальмолога'),
(5, 'Рентгенологическое отделение'),
(5, 'Эндоскопическое отделение'),
(5, 'Ультразвуковая диагностика'),
(5, 'Отделение функциональной диагностики');


INSERT INTO Wards (Name, Places, DepartmentId)
Values 
('Палата 21', 5, 1),
('Палата 22', 3, 2),
('Палата 23', 3, 3),
('Палата 24', 2, 4),
('Палата 25', 2, 5),
('Палата 26', 2, 5),
('Палата 27', 2, 5),
('Палата 1',2,2),
('Палата 2',4,3),
('Палата 3',5,2),
('Палата 4',7,2),
('Палата 5',12,2),
('Палата 6',2,2),
('Палата 7',7,2),
('Палата 8',6,3),
('Палата 9',3,2),
('Палата 10',1,2),
('Палата 11',4,3),
('Палата 12',1,3),
('Палата 13',5,3),
('Палата 14',1,4),
('Палата 15',1,3),
('Палата 16',2,3),
('Палата 17',1,3),
('Палата 18',3,2),
('Палата 19',3,3),
('Палата 20',5,3);
go


INSERT INTO DoctorsExaminations (EndTime, StartTime, DoctorId, ExaminationId, WardId)
Values 
('10:00','09:00', 1, 1, 1),
('9:30','8:30', 2, 2, 2),
('15:30','9:30', 3, 3, 3),
('17:30','14:30', 4, 4, 4),
('12:30','11:00', 5, 5, 5),
('8:30','8:10', 6, 6, 6),
('11:10','10:30', 7, 7, 7),
('08:30','08:00',8,1,7),
('09:00','08:30',9,2,7),
('09:30','09:00',10,3,8),
('10:00','09:30',11,4,27),
('10:30','10:00',12,7,22),
('11:00','10:30',13,4,23),
('11:30','11:00',1,3,24),
('12:00','11:30',2,1,25),
('12:30','12:00',3,4,26),
('13:00','12:30',4,6,27),
('13:30','13:00',5,7,1),
('14:00','13:30',6,8,5),
('14:30','14:00',1,2,7),
('15:00','14:30',2,1,8),
('15:30','15:00',3,8,12),
('16:00','15:30',4,5,11),
('16:30','16:00',5,3,14),
('17:00','16:30',6,2,16),
('17:30','17:00',1,5,16),
('18:00','17:30',2,9,18);
go








