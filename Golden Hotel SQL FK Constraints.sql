--- Foreign Key Contraints [Bed] ---
ALTER TABLE [dbo].[Bed]  WITH CHECK ADD  CONSTRAINT [FK_Bed_RoomNo] FOREIGN KEY([RoomNo])
REFERENCES [dbo].[Room] ([RoomNo])
GO

ALTER TABLE [dbo].[Bed] CHECK CONSTRAINT [FK_Bed_RoomNo]
GO

--- Foreign Key Contraint [Employee] ---
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK Employee_SuperivorID] FOREIGN KEY([SupervisorID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO

ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK Employee_SuperivorID]
GO

ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_HotelID] FOREIGN KEY([HotelID])
REFERENCES [dbo].[Hotel] ([HotelID])
GO

ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_HotelID]
GO

--- Foreign Key Constraint [EmployeePosition] ---
ALTER TABLE [dbo].[EmployeePosition]  WITH CHECK ADD  CONSTRAINT [FK_EmployeePosition_EmployeeID] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO

ALTER TABLE [dbo].[EmployeePosition] CHECK CONSTRAINT [FK_EmployeePosition_EmployeeID]
GO

--- Foreign Key Contraint [Hotel] ---
ALTER TABLE [dbo].[Hotel]  WITH CHECK ADD  CONSTRAINT [FK_Hotel_ManagerID] FOREIGN KEY([ManagerID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO

ALTER TABLE [dbo].[Hotel] CHECK CONSTRAINT [FK_Hotel_ManagerID]
GO

--- Foreign Key Contraint [Invoice] ---
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_GuestID] FOREIGN KEY([GuestID])
REFERENCES [dbo].[Guest] ([GuestID])
GO

ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [FK_Invoice_GuestID]
GO

ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_ItemNo] FOREIGN KEY([ItemNo])
REFERENCES [dbo].[Item] ([ItemNo])
GO

ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [FK_Invoice_ItemNo]
GO

--- Foreign Key Constraint [Reseveration] ---
ALTER TABLE [dbo].[Reservation]  WITH CHECK ADD  CONSTRAINT [FK_Reservation_GuestID] FOREIGN KEY([GuestID])
REFERENCES [dbo].[Guest] ([GuestID])
GO

ALTER TABLE [dbo].[Reservation] CHECK CONSTRAINT [FK_Reservation_GuestID]
GO

ALTER TABLE [dbo].[Reservation]  WITH CHECK ADD  CONSTRAINT [FK_Reservation_RoomNo] FOREIGN KEY([RoomNo])
REFERENCES [dbo].[Room] ([RoomNo])
GO

ALTER TABLE [dbo].[Reservation] CHECK CONSTRAINT [FK_Reservation_RoomNo]
GO

--- Foreign Key Constraint [Room] ---
ALTER TABLE [dbo].[Room]  WITH CHECK ADD  CONSTRAINT [FK_Room_HotelID] FOREIGN KEY([HotelID])
REFERENCES [dbo].[Hotel] ([HotelID])
GO

ALTER TABLE [dbo].[Room] CHECK CONSTRAINT [FK_Room_HotelID]
GO


-- When finished executing the statements above, double check the keys for each table in the Object Explorer --