CREATE OR REPLACE PROCEDURE RAW_PRD_SAP.EP1.LOAD_CARTERA("FECHA_INICIO" DATE, "FECHA_FIN" DATE, "SOCIEDAD" VARCHAR(4))
RETURNS VARCHAR(16777216)
LANGUAGE SQL
EXECUTE AS OWNER
AS 'DECLARE 

D_FECHA_INICIO DATE;
D_FECHA_FIN DATE;
V_SOCIEDAD VARCHAR(5);
--CLASE_DOCUMENTO VARCHAR(3);
V_RESULT VARCHAR(250);

BEGIN 

D_FECHA_INICIO := FECHA_INICIO ;
D_FECHA_FIN := FECHA_FIN;
V_SOCIEDAD := SOCIEDAD;
--CLASE_DOCUMENTO VARCHAR(3);

DELETE FROM RAW_PRD_SAP.EP1.RAW_CARTERA_TEST;

INSERT INTO  RAW_PRD_SAP.EP1.RAW_CARTERA_TEST
SELECT 
    A.Fuente,
    YEAR(a.budat) as Anio,
    MONTH(a.budat) as Mes,
    --(YEAR(a.budat) + ''-'' + MONTH(a.budat)) AS Anio_Mes,
    D.VKORG AS Orgventas_id,
    A.BUKRS AS Sociedad,
    D.VTWEG AS Canaldistrib_id,
    D.SPART AS Sector_id,
    A.KUNNR AS Deudor,
    D.KUNAG AS Solictante_id,
    E.KUNNR AS Destinatario_id,
    A.BELNR AS Documento_FI,
    A.BLART AS Tipo_Documento,
    A.GJAHR AS Ejercicio,
    A.BUDAT AS Fecha_Contabilizacion,
    A.ZFBDT AS Fecha_Vencimiento,
    A.BUZEI AS Posicion_DCTO_FI,
    A.AUGDT AS Fecha_Compensacion,
    A.PRCTR AS Centro_Beneficio,
    A.HKONT AS Cuenta_Mayor,
    A.XBLNR AS Referencia,
    A.VBELN AS Factura,
    D.FKART AS Clasefactura_id,
    F.KUNNR AS Asesorfactura_id,
    A.KKBER AS Area_Ctrl,
    B.STGRD AS Motivo_Anulacion,
    C.SHKZG AS Debe_Haber,
    SUM (C.NEBTR) AS Importe,
    C.PSWSL AS MONEDA,
    H.CTLPC AS ClaseRiesgo_id,
    H.SBGRP AS EquipoRespCredito_id,
    H.GRUPP AS GrupCredCliente_id
FROM (
        SELECT *,''BSID'' AS Fuente
            FROM RAW_PRD_SAP.EP1.RAW_BSID -- Universo Documentos Abiertos
        UNION ALL 
        SELECT *,''BSAD'' AS Fuente
            FROM RAW_PRD_SAP.EP1.RAW_BSAD_ACT  -- Universo Documentos Compensados año actual
        UNION ALL 
        SELECT *, ''BSAD'' AS Fuente
            FROM RAW_PRD_SAP.EP1.RAW_BSAD_HIST -- Universo Documentos Compensados Historia
    )A
    LEFT JOIN RAW_PRD_SAP.EP1.RAW_BKPF_ACT B ON A.BELNR = B.BELNR AND A.GJAHR = B.GJAHR AND A.BUKRS = B.BUKRS
    LEFT JOIN RAW_PRD_SAP.EP1.RAW_BSEG_ACT C ON A.BELNR = C.BELNR AND A.GJAHR = C.GJAHR AND A.BUKRS = C.BUKRS AND A.BUZEI = C.BUZEI AND C.XZAHL = ''X''
    LEFT JOIN RAW_PRD_SAP.EP1.RAW_VBRK D ON A.VBELN = D.VBELN
    LEFT JOIN RAW_PRD_SAP.EP1.RAW_VBPA E ON A.VBELN = E.VBELN AND E.POSNR = ''000010'' AND E.PARVW = ''WE''
    LEFT JOIN RAW_PRD_SAP.EP1.RAW_VBPA F ON A.VBELN = F.VBELN AND F.POSNR = ''000000'' AND F.PARVW = ''ZV''
    LEFT JOIN RAW_PRD_SAP.EP1.RAW_KNKK H ON (A.KUNNR = H.KUNNR AND A.KKBER = H.KKBER)
WHERE
    A.BUKRS = :V_SOCIEDAD /*''R101''*/ AND
    A.BLART IN (''DZ'',''ZC'') AND
    A.BUDAT BETWEEN :D_FECHA_INICIO /*''2024-09-01''*/ AND :D_FECHA_FIN/*''2024-09-30''*/
GROUP BY
    A.FUENTE,
    YEAR(a.budat),
    MONTH(a.budat),
    --(YEAR(a.budat) + ''-'' + MONTH(a.budat)),
    D.VKORG,
    A.BUKRS,
    D.VTWEG,
    D.SPART,
    A.BUKRS,
    A.KUNNR,
    D.KUNAG,
    E.KUNNR,
    A.BELNR,
    A.BLART,
    A.GJAHR,
    A.BUDAT,
    A.ZFBDT,
    A.BUZEI,
    A.AUGDT,
    A.PRCTR,
    A.HKONT,
    A.XBLNR,
    A.VBELN,
    D.FKART,
    F.KUNNR,
    A.KKBER,
    B.STGRD,
    C.SHKZG,
    C.PSWSL,
    H.CTLPC,
    H.SBGRP,
    H.GRUPP
;   

V_RESULT:= ''EL PROCESO FUE EXITOSO, SE REALIZO LA CARGA'';

RETURN  V_RESULT;

END';