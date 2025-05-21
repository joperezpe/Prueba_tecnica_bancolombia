3. Construya una consulta general que involucre todas las tablas del Modelo Relacional y permita visualizar totales en ella.

Repuesta: 


-- Para relacionar todas las tablas en una consulta general tenmos que: 
SELECT 
    -- Tabla ventas
    T.IdFactura,
    T.Fecha,
    T.Iva AS IvaVenta,
    -- Tabla Vendedor
    V.Identificacion AS IdVendedor,
    CONCAT(V.Nombre1, ' ', V.Apellido1) AS NombreVendedor,
    V.Identificacion,
    V.TipoDeIdentificacion,
    V.EstadoCivil,
    V.Sexo,,

    -- Tabla Producto
    P.Nombre AS Producto,
    P.Precio,

    -- Tabla Categoria
    C.Descripcion AS Categoria,

    -- Tabla Detalle venta
    DV.Cantidad,
    DV.Total AS TotalVentaProducto,

    -- Conceptos (aunque no están directamente ligados a ventas)
    CP.NombreConcepto AS Concepto,
    CP.Descripcion,
    CD.NombreConcepto AS Subconcepto

FROM TblVenta T
-- Detalle de la venta
INNER JOIN TblDetalleVenta DV ON T.IdFactura = DV.IdFactura
-- Producto y su categoría
INNER JOIN TblProducto P ON DV.IdProducto = P.IdProducto
INNER JOIN TblCategoria C ON P.IdCategoria = C.IdCategoria
-- Vendedor
INNER JOIN TblVendedor V ON T.Vendedor = V.Identificacion
-- Conceptos (relación indirecta, asumida)
LEFT JOIN TblConcepto CP ON CP.IdConcepto = CD.IdConcepto
LEFT JOIN TblConceptoDetalle CD ON CD.IdDetalleConcepto = CP.IdConcepto


ORDER BY T.Fecha, V.Identificacion;
