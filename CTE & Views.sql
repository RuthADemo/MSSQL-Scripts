--Use CTE_DB

Create View EmployeeShift
AS
With HotelEmp_CTE (EmployeeID, FirstName, LastName, DateWorked)
AS
(
Select EmployeeID, FirstName, LastName, concat(DATEPART(MM, DATEADD(MM, 1,DateWorked)), '/', DATEPART(Day,DATEADD(DD, 7, DateWorked)),'/',DATEPART(YEAR,DATEADD(YY, 1, DateWorked))) AS NewWorkDate
From Employee
Where YEAR(DateWorked) > 2017
)

Select Top 100 * From HotelEmp_CTE
Order by LastName

Select * From EmployeeShift_vw

--How can I show the leading decimal places for the Employment year?--
Create View EmployeeWorkYears
AS
With EmpYears_CTE (EmployeeID, FirstName, LastName, EmploymentYear)
AS
(
Select EmployeeID, FirstName, LastName, round(cast((DATEDIFF(DAY,DateWorked,GETDATE()))AS decimal)/365,2)
From Employee
)

Select * From EmpYears_CTE


Create View EmployeeDetails
AS
Select e.EmployeeID, concat(e.FirstName, ' ', e.LastName) AS EmpName, Position,
CASE	
	When Position like 'Hotel Manager' Then '49000'/24
	Else HoursWorked * 13.50
	END AS Salary
From Employee e
Join EmployeePosition ep
On e.EmployeeID = ep.EmployeeID

Create View RoomPreference
AS
Select r.GuestID, h.HotelName ,
CASE	
	When ro.Type like 'S' Then 'Single'
	When ro.Type like 'SU' Then 'Suite'
	When ro.Type like 'D' Then 'Double'
	END AS RoomType,
ro.RoomView,
r.PartyQuantity
From Reservation r
Join Room ro
On r.RoomNo = ro.RoomNo
Join Hotel h
On h.HotelID = ro.HotelID





