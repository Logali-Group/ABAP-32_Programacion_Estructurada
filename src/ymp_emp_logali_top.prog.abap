*&---------------------------------------------------------------------*
*& Include YMP_EMP_LOGALI_TOP                       - Module Pool      YMP_EMP_LOGALI
*&---------------------------------------------------------------------*

"Include TOP
PROGRAM ymp_emp_logali.

DATA gv_ok_code TYPE syucomm.

"Customer cointainer
DATA go_customer_cointainer TYPE REF TO cl_gui_custom_container.

"ALV Grid
DATA go_alv_empl_data TYPE REF TO cl_gui_alv_grid.

"Field catalog
DATA gt_fieldcat TYPE lvc_t_fcat.

"Employees data
DATA gt_employees TYPE TABLE OF ztb_empl_logali.
