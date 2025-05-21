2. Cuáles son los productos que han tenido mayor venta y a qué vendedor pertenece?

Respuesta:

-- Paso 1: Calcular la venta total por producto y vendedor
-- se utiliza la cracion de una tabla temporal para evitar crear tablas innecesarias y que eviten ser consumidas en el cache
WITH VentasPorProductoVendedor AS (
    SELECT 
        P.IdProducto,
        P.Nombre AS NombreProducto,
        V.Identificacion AS IdVendedor,
        CONCAT(V.Nombre1, ' ', V.Apellido1) AS NombreVendedor,
        SUM(DV.Total) AS TotalVentas
    FROM TblDetalleVenta DV
    INNER JOIN TblVenta T ON DV.IdFactura = T.IdFactura
    INNER JOIN TblVendedor V ON T.Vendedor = V.Identificacion
    INNER JOIN TblProducto P ON DV.IdProducto = P.IdProducto
    GROUP BY 
        P.IdProducto, P.Nombre,
        V.Identificacion, V.Nombre1, V.Apellido1
    ORDER BY 
    TotalVentas DESC;
)


-- Paso 2: Seleccionar los productos con la mayor venta 
SELECT *
FROM VentasPorProductoVendedor

