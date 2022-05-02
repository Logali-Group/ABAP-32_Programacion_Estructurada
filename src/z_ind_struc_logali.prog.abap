*&---------------------------------------------------------------------*
*& Report z_ind_struc_logali
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_ind_struc_logali.

"ABAP SQL Indicator structure

TYPES ls_sflight TYPE zsflight WITH INDICATORS ind.

DATA lt_sflight TYPE TABLE OF ls_sflight WITH EMPTY KEY.

SELECT FROM zsflight
    FIELDS *
    WHERE carrid EQ 'LH'   AND
          connid EQ '2402' AND
          fldate GT '20220101'
    INTO CORRESPONDING FIELDS OF TABLE @lt_sflight.


IF sy-subrc EQ 0.

 LOOP AT lt_sflight ASSIGNING FIELD-SYMBOL(<lfs_sflight>).

    <lfs_sflight>-price *= '0.5'.
    <lfs_sflight>-ind-price = 'X'.

    cl_demo_output=>write( <lfs_sflight>-price ).

  ENDLOOP.



UPDATE zsflight FROM TABLE @lt_sflight INDICATORS SET STRUCTURE ind.

ENDIF.

cl_demo_output=>display(  ).
