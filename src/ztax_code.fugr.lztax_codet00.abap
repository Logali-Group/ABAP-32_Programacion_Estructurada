*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: ZTAX_CODE.......................................*
DATA:  BEGIN OF STATUS_ZTAX_CODE                     .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZTAX_CODE                     .
CONTROLS: TCTRL_ZTAX_CODE
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *ZTAX_CODE                     .
TABLES: ZTAX_CODE                      .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
