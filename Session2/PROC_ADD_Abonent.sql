Create proc add_Abonent
@������� varchar(255),
@��� varchar(255),
@�������� varchar(255),
@����� varchar(255)
as
BEGIN
INSERT INTO [dbo].[�������]
([�������],[���],[��������],[�����])
Values
(@�������,@���,@��������,@�����)
END