*&---------------------------------------------------------------------*
*& Report z_parameter_logali
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_parameter_logali.

* Cargar la tabla SPFLI de la base de datos
TABLES: spfli.

* Definición de variables
DATA: gt_spfli TYPE TABLE OF spfli,
      gs_spfli TYPE spfli.

DATA: gt_screen TYPE TABLE OF screen.

* Pantalla de selección

*Para búsqueda básica
PARAMETERS: p_basic RADIOBUTTON GROUP srch USER-COMMAND uc DEFAULT 'X' .

SELECT-OPTIONS: s_bcarr FOR spfli-carrid MODIF ID md1,
                s_bconn FOR spfli-connid MODIF ID md1,
                s_bairp FOR spfli-airpto MODIF ID md1.

SELECTION-SCREEN SKIP 2.

*Para búsqueda avanzada
PARAMETERS: p_advanc RADIOBUTTON GROUP srch.

SELECT-OPTIONS: s_acarr FOR spfli-carrid MODIF ID md2,
                s_aconn FOR spfli-connid MODIF ID md2,
                s_aairp FOR spfli-airpto MODIF ID md2.

SELECTION-SCREEN SKIP 1.

SELECT-OPTIONS: s_adist FOR spfli-distance MODIF ID md2,
                s_adept FOR spfli-deptime  MODIF ID md2,
                s_fltim FOR spfli-fltime   MODIF ID md2.

AT SELECTION-SCREEN OUTPUT.

  IF p_basic = abap_true.
    LOOP AT SCREEN.
      IF screen-group1 = 'MD2'.
        screen-active = 0.
        MODIFY SCREEN.
      ENDIF.
    ENDLOOP.

  ELSE.
    LOOP AT SCREEN.
      IF screen-group1 = 'MD1'.
        screen-active = 0.
        MODIFY SCREEN.
      ENDIF.
    ENDLOOP.
  ENDIF.

  APPEND screen TO gt_screen.





*TABLES: kna1, mara.
*
*************************************************************************
**** SELECTION-SCREEN / PARAMETERS / SELECT-OPTIONS                   ***
*************************************************************************
*SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-a01.
*
*  PARAMETERS:
*    r_clie RADIOBUTTON GROUP grup USER-COMMAND r DEFAULT 'X',
*    r_mate RADIOBUTTON GROUP grup.
*
*SELECTION-SCREEN END OF BLOCK b1.
*
**Datos Clientes
*
*SELECTION-SCREEN BEGIN OF BLOCK b2 WITH FRAME TITLE TEXT-b02.
*
*  SELECT-OPTIONS: so_clie  FOR kna1-kunnr MODIF ID cli,
*                  so_name  FOR kna1-name1 MODIF ID cli,
*                  so_land  FOR kna1-land1 MODIF ID cli.
*
*SELECTION-SCREEN END OF BLOCK b2.
*
**Datos Materiales
*SELECTION-SCREEN BEGIN OF BLOCK b3 WITH FRAME TITLE TEXT-b03.
*
*  SELECT-OPTIONS: so_mate FOR mara-matnr MODIF ID mat.
*
*SELECTION-SCREEN END OF BLOCK b3.
*
**———————————————————————–*
**AT SELECTION-SCREEN.
**———————————————————————–*
*AT SELECTION-SCREEN OUTPUT.
*
*  LOOP AT SCREEN.
*
*    IF screen-group1 = 'MAT'.
*
*      CASE r_mate.
*        WHEN 'X'.
*          screen-active = 1.
*        WHEN OTHERS.
*          screen-active = 0.
*      ENDCASE.
*
*    ELSEIF screen-group1 = 'CLI'.
*
*      CASE r_mate.
*        WHEN 'X'.
*          screen-active = 0.
*        WHEN OTHERS.
*          screen-active = 1.
*      ENDCASE.
*
*    ENDIF.
*
*    MODIFY SCREEN.
*
*  ENDLOOP.
