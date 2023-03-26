       CONNEXION_ADMIN.
       MOVE 0 TO Wfin
       PERFORM WITH TEST AFTER UNTIL WFin = 1
        DISPLAY "Saisir le login de l'admin"
        ACCEPT Wlogin
        DISPLAY "Saisir le mdp"
        ACCEPT Wmdp
        IF Wlogin = "admin" AND Wmdp = "root"
     *  indiquer comme connecté  
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
                     INVALID KEY "L'id n'existe pas" 
                     NOT INVALID KEY 
                           indiquer comme connecté  
       END-PERFORM
       .
