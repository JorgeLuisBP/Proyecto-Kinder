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
Select * from ProgramaDeEducacion
--TABLA TIPODEREPRESENTANTE
select * from TipoDeRepresentante
-----PRIMER CONSULTA---
----¿QUE ESTUDIANTES SON REPRESENTADOS POR LA MADRE DE FAMILIA?-----
select e.ECédula as [Cedula de estudiante], e.ENombres as [Nombre de estudiante], e.EApellidos [Apellido del estudiante],
		e.EGénero as [Genero del estudiante], 
		r.Rnombres as [Nombre del representante], r.Rapellidos as [Apellido del representante],
		r.Rgénero as Género  , t.ParentescoDelRepresentado
		from Estudiante as e inner join Representante as r 
			on r.Rcédula=e.CedulaR inner join TipoDeRepresentante as t on t.Tcedula=r.Rcédula
			where ParentescoDelRepresentado like 'MAMÁ'
			

---SEGUNDA CONSULTA---
----¿ESTUDIANTES REPRESENTADOS POR EL PAPÁ?-----
select e.ECédula as [Cedula de estudiante], e.ENombres as [Nombre de estudiante], e.EApellidos [Apellido del estudiante],
		e.EGénero as [Genero del estudiante], 
		r.Rnombres as [Nombre del representante], r.Rapellidos as [Apellido del representante],
		r.Rgénero as [Genero] , t.ParentescoDelRepresentado
		from Estudiante as e inner join Representante as r 
			on r.Rcédula=e.CedulaR inner join TipoDeRepresentante as t on t.Tcedula=r.Rcédula
			where ParentescoDelRepresentado like 'PAPÁ'

---TERCER CONSULTA
-----	Cantidad de calificaciones regulares, buenas y excelentes en cada actividad por cada infante.----
select * from Estudiante
select * from ProgramaDeEducacion

select e.ECédula [Cedula del Estudiante],e.ENombres [Nombre Del Estudiante], e.EApellidos [Apellido Del Estudiante],Rendimiento, 
		COUNT(Rendimiento) as CantidadDeCalificaciones
		from ProgramaDeEducacion as pe inner join Estudiante as e on  e.ECédula=pe.CedulaEst 
		group by Rendimiento, e.ECédula,e.ENombres, e.EApellidos 

				---SUMATORIA GENERAL--
				select Rendimiento, COUNT (Rendimiento)as CantidadDeCalificaciones
				from ProgramaDeEducacion
				group by Rendimiento 

---CUARTA CONSULTA--
----Mostrar datos del estudiante (nombre-apellidos-cedula-fecha de nacimiento) y calcular cuantos años actualmente tiene cada estudiante
select e.ECédula as CedulaDeEstudiante, e.ENombres as NombreDelEstudiante, e.EApellidos as ApellidoDelEstudiante, 
		e.FechaDeNacimiento,  DATEDIFF(yy, FechaDeNacimiento, GETDATE())as AñosActualmente
		from Estudiante as e


----OTRAS CONSULTAS----
----MOSTRAR DATOS DEL ESTUDIANTES, CUANTOS AÑOS TIENE, ADEMAS CONOCER CUANTOS MESES TIENE DE NACIDO, Y CUANTOS DIAS TIENE DE NACIDO
select e.ECédula as CedulaDeEstudiante, e.ENombres as NombreDelEstudiante, e.EApellidos as ApellidoDelEstudiante, 
		e.FechaDeNacimiento,  DATEDIFF(yy, FechaDeNacimiento, GETDATE())as AñosActualmente
		,DATEDIFF(mm, FechaDeNacimiento , GETDATE()) as Meses 
		, DATEDIFF(dd, FechaDeNacimiento , GETDATE()) as Días 
		from Estudiante as e
----MOSTRAR DATOS DEL ESTUDIANTE, CON LOS DATOS DEL DOCTOR, UN DIAGNOSTICOS DE LA CITA MEDICA, MEDICAMENTOS A TOMAR Y LA FECHA DE LA CITA
select e.ENombres, e.EApellidos, e.ECédula, c.DcédulaC,d.Dnombre,d.Dapellido,d.Dnacionalidad , c.Diagnostico,c.Medicamentos, c.Fecha   
			from Estudiante as e 
			inner join [Cita Médica] as c on e.ECédula=c.EcédulaC 
			inner join Doctor as d on d.Dcédula=c.DcédulaC

---CONSULTAR EL 50% DE ESTUDIANTES MATRICULADOS EN LOS PROGRAMAS DE EDUCACION, MOSTRAR DATOS DEL ESTUDIANTE, DEL PROFESIONAL DE LA CLASE, EL CODIGO DE LA ACTIVIDAD. 
select top 50  percent e.ECédula as CedulaDelAlumno, e.ENombres as NombreDelAlumno, e.EApellidos as ApellidoDelAlumno, e.Ecorreo as correo, 
		e.EGénero as genero, r.Rcédula as CeduladelRepresentante, r.Rnombres as NombreDelRepresentante,
		r.Rapellidos as ApellidoDelRepresentante, pe.CodigoA as codigoDelprograma ,a.nombre as NombreDelPrograma , 
		p.ProfNombres as NombreDelProfesor, p.ProfApellidos as ApellidoDelProfesor
			from ProgramaDeEducacion as pe inner join Estudiante as e on pe.CedulaEst=e.ECédula
			inner join Representante as r on e.CedulaR=r.Rcédula
			inner join Actividad as a on pe.CodigoA=a.codigo
			inner join Profesional as p on pe.CédulaProf=p.ProfCédula
