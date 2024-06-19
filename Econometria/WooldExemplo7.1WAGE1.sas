PROC IMPORT OUT= WORK.WAGE1 
            DATAFILE= "C:\Users\joaov\Google Drive\ECONOMIA - UEL\3ºANO\
ECONOMETRIA\Econometria Wooldridge\dados_Econometria\Data Sets-Excel\wag
e1.xls" 
            DBMS=EXCEL REPLACE;
     RANGE="WAGE1$"; 
     GETNAMES=YES;
     MIXED=NO;
     SCANTEXT=YES;
     USEDATE=YES;
     SCANTIME=YES;
RUN;



proc reg data=work.wage1;
	model wage = female educ exper tenure;
run; 
