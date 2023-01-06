-- Bed --
INSERT INTO Bed ([BedNo],
				 [Size],
				 [RoomNo])
	VALUES ('001','Q','101')
		   , ('002','Q','001')
		   , ('003','Q','002')
		   , ('004','Q','003')
		   , ('005','K','004')
		   , ('006','K','005')
		   , ('007','K','006')
		   , ('008','K','007')
		   , ('009','D','008')
		   , ('010','D','009')
		   , ('011','D','010')
		   , ('012','D','011')
		   , ('013','Q','012')
		   , ('014','Q','101')
		   , ('015','Q','102')
		   , ('016','Q','103')
		   , ('017','K','104')
		   , ('018','K','105')
		   , ('019','K','106')
		   , ('020','K','107')
		   , ('021','D','108')
		   , ('022','D','109')
		   , ('023','D','110')
		   , ('024','D','111')
		   , ('025','Q','112')
		   , ('026','Q','201')
		   , ('027','Q','202')
		   , ('028','Q','203')
		   , ('029','K','204')
		   , ('030','K','205')
		   , ('031','K','206')
		   , ('032','K','207')
		   , ('033','Q','208')
		   , ('034','Q','209')
		   , ('035','Q','210')
		   , ('036','Q','211')
		   , ('037','Q','212')

--Employee --
INSERT INTO Employee (
					  [FirstName],
	                  [LastName],
	                  [Phone],
	                  [DateWorked],
	                  [HoursWorked],
	                  [SupervisorID],
	                  [HotelID])
VALUES ('Grace','Dole','234-234-2345','12/22/2022','10',NULL,'101')
	, ('Jane','Case','235-235-2346','12/22/2022','7',NULL,'102')
	, ('Louraine','Lowe','236-236-2347','12/22/2022','12',NULL,'103')
	, ('Jim','Dale','238-238-2348','12/22/2022','10','1001','101')
	, ('Stacey','Hill','239-239-2349','12/21/2022','5','1001','101')
	, ('Sue','Monroe','233-233-2343','12/23/2022','8','1001','101')
	, ('Susan','James','138-138-1348','12/23/2022','10','1001','101')
	, ('Linda','Popen','338-338-3348','12/23/2022','11','1001','101')
	, ('Lily','Mondel','435-435-4346','12/22/2022','3','1002','102')
	, ('Dan','Scott','535-535-5346','12/23/2022','5','1002','102')
	, ('Steve','Grimes','635-635-6346','12/23/2022','10','1002','102')
	, ('Fin','Dimmel','735-735-7346','12/23/2022','11','1002','102')
	, ('Rudy','Monte','835-835-9346','12/22/2022','3','1002','102')
	, ('Louis','Franks','136-136-1347','12/22/2022','12','1003','103')
	, ('Frank','Simmons','236-236-2347','12/23/2022','10','1003','103')
	, ('Derryl','Williams','336-336-3347','12/23/2022','7','1003','103')
	, ('Joe','Dane','436-436-4347','12/23/2022','10','1003','103')
	, ('Simeon','Charles','536-536-5347','12/22/2022','12','1003','103')

-- Employee Position --
INSERT INTO EmployeePosition ([EmployeeID],
							  [Position])
VALUES    ('1001', 'Manager') 
        , ('1002', 'Manager')
        , ('1003', 'Manager')
        , ('1004', 'Desk Clerk')
        , ('1005', 'Desk Clerk')
        , ('1006', 'Cleaning Staff')
        , ('1007', 'Assistant Manager')
        , ('1008', 'Cook')
        , ('1009', 'Desk Clerk')
        , ('1010', 'Desk Clerk')
        , ('1011', 'Cleaning Staff')
        , ('1012', 'Assistant Manager')
        , ('1013', 'Cook')
        , ('1014', 'Desk Clerk')
        , ('1015', 'Desk Clerk')
        , ('1016', 'Cleaning Staff')
        , ('1017', 'Assistant Manager')
        , ('1018', 'Cook')

-- Guest --
INSERT INTO Guest (
				   [FirstName],
				   [LastName],
				   [Email],
				   [Phone],
				   [Street],
				   [City],
				   [State],
				   [Zip])
VALUES('Ruth','Smith','ruth.smith@gmail.com','111-111-1111','123 Main Street','Tampa','FL','12345')
	, ('Sandy','Smith','sandy.smith@gmail.com','222-222-2222','456 Cedar Street','Tampa','FL','23456')
	, ('Joe','Smith','joe.smith@gmail.com','333-333-3333','789 Cypress Street','Tampa','FL','23456')
	, ('Louis','Smith','louis.smith@gmail.com','444-444-4444','456 Lolly Street','Tampa','FL','34567')
	, ('Jolie','Paul','jolie.paul@gmail.com','555-555-5555','246 Maple Drive','Tampa','FL','12378')
	, ('James','Paul','james.paul@gmail.com','777-777-7777','567 Madison Drive','Tampa','FL','12379')
	, ('Sam','Paul','sam.paul@gmail.com','888-888-8888','345 Raven Drive','Tampa','FL','12376')
	, ('Hailey','Paul','hailey.paul@gmail.com','999-999-9999','678 Peacock Drive','Tampa','FL','12377')
	, ('Genie','Samuels','genie.samuels@gmail.com','123-456-6789','246 Holly Drive','Tampa','FL','12378')
	, ('Allison','Samuels','allison.samuels@gmail.com','123-456-6788','231 Founders Drive','Tampa','FL','12378')
	, ('David','Samuels','david.samuels@gmail.com','123-456-6786','233 Lauren Drive','Tampa','FL','12376')
	, ('Farrah','Samuels','farrah.samuels@gmail.com','123-456-6785','232 Thistle Drive','Tampa','FL','12371')
	, ('Jamie','Samuels','jamie.samuels@gmail.com','123-456-6783','574 Grovers Drive','Tampa','FL','12378')

-- Hotel --
INSERT INTO Hotel ([HotelID],
	[HotelName],
	[Street],
	[City],
	[State],
	[Zip],
	[Region],
	[Phone],
	[ManagerID])
VALUES ('101', 'Grande Sweet Suites', '111 Grande Street', 'Tampa','FL','12345','Southeast','112-112-1122','1001')
	, ('102', 'Ulta Double Living', '112 Double Lane', 'Atlanta','GA','12346','Southeast','113-113-1133','1002')
	, ('103', 'Luxury Queen Castle', '113 Luxury Ave', 'New York','NY','12347','Northeast','113-113-1133','1002')


-- Invoice --
INSERT INTO Invoice ([ItemNo],
				     [GuestID],
				     [Quantity],
				     [Date],
				     [PaymentType],
				     [CardType])
VALUES ('10','101', '1', '12/21/2022', 'Cash', NULL)
		, ('11','102','1', '12/21/2022', 'Cash', NULL)
		, ('12','103','1', '12/21/2022', 'Cash', NULL)
		, ('13','104','2', '12/24/2022', 'Cash', NULL)
		, ('14','105','2', '12/24/2022', 'Cash', NULL)
		, ('15','106','2', '12/24/2022', 'Cash', NULL)
		, ('16','107','2', '12/26/2022', 'Cash', NULL)
		, ('17','108','3', '12/26/2022', 'Card', 'Debit')
		, ('18','109','3', '12/26/2022', 'Card', 'Debit')
		, ('19','110','3', '12/22/2022', 'Card', 'Debit')
		, ('20','111','1', '12/22/2022', 'Card', 'Debit')
		, ('21','112','1', '12/22/2022', 'Card', 'Credit')
		, ('22','113','1', '12/22/2022', 'Card', 'Credit')
		, ('23','101','1', '12/29/2022', 'Card', 'Credit')



-- Item --
INSERT INTO Item (
	              [ItemName],
	              [Charge])
VALUES ('Towels','0')
		, ('Sheets','0')
		, ('Pillows','0')
		, ('Toiletries','1')
		, ('Water','1')
		, ('Chips','1')
		, ('Candy','1')
		, ('Liquor','5')
		, ('Beach Towel','2')
		, ('Robes','5')
		, ('Welcome gift','100')
		, ('Welcome drinks','100')
		, ('Trail Mix','1')
		, ('Soda','2')

-- Reseveration --
INSERT INTO Reservation ([RoomNo],
						 [GuestID],
						 [CheckInDate],
						 [CheckOutDate],
						 [PartyQuantity])
VALUES  ('1', '101',  '12/21/2022', '12/25/2022', '1')   
		,('2', '102', '12/21/2022', '12/25/2022', '1') 
		,('3', '103', '12/21/2022', '12/25/2022', '1') 
		,('4', '104', '12/24/2022', '12/27/2022', '1') 
		,('5', '105', '12/24/2022', '12/27/2022', '2') 
		,('101', '106', '12/24/2022', '12/27/2022', '2') 
		,('102', '107', '12/26/2022', '12/29/2022', '2') 
		,('103', '108', '12/26/2022', '12/29/2022', '2') 
		,('104', '109', '12/26/2022', '12/29/2022', '4') 
		,('105', '110', '12/22/2022', '12/30/2022', '4') 
		,('106', '111', '12/22/2022', '12/30/2022', '4') 
		,('107', '112', '12/22/2022', '12/30/2022', '4') 
		,('201', '113', '12/22/2022', '12/30/2022', '1') 
		,('202', '101', '01/01/2023', '01/03/2023', '1')
		,('203', '102', '01/01/2023', '01/03/2023', '1')
		,('204', '103', '01/01/2023', '01/03/2023', '1')
		,('205', '104', '01/01/2023', '01/03/2023', '2')
		,('206', '105', '01/01/2023', '01/03/2023', '2')
		,('207', '106', '01/01/2023', '01/03/2023', '2')


-- Room --
INSERT INTO Room ([RoomNo],
				  [FloorNo],
				  [RoomView],
				  [Type],
				  [HotelID])
VALUES   ('001','01','Hall','S','101')
	   , ('002','02','Hall','S','101') 
	   , ('003','01','Pool','S','101')
	   , ('004','02','Pool','S','101')
	   , ('005','01','Gym','SU','101')
	   , ('006','02','Gym','SU','101')
	   , ('007','01','Hall','SU','101')
	   , ('008','02','Hall','SU','101') 
	   , ('009','01','Pool','D','101')
	   , ('010','02','Pool','D','101')
	   , ('011','01','Gym','D','101')
	   , ('012','02','Gym','D','101')
	   , ('101','01','Hall','S','102')
	   , ('102','02','Hall','S','102') 
	   , ('103','01','Pool','S','102')
	   , ('104','02','Pool','S','102')
	   , ('105','01','Gym','SU','102')
	   , ('106','02','Gym','SU','102')
	   , ('107','01','Hall','SU','102')
	   , ('108','02','Hall','SU','102') 
	   , ('109','01','Pool','D','102')
	   , ('110','02','Pool','D','102')
	   , ('111','01','Gym','D','102')
	   , ('112','02','Gym','D','102')
	   , ('201','01','Hall','S','103')
	   , ('202','02','Hall','S','103') 
	   , ('203','01','Pool','S','103')
	   , ('204','02','Pool','S','103')
	   , ('205','01','Gym','SU','103')
	   , ('206','02','Gym','SU','103')
	   , ('207','01','Hall','SU','103')
	   , ('208','02','Hall','SU','103') 
	   , ('209','01','Pool','D','103')
	   , ('210','02','Pool','D','103')
	   , ('211','01','Gym','D','103')
	   , ('212','02','Gym','D','103')

--- Run these statements below to ensure the records successfully populated in each table --
Select Top 1 * from Room

Select Top 1 * from Guest

Select Top 1 * from Invoice

Select Top 1 * from Bed

Select Top 1 * From Reservation

Select Top 1 * From Employee

Select Top 1* from EmployeePosition

Select Top 1* from Item

Select Top 1 * from Hotel