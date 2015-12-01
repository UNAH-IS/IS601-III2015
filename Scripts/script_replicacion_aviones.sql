SELECT A.CODIGO_AVION, A.REGISTRO,
    A.CANTIDAD_ASIENTOS, B.NOMBRE_MARCA,
    C.NOMBRE_MODELO
FROM AEROLINEA.TBL_AVIONES@ A
INNER JOIN TBL_MARCAS B
ON (A.CODIGO_MARCA = B.CODIGO_MARCA)
INNER JOIN TBL_MODELOS C
ON (A.CODIGO_MODELO = C.CODIGO_MODELO); 