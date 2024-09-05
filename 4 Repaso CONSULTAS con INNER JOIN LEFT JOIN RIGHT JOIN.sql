USE HiperAlmacen
GO
SELECT * FROM Categorias

SELECT * FROM Productos

SELECT * FROM Clientes

SELECT * FROM Facturas

SELECT * FROM DetalleFactura

-- DE LA TABLA CATEGORIA NECESITO EL NOMBRE Y DE LA TABLA PRODUCTOS NECESITO EL NOMBRE DEL PRODUCTO

SELECT Categorias.NombreCat, Productos.NombrePro
FROM Categorias INNER JOIN Productos ON Categorias.IdCategoria=Productos.IdCategoria
ORDER BY Categorias.NombreCat


-- De la tabla Categorias necesito el nombre y de la tabla Productos necesito el nombre del producto,
--precio del producto de la tabla producto y la descripcion de la categoria de la tabla

SELECT Categorias.NombreCat, Productos.NombrePro,Productos.Precio, Categorias.Descripcion
FROM Categorias INNER JOIN Productos ON Categorias.IdCategoria=Productos.IdCategoria
ORDER BY Categorias.NombreCat

--Apellido, nombre CLIENTE ciudad identificacion y fecha de compra de las tablas facturas y clientes

SELECT Clientes.Apellido, Clientes.NombreCli,Clientes.Ciudad, Clientes.Identificacion,Facturas.FechaCompra
FROM Facturas INNER JOIN Clientes ON Facturas.Identificacion=Clientes.Identificacion
ORDER BY Identificacion

--Realizar una consulta SQL, que visualice la Categoría, descripción de la Categoría,
--Nombre del producto y el precio del producto. Ordenar la lista por Categoría y mostrar los precios de mayor a menor	
SELECT Categorias.NombreCat, Categorias.Descripcion, Productos.NombrePro,Productos.Precio
FROM Categorias INNER JOIN Productos ON Categorias.IdCategoria=Productos.IdCategoria
ORDER BY Categorias.NombreCat, Productos.Precio DESC

--Realizar una consulta SQL, que visualice la categoría y el nombre de los productos que se encuentren descontinuados (=1)
SELECT Categorias.NombreCat, Productos.NombrePro,Productos.Descontinuado
FROM Categorias INNER JOIN Productos ON Categorias.IdCategoria=Productos.IdCategoria
WHERE Productos.Descontinuado=1


--Realizar una consulta SQL, que visualice la categoría y el nombre de los productos que se encuentren con nivel de pedido (=1)
SELECT Categorias.NombreCat, Productos.NombrePro,Productos.NivelPedido
FROM Categorias INNER JOIN Productos ON Categorias.IdCategoria=Productos.IdCategoria
WHERE Productos.NivelPedido=1

--Realizar una consulta SQL, que visualice la categoría, descripción de la Categoría, Nombre del producto y el precio del producto;
-- de los productos que tengan una cantidad superior a 30
SELECT Categorias.NombreCat, Categorias.Descripcion, Productos.NombrePro,Productos.Precio,Productos.Cantidad
FROM Categorias INNER JOIN Productos ON Categorias.IdCategoria=Productos.IdCategoria
WHERE Productos.Cantidad>30
ORDER BY Productos.Cantidad

--Realizar una consulta SQL, que calcule: Subtotal = precio * cantidad, mostrar el nombre de la categoría, el nombre del producto, precio, 
--cantidad y el Subtotal, colocar nombre a la columna Subtotal.
SELECT Categorias.NombreCat, Productos.NombrePro,FORMAT(Productos.Precio,'#,##')AS'Precio Unitario',Productos.Cantidad, FORMAT(Productos.Precio*Productos.Cantidad,'#,##') AS Subtotal
FROM Categorias INNER JOIN Productos ON Categorias.IdCategoria=Productos.IdCategoria
ORDER BY Productos.Cantidad

--Realizar una consulta SQL, que muestre los siguientes datos: concatenar nombre y apellido, ciudad, 
--Identificación del cliente, fecha de la factura y el IdFactura.Ordenar por ciudad y nombre.

SELECT CONCAT (Clientes.NombreCli,' ', Clientes.Apellido) AS 'Nombre Completo', Clientes.Ciudad, Clientes.Identificacion,
		Facturas.FechaCompra,Facturas.IdFactura
FROM Facturas INNER JOIN Clientes ON Facturas.Identificacion=Clientes.Identificacion
ORDER BY Clientes.Ciudad,[Nombre Completo]

--Realizar una consulta SQL, que Liste los datos principales del cliente con Identificación = 24 por cada factura.
SELECT *
FROM Facturas INNER JOIN Clientes ON Facturas.Identificacion=Clientes.Identificacion
WHERE Clientes.Identificacion=24
ORDER BY Facturas.IdFactura

--La tabla DETALLE FACTURA, es la tabla más importante de la base de datos, pues en ella se encuentra el resumen de los clientes 
--y los productos. Por lo tanto, la información que se requiere, por lo general involucras varias tablas. 
--Por Ejemplo, se desea saber del cliente con identificación 69, su nombre completo y el nombre de los productos, 
--el precio, la cantidad, el descuento, así como los números de las facturas y la fecha de compra.

SELECT Clientes.Identificacion, CONCAT (Clientes.NombreCli,' ', Clientes.Apellido) AS 'Nombre Completo',DetalleFactura.Idproducto, 
		Productos.NombrePro,Productos.Precio,DetalleFactura.Cantidad,(Productos.Precio*DetalleFactura.Cantidad) as SUBTOTAL, DetalleFactura.Descuento,
		((Productos.Precio*DetalleFactura.Cantidad)-DetalleFactura.Descuento) AS 'TOTAL A PAGAR',
		Facturas.IdFactura,Facturas.FechaCompra
FROM Clientes INNER JOIN Facturas ON Clientes.Identificacion=Facturas.Identificacion 
	INNER JOIN DetalleFactura ON Facturas.IdFactura=DetalleFactura.IdFactura 
	INNER JOIN Productos ON Productos.IdProducto=DetalleFactura.Idproducto
WHERE Clientes.Identificacion=69
ORDER BY Facturas.IdFactura


