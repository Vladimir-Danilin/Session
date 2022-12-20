Create proc add_Abonent
@Фамилия varchar(255),
@Имя varchar(255),
@Отчество varchar(255),
@Адрес varchar(255)
as
BEGIN
INSERT INTO [dbo].[Абонент]
([Фамилия],[Имя],[Отчество],[Адрес])
Values
(@Фамилия,@Имя,@Отчество,@Адрес)
END