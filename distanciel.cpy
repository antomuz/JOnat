       distanciel.
       OPEN INPUT fepreuves
       OPEN INPUT fathletes
       OPEN INPUT fparticipations

       MOVE 1 TO Wfin
       MOVE 1 TO Wfin2

       DISPLAY "Pour quel pays souhaitez-vous afficher les medailles"
       ACCEPT choixPays

       PERFORM WITH TEST AFTER UNTIL choixType>0 AND choixType<5
         DISPLAY "Pour quel type d'epreuve ?"
         DISPLAY "1- Brasse"
         DISPLAY "2- Crawl"
         DISPLAY "3- Dos"
         DISPLAY "4- Papillon"

         ACCEPT choixType
       END-PERFORM

       PERFORM WITH TEST AFTER UNTIL choixDistance = 100 OR
       choixDistance = 200
         DISPLAY "Pour quelle distance (en metre)? (Entrez 100 ou 200)"
         ACCEPT choixDistance
       END-PERFORM

       IF choixType = 1 THEN
         MOVE "Brasse" TO chaineType
       ELSE IF choixType = 2 THEN
             MOVE "Crawl" TO chaineType
             ELSE IF choixType = 3 THEN
                  MOVE "Dos" TO chaineType
                  ELSE IF choixType = 4 THEN
                     MOVE "Papillon" TO chaineType
                  END-IF
             END-IF
        END-IF
        END-IF

        DISPLAY "Affichage des medaille de l'epreuve "WITH NO ADVANCING
        DISPLAY chaineType "-" choixDistance "m " WITH NO ADVANCING
        DISPLAY " du pays " choixPays " : "

        MOVE chaineType TO fe_type


        START fepreuves, KEY IS=fe_type
        INVALID KEY DISPLAY "Aucune epreuve avec ce type"
        NOT INVALID KEY

         PERFORM WITH TEST AFTER UNTIL Wfin =0
          READ fepreuves NEXT
          AT END Move 0 TO Wfin
          NOT AT END

               IF fe_type = chaineType THEN
                IF fe_distance = choixDistance THEN
                 MOVE fe_numE TO fp_numE
                 MOVE 1 TO Wfin2
                 START fparticipations, KEY IS= fp_numE
                 INVALID KEY DISPLAY "Aucun Enregistrement"
                 NOT INVALID KEY
                  PERFORM WITH TEST AFTER UNTIL Wfin2 = 0

                   READ fparticipations NEXT
                   AT END MOVE 0 TO Wfin2
                   NOT AT END

                    IF fp_numE=fe_numE THEN

                     IF fp_classement=1 OR fp_classement=2 OR
                     fp_classement=3 THEN
                      MOVE fp_numA TO fa_numA
                      READ fathletes
                      INVALID KEY DISPLAY "Aucun enregistrement"
                      NOT INVALID KEY

                       IF fa_pays= choixPays THEN
                        DISPLAY "-----------------------------------"
                        DISPLAY "Athlete : " fa_nom " " fa_prenom
                        DISPLAY "classement : " fp_classement
                       END-IF
                      END-READ
                     END-IF
                    ELSE
                      MOVE 0 TO Wfin2
                    END-IF
                   END-READ
                  END-PERFORM
                 END-START
                END-IF
               ELSE

                MOVE 0 TO Wfin
               END-IF
          END-READ
         END-PERFORM
        END-START


       CLOSE fathletes
       CLOSE fparticipations
       CLOSE fepreuves.
