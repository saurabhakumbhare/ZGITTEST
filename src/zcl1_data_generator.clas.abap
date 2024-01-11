CLASS zcl1_DATA_GENERATOR DEFINITION

  PUBLIC

  FINAL

  CREATE PUBLIC .



  PUBLIC SECTION.

    INTERFACES:

      if_oo_adt_classrun.

  PROTECTED SECTION.

  PRIVATE SECTION.

ENDCLASS.







CLASS zcl1_DATA_GENERATOR IMPLEMENTATION.





  METHOD if_oo_adt_classrun~main.



    " delete existing entries in the database table

    DELETE FROM ztravel_techno_m.

    DELETE FROM zbookng_techno_m.

    DELETE FROM zboksup_techno_m.

    COMMIT WORK.

    " insert travel demo data

    INSERT ztravel_techno_m FROM (

        SELECT *

          FROM /dmo/travel_m

      ).

    COMMIT WORK.



    " insert booking demo data

    INSERT zbookng_techno_m FROM (

        SELECT *

          FROM   /dmo/booking_m

*            JOIN ztravel_tech_m AS z

*            ON   booking~travel_id = z~travel_id



      ).

    COMMIT WORK.

    INSERT zboksup_techno_m FROM (

        SELECT *

          FROM   /dmo/booksuppl_m

*            JOIN ztravel_tech_m AS z

*            ON   booking~travel_id = z~travel_id



      ).

    COMMIT WORK.



    out->write( 'Travel and booking demo data inserted.').





  ENDMETHOD.

ENDCLASS.
