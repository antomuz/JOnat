       AFFI_INFOS_ATHLETE.
       OPEN INPUT fathletes
       MOVE WIdUser TO fa_numA
       READ fathletes
              INVALID KEY DISPLAY "Erreur sur la clÃ© (Athletes)"
              NOT INVALID KEY
                     DISPLAY "Numero de l'athlete : " fa_numA
                     DISPLAY "Nom : " fa_nom
                     DISPLAY "Prenom : " fa_prenom
                     DISPLAY "Age: " fa_age " ans"
                     DISPLAY "Pays : " fa_pays
                     DISPLAY "Genre : " fa_genre
                     DISPLAY " "
       END-READ
       CLOSE fathletes.


       ADD_ATHLETE.
      *Methode qui permet d'ajouter un athlete
       DISPLAY "---------------------------------------"
       DISPLAY "            AJOUT ATHLETES "
       DISPLAY "---------------------------------------"

       MOVE 1 TO repUser
       MOVE 0 TO Wfin

       OPEN I-O fathletes

       PERFORM WITH TEST AFTER UNTIL repUser=0
              PERFORM WITH TEST AFTER UNTIL Wfin>0

                     DISPLAY "Saisissez  l'id de l'athlete : "
                     ACCEPT fa_numA

                     IF fa_numA > 0 THEN
                            MOVE 1 TO Wfin
                     END-IF

              END-PERFORM

              MOVE 0 TO Wfin


              READ fathletes
              INVALID KEY
                     DISPLAY "Saisissez le nom de l'athlete : "
                     ACCEPT fa_nom

                     DISPLAY "Saisissez le prenom de l'athlete : "
                     ACCEPT fa_prenom

                     PERFORM WITH TEST AFTER UNTIL Wfin>0
                            DISPLAY "Saisissez l'age de l'athlete : "
                            ACCEPT fa_age

                            IF fa_age>12 AND fa_age<70 THEN
                                   MOVE 1 TO Wfin
                            END-IF

                     END-PERFORM

                     MOVE 0 TO Wfin
                     DISPLAY "Saisissez le pays : "
                     ACCEPT fa_pays

                     PERFORM WITH TEST AFTER UNTIL fa_genre='f' OR
                     fa_genre='h'


                            DISPLAY "Saisissez le genre de l'athlÃ¨te "
                            DISPLAY "(entrez f pour Femme"
                            DISPLAY "ou h pour Homme) "

                            ACCEPT fa_genre

                     END-PERFORM

                     MOVE fa_nom TO fa_mdp

                     WRITE tamp_fathletes

                     INVALID KEY DISPLAY "erreur dans l'ajout "
                     NOT INVALID KEY DISPLAY "Ajout effectue "
                     END-WRITE
              NOT INVALID KEY DISPLAY "cet id est deja utilise"
              END-READ



              PERFORM WITH TEST AFTER UNTIL Wfin>0
                     DISPLAY "Souhaitez-vous ajouter une nouvelle fois?"
                     DISPLAY "1-Oui 0-Non"
                     ACCEPT repUser


                     IF repUser=1 OR repUser=0 THEN
                            MOVE 1 TO Wfin
                     END-IF

              END-PERFORM

       END-PERFORM
       CLOSE fathletes.


       LIST_ATHLETES.
      *Methode qui permet d'afficher la listes des athletes enregistrés
       DISPLAY "---------------------------------------"
       DISPLAY "            LISTE DES ATHLETES         "
       DISPLAY "---------------------------------------"


       OPEN I-O fathletes

       Move 1 TO Wfin


       PERFORM WITH TEST AFTER UNTIL Wfin=0
              READ fathletes
              AT END MOVE 0 to Wfin
              NOT AT END
                     DISPLAY "---------------------------------"
                     DISPLAY "ID : " fa_numA
                     DISPLAY "Nom : " fa_nom
                     DISPLAY "Prenom : " fa_prenom
                     DISPLAY "Age : " fa_age
                     DISPLAY "Pays : " fa_pays
              END-READ
       END-PERFORM
       close fathletes.


       LISTE_EPREUVE_ATHLETE.
      *Methode qui permet de faire la liste des épreuves à venir pour un athlete
       DISPLAY "---------------------------------------"
       DISPLAY "            Epreuves A VENIR           "
       DISPLAY "---------------------------------------"


       OPEN I-O fparticipations
       OPEN I-O fepreuves

       MOVE WIdUser TO fp_numA

       START fparticipations, KEY IS=fp_numA
       INVALID KEY DISPLAY "Aucun enregistrement"
       NOT INVALID KEY
          IF cr_fparti=35
             READ fparticipations NEXT
             AT END DISPLAY "Aucun enregistrement"
             NOT AT END
                PERFORM UNTIL Wfin=0
                IF fp_numA = WIdUser
                   IF fp_classement NOT = SPACE AND LOW-VALUE
                      READ fepreuves
                      INVALID KEY
                         DISPLAY"Aucun"
                         DISPLAY" Enrg"
                      NOT INVALID KEY
                         IF cr_fep=35
                            DISPLAY "Epreuve : "
                            DISPLAY fe_type
                            DISPLAY "Distance : "
                            DISPLAY fe_distance
                            DISPLAY "Date : "
                            DISPLAY fe_date
                            DISPLAY "Lieu : "
                            DISPLAY fe_lieu
                         ELSE
                            DISPLAY "Epreuve non retrouvÃ©e"
                         END-IF
                      END-READ
                   END-IF
                ELSE
                   MOVE 1 TO Wfin
                END-IF
                END-PERFORM
             END-READ
          END-IF
       END-START

       CLOSE fparticipations
       CLOSE fepreuves.


       DEL_ATH.
       OPEN I-O fathletes
       DISPLAY "---------------------------------------"
       DISPLAY "            SUPPRESION ATHLETE         "
       DISPLAY "---------------------------------------"


       MOVE 0 TO Wfin

       PERFORM LIST_ATHLETES
       PERFORM UNTIL Wfin=1
               DISPLAY"Quel est l'id de l'athlete "
               PERFORM WITH TEST AFTER UNTIL fa_numA>0
                       DISPLAY"que vous souhaitez supprimer?"
                       ACCEPT fa_numA
               END-PERFORM

               DELETE fathletes RECORD
                       INVALID KEY DISPLAY 'epreuve existe pas'
                       NOT INVALID KEY DISPLAY 'epreuve supprimee'
               END-DELETE

               PERFORM WITH TEST AFTER UNTIL repUser>=0
                  DISPLAY"Souhaitez-vous supprimer un autre athlete ?"
                  DISPLAY"0-Non 1-Oui "
                  ACCEPT repUser
               END-PERFORM

               IF repUser=0 THEN
                       MOVE 1 TO Wfin
               END-IF

       END-PERFORM

       CLOSE fathletes.

       DELE_ATH.
       OPEN I-O fathletes
       DISPLAY"Quel est l'id de l'athlete "
       PERFORM WITH TEST AFTER UNTIL fa_numA>0
               DISPLAY"que vous souhaitez supprimer?"
               ACCEPT fa_numA
       END-PERFORM

       DELETE fathletes RECORD
               INVALID KEY DISPLAY 'epreuve existe pas'
               NOT INVALID KEY DISPLAY 'epreuve supprimee'
       END-DELETE

       CLOSE fathletes.
