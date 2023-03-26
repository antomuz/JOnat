       GESTION_EPREUVES.
       DISPLAY "***********************************************"
       DISPLAY "*          Gestion Epreuve                    *"
       DISPLAY "***********************************************"
       DISPLAY "*   Que voulez vous faire ?                   *"
       DISPLAY "*                                             *"
       DISPLAY "* 1-Visualiser les epreuves                   *"
       DISPLAY "* 2-Ajouter une epreuve                       *"
       DISPLAY "* 3-Supprimer une epreuve                     *"
       DISPLAY "* 4-Visualiser les epreuves passées           *"
       DISPLAY "* 5-Visualiser les epreuves futures           *"
       DISPLAY "* 6-Inserer resultat d une epreuve            *"
       DISPLAY "* 7-Quitter                                   *"
       DISPLAY "*                                             *"
       PERFORM WITH TEST AFTER UNTIL Wchoix < 8 AND Wchoix > 0
        DISPLAY "* Saisir le nombre :                          *"
        ACCEPT Wchoix2
        DISPLAY "*                                             *"
       END-PERFORM
       DISPLAY "***********************************************"
       IF Wchoix2 = 1 THEN
              PERFORM LIST_EPREUVE
       ELSE IF Wchoix2 = 2 THEN
              PERFORM ADD_EPREUVE
       ELSE IF Wchoix2 = 3 THEN
              PERFORM DEL_EPREUVE
       ELSE IF Wchoix2 = 4 THEN
              PERFORM EPREUVES_PASSEE
       ELSE IF Wchoix2 = 5 THEN
              PERFORM EPREUVES_FUTURES
       ELSE IF Wchoix2 = 6 THEN
              PERFORM UPDATE_EPREUVE
       ELSE IF Wchoix2 = 7 THEN
              MOVE -1 TO Wchoix2
       END-IF.

       GESTION_ATHLETES.
       DISPLAY "***********************************************"
       DISPLAY "*          Gestion Athlete                    *"
       DISPLAY "***********************************************"
       DISPLAY "*   Que voulez vous faire ?                   *"
       DISPLAY "*                                             *"
       DISPLAY "* 1-Visualiser les athletes                   *"
       DISPLAY "* 2-Ajouter un athlete                        *"
       DISPLAY "* 3-Supprimer un athlete                      *"
       DISPLAY "* 4-Quitter                                   *"
       DISPLAY "*                                             *"
       PERFORM WITH TEST AFTER UNTIL Wchoix < 5 AND Wchoix > 0
        DISPLAY "* Saisir le nombre :                          *"
        ACCEPT Wchoix2
        DISPLAY "*                                             *"
       END-PERFORM
       DISPLAY "***********************************************"
       IF Wchoix2 = 1 THEN
              PERFORM LIST_ATHLETES
       ELSE IF Wchoix2 = 2 THEN
              PERFORM ADD_ATHLETE
       ELSE IF Wchoix2 = 3 THEN
              PERFORM DEL_ATH
       ELSE IF Wchoix2 = 4 THEN
              MOVE -1 TO Wchoix2
       END-IF.

       GESTION_PARTICIPATIONS.
       DISPLAY "***********************************************"
       DISPLAY "*         Gestion Participation               *"
       DISPLAY "***********************************************"
       DISPLAY "*   Que voulez vous faire ?                   *"
       DISPLAY "*                                             *"
       DISPLAY "* 1-Visualiser les participations             *"
       DISPLAY "* 2-Ajouter une participation                 *"
       DISPLAY "* 3-Supprimer une participation               *"
       DISPLAY "* 4-Visualiser les participations dune epreuve*"
       DISPLAY "* 5-Visualiser les scores d'une épreuve       *"
       DISPLAY "* 6-Quitter                                   *"
       DISPLAY "*                                             *"
       PERFORM WITH TEST AFTER UNTIL Wchoix < 7 AND Wchoix > 0
        DISPLAY "* Saisir le nombre :                          *"
        ACCEPT Wchoix2
        DISPLAY "*                                             *"
       END-PERFORM
       DISPLAY "***********************************************"
       IF Wchoix2 = 1 THEN
              PERFORM AFFICHE_TOUT_PARTICIPATION
       ELSE IF Wchoix2 = 2 THEN
              PERFORM ADD_PARTICIPATION
       ELSE IF Wchoix2 = 3 THEN
              PERFORM DEL_PARTICIPATION
       ELSE IF Wchoix2 = 4 THEN
              PERFORM AFFI_PARTICIPATIONS_epreuve
       ELSE IF Wchoix2 = 5 THEN
              PERFORM AFFICHE_SCORE_EPREUVE
       ELSE IF Wchoix2 = 6 THEN
              MOVE -1 TO Wchoix2
       END-IF.
