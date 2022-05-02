*&---------------------------------------------------------------------*
*& Report ztesttrans
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ztesttrans.

DATA gv_xml TYPE string.

DATA: gt_xml        TYPE TABLE OF string,
      gt_result_xml TYPE abap_trans_resbind_tab.

"Load xml file
cl_gui_frontend_services=>gui_upload(
  EXPORTING
    filename = 'C:\Users\info\Documents\file.xml'
    filetype = 'ASC'
  CHANGING
    data_tab = gt_xml
  EXCEPTIONS
    OTHERS   = 19 ).

gv_xml = concat_lines_of( gt_xml ).

TRY.
    CALL TRANSFORMATION ztesttrans
    SOURCE XML gv_xml
    RESULT (gt_result_xml).
  CATCH cx_root INTO DATA(gx_root).
    WRITE gx_root->get_text( ).
ENDTRY.
