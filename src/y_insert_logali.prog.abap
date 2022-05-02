*&---------------------------------------------------------------------*
*& Report y_insert_logali
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT y_insert_logali.



DATA(gt_employee) = VALUE ztb_empl_logali( empid       = '000000006F'
                                           first_name  = 'Jessica'
                                           middle_name = 'María'
                                           last_name   = 'Vince'
                                           email1      = 'jvince@logaligroup.com'
                                           mobile1     = '02568922'
                                           dob         = '19980622' ).



*INSERT ztb_empl_logali FROM gt_employee.


UPDATE ztb_empl_logali FROM gt_employee.
