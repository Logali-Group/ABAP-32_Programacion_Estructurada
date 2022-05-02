*&---------------------------------------------------------------------*
*& Include ZMP_EMP_LOGALI_TOP                       - Module Pool      ZMP_EMP_LOGALI
*&---------------------------------------------------------------------*
PROGRAM ZMP_EMP_LOGALI.

DATA gv_ok_code TYPE syucomm.

"Custom container
DATA go_custom_container TYPE REF TO cl_gui_custom_container.

"ALV Grid
DATA go_alv_empl_data TYPE REF TO cl_gui_alv_grid.

"Field catalog
DATA gt_fieldcat TYPE lvc_t_fcat.

"Employees data
DATA gt_employees TYPE TABLE OF ztb_empl_logali.
