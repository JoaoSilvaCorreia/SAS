PROC IMPORT OUT= WORK.gpa1 
            DATAFILE= "C:\Users\joaov\Google Drive\ECONOMIA - UEL\3ºANO\
ECONOMETRIA\Econometria Wooldridge\dados_Econometria\Data Sets-Excel\gpa
1.xls" 
            DBMS=EXCEL REPLACE;
     RANGE="GPA1$"; 
     GETNAMES=YES;
     MIXED=NO;
     SCANTEXT=YES;
     USEDATE=YES;
     SCANTIME=YES;
RUN;


proc reg data=work.gpa1;
model colGPA = PC  hsGPA ACT;
run;
