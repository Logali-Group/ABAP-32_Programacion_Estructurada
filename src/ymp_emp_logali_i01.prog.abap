*&---------------------------------------------------------------------*
*& Include ymp_emp_logali_i01
*&---------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_2000  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_2000 INPUT.

    gv_ok_code = sy-ucomm.

    CASE gv_ok_code.

      WHEN 'BACK'.

      LEAVE TO SCREEN 0. "aqui se tambien se puede poner si queremos volver a cierta pantalla, se indica LEAVE TO SCREEN y el numero de la pantalla

    ENDCASE.

ENDMODULE.
