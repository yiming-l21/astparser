create database 学生管理系统
on
(
	name = stu,
	filename = 'D:\temp\database\stu.mdf',
	size = 10,
	maxsize = 50,
	filegrowth = 5%
)
log on
(
	name = stu_log,
	filename = 'D:\temp\database\stu.ldf',
	size = 5,
	filegrowth = 5%,
	maxsize = 25
)