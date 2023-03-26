       DEL_EPREUVE.
       OPEN I-O fepreuves
       ACCEPT fe_numE

       DELETE fepreuves RECORD
              INVALID KEY DISPLAY 'epreuve existe pas'
              NOT INVALID KEY DISPLAY 'epreuve supprimee'
       END-DELETE

       CLOSE fepreuves.

       AFFICHE_SCORE_EPREUVE.
       open input fepreuves
       display "indiquer le numero de lepreuve a afficher"
       perform EPREUVES_PASSEE

       accept Wchoix
       MOVE 0 tO Wfin

       MOVE Wchoix TO fp_numE
       START fparticipations, KEY IS = fp_numE
       INVALID KEY display "erreur sur lepreuve"
       NOT INVALID KEY
           PERFORM WITH TEST AFTER UNTIL Wfin = 1
               READ fparticipations NEXT
               AT END MOVE 1 TO Wfin
               NOT AT END
                   MOVE    fp_numA TO fa_numA
                   READ    fathletes
                   INVALID KEY display "erreur sur lathlete"
                   NOT INVALID KEY
                       display "classement - " fp_classement
                       display "nom - " fa_nom
                       display "prenom - " fa_prenom
                       display "temps - " fc_temps
                   END-READ
               end-read
           end-perform
       end-start
       close fepreuves.

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
          DISPLAY "Il existe deja une epreuve avec le meme id"
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
                     DISPLAY  "epreuve bien enregistré"
              END-IF
       END-IF
       Close fepreuves.

       EPREUVES_FUTURES.
       OPEN INPUT fepreuves
       MOVE 0 TO Wfin
       MOVE FUNCTION CURRENT-DATE TO WS-TEMP-DATE-TIME
       DISPLAY "-----------------------"
       DISPLAY "   EPREUVES FUTURES    "
       DISPLAY "-----------------------"

       PERFORM WITH TEST AFTER UNTIL Wfin=1
              READ fepreuves
              AT END        MOVE 1 TO Wfin
              NOT AT END    IF WS-TEMP-DATE-TIME > fe_datetime then

                                    DISPLAY fe_numE " - " fe_distance
                                    " " fe_type " " fe_genre " date : "
                                    fe_DAY "/" fe_MONTH "/" fe_YEAR
              END-READ
       END-PERFORM
       CLOSE fepreuves.

       EPREUVES_PASSEE.
       OPEN INPUT fepreuves
       MOVE 0 TO Wfin
       MOVE FUNCTION CURRENT-DATE TO WS-TEMP-DATE-TIME

       PERFORM WITH TEST AFTER UNTIL Wfin=1
              READ fepreuves
              AT END        MOVE 1 TO Wfin
              NOT AT END    IF WS-TEMP-DATE-TIME < fe_datetime then
                                    DISPLAY fe_numE " - " fe_distance
                                    " " fe_type " " fe_genre
              END-READ
       END-PERFORM
       CLOSE fepreuves.

       LIST_EPREUVE.
       OPEN INPUT fepreuves
       MOVE 0 TO Wfin
       PERFORM WITH TEST AFTER UNTIL Wfin=1
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
