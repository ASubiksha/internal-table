CLASS z_internaltable_110 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS z_internaltable_110 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
   TYPES: BEGIN OF ty_movie,
         movie_id TYPE i,
         movie_name TYPE string,
         seats_available TYPE i,
       END OF ty_movie.

DATA: gt_movies TYPE STANDARD TABLE OF ty_movie,
      gs_movie TYPE ty_movie.

"Movie 1
gs_movie-movie_id = 1.
gs_movie-movie_name = 'Leo'.
gs_movie-seats_available = 50.
APPEND gs_movie TO gt_movies.

"Movie 2
gs_movie-movie_id = 2.
gs_movie-movie_name = 'Jailer'.
gs_movie-seats_available = 30.
APPEND gs_movie TO gt_movies.

"Display Movies
LOOP AT gt_movies INTO gs_movie.
  out->write( gs_movie-movie_id ).
  out->write( gs_movie-movie_name ).
  out->write( gs_movie-seats_available ).
ENDLOOP.

"Search Movie
READ TABLE gt_movies INTO gs_movie WITH KEY movie_id = 1.

IF sy-subrc = 0.
  out->write( |Movie Found: { gs_movie-movie_name }| ).
ELSE.
  out->write( 'Movie Not Found' ).
ENDIF.
  ENDMETHOD.
ENDCLASS.
