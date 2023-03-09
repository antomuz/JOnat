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
       
       
       ADD_PARTICIPATION.
       OPEN INPUT fparticipations
       MOVE 0 TO Wfin
       PERFORM WITH TEST AFTER UNTIL Wfin=1
              DISPLAY "----------------------------------"
              DISPLAY "Veuillez saisir l ID de l athlete"
              ACCEPT fp_numA
              DISPLAY "Veuillez saisir l ID de l epreuve"
              ACCEPT fp_numE
              DISPLAY "Veuillez saisir le classement"
              ACCEPT fp_classement
              DISPLAY "Veuillez saisir le temps realise"
              ACCEPT fc_temps
              WRITE tamp_fparticipation
                     INVALID KEY
                            DISPLAY "Cette participation existe deja"
                     NOT INVALID KEY
                            MOVE 1 TO Wfin
                            DISPLAY "Participation ajoutee"
              END-WRITE
       END-PERFORM
       CLOSE fparticipations
       
       OPEN I-O fparticipations
       Close fparticipations.
       
       DEL_PARTICIPATION.
       OPEN I-O fparticipations
       ACCEPT fp_numA
       ACCEPT fe_numE
       
       DELETE fparticipations RECORD
              INVALID KEY DISPLAY "La participation n existe pas"
              NOT INVALID KEY DISPLAY "Participation supprimee"
       END-DELETE
       
       CLOSE fparticipations.
       
