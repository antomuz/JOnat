       AFFI_PART_athl.
       OPEN INPUT fparticipations
       OPEN INPUT fepreuves
       MOVE current_athlete TO fp_numA
       MOVE 0 TO Wfin
       START fparticipations, KEY IS = fp_numA
              INVALID KEY DISPLAY "Erreur sur la cle (Participations)"
              NOT INVALID KEY
              PERFORM WITH TEST AFTER UNTIL Wfin=1
                     READ fparticipations NEXT
                     AT END MOVE 1 TO Wfin
                     NOT AT END
                            MOVE fp_numE TO fe_numE
                            READ fepreuves
                                   INVALID KEY
                                          DISPLAY
                                          "Erreur sur la cle (Epreuves)"
                                   NOT INVALID KEY
                                          DISPLAY
                                          "Numéro de l epreuve : "
                                          fe_numE
                                          DISPLAY
                                          "Type : "
                                          fe_type
                                          DISPLAY
                                          "Distance : "
                                          fe_distance " m"
                                          DISPLAY
                                          "Genre : "
                                          fe_genre
                                          DISPLAY
                                          "Date : "
                                          fe_date
                                          DISPLAY
                                          "Lieu : "
                                          fe_lieu
                                          DISPLAY
                                          "Nb max de participants : "
                                          fe_nbParticipant
                                          DISPLAY " "
                            END-READ
                     END-READ
              END-PERFORM
       END-START
       CLOSE fepreuves
       CLOSE fparticipations.


       AFFI_PARTICIPATIONS_epreuve.
       OPEN INPUT fparticipations
       OPEN INPUT fathletes
       MOVE WIdE TO fp_numE
       MOVE 0 TO Wfin
       START fparticipations, KEY IS = fp_numE
              INVALID KEY DISPLAY "Erreur sur la cle (Epreuves)"
              NOT INVALID KEY
              PERFORM WITH TEST AFTER UNTIL Wfin=1
                     READ fparticipations NEXT
                     AT END MOVE 1 TO Wfin
                     NOT AT END
                            MOVE fp_numA TO fa_numA
                            READ fathletes
                                   INVALID KEY
                                          DISPLAY
                                          "Erreur sur la cle (Athletes)"
                                   NOT INVALID KEY
                                          DISPLAY
                                          "Numéro de l athlete : "
                                          fa_numA
                                          DISPLAY
                                          "Nom : "
                                          fa_nom
                                          DISPLAY
                                          "Prenom : "
                                          fa_prenom
                                          DISPLAY
                                          "Age : "
                                          fa_age " ans"
                                          DISPLAY
                                          "Pays : "
                                          fa_pays
                                          DISPLAY
                                          "Genre : "
                                          fa_genre
                                          DISPLAY " "
                            END-READ
                     END-READ
              END-PERFORM
       END-START
       CLOSE fathletes
       CLOSE fparticipations.






       DEL_PARTICIPATION.
       OPEN I-O fparticipations
       ACCEPT fp_numA
       ACCEPT fp_numE

       DELETE fparticipations RECORD
              INVALID KEY DISPLAY "La participation n existe pas"
              NOT INVALID KEY DISPLAY "Participation supprimee"
       END-DELETE

       CLOSE fparticipations.

       AFFICHE_SCORE.
       OPEN INPUT fathletes
       DISPLAY "Veuillez choisir une epreuve (indiquer le numero)"
       PERFORM EPREUVES_FUTURES

       ACCEPT fe_numE
       MOVE 0 TO Wfin
       START fparticipations, KEY IS = fp_numE
              INVALID KEY DISPLAY "Erreur sur la clé (Épreuves)"
              NOT INVALID KEY
              PERFORM WITH TEST AFTER UNTIL Wfin=1
                     READ fparticipations NEXT
                     AT END MOVE 1 TO Wfin
                     NOT AT END
                            MOVE fp_numE TO fe_numE
                            READ fepreuves
                                   INVALID KEY
                                          DISPLAY
                                          "Erreur sur la cle (Athletes)"
                                   NOT INVALID KEY
                                          DISPLAY fp_classement " - "
                                          fa_nom " - "
                                          fa_prenom " : temps : "
                                          fc_temps
                            END-READ
                     END-READ
              END-PERFORM
       END-START
       CLOSE fathletes
       CLOSE fparticipations.



       ADD_PARTICIPATION.
       OPEN I-O fparticipations
       MOVE 0 TO Wfin

       DISPLAY "---------------------------------------"
       DISPLAY "            AJOUT PARTICIPATION  "
       DISPLAY "---------------------------------------"

       PERFORM WITH TEST AFTER UNTIL repUser=0
               PERFORM WITH TEST AFTER UNTIL Wfin=1
                      DISPLAY "----------------------------------"
                      DISPLAY
                      "Veuillez saisir l ID de l athlete participant"
                      ACCEPT fp_numA
                      DISPLAY "Veuillez saisir l ID de l epreuve"
                      ACCEPT fp_numE
                      DISPLAY
                      "Veuillez saisir le classement (s'il y en a)"
                      ACCEPT fp_classement
                      DISPLAY
                      "Veuillez saisir le temps realise (s'il y en a)"
                      ACCEPT fc_temps
                      WRITE tamp_fparticipation
                             INVALID KEY
                                    DISPLAY
                                    "Cette participation existe deja"
                             NOT INVALID KEY
                                    DISPLAY "Participation ajoutee"
                      END-WRITE

                     PERFORM WITH TEST AFTER UNTIL Wfin>0
                     DISPLAY "Souhaitez-vous ajouter une nouvelle fois?"
                     DISPLAY "1-Oui 0-Non"
                     ACCEPT repUser


                     IF repUser=1 OR repUser=0 THEN
                            MOVE 1 TO Wfin
                     END-IF
                     END-PERFORM

               END-PERFORM
       END-PERFORM
       CLOSE fparticipations

       OPEN I-O fparticipations
       Close fparticipations.





       VISU_MEDAILLES.
       OPEN INPUT fparticipations
       MOVE 0 TO nb_medaille
       MOVE current_athlete TO fp_numA
       START fparticipations, KEY IS = fp_numA
              INVALID KEY DISPLAY "Erreur sur la cle (Athlete)"
              NOT INVALID KEY
              PERFORM WITH TEST AFTER UNTIL Wfin=1
                     READ fparticipations NEXT
                     AT END MOVE 1 TO Wfin
                     NOT AT END
                            IF fp_classement < 4 THEN
                                   ADD 1 TO nb_medaille
                            END-IF
                     END-READ
              END-PERFORM
       END-START
       CLOSE fparticipations.

       AFFICHE_TOUT_PARTICIPATION.
       OPEN INPUT fparticipations
       MOVE 1 TO Wfin

       DISPLAY "------------------------------"
       DISPLAY "   LISTE DES PARTICIPATIONS"
       DISPLAY "------------------------------"
       PERFORM WITH TEST AFTER UNTIL Wfin=0
               DISPLAY "------------------------------"
               READ fparticipations
               AT END MOVE 0 TO Wfin
               NOT AT END
                       DISPLAY "iD-part : " fp_cle
                       DISPLAY "iD-eprv : " fp_numE
                       DISPLAY "iD-athlt : " fp_numA
                       DISPLAY "classement : " fp_classement
                       DISPLAY "temps : " fc_temps
               END-READ
       END-PERFORM

       CLOSE fparticipations.
