use Kinder

select * from Estudiante
Select * from Representante

select e.EC�dula CedulaEstudiante , r.Rc�dula CedulaRepresentante from  Estudiante as e inner join Representante as r on r.Rc�dula=e.CedulaR

select * from [Cita M�dica]
Select * from Doctor

select * from Profesional
Select * from ProgramaDeEducaci�n

select e.ENombres, e.EApellidos, e.EC�dula, c.Dc�dulaC, c.Diagnostico,c.Medicamentos, c.Fecha , d.Dnombre,d.Dapellido,d.Dnacionalidad  from Estudiante as e 
	inner join [Cita M�dica] as c on e.EC�dula=c.Ec�dulaC 
	inner join Doctor as d on d.Dc�dula=c.Dc�dulaC

----where --
select * from Representante
where Rg�nero like 'Femenino'
order by Rnombres


-----PRIMER CONSULTA---
----�que estudiante no tiene a su madre de forma activa en su vida?-----

select e.EC�dula as [Cedula de estudiante], e.ENombres as [Nombre de estudiante], e.EApellidos,e.EG�nero as [Apellido del estudiante], 
	r.Rnombres as [Nombre del representante], r.Rapellidos as [Apellido del representante],r.Rg�nero as [Genero del representante Activo en su vida] 
		from Estudiante as e inner join Representante as r 
			on r.Rc�dula=e.CedulaR
			where Rg�nero like 'Masculino'

----�que estudiante no tiene a su padre de forma activa en su vida?-----

select e.EC�dula as [Cedula de estudiante], e.ENombres as [Nombre de estudiante], e.EApellidos,e.EG�nero as [Apellido del estudiante], 
	r.Rnombres as [Nombre del representante], r.Rapellidos as [Apellido del representante],r.Rg�nero as [Genero del representante Activo en su vida] 
		from Estudiante as e inner join Representante as r 
			on r.Rc�dula=e.CedulaR
			where Rg�nero like 'Femenino'

------SEGUNDA CONSULTA-----
-----	Cantidad de calificaciones regulares, buenas y excelentes en cada actividad por cada infante.----
select * from Estudiante
select * from ProgramaDeEducaci�n

select e.EC�dula,e.ENombres, e.EApellidos ,Rendimiento, COUNT(Rendimiento) as CantidadDeCalificaciones
from ProgramaDeEducaci�n as pe inner join Estudiante as e on  e.EC�dula=pe.CedulaEst 
group by Rendimiento, e.EC�dula,e.ENombres, e.EApellidos

---?�--
select Rendimiento, COUNT (Rendimiento)as CantidadDeCalificaciones
from ProgramaDeEducaci�n
group by Rendimiento

-----TERCER CONSULTA
-----	Cantidad de profesores hombres y mujeres que tiene cada programa.--
select * from Profesional

select ProgramaEducativo,ProfG�nero, COUNT(ProfG�nero) as CantidadDeProfesores
from Profesional
group by ProfG�nero, ProgramaEducativo
