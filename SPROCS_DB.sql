--Use PROCS_DB

Create proc GuestBilling
AS
Begin
/**Shows a general report on guests accounts recievables on items that are still pending in the hotel's general ledger.**/
Select concat(g.FirstName,' ',g.LastName) AS GuestName, 
	   it.ItemName,
	   it.Charge,
	   i.Quantity, 
	   (Quantity*it.Charge) AS GrandTotal, 
	   CASE
		When DATEDIFF(DAY, i.Date, GETDATE()) <= 30 Then '1%'
		When DATEDIFF(DAY, i.Date, GETDATE()) BETWEEN 31 AND 60 Then '1.5%'
		When DATEDIFF(DAY, i.Date, GETDATE()) BETWEEN 61 AND 91 Then '2%'
		When DATEDIFF(DAY, i.Date, GETDATE()) > 91 Then '2.5%'
		END AS InterestAdded,
	   CASE
		When DATEDIFF(DAY, i.Date, GETDATE()) <= 30 Then round(cast(SUM((Charge*Quantity) + Charge*0.010) AS numeric(6,2)),2)
		When DATEDIFF(DAY, i.Date, GETDATE()) BETWEEN 31 AND 60 Then round(cast(SUM((Charge*Quantity) + Charge*0.015) AS numeric(6,2)),2)
		When DATEDIFF(DAY, i.Date, GETDATE()) BETWEEN 61 AND 90 Then round(cast(SUM((Charge*Quantity) + Charge*0.020) AS numeric(6,2)),2)
		When DATEDIFF(DAY, i.Date, GETDATE()) > 91 Then round(cast(SUM((Charge*Quantity) + Charge*0.025) AS numeric(6,2)),2)
		END AS NewCharge
From Invoice i
Join Item it
On i.ItemNo = it.ItemNo
Join Guest g
On g.GuestID = i.GuestID
Group by g.FirstName, g.LastName,it.ItemName,it.Charge,i.Quantity, i.Date
END

Create proc RoomBooking
AS
BEGIN
/**Provides an outlook when rooms are reserved. In this case, all the rooms are booked for now**/
Select concat(g.FirstName, ' ', g.LastName) AS GuestName, h.HotelName, r.RoomNo, rr.CheckInDate
From Guest g
Join Reservation rr
On g.GuestID = rr.GuestID
Full Join Room r
On r.RoomNo = rr.RoomNo
Join Hotel h
On h.HotelID = r.HotelID
END

Create Proc ItemSellingAdj
As
Begin
/**Shows a list items that are not selling within the hotel. This will allow the hotel to price or product adjust according to guest needs**/
Select i.ItemName, Count(ii.ItemNo) AS NumberOfItems
From Item i
Right Join Invoice ii
On i.ItemNo = ii.ItemNo
Group by i.ItemName
Having Count(ii.ItemNo) <= 1
END

Create proc HotelManagers
AS
Begin
/**Shows all the hotel manager's information for easy connect**/
Select h.HotelName,h.ManagerID, concat(e.FirstName, ' ',e.LastName) AS EmployeeName, e.Phone
From Hotel h
Join Employee e
On h.HotelID = e.HotelID AND h.ManagerID = e.EmployeeID
END

Create proc EmployeeRole
As 
Begin
/**Gives a general overview of each employee's role in the hotel**/
Select h.HotelName, 
	   h.ManagerID,
	   concat(e.FirstName, ' ', e.LastName) AS EmployeeName,
	   CASE 
		When e.EmployeeID = 1014 Then 'Hotel Manager'
	    When e.EmployeeID = 1002 Then 'Hotel Manager'
		When e.EmployeeID = 1018 Then 'Hotel Manager'
		ELSE 'Employee'
	   END AS EmployeePosition  
From Hotel h
Join Employee e
On h.HotelID = e.HotelID 
Order by ManagerID
END

Create proc EmployeeAssignment
AS
Begin
/**Quick report of how many empolyees are assigned to each hotel**/
Select h.HotelName, 
	   h.ManagerID,
	   count(e.EmployeeID) AS 'HeadCount'   
From Hotel h
Join Employee e
On h.HotelID = e.HotelID 
Group by h.HotelName, h.ManagerID
END

Create Proc SupervisorRole
AS
BEGIN
/**Shows all the hotel supervisors**/
Select h.HotelName,
	   e.EmployeeID,
	   concat(e.FirstName, ' ', e.LastName) AS EmployeeName
From Hotel h
Join Employee e
On h.HotelID = e.HotelID
Where e.SupervisorID IS NULL AND e.EmployeeID <> h.ManagerID 
END	

Create proc RoomOptions
As
Begin
/**This first query provides a general list of all the room types available in the hotel chain**/
Select h.HotelName,r.RoomNo,r.Type
From Hotel h
Join Room r
On h.HotelID = r.HotelID 

/**This join shows a list of possible hotel room options in case of a hotel expansion**/
Select h.HotelName,r.RoomNo,
CASE	
	When r.Type like 'S' Then 'Single'
	When r.Type like 'SU' Then 'Suite'
	When r.Type like 'D' Then 'Double'
	END AS RoomType
From Hotel h
Cross Join Room r
END


