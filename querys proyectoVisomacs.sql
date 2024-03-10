-- 1 Muestrame todos los productos que sean iphone
SELECT * 
FROM producto 
WHERE categoria='Iphone';
-- 2 Muestrame todos los proveedores que su empresa tenga sede en sevilla
SELECT pro.id,pro.nombre,pro.apellidos,pro.correo,pro.telefono,pro.id_empresa 
from proveedor pro 
JOIN empresa em ON pro.id_empresa = em.id 
WHERE em.sede='Sevilla';
-- 3 muestrame todos los clientes que su ciudad sea sevilla
SELECT  DISTINCT cli.nombre,cli.apellidos 
FROM cliente cli 
JOIN direccion di ON di.id_cliente = cli.id 
WHERE di.ciudad = 'Sevilla';
-- 4 Muestrame todos los productos cuyo valor sea mayor de 500
SELECT * 
FROM producto 
WHERE precio>500;
-- 5 Muestra cuantos productos han comprado cada cliente
SELECT cli.nombre, COUNT(com.id_cliente) 
FROM compra com 
JOIN cliente cli ON com.id_cliente=cli.id 
GROUP BY cli.nombre;
-- 6 Muestrame cuantas direcciones tiene cada cliente
SELECT cli.nombre, COUNT(dir.id_cliente) 
FROM direccion dir 
JOIN cliente cli ON dir.id_cliente= cli.id 
GROUP BY cli.nombre;
-- 7 Muestrame todos los productos que hayan sido proveidos por un proveedor que su empresa tenga sede en sevilla
SELECT prod.nombre 
FROM entrega ent 
JOIN producto prod ON ent.id_producto= prod.id 
JOIN proveedor prov ON ent.id_proveedor= prov.id 
JOIN empresa emp ON prov.id_empresa = emp.id
 WHERE emp.sede = 'Sevilla';
-- 8 Muestrame todos los productos que hayan sido comprados por clientes que tenga más de una direccion 
SELECT cli.nombre AS clientes,prod.nombre AS producto FROM compra comp 
JOIN cliente cli ON comp.id_cliente= cli.id 
JOIN producto prod ON comp.id_producto= prod.id 
JOIN direccion dir ON cli.id=dir.id_cliente 
GROUP BY cli.nombre,prod.nombre 
HAVING COUNT(dir.id_cliente)>1 ;
-- 9 Muestrame el la media que se gasta cada cliente 
SELECT id_cliente AS cliente, AVG(precio_total) AS gasto_medio 
FROM compra 
GROUP BY id_cliente;
-- 10 MUestrame los productos comprados por clientes que vivan en sevilla y que el producto hay sido proveido por una empresa de sevilla
SELECT distinct cli.nombre,prod.nombre 
FROM compra comp 
JOIN cliente cli ON comp.id_cliente = cli.id 
JOIN direccion dir ON dir.id_cliente= cli.id 
JOIN producto prod ON comp.id_producto=prod.id 
JOIN entrega ent ON ent.id_producto=prod.id 
JOIN proveedor prov ON ent.id_proveedor=prov.id 
JOIN empresa empr ON prov.id_empresa= empr.id 
WHERE dir.ciudad='Sevilla' AND empr.sede='Sevilla';
-- 11 Ordename los productos de más caro a mas barato por precio
SELECT * FROM producto ORDER BY precio DESC;
-- 12 Muestrame cuantas compras ha realizado los clientes de categoria nuevo
SELECT cli.nombre AS cliente, COUNT(*) AS compras 
FROM compra comp 
JOIN cliente cli ON comp.id_cliente=cli.id  
WHERE  cli.categoria_cli=1 
GROUP BY cli.nombre;
-- 13 Muestrame las compras de los clientes platinos que viven en sevilla 
SELECT cli.nombre AS cliente, COUNT(*) AS compras 
FROM compra comp 
JOIN cliente cli ON comp.id_cliente=cli.id 
JOIN direccion dir ON dir.id_cliente = cli.id 
WHERE cli.categoria_cli=5 AND dir.ciudad='Sevilla' 
GROUP BY cli.nombre; 
-- 14 Muestrame todos los productos entregados antes del 2024
SELECT prod.nombre,ent.fecha_entrega 
FROM producto prod 
JOIN entrega ent ON ent.id_producto=prod.id 
WHERE fecha_entrega<'2024-01-01';
-- 15 Muestrame el nombre y la sede de las empresas que tienen proveedores asociados
SELECT emp.nombre,emp.sede 
FROM proveedor prov 
JOIN empresa emp ON prov.id_empresa=emp.id;
-- 16 Muestrame el nombre, apellidos y correo de los clientes que hayan realizado compras superior a 2000 euros
SELECT cli.nombre,cli.apellidos,cli.correo 
FROM compra comp 
JOIN cliente cli ON  comp.id_cliente=cli.id 
WHERE comp.precio_total>2000;
-- 17 Muestrame cuantos productos ha proveido cada proveedor
SELECT prov.nombre AS proveedor ,COUNT(id_proveedor) AS entregas 
FROM entrega ent 
JOIN proveedor prov ON ent.id_proveedor=prov.id 
GROUP BY prov.nombre;
-- 18 Muestrame los productos, la cantidad, el precio y el cliente que su categotia sea bronce
SELECT * FROM categoria_cliente;
 SELECT cli.nombre,prod.nombre,comp.cantidad,comp.precio_total 
 FROM compra comp 
 JOIN producto prod ON comp.id_producto=prod.id 
 JOIN cliente cli ON comp.id_cliente= cli.id 
 WHERE cli.categoria_cli=2;
-- 19 MUestrame la compra que más productos se llevaron 
SELECT * 
from compra 
ORDER BY cantidad DESC 
LIMIT 1;
-- 20 Ordena las compra de la mas barata a la mas cara
SELECT * 
FROM compra 
ORDER BY precio_total ASC;
-- 21 Ordenar las compras por la fecha más reciente a la más antigua de compra
SELECT * 
FROM compra 
ORDER BY fecha_compra DESC;
-- 22 Muestrame las direcciones de sevilla
SELECT * 
FROM direccion W
HERE ciudad='Sevilla';
-- 23 Muestrame las direcciones sean pisos
SELECT * 
FROM direccion 
WHERE bloque IS NOT NULL AND piso IS NOT NULL;
-- 24 Muestra de forma ordenada las direcciones por sus clientes asociados del primero al ultimo
SELECT * 
FROM direccion 
ORDER BY id_cliente ASC;
-- 25 Muestrame todos los clientes que contenga una o en su nombre
SELECT * 
FROM cliente 
WHERE nombre LIKE '%o%';
-- 26 Ordename los clientes por su categoria 
SELECT * 
FROM cliente 
ORDER BY categoria_cli ASC;
-- 27 Muestrame los cliente que contengan un 0 en su numero de telefono
SELECT * 
FROM cliente 
WHERE telefono LIKE '%0%';
-- 28 Muestrame los proveedore que su apellido  empiece por R 
SELECT * 
FROM proveedor 
WHERE apellidos LIKE 'r%';
-- 29 Muestrame los proveedores que contengan un numero en su correo 
SELECT * 
FROM proveedor 
WHERE correo LIKE '%0%' OR
correo LIKE '%1%' OR 
correo LIKE '%2%' OR
correo LIKE '%3%' OR 
correo LIKE '%4%' OR
correo LIKE '%5%' OR 
correo LIKE '%6%' OR 
correo LIKE '%7%' OR 
correo LIKE '%8%' OR 
correo LIKE '%9%';
-- 30 Ordename los proveedores por los id de sus empresas en orden descendente
SELECT * 
FROM proveedor O
RDER BY id_empresa DESC;