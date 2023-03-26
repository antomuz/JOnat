       IDENTIFICATION DIVISION.
       PROGRAM-ID. JO_natation.

       ENVIRONMENT  DIVISION.  
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.  
              select fepreuves assign to "epreuves.dat"
              organization indexed
              access mode is dynamic
              record key is fe_numE
              alternate record key is fe_type WITH DUPLICATES
              alternate record key is fe_date WITH DUPLICATES
              file status is cr_fep.
       
              select fathletes assign to "athletes.dat"
              organization indexed
              access mode is dynamic
              record key is fa_numA
              file status is cr_fath.
              
              select fparticipations assign to "participations.dat"
              organization indexed
              access mode is dynamic
              record key is fp_cle
              alternate record key is fp_numE WITH DUPLICATES
              alternate record key is fp_numA WITH DUPLICATES
              file status is cr_fparti.
        
              select farch assign to "archive.dat"
              organization sequential
              access mode is sequential
              file status is cr_farch.
       
       DATA DIVISION.
       FILE SECTION.
       FD fathletes.
              01 tamp_fathletes.
                     02 fa_numA PIC 9(2).
                     02 fa_nom PIC A(20).
                     02 fa_prenom PIC A(20).
                     02 fa_age PIC 9(2).
                     02 fa_pays PIC A(20).
                     02 fa_genre PIC A(5).
                     02 fa_mdp PIC X(20).
       FD fepreuves.
              01 tamp_fepreuve.
                     02 fe_numE PIC 9(2).
                     02 fe_type PIC A(20).
                     02 fe_distance PIC 9(4).
                     02 fe_genre PIC A(1).
                     02 fe_datetime.
                            03 fe_date.              
                                   04 fe_YEAR  PIC  9(4). 
                                   04 fe_MONTH PIC  9(2).
                                   04 fe_DAY   PIC  9(2).
                            03 fe_time.              
                                   04 fe_HOUR  PIC  9(2).
                                   04 fe_MIN   PIC  9(2).
                     02 fe_lieu PIC A(20).
                     02 fe_nbParticipant PIC A(30).
       FD fparticipations.
              01 tamp_fparticipation.
                     02 fp_cle.
                            03 fp_numA PIC 9(2).
                            03 fp_numE PIC 9(2).
                     02 fp_classement PIC 9(2).
                     02 fc_temps PIC 9(5).
       FD farch.
              01 tamp_farch.
                     02 fa_annee PIC 9(4).
                     02 fa_type PIC A(20).
                     02 fa_disatnce PIC 9(4).
                     02 fa_genre PIC A(1).
                     02 fa_prenom_or PIC A(20).
                     02 fa_nom_or PIC A(20).
                     02 fa_temps_or PIC 9(5).
                     02 fa_prenom_argent PIC A(20).
                     02 fa_nom_argent PIC A(20).
                     02 fa_temps_argent PIC 9(5).
                     02 fa_prenom_bronze PIC A(20).
                     02 fa_nom_bronze PIC A(20).
                     02 fa_temps_bronze PIC 9(5).
                               
       WORKING-STORAGE SECTION.
       77 cr_fep PIC 9(2).
       77 cr_fath PIC 9(2).
       77 cr_farch PIC 9(2).
       77 cr_fparti PIC 9(2).
       77 WIdE PIC 9(2).
       77 Wfin PIC 9(1).
       77 Wchoix2 PIC 9.
       77 Wtrouve PIC 9.
       77 WIdUser PIC 9.
       77 WidUtilisateurConnecte PIC 9(10).
       77 WLogin PIC X(20).
       77 Wmdp  PIC X(20).
       77 repUser PIC 9.
       77 current_athlete PIC 9(2).
       77 nb_medaille PIC 9(3).
       01 WS-TEMP-DT.   
              05 WS-TEMP-DATE-TIME.            
                     10 WS-TEMP-DATE.              
                            15 WS-TEMP-YEAR  PIC  9(4). 
                            15 WS-TEMP-MONTH PIC  9(2).
                            15 WS-TEMP-DAY   PIC  9(2).
                     10 WS-TEMP-TIME.              
                            15 WS-TEMP-HOUR  PIC  9(2).
                            15 WS-TEMP-MIN   PIC  9(2).

       01 WS-FORMATTED-DT.   
              05 WS-FORMATTED-DATE-TIME.               
                     15 WS-FORMATTED-DAY   PIC  9(2).  
                     15 FILLER             PIC X VALUE '-'.
                     15 WS-FORMATTED-MONTH PIC  9(2).
                     15 FILLER             PIC X VALUE '-'.        
                     15 WS-FORMATTED-YEAR  PIC  9(4). 
                     15 FILLER             PIC X VALUE ' '.           
                     15 WS-FORMATTED-HOUR  PIC  9(2).
                     15 FILLER             PIC X VALUE 'h'.
                     15 WS-FORMATTED-MIN   PIC  9(2).
       PROCEDURE DIVISION.
       
       OPEN I-O fathletes
       IF cr_fath=35 THEN
              OPEN OUTPUT fathletes
       END-IF
       CLOSE fathletes
       
       OPEN I-O fepreuves
       IF cr_fep=35 THEN
              OPEN OUTPUT fepreuves
       END-IF
       CLOSE fepreuves
       
       OPEN I-O fparticipations
       IF cr_fparti=35 THEN
              OPEN OUTPUT fparticipations
       END-IF
       CLOSE fparticipations
       
       OPEN I-O farch
       IF cr_farch=35 THEN
              OPEN OUTPUT farch
       END-IF
       CLOSE farch
       
       MOVE FUNCTION CURRENT-DATE TO WS-TEMP-DATE-TIME
       MOVE WS-TEMP-YEAR  TO WS-FORMATTED-YEAR
       MOVE WS-TEMP-MONTH TO WS-FORMATTED-MONTH
       MOVE WS-TEMP-DAY   TO WS-FORMATTED-DAY
       MOVE WS-TEMP-HOUR  TO WS-FORMATTED-HOUR
       MOVE WS-TEMP-MIN   TO WS-FORMATTED-MIN
       
       MOVE 0 TO current_athlete
       
       
       
       PERFORM AFFI_PART_athl
       
       STOP RUN.
       COPY "participation.cbl".
       COPY "athlete.cbl".
       COPY "epreuve.cbl".
       
       COPY "participation.cpy".
       
