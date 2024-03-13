create view Consulta1 as
select A.nombre, (A.parcial/A.total) as participacion
from (
select T.nombre, T.cedulas as parcial, sum(T.cedulas) over () as total
from( 
select departamento.nombre, count(tomador.cedula)as cedulas
from departamento
inner join tomador
on departamento.id = tomador.iddepartamento
group by departamento.nombre
) T
)A
