       AFFICH_MENU.
       MOVE 1 TO Wchoix
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
           MOVE 1 TO WidUtilisateurConnecte
         ELSE IF Wchoix = 2 THEN
             DISPLAY "connexion admin"
      *      PERFORM CONNEXION_ATHL
         ELSE IF Wchoix = 3 THEN
             DISPLAY "connexion admin"
      *      PERFORM CONNEXION_ADMIN
         ELSE IF Wchoix = 4 THEN
            MOVE 0 TO Wchoix
         END-IF

        ELSE
         PERFORM WITH TEST AFTER UNTIL Wchoix = 0
          IF WIdUser = 1 THEN
      *    Affichage en tant que spectateur
           DISPLAY "*Bienvenue cher spectateur !                  *"
           DISPLAY "*Que souhaitez-vous faire ?                   *"
           DISPLAY "*                                             *"
           DISPLAY "* 1 - Visualiser les épreuves �  venir         *"
           DISPLAY "* 2 - Visualiser les scores                   *"
           DISPLAY "* 3 - Visualiser classement général des pays  *"
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
      *      PERFORM AFFI_EPREUVE
           ELSE IF Wchoix2 = 2 THEN
             DISPLAY "affi score"
      *      PERFORM AFFI_SCORE
           ELSE IF Wchoix2 = 3 THEN
             DISPLAY "affi classement"
      *      PERFORM AFFI_CLASSEMENT
           ELSE IF Wchoix2 = 4 THEN
             DISPLAY "affi stats"
      *      PERFORM AFFI_STATS
           ELSE IF Wchoix2 = 5 THEN
            MOVE 0 TO Wchoix2

         ELSE IF WidUtilisateurConnecte = 2 THEN
      *     Affichage en tant qu'athlete
           DISPLAY "*A quel menu souhaitez vous accedez ?         *"
           DISPLAY "*                                             *"
           DISPLAY "* 1 - Mes informations                        *"
           DISPLAY "* 2 - Mes épreuves a venir                    *"
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
      *      PERFORM MENU_INFO
           ELSE IF Wchoix2 = 2 THEN
      *      PERFORM EPRE_FUTUR
           ELSE IF Wchoix2 = 3 THEN
      *      PERFORM MESVICTOIRES
           ELSE IF Wchoix2 = 4 THEN
            MOVE 0 TO Wchoix2


         ELSE IF WidUtilisateurConnecte = 3 THEN
      *    Affichage en tant qu'admin
           DISPLAY "*A quel menu souhaitez vous accedez ?         *"
           DISPLAY "*                                             *"
           DISPLAY "* 1 - Gérer les athlètes                      *"
           DISPLAY "* 2 - Gérer les épreuves                      *"
           DISPLAY "* 3 - Gérer les participations                *"
           DISPLAY "* 4 - Deconnexion                             *"
           DISPLAY "*                                             *"
           PERFORM WITH TEST AFTER UNTIL Wchoix2 < 5 AND Wchoix2 > 0
            DISPLAY "* Saisir le nombre :                          *"
             ACCEPT Wchoix2
           END-PERFORM
           DISPLAY "*                                             *"
           DISPLAY "***********************************************"
           IF Wchoix2 = 1 THEN
      *      PERFORM GESTION_ATHLETE
           ELSE IF Wchoix2 = 2 THEN
      *      PERFORM GESTION_EPREUVE
           ELSE IF Wchoix2 = 3 THEN
      *      PERFORM GESTION_PARTICIPATION
           ELSE IF Wchoix2 = 4 THEN
            MOVE 0 TO Wchoix2
           END-IF
          END-IF
         END-IF
        END-PERFORM
       END-PERFORM.
