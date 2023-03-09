       AFFI_INFOS_ATHLETE.
       OPEN INPUT fathletes
       MOVE current_athlete TO fa_numA
       READ fathletes
              INVALID KEY DISPLAY "Erreur sur la clé (Athlètes)"
              NOT INVALID KEY
                     DISPLAY "Numéro de l'athlète : " fa_numA
                     DISPLAY "Nom : " fa_nom
                     DISPLAY "Prénom : " fa_prenom
                     DISPLAY "Âge: " fa_age " ans"
                     DISPLAY "Pays : " fa_pays
                     DISPLAY "Genre : " fa_genre
                     DISPLAY " "
       END-READ
       CLOSE fathletes.
       
