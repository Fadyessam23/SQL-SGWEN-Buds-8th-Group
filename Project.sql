delete from buds_information
delete from parents_info
delete from buds_information
delete from buds_information

/* Insert data for table Buds_Information */
INSERT INTO Buds_Information(Bud_ID, Bud_Name, National_ID, Birth_Date,[Address],School,JoinedAT,LeaveAT)
VALUES 
(1, 'Andrew Sherif Youssef', null,'20191110',null,null,null, '20251109'),
(2, 'Youssef Fady Atef', '31904090102138','20190409','44 Sherif Basha West el Balad','Collège de la salle (BAC)',null, '20250408'),
(3, 'Youssef Samy Makram','32008010101231','20200801','8 Ali Fahmy Kamel Mahkama square Masr el gedida ','Ramses International School','20220722', '20251109'),
(4, 'Chris Morcos', null,null,null,null,'20230303',null),
(5, 'Chris Rober Kamal Fayez', '32011010105173','20201101','27 Atteia el kholy Nasr city','Baby Class','20231103', '20261101'),
(6, 'Gislan Jean Adel', '32005318800875','20200531','A6 tiba buildings zahraa El maadi',null,'20230217', '20260531'),
(7, 'Mourad Fady Selim', '31905150103658','20190515','14 Hassan Moussa el akad','Ecole oasis','20240301', '20250514'),
(8, 'Aser Youssef', null,null,null,null,null,null),
(9, 'Evan Alber Mamdouh','31906132402199','20190613','Gardenia City Suez Road','Own Heliopolis','20231215','20250613'),
(10, 'Youssef Maher', null,'20191004',null,null,'20241101',null),
(11, 'Rafy Philpp Nagy','32106010104178','20210601','Tigan Compound - Zahraa el Maadi',null,'20241101', '20270601'),
(12, 'Youssef Hany Riad', null,'20191019',null,null,null, '20251019'),
(13, 'Youssef Mina Raafat Selim', null,null,null,null,'20250307',null),
(14, 'Diala Youssef Nagy', null,null,null,null,'20250208', null),
(15, 'Rafy Alex Sandro', null,null,null,null,'20250413',null),
(16, 'Mark Magdy Azer','32103110100251','20210311','Ebn El-Haithan Street Abass El Akad','Frere Masr-El-gedida','20250413', '20270311'),
(17, 'Kevin Antony Henry','32003300104852','20200330','34 Montazah Street-Helipolis','New Ramses College','20251107', '20260330'),
(18, 'Karim Peter Nicola',null,null,null,null,'20250307',null)
alter table Buds_information alter column father_job nvarchar (50)
alter table parents_info alter column father_job nvarchar (50)
alter table parents_info alter column total_payment nvarchar (50)
alter table buds_Payments add total_payment as ((case when T_Shirt_Paid = 1 then 250.00 else 0 end) + ( case when T_Shirt_Paid_2 = 1 then 200.00 else 0 end)+ 
(case when Foulard_paid = 1 then 70.00 else 0 end) + (case when Annual_Subscripted_Paid = 1 then 300.00 else 0 end)) 
/* Insert data for table Parents_Info */
INSERT INTO Parents_Info(Father_Name, Father_Phone, Father_Job, Mother_Name,Mother_Phone,Mother_Job,Home_No,Bud_ID)
VALUES 
('Sherif Youssef', null, null,'Shereen','01223708132',null,null, 1),
('Fady Atef William', '01221111770','Clothes merchant','Marllin Emad Aiad','01280449337',null,null, 2),
('Samy Makram Wahba','01001021418','Senior Accountant','Marian Youssry Youssef','01224339986','Former Guest Relations Manager',null,3),
('Morcos','01555058332',null,null,null,null,null,4),
('Rober Kamal Fayez','01271010015','Purchasing manager','Mavie Youssef Fekry','01271010087','Freelancer',null,5),
('Jean Adel Riad','01114443598','Lead Audio Engineer','Irenie Milad Hanna','01223535721','Head of landscape department',null,6),
('Fady Samir Fahmy','01221444111','Owner & Manager of car service center','Marise Amir Helmy','01229944492','Program manager at orange business','26906702',7),
('Youssef',null,null,null,null,null,null,8),
('Alber Mamdouh','01203222379','Football Coach','Diana Michael Kaisar','1223844798','Therapist',null,9),
('Maher',null,null,'Gehan','01149407340',null,null,10),
('Philpp Nagy Halim','01286654543','Digital Marketing Manager','Sandra Assad Zaghloul','01202228831','HR Manager',null,11),
('Hany Riad','01226649818',null,'Mariam','01222231932',null,null,12),
('Mina Raafat Selim','01221218328','Writer & Pharmaceutical',null,null,null,null,13),
('Youssef Nagy Youssef','01204643539','Free lawyer','Sarah Kamel','01227407848','Government employee','22748964',14),
('Alex Sandro','1229007934',null,null,null,null,null,15),
('Magdy Azer Mounir','01005742910','Lawyer','Mirielle Medhat Michael','01229078903','Accountant','23560244',16),
('Antony Henry Emil Nabih','01228846686','Owner of car service center','Maggy Wagih Beshara','01288448680','RSD Assistant at UNHCR',null,17),
('Peter Nicola','01201751192','Project Manager at EHAF Consulting Engineers','Jackline Boshra','01220623514',null,null,18)



/* Insert data for table Buds_Payments */
CREATE TABLE Buds_Payments (
    Foulard_Paid bit,
    Foulard_Recieved bit,
    T_Shirt_Paid bit,
    t_shirt_paid_2 bit,
    T_Shirt_Received bit,
    Annual_Subscripted_Paid bit,
    Bud_ID int not null,
    FOREIGN KEY (Bud_ID) REFERENCES Buds_Information (Bud_ID)
);

CREATE TABLE item_price_list (
   item_id int primary key,
   item_name varchar(100) not null,
   item_size int,
   item_price decimal(5,2)
);

INSERT INTO item_price_list (item_id, item_name,item_size,item_price)
VALUES
(101, 'T_shirt_1', '4', 200.00),
(102, 'T_shirt_2', '6', 250.00),
(103, 'Foulard', '1', 70.00),
(104, 'Annual Subscription', NULL, 300.00)

--Query 1: Calculate the total paid for each bud
select bud_name,
buds_payments.total_payment as Total_Payment
from Buds_information
join Buds_Payments
on Buds_information.Bud_ID = buds_payments.Bud_ID

--Query 2: Display name for buds who paid the foulard and who didnt pay
select
Buds_information.bud_name as Full_Name,buds_payments.foulard_paid as Foulard_Paid
from Buds_information 
join Buds_Payments
on Buds_information.Bud_ID = buds_payments.Bud_ID

--Query 3: Display name for buds who paid the T-Shirt with size and Foulard 
select
Buds_information.bud_name as Full_Name,
buds_payments.T_Shirt_Paid as T_Shirt_Size_6, 
buds_payments.T_Shirt_paid_2 as T_Shirt_Size_4,
buds_payments.foulard_paid as Foulard_Paid
from Buds_information
join Buds_Payments
on Buds_information.Bud_ID = buds_payments.Bud_ID
where buds_payments.foulard_paid = 1 and (buds_payments.T_Shirt_Paid = 1 or buds_payments.T_Shirt_Paid_2 =1) 
order by Buds_information.bud_name

--Query 4: Select buds name who started with letter y
select bud_name from Buds_Information
where Buds_information.bud_name like 'y%'


--Query 5: Select buds name and his address with father and mother phone numbers 
select bud_name as Full_Name,[address] as Bud_address,
Parents_info.Father_name as Father_name,
Parents_info.Father_Phone as Father_Phone,
Parents_info.Mother_name as Mother_name, 
Parents_info.Mother_Phone as Mother_Phone
from Buds_information
join Parents_info
on Buds_information.Bud_ID = Parents_info.Bud_ID
order by Buds_information.bud_name

--Query 6: Select oldest buds joined 
select top 5 Bud_id, Bud_name, JoinedAT from Buds_information
where JoinedAt is not null

--Query 7: Select newest buds joined
select top 5 Bud_id, Bud_name, JoinedAT from Buds_information
where JoinedAt is not null
order by joinedat desc

--Query 8: Display name for buds who paid the T-Shirt with size and Foulard 
select
Buds_information.bud_name as Full_Name,
buds_payments.Annual_Subscripted_Paid as Year_Subcripted_Paid
from Buds_information
join Buds_Payments
on Buds_information.Bud_ID = buds_payments.Bud_ID
order by Buds_information.bud_name

--Query 9: Display name for buds who got all badges 
select
Buds_information.bud_name as Full_Name,
Bud_Achievements.Badges_3_Years,
Bud_Achievements.Badges_4_Years,
Bud_Achievements.Badges_5_Years,
Bud_Achievements.Golden_Badge
from Buds_information
join Bud_Achievements
on Buds_information.Bud_ID = Bud_Achievements.Bud_ID
where Golden_Badge is not null
order by Buds_information.bud_name

--Query 10: Display name for buds order by birth_date
select
bud_name as Full_Name, Birth_date,National_ID 
from Buds_information
where Birth_date  is not null
order by Birth_date 

--Query 11: Display all buds information
select * From buds_information

--Query 12: Display all item price
select * From Item_price_list

--Query 13: Display Buds who had already completed their time in buds
select
bud_name as Full_Name,LeaveAT as [Left]  
from Buds_information
where LeaveAT <= '20250722'


