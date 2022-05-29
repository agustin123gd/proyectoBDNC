//Estudiantes
CREATE (luis:estudiantes {nombre:"Luis",apellidos:"Perez Lopez",edad:"19",matricula:"zs15404476"})
CREATE (carlos:estudiantes {nombre:"Carlos",apellidos:"Adrade Lopez",edad:"21",matricula:"zs154041234"})
CREATE (javier:estudiantes {nombre:"Javier",apellidos:"Gómez Baez",edad:"20",matricula:"zs154040254"})
CREATE (pablo:estudiantes {nombre:"Pablo",apellidos:"Paez",edad:"21",matricula:"zs18045254"})
CREATE (ingrid:estudiantes {nombre:"Ingrid",apellidos:"Melchor",edad:"22",matricula:"zs18123254"})

//Materias
CREATE (bdnc:materias {nombre:"Base de datos no convencionales",creditos:"6",horasSemana:"4"})

//Calificaciones
//CREATE (Cal1:calificaciones {promedio:"8.0"})


//Estatus
CREATE (estatus1:estatus {Calificacion:"8.0",estatus:"Aprobado",inscripcion:"Primera"})

//Carrera
CREATE (carr1:carrera {nombre:"Tecnologias computacionales",facultad:"Estadistica e Informatica",region:"Xalapa"})

//Maestros
CREATE (rojano:maestros {nombre:"Rafael",apellidos:"Rojano",matricula:"zsd2323543",edad:"45"})



//________________________RELACIONES_____________________________

// 1 Estudiante cursa N materias

MATCH(luis:estudiantes),(bdnc:materias)
WHERE luis.nombre = "Luis" AND bdnc.nombre= "Base de datos no convencionales" 
CREATE (luis)-[:Cursa]->(bdnc)

// 1 Estudiante se le asigna 1 Calificación a 1 materia

MATCH(luis:estudiantes),(bdnc:materias),(estatus1:estatus)
WHERE luis.nombre = "Luis" AND bdnc.nombre= "Base de datos no convencionales" AND estatus1.estatus="Aprobado"
CREATE (luis)-[:tiene]->(estatus1),(estatus1)-[:en]->(bdnc)

// 1 maestro n materias

MATCH(rojano:maestros),(bdnc:materias)
WHERE rojano.nombre = "Rafael" AND bdnc.nombre= "Base de datos no convencionales" 
CREATE (rojano)-[:enseña]->(bdnc)

// 1 Estudiante estudia 1 carrera

MATCH(luis:estudiantes),(carr1:carrera)
WHERE luis.nombre = "Luis" AND carr1.nombre="Tecnologias computacionales" 
CREATE (luis)-[:Estudia]->(carr1)


