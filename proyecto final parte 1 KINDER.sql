-----PRIMERAMENTE TENEMOS QUE DARNOS CUENTA QUE VAMOS A TRABAJAR EN LA BASE DE DATOS CORRECTA EN ESTE CASO "KINDER"----
----PARA ESO USAMOS EL SIGUIENTE COMANDO----
use Kinder
----MOSTRAMOS LAS TABLAS CREADAS EN LA BASE DE DATOS
--TABLA ESTUDIANTE---
select * from Estudiante
--TABLA REPRESENTANTE---
Select * from Representante
--TABLA CITA MEDICA---
select * from [Cita Médica]
--TABLA DOCTOR--
Select * from Doctor
--TABLA PROFESIONAL--
select * from Profesional
--TABLA PROGRAMADEEDUCACION---
Select * from ProgramaDeEducación

-----PRIMER CONSULTA---
----¿que estudiante no tiene a su madre de forma activa en su vida?-----

select e.ECédula as [Cedula de estudiante], e.ENombres as [Nombre de estudiante], e.EApellidos [Apellido del estudiante],
		e.EGénero as [Genero del estudiante], 
		r.Rnombres as [Nombre del representante], r.Rapellidos as [Apellido del representante],
		r.Rgénero as [Genero del representante Activo en su vida] 
		from Estudiante as e inner join Representante as r 
			on r.Rcédula=e.CedulaR
			where Rgénero like 'Masculino' 
			
------SEGUNDA CONSULTA-----
----¿que estudiante no tiene a su padre de forma activa en su vida?-----

select e.ECédula as [Cedula de estudiante], e.ENombres as [Nombre de estudiante], e.EApellidos as [Apellido del estudiante],e.EGénero [Género], 
	r.Rnombres as [Nombre del representante], r.Rapellidos as [Apellido del representante],
	r.Rgénero as [Genero del representante Activo en su vida] 
		from Estudiante as e inner join Representante as r 
			on r.Rcédula=e.CedulaR
			where Rgénero like 'Femenino'

---TERCER CONSULTA
-----	Cantidad de calificaciones regulares, buenas y excelentes en cada actividad por cada infante.----
select * from Estudiante
select * from ProgramaDeEducación

select e.ECédula [Cedula del Estudiante],e.ENombres [Nombre Del Estudiante], e.EApellidos [Apellido Del Estudiante],Rendimiento, 
		COUNT(Rendimiento) as CantidadDeCalificaciones
		from ProgramaDeEducación as pe inner join Estudiante as e on  e.ECédula=pe.CedulaEst 
		group by Rendimiento, e.ECédula,e.ENombres, e.EApellidos 

---SUMATORIA GENERAL--
select Rendimiento, COUNT (Rendimiento)as CantidadDeCalificaciones
from ProgramaDeEducación
group by Rendimiento 


-----CUARTA CONSULTA
-----	Cantidad de profesores hombres y mujeres que tiene cada programa.--
select * from Profesional

select ProgramaEducativo,ProfGénero, COUNT(ProfGénero) as CantidadDeProfesores
from Profesional
group by ProfGénero, ProgramaEducativo





---ANEXO---
---CONSULTAS PROPIAS---
----MOSTRAR EL NUMERO DE CEDULA DE ESTUDIANTES Y EL REPRESENTANTE
		select e.ECédula CedulaEstudiante , r.Rcédula CedulaRepresentante 
			from  Estudiante as e inner join Representante as r on r.Rcédula=e.CedulaR

--MOSTRAR DATOS DEL ESTUDIANTE ENFERMO, CON LOS DATOS DEL DOCTOR, UN DIAGNOSTICOS DE LA CITA MEDICA, MEDICAMENTOS A TOMAR Y LA FECHA DE LA CITA
		select e.ENombres, e.EApellidos, e.ECédula, c.DcédulaC,d.Dnombre,d.Dapellido,d.Dnacionalidad , c.Diagnostico,c.Medicamentos, c.Fecha   
			from Estudiante as e 
			inner join [Cita Médica] as c on e.ECédula=c.EcédulaC 
			inner join Doctor as d on d.Dcédula=c.DcédulaC

--MOSTRAR DATOS DEL ESTUDIANTE ENFERMO, CON LOS DATOS DEL DOCTOR, UN DIAGNOSTICOS DE LA CITA MEDICA, MEDICAMENTOS A TOMAR Y LA FECHA DE LA CITA 
---DE MANERA MAS CLARA Y PRECISA PARA UN USUARIO
		select e.ENombres as [Nombre Del Estudiante], e.EApellidos as [Apellido Del Estudiante], e.ECédula as [Cedula del estudiante],
			c.DcédulaC [Cedula del Doctor],d.Dnombre [Nombre del Doctor],d.Dapellido [Apellido del Doctor], d.Dnacionalidad [Nacionalidad] ,
			c.Diagnostico [Diagnostico],c.Medicamentos [Medicamentos a tomar], c.Fecha [Fecha de la cita ]   
			from Estudiante as e 
			inner join [Cita Médica] as c on e.ECédula=c.EcédulaC 
			inner join Doctor as d on d.Dcédula=c.DcédulaC


----where --
-- MOSTART DATOS DE LOS REPRESENTANTE DE GENERO FEMENINO
select * from Representante
where Rgénero like 'Femenino'
order by Rnombres
