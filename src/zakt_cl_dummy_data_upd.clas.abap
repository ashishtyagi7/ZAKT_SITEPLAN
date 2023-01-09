CLASS zakt_cl_dummy_data_upd DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zakt_cl_dummy_data_upd IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
  DATA : lt_prod_ord TYPE TABLE OF zakt_prod_ord,
       lt_prod_ord_chk TYPE TABLE OF zakt_prod_ord.
*   fill Dummy date (itab)
    lt_prod_ord = VALUE #(
      ( ordnum = '12345679' matnr = 'FG8888' quantity = '200' ord_begda = '20221226' ord_endda = '20221228' )
      ( ordnum = '12345678' matnr = 'FG8889' quantity = '150' ord_begda = '20221224' ord_endda = '20221226' )
      ( ordnum = '12345677' matnr = 'FG8890' quantity = '300' ord_begda = '20221222' ord_endda = '20221224' )
      ( ordnum = '12345577' matnr = 'FG8891' quantity = '250' ord_begda = '20221222' ord_endda = '20221228' )
      ( ordnum = '12345578' matnr = 'FG8892' quantity = '200' ord_begda = '20221222' ord_endda = '20230124' )
      ( ordnum = '12345579' matnr = 'FG8893' quantity = '400' ord_begda = '20221222' ord_endda = '20240107' )
    ).

*   delete existing entries in the database table
    delete from zakt_prod_ord.
*    select * from zakt_prod_ord into table @lt_prod_ord_chk.
*    out->write(  sy-dbcnt ).

*   insert the new table entries
    INSERT zakt_prod_ord FROM TABLE @lt_prod_ord.
    clear lt_prod_ord.
    select * from zakt_prod_ord into table @lt_prod_ord.
    out->write(  sy-dbcnt ).
    out->write(  'Prod data inserted successfully!' ).

DATA : lt_STO_data TYPE TABLE OF zakt_sto_data,
       lt_sto_data_chk TYPE TABLE OF zakt_sto_data.
*   fill dummy data for STO
    lt_STO_data = VALUE #(
      ( stonum = '12345679' matnr = 'FG8888' quantity = '180' req_date = '20221226' sup_plant = '1222' rec_plant = '9222')
      ( stonum = '12345678' matnr = 'FG8889' quantity = '100' req_date = '20221224' sup_plant = '1222' rec_plant = '9222')
      ( stonum = '12345677' matnr = 'FG8890' quantity = '200' req_date = '20221222' sup_plant = '1224' rec_plant = '9222')
      ( stonum = '12345577' matnr = 'FG8891' quantity = '150' req_date = '20221222' sup_plant = '1224' rec_plant = '9222')
      ( stonum = '12345578' matnr = 'FG8892' quantity = '100' req_date = '20221222' sup_plant = '1224' rec_plant = '9222')
      ( stonum = '12345579' matnr = 'FG8893' quantity = '250' req_date = '20221222' sup_plant = '1224' rec_plant = '9222')

    ).

*   delete existing entries in the database table
    delete from zakt_sto_data.
*    select * from zakt_sto_data into table @lt_sto_data_chk.
*    out->write(  sy-dbcnt ).

*   insert the new table entries
    INSERT zakt_sto_data FROM TABLE @lt_STO_data.
    if SY-SUBRC NE 0.
    out->write(  sy-subrc ).
    ENDIF.
*    clear lt_STO_data.
    select * from zakt_sto_data into table @lt_sto_data_chk.
    if syst-subrc = 0.
*     'STO data inserted'.
    endif.
   out->write(  sy-dbcnt ).
   out->write(  'STO data inserted successfully!' ).


  ENDMETHOD.
ENDCLASS.
