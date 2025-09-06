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

