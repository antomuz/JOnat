       CONNEXION_ADMIN.
       MOVE 0 TO Wfin
       PERFORM WITH TEST AFTER UNTIL WFin = 1
        DISPLAY "Saisir le login de l'admin"
        ACCEPT Wlogin
        DISPLAY "Saisir le mdp"
        ACCEPT Wmdp
        IF Wlogin = "admin" AND Wmdp = "root"
     *  MOVE 3 to WidUtilisateurConnecte
        END-IF
       END-PERFORM
       .



       CONNEXION_ATHL.
       MOVE 0 TO Wfin
       PERFORM WITH TEST AFTER UNTIL WFin = 1
        DISPLAY "Saisir l'identifiant athlete"
        ACCEPT WidUser
        DISPLAY "Saisir le mdp"
        ACCEPT Wmdp
        MOVE WidUser TO fa_numA
              READ fathletes
                     INVALID KEY DISPLAY "L'id n'existe pas"
                                 MOVE 0 to WidUser
                     NOT INVALID KEY
                           MOVE 2 to WidUtilisateurConnecte
       END-PERFORM
       .
