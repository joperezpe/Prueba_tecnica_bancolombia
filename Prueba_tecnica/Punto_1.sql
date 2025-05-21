1. Cuáles son las ventas de cada uno de los productos vendidos por categoría y por cada uno de los vendedores, indique aquí los nombres de estado civil sexo y tipo de identificación
de cada vendedor en la consulta.

Respuesta:

Dada las relaciones que se presentan en el modelo relacional expuesto el pseudocodigo seria de esta forma:

SELECT 
    -- Se seleccionan todos los campos necesarios para la consulta final
    V.Identificacion,
    V.Nombre1,
    V.Nombre2,
    V.Apellido1,
    V.Apellido2,
    V.TipoDeIdentificacion,
    V.EstadoCivil,
    V.Sexo,
    C.Descripcion AS Categoria,
    P.Nombre AS Producto,
    SUM(DV.Cantidad) AS TotalCantidadVendida,
    SUM(DV.Total) AS TotalVentas
    -- Se asignan nombres especificos a cada tabla a utilizar para evitar confusiones a la hora de los cruces de estas
FROM TblVenta VE 
INNER JOIN  TblDetalleVenta DV ON VE.IdFactura = DV.IdFactura
INNER JOIN  TblProducto P ON DV.IdProducto = P.IdProducto
INNER JOIN  TblCategoria C ON P.IdCategoria = C.IdCategoria
INNER JOIN  TblVendedor V ON VE.Vendedor = V.Identificacion
    -- se realiza la respetiva agrupación de la forma de tabla final
GROUP BY 
    V.Identificacion, V.Nombre1, V.Nombre2, V.Apellido1, V.Apellido2,
    V.TipoDeIdentificacion, V.EstadoCivil, V.Sexo,
    C.Descripcion, P.Nombre
    -- se ordena por el id, categoria y el nombre del producto
ORDER BY 
    V.Identificacion, C.Descripcion, P.Nombre;

