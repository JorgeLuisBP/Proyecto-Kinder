use Kinder

select * from Estudiante
Select * from Representante

select e.ECédula CedulaEstudiante , r.Rcédula CedulaRepresentante from  Estudiante as e inner join Representante as r on r.Rcédula=e.CedulaR

select * from [Cita Médica]
Select * from Doctor

select * from Profesional
Select * from ProgramaDeEducación

select e.ENombres, e.EApellidos, e.ECédula, c.DcédulaC, c.Diagnostico,c.Medicamentos, c.Fecha , d.Dnombre,d.Dapellido,d.Dnacionalidad  from Estudiante as e 
	inner join [Cita Médica] as c on e.ECédula=c.EcédulaC 
	inner join Doctor as d on d.Dcédula=c.DcédulaC

----where --
select * from Representante
where Rgénero like 'Femenino'
order by Rnombres


-----PRIMER CONSULTA---
----¿que estudiante no tiene a su madre de forma activa en su vida?-----

select e.ECédula as [Cedula de estudiante], e.ENombres as [Nombre de estudiante], e.EApellidos,e.EGénero as [Apellido del estudiante], 
	r.Rnombres as [Nombre del representante], r.Rapellidos as [Apellido del representante],r.Rgénero as [Genero del representante Activo en su vida] 
		from Estudiante as e inner join Representante as r 
			on r.Rcédula=e.CedulaR
			where Rgénero like 'Masculino'

----¿que estudiante no tiene a su padre de forma activa en su vida?-----

select e.ECédula as [Cedula de estudiante], e.ENombres as [Nombre de estudiante], e.EApellidos,e.EGénero as [Apellido del estudiante], 
	r.Rnombres as [Nombre del representante], r.Rapellidos as [Apellido del representante],r.Rgénero as [Genero del representante Activo en su vida] 
		from Estudiante as e inner join Representante as r 
			on r.Rcédula=e.CedulaR
			where Rgénero like 'Femenino'

------SEGUNDA CONSULTA-----
-----	Cantidad de calificaciones regulares, buenas y excelentes en cada actividad por cada infante.----
select * from Estudiante
select * from ProgramaDeEducación

select e.ECédula,e.ENombres, e.EApellidos ,Rendimiento, COUNT(Rendimiento) as CantidadDeCalificaciones
from ProgramaDeEducación as pe inner join Estudiante as e on  e.ECédula=pe.CedulaEst 
group by Rendimiento, e.ECédula,e.ENombres, e.EApellidos

---?¿--
select Rendimiento, COUNT (Rendimiento)as CantidadDeCalificaciones
from ProgramaDeEducación
group by Rendimiento

-----TERCER CONSULTA
-----	Cantidad de profesores hombres y mujeres que tiene cada programa.--
select * from Profesional

select ProgramaEducativo,ProfGénero, COUNT(ProfGénero) as CantidadDeProfesores
from Profesional
group by ProfGénero, ProgramaEducativo
