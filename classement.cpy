
       CLASSEMENT_PAYS.

       Open input fparticipations
       open input fathletes
       MOVE 0 TO Wfin
       move 1 to colonne
       move 1 to fp_classement
       PERFORM WITH TEST AFTER UNTIL Wfin=1
           READ fparticipations KEY IS fp_classement
           AT END          MOVE 1 TO Wfin
           NOT AT END      MOVE 0 TO Wtrouve
                           Move fp_numA to fa_numA
                           READ fathletes
                            INVALID KEY DISPLAY "inexistant"
                            NOT INVALID KEY
                               move 1 to colonne
                               PERFORM WITH TEST AFTER UNTIL i = colonne
                               or Wtrouve = 1
                                   if listPays(i) = fa_pays
                                       MOVE 1 to Wtrouve
                                       ADD 1 TO nbMedPays(i)
                                       ADD 1 TO i
                                   end-if
                               END-PERFORM
                               if Wtrouve = 0
                                   add 1 to colonne
                                   move fa_pays to listPays(colonne)
                                   move 0 to nbMedPays(colonne)
                               end-if
                           END-READ
       end-perform

       PERFORM TEST AFTER VARYING i FROM 1 BY 1 UNTIL i = colonne
           display listPays(i) with no advancing
           display " comporte " with no advancing
           display nbMedPays(i) with no advancing
           display " medailles" with no advancing
       end-perform
       close fparticipations
       close fathletes.
