       AFFICH_MENU.
       MOVE 1 TO Wchoix
       MOVE 0 TO Wchoix2
       MOVE 0 TO WidUtilisateurConnecte
       PERFORM WITH TEST AFTER UNTIL Wchoix = 0
        IF WidUtilisateurConnecte = 0 THEN
         DISPLAY "***********************************************"
         DISPLAY "*                 ACCUEIL                     *"
         DISPLAY "***********************************************"
         DISPLAY "*Bienvenue sur l'application dedie au suivi   *"
         DISPLAY "*des epreuves de natation des Jeux Olympiques!*"
         DISPLAY "*                                             *"
         DISPLAY "*   Pour commencer, qui etes vous ?           *"
         DISPLAY "*                                             *"
         DISPLAY "* 1-Spectateur                                *"
         DISPLAY "* 2-Athlete                                   *"
         DISPLAY "* 3-Administrateur                            *"
         DISPLAY "* 4-Quitter                                   *"
         DISPLAY "*                                             *"
         PERFORM WITH TEST AFTER UNTIL Wchoix < 5 AND Wchoix > 0
          DISPLAY "* Saisir le nombre :                          *"
          ACCEPT Wchoix
          DISPLAY "*                                             *"
         END-PERFORM
         DISPLAY "***********************************************"
         IF Wchoix = 1 THEN
           DISPLAY "connexion spectateur"
           MOVE 1 TO WidUtilisateurConnecte
         ELSE IF Wchoix = 2 THEN
           DISPLAY "connexion athlete"
           PERFORM CONNEXION_ATHL
         ELSE IF Wchoix = 3 THEN
           DISPLAY "connexion admin"
           PERFORM CONNEXION_ADMIN
         ELSE IF Wchoix = 4 THEN
           MOVE 0 TO Wchoix
         END-IF
        END-IF
        ELSE
         PERFORM WITH TEST AFTER UNTIL Wchoix2 = 0
          IF WidUtilisateurConnecte = 1 THEN
      *    Affichage en tant que spectateur
           DISPLAY "*Bienvenue cher spectateur !                  *"
           DISPLAY "*Que souhaitez-vous faire ?                   *"
           DISPLAY "*                                             *"
           DISPLAY "* 1 - Visualiser les epreuves a venir         *"
           DISPLAY "* 2 - Visualiser les scores                   *"
           DISPLAY "* 3 - Visualiser classement general des pays  *"
           DISPLAY "* 4 - Visualiser les statistiques             *"
           DISPLAY "* 5 - Retour                                  *"
           DISPLAY "*                                             *"
           PERFORM WITH TEST AFTER UNTIL Wchoix2 < 6 AND Wchoix2 > 0
            DISPLAY "* Saisir le nombre :                          *"
             ACCEPT Wchoix2
           END-PERFORM
           DISPLAY "*                                             *"
           DISPLAY "***********************************************"
           IF Wchoix2 = 1 THEN
             DISPLAY "affi epreuve"
            PERFORM EPREUVES_FUTURES
           ELSE IF Wchoix2 = 2 THEN
             DISPLAY "affi score"
            PERFORM AFFICHE_SCORE_EPREUVE
           ELSE IF Wchoix2 = 3 THEN
             DISPLAY "affi classement"
            PERFORM CLASSEMENT_PAYS
           ELSE IF Wchoix2 = 4 THEN
             DISPLAY "affi stats"
      *      PERFORM maisSiLa
           ELSE IF Wchoix2 = 5 THEN
            MOVE 0 TO Wchoix2
            MOVE 0 TO WidUtilisateurConnecte
           END-IF
          END-IF
         ELSE IF WidUtilisateurConnecte = 2 THEN
      *     Affichage en tant qu'athlete
           DISPLAY "*A quel menu souhaitez vous accedez ?         *"
           DISPLAY "*                                             *"
           DISPLAY "* 1 - Mes informations                        *"
           DISPLAY "* 2 - Mes epreuves a venir                    *"
           DISPLAY "* 3 - Mes victoires                           *"
           DISPLAY "* 4 - Deconnexion                             *"
           DISPLAY "*                                             *"
           PERFORM WITH TEST AFTER UNTIL Wchoix2 < 5 AND Wchoix2 > 0
            DISPLAY "* Saisir le nombre :                          *"
             ACCEPT Wchoix2
           END-PERFORM
           DISPLAY "*                                             *"
           DISPLAY "***********************************************"
           IF Wchoix2 = 1 THEN
            PERFORM AFFI_INFOS_ATHLETE
           ELSE IF Wchoix2 = 2 THEN
            PERFORM LISTE_EPREUVE_ATHLETE
           ELSE IF Wchoix2 = 3 THEN
            PERFORM VISU_MEDAILLES
           ELSE IF Wchoix2 = 4 THEN
            MOVE 0 TO Wchoix2
            MOVE 0 TO WidUser
            MOVE 0 TO WidUtilisateurConnecte
           END-IF
         END-IF
         ELSE IF WidUtilisateurConnecte = 3 THEN
      *    Affichage en tant qu'admin
           DISPLAY "*A quel menu souhaitez vous accedez ?         *"
           DISPLAY "*                                             *"
           DISPLAY "* 1 - Gerer les athletes                      *"
           DISPLAY "* 2 - Gerer les epreuves                      *"
           DISPLAY "* 3 - Gerer les participations                *"
           DISPLAY "* 4 - Archiver les donnees                    *"
           DISPLAY "* 5 - Deconnexion                             *"
           DISPLAY "*                                             *"
           PERFORM WITH TEST AFTER UNTIL Wchoix2 < 6 AND Wchoix2 > 0
            DISPLAY "* Saisir le nombre :                          *"
             ACCEPT Wchoix2
           END-PERFORM
           DISPLAY "*                                             *"
           DISPLAY "***********************************************"
           IF Wchoix2 = 1 THEN
            PERFORM GESTION_ATHLETES
           ELSE IF Wchoix2 = 2 THEN
            PERFORM GESTION_EPREUVES
           ELSE IF Wchoix2 = 3 THEN
            PERFORM GESTION_PARTICIPATIONS
           ELSE IF Wchoix2 = 4 THEN
            PERFORM ARCHIVAGE
           ELSE IF Wchoix2 = 5 THEN
            MOVE 0 TO Wchoix2
            MOVE 0 TO WidUtilisateurConnecte
           END-IF
          END-IF
         END-IF
        END-PERFORM
       END-PERFORM.
