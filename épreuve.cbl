       AFFI_EPREUVES.
       OPEN INPUT fepreuves
       MOVE 0 TO Wfin
       MOVE 0 TO Wtrouve
       PERFORM WITH TEST AFTER UNTIL Wfin=1 OR Wtrouve=1
              READ fepreuves
              AT END        MOVE 1 TO Wfin
              NOT AT END    DISPLAY "----------------------------------"
                            DISPLAY "ID            : " WITH NO ADVANCING
                            DISPLAY fe_numE 
                            DISPLAY "Type d'épreuve  " WITH NO ADVANCING
                            DISPLAY fe_type
                            DISPLAY "Distance      : " WITH NO ADVANCING
                            DISPLAY fe_distance
                            DISPLAY "Genre         : " WITH NO ADVANCING
                            DISPLAY fe_genre
                            DISPLAY "Date          : " WITH NO ADVANCING
                            DISPLAY fe_date
                            DISPLAY "Lieu          : " WITH NO ADVANCING
                            DISPLAY fe_lieu
                            DISPLAY "Nb participants " WITH NO ADVANCING
                            DISPLAY fe_nbParticipant
              END-READ
       END-PERFORM
       CLOSE fepreuves.
       

       ADD_EPREUVE.
       OPEN INPUT fepreuves
       DISPLAY "Veuillez saisir l'ID de la compétition"
       ACCEPT WIdE
       MOVE 0 TO Wfin
       MOVE 0 TO Wtrouve
       PERFORM WITH TEST AFTER UNTIL Wfin=1 OR Wtrouve=1
              READ fco
              AT END        MOVE 1 TO Wfin
              NOT AT END    IF WIdE = fe_numE THEN
                                   MOVE 1 TO Wtrouve
                            END-IF
              END-READ
       END-PERFORM
       CLOSE fepreuves
       OPEN I-O fepreuves
       IF Wtrouve = 1 THEN
          DISPLAY "Il existe déjà une épreuve avec le même ID"
       ELSE
              MOVE WIdE TO fe_numE
              DISPLAY "Saisir le type de l'épreuve"
              ACCEPT fe_type
              DISPLAY "Saisir la distance" 
              ACCEPT fe_distance
              DISPLAY "Saisir le genre"
              ACCEPT fe_genre
              DISPLAY "Saisir la date" 
              ACCEPT fe_date
              DISPLAY "Saisir le lieu" 
              ACCEPT fe_lieu
              DISPLAY "Saisir le nombre de participants" 
              ACCEPT fe_nbParticipant
              WRITE tamp_fe
              END-WRITE
              DISPLAY cr_fe
              IF cr_fe = 00 THEN 
                     DISPLAY  "Épreuve bien enregistrée"
              END-IF
       END-IF
       Close fepreuves.
       

       DEL_EPREUVE.
       OPEN I-O fepreuves
       ACCEPT fe_numE
       
       DELETE fepreuves RECORD
              INVALID KEY DISPLAY "L'épreuve n'existe pas"
              NOT INVALID KEY DISPLAY "Épreuve supprimée"
       END-DELETE
       
       CLOSE fepreuves.
       

       EPREUVES_FUTURES.
       OPEN INPUT fepreuves
       MOVE 0 TO Wfin
       MOVE FUNCTION CURRENT-DATE TO WS-TEMP-DATE-TIME

       PERFORM WITH TEST AFTER UNTIL Wfin=1
              READ fepreuves
              AT END        MOVE 1 TO Wfin
              NOT AT END    IF WS-TEMP-DATE-TIME > fe_datetime then 
                                    DISPLAY "- " fe_distance " " 
                                    fe_type " " fe_genre
              END-READ
       END-PERFORM
       CLOSE fepreuves.

