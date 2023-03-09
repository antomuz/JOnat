       ajoutAthlete.
       
       DISPLAY "-------------------------------"
       DISPLAY "        AJOUT ATHLETES "
       DISPLAY "-------------------------------"
       
       MOVE rep TO 1
       MOVE 0 TO Wfin
       
       OPEN I-O fathletes
       
     
   
                     
       PERFORM WITH TEST AFTER UNTIL tamp__fathlete.fa_numA>0
                
              DISPLAY "Saisissez  l'id de l'athlete : "
              ACCEPT tamp__fathlete.fa_numA
                   
       END-PERFORM
                     
       MOVE val TO fa_numA
       READ fathletes 
       INVALID KEY DISPLAY 
       
       
                     
              
