Use [The Golden Hotel]

/** Enable 'Include Actual Execution Plan' and 'Live Query Statistics' to see the execution plan of this T-SQL join.
PK-GuestID and CPK-Reservation holds the highest cost.**/

--Test this query first!--
Select g.GuestID, concat(g.FirstName, ' ', g.LastName) AS 'Guest Name', r.PartyQuantity
From Guest g
LEFT Join Reservation r
On g.GuestID = r.GuestID
Where (CheckInDate BETWEEN '7/1/2018' AND '7/31/2018')
AND PartyQuantity >= 3


--This join hint includes a key lookup (25%) on CPK-Reservation, in which is not ideal --
Select g.GuestID, concat(g.FirstName, ' ', g.LastName) AS 'Guest Name', r.PartyQuantity
From Guest g
LEFT LOOP Join Reservation r
On g.GuestID = r.GuestID
Where (CheckInDate BETWEEN '7/1/2018' AND '7/31/2018')
AND PartyQuantity >= 3

--This join hint includes a key lookup (34%) on CPK-Reservation, in which is not ideal--
Select g.GuestID, concat(g.FirstName, ' ', g.LastName) AS 'Guest Name', r.PartyQuantity
From Guest g
LEFT MERGE Join Reservation r
On g.GuestID = r.GuestID
Where (CheckInDate BETWEEN '7/1/2018' AND '7/31/2018')
AND PartyQuantity >= 3

--This join hint is ideal for this particular T-SQL Query due to the significant low cost with the hash join--
Select g.GuestID, concat(g.FirstName, ' ', g.LastName) AS 'Guest Name', r.PartyQuantity
From Guest g
LEFT HASH Join Reservation r
On g.GuestID = r.GuestID
Where (CheckInDate BETWEEN '7/1/2018' AND '7/31/2018')
AND PartyQuantity >= 3
 