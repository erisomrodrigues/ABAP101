*&---------------------------------------------------------------------*
*& Report zscr_working_obj_eri
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zscr_working_obj_eri.

CLASS abap_types_string DEFINITION.
  PUBLIC SECTION.
    METHODS constructor IMPORTING string_value     TYPE string.

    METHODS trim RETURNING VALUE(string_value)     TYPE string.

    METHODS: upper RETURNING VALUE(strig_value)    TYPE string,
      replace IMPORTING pattern             TYPE string
                        replace             TYPE string
              RETURNING VALUE(string_value) TYPE string,
      get_value  RETURNING VALUE(string_value) TYPE string.


  PROTECTED SECTION.


  PRIVATE SECTION.
    CONSTANTS std_separator TYPE char1 VALUE '|'.

    DATA: value TYPE string.

ENDCLASS.

CLASS abap_types_string IMPLEMENTATION.
  METHOD constructor.
    me->value = string_value.
  ENDMETHOD.

  METHOD trim.
    string_value = me->value.
    CONDENSE string_value.
  ENDMETHOD.

  METHOD upper.
    strig_value = me->value.
    TRANSLATE strig_value TO UPPER CASE.
  ENDMETHOD.

  METHOD replace.
    string_value = me->value.
    REPLACE ALL OCCURRENCES OF pattern IN string_value WITH replace.
  ENDMETHOD.

  METHOD get_value.
    string_value = me->value.
  ENDMETHOD.

ENDCLASS.

DATA my_string TYPE REF TO abap_types_string.

START-OF-SELECTION.

  CREATE OBJECT my_string EXPORTING string_value = ' vida longa e própera ao tdd '.

  WRITE: / 'TRIM:', my_string->trim( ).
  WRITE: / 'UPPER:', my_string->upper( ).
  WRITE: / 'REPLACE:', my_string->replace( pattern = 'tdd' replace = 'abap' ).
  WRITE: / 'VALUE:', my_string->get_value( ).

  DATA converted_string TYPE string.
  CALL METHOD my_string->replace
    EXPORTING
      pattern      = 'tdd'
      replace      = 'FIORI'
    RECEIVING
      string_value = converted_string.

  WRITE: / 'Converted:', converted_string.
  .
