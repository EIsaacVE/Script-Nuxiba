

/*1) INSERSIÓN DE VALORES*/

/*-----Insertar dos tipos de usuario en la tabla tipoUsuario, el primero será “Administrador” y el segundo “Agente”.-----*/
insert into tipoUsuario (descripcion) values ("Administrador");
insert into tipoUsuario (descripcion) values ("Agente");


/*-----Insertar 2 registros en la tabla usuarios, uno de tipo Administrador y uno de tipo agente. -----*/
insert into usuarios (nombre, apellidoPaterno, apellidoMaterno, idTipoUsuarioF) values ("Mariana", "Ponce", "González", 1);
insert into usuarios (nombre, apellidoPaterno, apellidoMaterno, idTipoUsuarioF) values ("Isaac", "Newton", "Asomov", 2);

/*-----Insertar 3 resultados de marcación en la tabla CatalogoResultados: “contestada”, “no contesta”, “buzon/maquina-----”  
		respectivamente, para que queden con el id 1,2 y 3.*/
insert into CatalogoResultados (descripcion) values ("Contestada");
insert into CatalogoResultados (descripcion) values ("No contesta");
insert into CatalogoResultados (descripcion) values ("Buzón/Máquina");


/*-----Inserta 3 registros de marcación en la tabla marcaciones, con lo siguiente (recuerda no registrar usuarios de tipo administrador en las marcaciones): 
        ◦ 1 con el resultado de contestada
        ◦ 1 con el resultado de no contesta
        ◦ 1 con el resultado de buzon/maquina-----*/

insert into Marcaciones (fecha, telefono, duracion, idResultadosF, idUsuariof) values ("2022/07/31 13:03:23", "5541906111", 3, 2, 2);
insert into Marcaciones (fecha, telefono, duracion, idResultadosF, idUsuarioF) values (current_timestamp(), "56982000", 6, 1, 2);
insert into Marcaciones (fecha, telefono, duracion, idResultadosF, idUsuarioF) values ("2023/01/12 14:29:17", "8972665109", 9, 3, 2);



/*2) ACTUALIZACIÓN*/

/*-----Escribe un query que modifica un registro de marcación de la tabla marcaciones, cambiando uno de los que tienes con 
resultado de “no contesta” le cambies el id de resultado de marcación a “contesta” y la duración ponerla a 60.-----*/

update Marcaciones set idResultadosF = 1, duracion = 60 where idMarcaciones = 1;


/*3)*/
/*-----Escribe un query que consulte los siguientes datos: Nombre completo de usuario y tipo de usuario.*/

select usuarios.nombre, usuarios.apellidoPaterno, usuarios.apellidoMaterno, tipoUsuario.descripcion from usuarios
inner join tipoUsuario
on usuarios.idTipoUsuarioF=tipoUsuario.idTipoUsuario;

/*4)*/
/*-----Escribe un query que consulte los siguientes datos: nombre completo de usuario, descripción del tipo de usuario, descripción del resultado se marcación
ide de marcación, fecha y teléfono-----*/


select concat(usuarios.nombre, usuarios.apellidoPaterno, usuarios.apellidoMaterno) as NombreCompleto, tipoUsuario.descripcion as DescripciónDelTipoDeUsuario, 
CatalogoResultados.descripcion as DescripciónDelUsuario,
CatalogoResultados.idResultados as idMarcación, Marcaciones.fecha as Fecha, Marcaciones.telefono as Teléfono 
from tipoUsuario
inner join usuarios on tipoUsuario.idTipoUsuario = usuarios.idTipoUsuarioF
inner join Marcaciones on Marcaciones.idUsuarioF = usuarios.idUsuario
inner join CatalogoResultados on CatalogoResultados.idResultados = Marcaciones.idResultadosF
group by idResultados;

/*5)*/
/*-----Escribe un query que calcule y muestre lo siguiente datos: idUsuario, Marcaciones totales, Llamadas contestadas, Porciento de llamadas contestadas,
 Llamadas no contestadas y Porcentaje de llamadas no contestadas.*/

  select distinct (idUsuarioF) as idUsuario, sum(idMarcaciones) as MarcacionesTotales, sum(idResultadosF) as Contestadas, 
  (sum((idResultadosF)/3)*100) as PorcientoContesta, idResultadosF as NoContestadas, (idResultadosF/3)*100 as PorcientoNoContesta from Marcaciones 
  inner join CatalogoResultados 
  on
  Marcaciones.idResultadosF=CatalogoResultados.idResultados
  where idResultadosF = 1;
