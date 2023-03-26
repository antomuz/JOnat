       maisSiLa.
       OPEN I-O fepreuves
       OPEN I-O fathletes
       OPEN I-O fparticipations

       MOVE 1 TO Wfin
       DISPLAY "Pour quel pays souhaitez-vous afficher les medailes"
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
        DISPLAY fe_type

        START fepreuves, KEY IS=fe_type
        INVALID KEY DISPLAY "Aucun enregistrement pour ce type"
        NOT INVALID KEY
         DISPLAY"----------------Enreg fe_type existe"
         IF cr_fep=35 THEN
          DISPLAY"----------------cr_fep=OK"
          READ fepreuves NEXT
          AT END DISPLAY "AUCUN ENREGISTREMENT"
          NOT AT END

           PERFORM WITH TEST AFTER UNTIL Wfin=0
            READ fepreuves NEXT
            AT END MOVE 0 TO Wfin
            NOT AT END
             IF fe_distance = choixDistance THEN
              DISPLAY"----------------choix-distance bon"
              MOVE fe_numE TO fp_numE
              READ fparticipations
              INVALID KEY DISPLAY "Pas d'enregistrement"
              NOT INVALID KEY
               IF cr_fparti=35 THEN
                DISPLAY"----------------Enreg fe_numE"
                IF fp_classement=1 OR fp_classement=2 or fp_classement=3
                THEN
                DISPLAY"----------------classement trouve"
                 MOVE fp_numA TO fa_numA
                 READ fathletes
                 INVALID KEY DISPLAY
                 "Aucun enregistrement de cet athlete"
                 NOT INVALID KEY
                  IF cr_fath=35 THEN
                  DISPLAY"----------------classement trouve"
                   IF fa_pays=choixPays THEN
                    DISPLAY"----------------Pays trouvee"
                    DISPLAY "Athlete : " fa_nom " " fa_prenom
                    DISPLAY "Classement : " fp_classement
                   END-IF
                  ELSE
                   DISPLAY "Auncun enregistrement"
                  END-IF
                 END-READ
                ELSE
                 DISPLAY "Auncun enregistrement"
                END-iF
               END-IF
              END-READ
             END-IF
            END-READ
           END-PERFORM


          END-READ
        END-START

       CLOSE fathletes
       CLOSE fparticipations
       CLOSE fepreuves.
