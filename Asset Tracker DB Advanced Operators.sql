Use AssetTracker

--This T-SQL query serves as a quarterly rent pivot to visually display when a contract is due for payment in a certain quarter.--
Select concat('Contract No.',' ',ContractNo) AS ContractNo, Year, ISNULL(Qtr.[1],0) AS Q1, ISNULL(Qtr.[2],0) AS Q2, ISNULL(Qtr.[3],0) AS Q3, ISNULL(Qtr.[4],0) AS Q4
From 
	(Select c.ContractNo, DATEPART(Year,c.StartDate) [Year], DATEPART(Quarter,c.StartDate)[Quarter], SUM(a.EqiupCost)/3 [EquipCost]
	 From Contract c 
	 Join AssetDetails a
	 On c.ContractNo = a.ContractNo
	 Group by c.ContractNo, DATEPART(Year,c.StartDate), DATEPART(Quarter,c.StartDate)) AS QuarterlyRent
PIVOT
	(SUM([EquipCost]) FOR Quarter IN ([1],[2],[3],[4])) AS Qtr
Order by [Year]

--This T-SQL query contains the overall cost, number of assets, average cost, quarterly cost and monthly cost per contract.--
Select Distinct c. ContractNo, Sum(a.EqiupCost) OVER (PARTITION BY c.ContractNo) AS GrandTotal,
	   Count(a.AssetID) OVER (PARTITION BY c.ContractNo) AS TotalAssets,
	   Avg(a.EqiupCost) OVER (PARTITION BY c.ContractNo) AS AverageCost,
	   Sum(a.EqiupCost) OVER (PARTITION BY c.ContractNo)/4 AS QuarterRent,
	   Sum(a.EqiupCost) OVER (PARTITION BY c.ContractNo)/12 AS MonthlyRent
From Contract c
Join AssetDetails a
On c.ContractNo = a.ContractNo


--This T-SQL query displays the asset cost plus the accumalted interest depending on asset description--
Select a.AssetID, Sum(a.EqiupCost) OVER(PARTITION BY a.AssetID) AS GrandTotal,
	CASE
		When a.Description like 'Laptop' Then Sum(a.EqiupCost)*0.05 + a.EqiupCost
		When a.Description like 'Desktop' Then Sum(a.EqiupCost)*0.08 + a.EqiupCost
		END AS InterestAdded
From AssetDetails a
Join AssetStatus ae
On a.AssetID = ae.AssetID
Where ae.Status <> 'Decommission'
Group by a.AssetID,a.EqiupCost,a.Description


--This T-SQL query displays the number of idle assets and aging by location--
--Logic: the contract has not matured yet and the asset is not assigned to anyone or decommissoned--

Select LocationName,Aging.[1 Month], Aging.[2 Months], Aging.[3 Months], Aging.[>4 Months]
From(Select l.LocationName [LocationName], 	
	CASE 
		When DATEDIFF(DAY, DateAssigned, GETDATE()) <= 30 THEN '1 Month' 
		When DATEDIFF(DAY, DateAssigned, GETDATE()) BETWEEN 31 AND 60 THEN '2 Months'
		When DATEDIFF(DAY, DateAssigned, GETDATE()) BETWEEN 61 AND 90 THEN '3 Months'
		When DATEDIFF(DAY, DateAssigned, GETDATE()) > 91 THEN '>4 Months'
		END AS [Months], 
		Count(aa.AssetID) [TotalAssets]
	From Location l
	Join AssetAssignment aa
	On l.LocationID = aa.LocationID
	Join AssetStatus ae
	On ae.AssetID = aa.AssetID
	Where ae.Status IN ('Available','Inventory')
	Group by l.LocationName, aa.DateAssigned,aa.AssetID
) AS Assets
PIVOT 
	(Count([TotalAssets]) FOR [Months] IN ([1 Month],[2 Months],[3 Months],[>4 Months])) AS Aging