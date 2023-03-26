       ModifierMDP.
       OPEN I-O fathletes
       PERFORM WITH TEST AFTER UNTIL Wchoix = 1 OR Wchoix = 0
              DISPLAY "Voulez vous modifier votre mot de passe"
              ACCEPT Wchoix
       END-PERFORM
       IF Wchoix = 1
              MOVE WidUser TO fa_numA
              READ fathletes
                     INVALID KEY DISPLAY "L'id n'existe pas"
                     NOT INVALID KEY DISPLAY "Saisir nouveau mdp"
                                     ACCEPT fa_mdp
                                     WRITE tamp_fepreuve
                                     END-WRITE
                                     DISPLAY cr_fep
                                         IF cr_fep = 00 THEN
                                      DISPLAY  "mdp bien enregistré"
                                     END-IF
                     END-READ
       CLOSE fathletes
       END-IF.
