       ARCHIVAGE.

       OPEN INPUT fparticipations
       OPEN INPUT fathletes
       OPEN INPUT fepreuves

       MOVE WS-TEMP-YEAR TO fa_annee

       MOVE 0 TO Wfin
       MOVE 0 TO Wfin2
       PERFORM    WITH TEST AFTER    UNTIL Wfin = 1
       READ    fepreuves NEXT
       AT END MOVE 1 TO Wfin
       NOT AT END

           move fe_genre  TO fa_genre_ath
           move fe_type  TO fa_type
           move fe_distance  TO fa_disatnce

           MOVE    fe_numE TO fp_numE
           START fparticipations, KEY IS = fp_numE
           INVALID    KEY    display "erreur sur lepreuve"
           NOT INVALID KEY

           PERFORM WITH TEST AFTER UNTIL Wfin2 = 1
           READ    fparticipations    NEXT
           AT END MOVE 1 TO Wfin2
           NOT AT END
               IF fp_classement = 1 then
                   MOVE    fp_numA TO fa_numA
                   READ    fathletes
                   INVALID KEY display "erreur sur lathlete"
                   NOT INVALID KEY
                       MOVE fa_prenom TO fa_prenom_or
                       MOVE fa_nom TO fa_nom_or
                       MOVE fc_temps TO fa_temps_or
                   END-READ
               ELSE
                   IF fp_classement = 2 then
                          MOVE    fp_numA TO fa_numA
                          READ    fathletes
                          INVALID KEY display "erreur sur lathlete"
                          NOT INVALID KEY
                              MOVE fa_prenom TO fa_prenom_argent
                              MOVE fa_nom TO fa_nom_argent
                              MOVE fc_temps TO fa_temps_argent
                          END-READ
                   ELSE
                       IF fp_classement = 3 then

                              MOVE    fp_numA TO fa_numA
                              READ    fathletes
                              INVALID KEY display "erreur sur lathlete"
                              NOT INVALID KEY
                                  MOVE fa_prenom TO fa_prenom_bronze
                                  MOVE fa_nom TO fa_nom_bronze
                                  MOVE fc_temps TO fa_temps_bronze
                              END-READ
                       end-if
                   end-if
               end-if


           END-READ
           END-PERFORM
           END-START

       END-READ
       END-PERFORM.
