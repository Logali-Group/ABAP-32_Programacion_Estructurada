*&---------------------------------------------------------------------*
*& Report z_debugger_logali
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_debugger_logali.

TYPES: BEGIN OF lty_flights,
         iduser     TYPE /aif/docu_id,
         aircode    TYPE s_carr_id,
         flightnum  TYPE s_conn_id,
         key        TYPE land1,
         seat       TYPE s_seatsocc,
         flightdate TYPE s_date,
       END OF lty_flights.

SELECT FROM sflight
    FIELDS *
    INTO TABLE @DATA(gt_flights).

SELECT FROM spfli
    FIELDS carrid, connid, countryfr
    INTO TABLE @DATA(gt_airline).


DATA: gt_final TYPE SORTED TABLE OF lty_flights WITH NON-UNIQUE KEY flightnum.


gt_final = VALUE #(  FOR gs_flight IN gt_flights WHERE ( carrid = 'SQ' )

                        FOR gs_airline  IN gt_airline WHERE ( connid = gs_flight-connid )

                          ( aircode   =  gs_flight-carrid
                           flightnum  =  gs_airline-connid
                           key        =  gs_airline-countryfr
                           seat       =  gs_flight-seatsocc
                           flightdate =  gs_flight-fldate    )  ).

cl_demo_output=>display( gt_final ).
