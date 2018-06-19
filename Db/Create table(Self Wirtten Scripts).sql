use [TechnossusDb]

Create table tblUser (Id int identity(1,1) primary key,Name varchar(100) not null,Address nvarchar(500) not null)

Create table tblUserSkillLink (Id int identity(1,1) primary key,userId int not null,skillId int not null)

Create table tblSkill (Id int identity(1,1) primary key,skill nvarchar(100) not null)

ALTER TABLE tblUserSkillLink ADD FOREIGN KEY (userId) REFERENCES tblUser(Id); 

ALTER TABLE tblUserSkillLink ADD FOREIGN KEY (skillId) REFERENCES tblSkill(Id); 
