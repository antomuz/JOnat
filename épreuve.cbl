       AFFI_EPREUVES.
       OPEN INPUT fepreuves
       MOVE 0 TO Wfin
       MOVE 0 TO Wtrouve
       PERFORM WITH TEST AFTER UNTIL Wfin=1 OR Wtrouve=1
              READ fepreuves
              AT END        MOVE 1 TO Wfin
              NOT AT END    DISPLAY "----------------------------------"
                            DISPLAY "ID           : " WITH NO ADVANCING
                            DISPLAY fe_numE 
                            DISPLAY "type d'épreuve " WITH NO ADVANCING
                            DISPLAY fe_type
                            DISPLAY "Genre        : " WITH NO ADVANCING
                            DISPLAY fe_genre
                            DISPLAY "Distance     : " WITH NO ADVANCING
                            DISPLAY fe_distance
                            DISPLAY "Date         : " WITH NO ADVANCING
                            DISPLAY fe_datetime
                            DISPLAY "Lieu         : " WITH NO ADVANCING
                            DISPLAY fe_lieu
                            DISPLAY "Nb_participant " WITH NO ADVANCING
                            DISPLAY fe_nbParticipant
              END-READ
       END-PERFORM
       CLOSE fepreuves.
       
       ADD_EPREUVE.
       OPEN INPUT fepreuves
       DISPLAY "Veuillez saisir l'id de la competition"
       ACCEPT WIdE
       MOVE 0 TO Wfin
       MOVE 0 TO Wtrouve
       PERFORM WITH TEST AFTER UNTIL Wfin=1 OR Wtrouve=1
              READ fepreuves
              AT END        MOVE 1 TO Wfin
              NOT AT END    IF WIdE = fe_numE THEN
                                   MOVE 1 TO Wtrouve
                            END-IF
              END-READ
       END-PERFORM
       CLOSE fepreuves
       OPEN I-O fepreuves
       IF Wtrouve = 1 THEN
          DISPLAY "Il existe deja une épreuve avec le meme id"
       ELSE
              MOVE WIdE TO fe_numE
              DISPLAY "Saisir le type de l'epreuve"
              ACCEPT fe_type
              DISPLAY "Saisir le genre"
              ACCEPT fe_genre
              DISPLAY "Saisir la distance" 
              ACCEPT fe_distance
              DISPLAY "Saisir l'année" 
              ACCEPT fe_YEAR
              DISPLAY "Saisir le mois" 
              ACCEPT fe_MONTH
              DISPLAY "Saisir le jour" 
              ACCEPT fe_DAY
              DISPLAY "Saisir l'heure" 
              ACCEPT fe_HOUR
              DISPLAY "Saisir les minutes" 
              ACCEPT fe_MIN
              DISPLAY "Saisir le lieu" 
              ACCEPT fe_lieu
              DISPLAY "Saisir le nb de participant" 
              ACCEPT fe_nbParticipant
              WRITE tamp_fepreuve
              END-WRITE
              DISPLAY cr_fep
              IF cr_fep = 00 THEN 
                     DISPLAY  "épreuve bien enregistré"
              END-IF
       END-IF
       Close fepreuves.
       
       DEL_EPREUVE.
       OPEN I-O fepreuves
       ACCEPT fe_numE
       
       DELETE fepreuves RECORD
              INVALID KEY DISPLAY 'epreuve existe pas'
              NOT INVALID KEY DISPLAY 'epreuve supprimee'
       END-DELETE
       
       CLOSE fepreuves.
       
       
