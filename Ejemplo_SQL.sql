USE [PruebaOLX]
GO

/****** Object:  View [dbo].[VNT_CIU_CONS]    Script Date: 14/04/2022 12:37:21 a. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[VNT_CIU_CONS]
AS
SELECT DISTINCT
DE.Ciudad,
CONVERT(int, [Precio de compra]) AS Precio_Compra,
CASE WHEN GAP <= 0.02 THEN 'Poca ganancia'
	 WHEN GAP >= 0.03 AND GAP <= 0.05 THEN 'Ganancia moderada'
	 WHEN GAP >=  0.05 THEN 'Buena ganancia'
END AS [Tipo_Ganancia],
CONVERT(varchar,[Fecha de venta],106) AS Fecha_Venta,
DA.Modelo,
CASE WHEN Modelo BETWEEN 1990 AND 2004 THEN 'Muy Antiguo'
	 WHEN Modelo BETWEEN 2005 AND 2009 THEN 'Antiguo'
	 WHEN Modelo BETWEEN 2010 AND 2015 THEN 'Muy usado'
	 WHEN Modelo BETWEEN 2016 AND 2022 THEN 'Moderno'
END AS [Clasificacion],
DE.[Marca],
Latitud,
Longitud
FROM
Detalle DE
LEFT JOIN
[Data] DA
ON DE.Marca = DA.Marca
INNER JOIN
[Ubicaciones] UB
ON UB.Ciudad = DE.Ciudad




GO

