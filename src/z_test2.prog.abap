*&---------------------------------------------------------------------*
*& Report z_test2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_test2.

*DATA gt_messages TYPE SORTED TABLE OF snwd_employees WITH NON-UNIQUE KEY sex.
*SELECT *
*       FROM snwd_employees
*       INTO TABLE @gt_messages.
*
*cl_demo_output=>display(
*  FILTER #( gt_messages EXCEPT WHERE sex = 'F' ) ).




DATA: lt_empl_final TYPE STANDARD TABLE OF snwd_employees,
      "Filter table
      lt_filter     TYPE SORTED TABLE OF snwd_employees-sex WITH UNIQUE KEY table_line.

SELECT FROM snwd_employees
    FIELDS *
    INTO TABLE @DATA(lt_empl_all).


lt_filter = VALUE #( ( 'F' ) ).

lt_empl_final  = FILTER #( lt_empl_all EXCEPT IN lt_filter WHERE sex = table_line   ).

cl_demo_output=>write( lt_empl_all ).
cl_demo_output=>write( lt_empl_final ).
cl_demo_output=>write( lt_filter ).
cl_demo_output=>display(  ).







*DATA(gv_replace) = 'ABCA'.
*
*WRITE: / 'Initial Value: ', gv_replace.
*
*REPLACE SECTION OFFSET 3 LENGTH 1 OF: gv_replace WITH 'D'.
*
*WRITE: / 'Replaced Value: ', gv_replace.

*
*
*DATA(gv_replace) = 'ABCA'.
*DATA(gv_new) = 'D'.
*
*WRITE: / 'Initial Value: ', gv_replace.
*
*gv_replace = replace( val = gv_replace
*                      off = 3
*                      len = 1
*                      with = gv_new ).
*
*WRITE: / 'Replaced Value: ', gv_replace.
*


*Option 2
*gv_reempl = replace( val   = gv_reempl
*                     regex = gv_sig
*                     with  = 'D'
*                     occ   = 0 ). "si cambiamos el numero de la posicion, empezará a cambiarse desde la posicion que se indica

*SKIP.




*SELECT FROM spfli
*    FIELDS *
*    INTO TABLE @DATA(gt_spfli).
*
*DATA gt_members LIKE gt_spfli.
*
*LOOP AT gt_spfli INTO DATA(gs_spfli)
*
*"Agrupación por una columna
**GROUP BY gs_spfli-carrid.
*
*"Agrupación por más de una columna de grupos
* GROUP BY (  airline = gs_spfli-carrid
*             city    = gs_spfli-cityfrom
*             index   = GROUP INDEX
*             size    = GROUP SIZE   )
*             WITHOUT MEMBERS
*          ASSIGNING FIELD-SYMBOL(<gfs_key>).
*
**Miembros de una columna de grupos
*
**  CLEAR gt_members.
**
**  LOOP AT GROUP gs_key INTO DATA(gs_member).
**
**    gt_members = VALUE #(  BASE gt_members ( gs_member ) ).
**
**  ENDLOOP.
**
** cl_demo_output=>write( gt_members ).
*
*  cl_demo_output=>write( <gfs_key> ).
*
*ENDLOOP.
*
*cl_demo_output=>display( ).























*SELECT FROM spfli
*    FIELDS *
*    INTO TABLE @DATA(gt_spfli).
*
*LOOP AT gt_spfli INTO DATA(gs_spfli)
*
* GROUP BY gs_spfli-carrid.
*
* cl_demo_output=>write( gs_spfli ).
*
*ENDLOOP.
*
*cl_demo_output=>display( ).

*SELECT FROM spfli
*    FIELDS *
*    INTO TABLE @DATA(gt_spfli).
*
*DATA gt_members LIKE gt_spfli.
*
*LOOP AT gt_spfli INTO DATA(gs_spfli)
*
*  GROUP BY gs_spfli-carrid.
*
*  "Miembros de una columna de grupos
*
*  CLEAR gt_members.
*
*  LOOP AT GROUP gs_spfli INTO DATA(gs_member).
*
*    gt_members = VALUE #(  BASE gt_members ( gs_member ) ).
*
*  ENDLOOP.
*
*  cl_demo_output=>write( gt_members ).
*
*
*ENDLOOP.
*
*cl_demo_output=>display( ).
**********************************************************************

*SELECT FROM spfli
*    FIELDS *
*    INTO TABLE @DATA(gt_spfli).
*
*DATA gt_members LIKE gt_spfli.
*
*LOOP AT gt_spfli INTO DATA(gs_spfli)
*
*"Agrupación por una columna
**GROUP BY gs_spfli-carrid.
*
*"Agrupación por más de una columna de grupos
* GROUP BY (  airline = gs_spfli-carrid
*             city    = gs_spfli-cityfrom   ).
*
**Miembros de una columna de grupos
*
*  CLEAR gt_members.
*
*  LOOP AT GROUP gs_spfli INTO DATA(gs_member).
*
*    gt_members = VALUE #(  BASE gt_members ( gs_member ) ).
*
*  ENDLOOP.
*
*  cl_demo_output=>write( gt_members ).
*
*
*ENDLOOP.
*
*cl_demo_output=>display( ).






"group key
*SELECT FROM spfli
*    FIELDS *
*    INTO TABLE @DATA(gt_spfli).
*
*DATA gt_members LIKE gt_spfli.
*
*LOOP AT gt_spfli INTO DATA(gs_spfli)
*
*"Agrupación por una columna
**GROUP BY gs_spfli-carrid.
*
*"Agrupación por más de una columna de grupos
* GROUP BY (  airline = gs_spfli-carrid
*             city    = gs_spfli-cityfrom  )
*          ASSIGNING FIELD-SYMBOL(<gfs_key>).
*
*"Miembros de una columna de grupos
*
*  CLEAR gt_members.
*
*  LOOP AT GROUP <gfs_key> ASSIGNING FIELD-SYMBOL(<gfs_member>).
*
*    gt_members = VALUE #(  BASE gt_members ( <gfs_member> ) ).
*
*  ENDLOOP.
*
*  cl_demo_output=>write( gt_members ).
*
*ENDLOOP.
*
*cl_demo_output=>display( ).
*

*SELECT FROM spfli
*    FIELDS *
*    INTO TABLE @DATA(gt_spfli).
*
*DATA gt_members LIKE gt_spfli.
*
*LOOP AT gt_spfli INTO DATA(gs_spfli)
*
*"Agrupación por una columna
**GROUP BY gs_spfli-carrid.
*
*"Agrupación por más de una columna de grupos
* GROUP BY (  airline = gs_spfli-carrid
*             city    = gs_spfli-cityfrom  )
*          ASSIGNING FIELD-SYMBOL(<gfs_key>).
*
*"Miembros de una columna de grupos
*
*  CLEAR gt_members.
*
*  LOOP AT GROUP <gfs_key> ASSIGNING FIELD-SYMBOL(<gfs_member>).
*
*    gt_members = VALUE #(  BASE gt_members ( <gfs_member> ) ).
*
*  ENDLOOP.
*
*  cl_demo_output=>write( gt_members ).
*  cl_demo_output=>write( <gfs_key> ).
*
*ENDLOOP.
*
*cl_demo_output=>display( ).




*DATA : lv_starttime TYPE timestampl,
*       lv_endtime   TYPE timestampl,
*       lv_runtime   TYPE timestampl.
*
*
*SELECT * FROM ekko INTO TABLE @DATA(gt_ekko) UP TO 10000 ROWS.
*
*IF gt_ekko[] IS NOT INITIAL.
*
*  SELECT * FROM ekpo INTO TABLE @DATA(gt_ekpo) FOR ALL ENTRIES IN @gt_ekko
*  WHERE ebeln = @gt_ekko-ebeln.
*
*ENDIF.
*
*SORT gt_ekko.
*SORT gt_ekpo.
*
*GET TIME STAMP FIELD lv_starttime.
*
*
*LOOP AT gt_ekko INTO DATA(gs_ekko).
*
*  READ TABLE gt_ekpo INTO DATA(gs_ekpo) WITH KEY ebeln = gs_ekko-ebeln BINARY SEARCH.
*
*  IF sy-subrc = 0.
*
*    LOOP AT gt_ekpo INTO gs_ekpo FROM sy-tabix.
*
*      IF gs_ekpo-ebeln NE gs_ekko-ebeln.
*        EXIT.
*      ENDIF.
*
*
*      CLEAR : gs_ekpo.
*    ENDLOOP.
*
*  ENDIF.
*
*  CLEAR : gs_ekko.
*ENDLOOP.
*
*GET TIME STAMP FIELD lv_endtime.
*
*lv_runtime = lv_endtime - lv_starttime.
*
*
*WRITE : / lv_runtime.
*WRITE : / lv_endtime.
*WRITE : / lv_starttime.


*data : lv_starttime type TIMESTAMPL,
*       lv_endtime type TIMESTAMPL,
*       lv_runtime type TIMESTAMPL.
*
*
*
*select * from ekko into TABLE @data(gt_ekko) UP TO 10000 ROWS.
*
*if gt_ekko[] is NOT INITIAL.
*
*select * from ekpo into TABLE @data(gt_ekpo) FOR ALL ENTRIES IN @gt_ekko
*WHERE EBELN = @GT_EKKO-EBELN.
*
*endif.
*
*SORT GT_EKKO.
*SORT GT_EKPO.
*
*GET TIME STAMP FIELD LV_STARTTIME.
*
*
*LOOP at gt_ekko into data(gs_ekko).
*
*loop at gt_ekpo into data(gs_ekpo) WHERE ebeln = gs_ekko-ebeln.
*
*
*
*clear : gs_ekpo.
*endloop.
*
*clear : gs_ekko.
*endloop.
*
*get TIME STAMP FIELD LV_ENDTIME.
*
*LV_RUNTIME = LV_ENDTIME - LV_STARTTIME.
*
*
*write : / lv_runtime.
*write : / LV_ENDTIME.
*write : / LV_STARTTIME.


*TYPES ls_sflight TYPE zsflight WITH INDICATORS ind.
*
*DATA lt_sflight TYPE TABLE OF ls_sflight WITH EMPTY KEY.
*
*SELECT FROM zsflight
*    FIELDS *
*    WHERE carrid EQ 'LH'   AND
*          connid EQ '2402' AND
*          fldate GT '20220101'
*    INTO CORRESPONDING FIELDS OF TABLE @lt_sflight.
*
*IF sy-subrc  = 0.
*
*  LOOP AT lt_sflight ASSIGNING FIELD-SYMBOL(<lfs_sflight>).
*    <lfs_sflight>-price *= '0.5'.
*    <lfs_sflight>-ind-price = 'X'.
*    cl_demo_output=>write( <lfs_sflight>-price ).
*  ENDLOOP.
*
*  UPDATE zsflight FROM TABLE @lt_sflight INDICATORS SET STRUCTURE ind.
*
*ENDIF.
*
*cl_demo_output=>display(  ).
*

"code for insert data

*DATA ivar type i.
*
*  SELECT * FROM sflight INTO TABLE @data(it_flights).
*
*     LOOP AT it_flights INTO DATA(gs_sflight).
*      INSERT zsflight FROM gs_sflight.
*      ivar = ivar + 1.
*
*      IF ivar = 100.
*        COMMIT WORK.
*        CLEAR ivar. " limpiar contador
*      ENDIF.
*
*    ENDLOOP.
*    COMMIT WORK.
*
*
