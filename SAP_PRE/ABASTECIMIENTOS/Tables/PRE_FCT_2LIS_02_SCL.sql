create or alter TABLE PRE.PRE_FCT_2LIS_02_SCL (
	IND_ANULACION VARCHAR(1),
	FECHA_DOCCOMPRAS DATE,
	CLASEDOCCOMPRAS_ID VARCHAR(4),
	TIPODOCCOMPRAS_ID VARCHAR(1),
	FECHA_CONTABILIZACION DATE,
	DOCUMENTO_ID VARCHAR(10),
	GPOCOMPRAS_ID VARCHAR(3),
	ORGCOMPRAS_ID VARCHAR(4),
	MON_LOC VARCHAR(5),
	PROVEEDOR_ID VARCHAR(10),
	STATUSDOCCOMPRAS_ID VARCHAR(1),
	FECHA_REGCOMPRAS DATE,
	MON_PED VARCHAR(5),
	TIPOCAMBIO_DOCUMENTO NUMBER(15,5),
	CONDDOCUMENTO_ID VARCHAR(10),
	SOLICITANTE_ID VARCHAR(12),
	CLAVEOPERACION_ID VARCHAR(3),
	POSICIONDOC_ID VARCHAR(5),
	IND_ENTREGAFINAL VARCHAR(1),
	IND_FACTFINAL VARCHAR(1),
	CONTRATO_ID VARCHAR(10),
	POSICIONCONTRATO_ID VARCHAR(5),
	ALMACEN_ID VARCHAR(4),
	UM_BASE VARCHAR(3),
	GPOARTICULOS_ID VARCHAR(9),
	MATERIAL_ID VARCHAR(18),
	UM_PEDIDO VARCHAR(3),
	PRECIO_NETO NUMBER(14,2),
	CANTIDAD_BASE NUMBER(6,0),
	TIPOPOS_DOCCOMPRAS_ID VARCHAR(1),
	TEXTO_BREVE VARCHAR(40),
	DENOMINADOR_UM_BASE NUMBER(6,0),
	NUMERADOR_UM_BASE NUMBER(6,0),
	CENTRO_ID VARCHAR(4),
	CANTIDAD_UM_PEDIDO NUMBER(17,3),
	UM_PRECIOPEDIDO VARCHAR(3),
	SOLPED_ID VARCHAR(10),
	POSSOLPED_ID VARCHAR(5),
	IMPORTE_BRUTO_MON_PED NUMBER(16,2),
	IMPORTE_EFECTIVO_MON_PED NUMBER(18,2),
	IMPORTE_COMPRA_MON_LOC NUMBER(22,2),
	IMPORTE_COMPRA_MON_PED NUMBER(22,2),
	IMPORTE_VENTA_MON_LOC NUMBER(22,2),
	CANTIDAD_UM_PED NUMBER(19,3),
	NUMLOTE_ID VARCHAR(10),
	DELTAPEDIDO_EM NUMBER(22,2),
	DELTAPEDIDO_EM_UM_BASE NUMBER(19,3),
	FECHA_ENTREGAPOSICION DATE,
	CONTADOR_REPARTOS VARCHAR(4),
	FECHA_ENTREGAESTADISTICA DATE,
	CATEGORIAMAT_ID VARCHAR(2),
	TIPOCENTRO_ID VARCHAR(1),
	FECHA_REPARTO DATE,
	CONTADOR_REPARTOS_PLANENT NUMBER(4,0),
	CONVERSION_CANTIDAD NUMBER(6,0),
	FECHA_LIBERACION DATE,
	IMPORTE_CODICION NUMBER(14,2),
	UD_CONDICION VARCHAR(5),
	CANTIDAD_BASECONDICION NUMBER(6,0),
	UM_CONDICION VARCHAR(3),
	TC_CONDICION NUMBER(15,5),
	IMPORTE_FLETE NUMBER(14,2),
	TC_USD NUMBER(15,5),
	TC_EUR NUMBER(15,5),
	TS_SEQUENCE_NUMBER NUMBER(20,0),
	HORA_REPARTO VARCHAR(6),
	VARIANTE_FISCAL VARCHAR(2),
	FECHA_CARGA TIMESTAMP_NTZ(9),
	MATCENTRO_ID VARCHAR(22),
	ACTDELDATE DATE
);