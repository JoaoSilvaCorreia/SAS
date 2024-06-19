/*importa txt*/
proc import datafile="/home/joaovitorsilvaco0/Econometria/ListasCobradas/Tabela9_7IndianWage.xlsx"
out= BD_10 dbms = xlsx replace;
getnames=yes;
RUN;


/*  WI = Renda Semanal em Rúpias*/
	/*AGE = idade*/
/*	DE2 = Dummy, 1 se primeiro grau*/
/*	DE3 = dummy, 1 se segundo grau */
/*	DE4 = dummy, 1 se superior ao segundo grau*/
/*	DPT = dummy, 1 se trabalhador CLT*/
/*	DSEX = dummy, 1 se mulher */


DATA ListaBD_10;
	SET BD_10;
	
	lnWI = LOG(WI);
	


/*semi-log*/
PROC REG data=listabd_10;
	MODEL lnWI = AGE Dsex DE2 DE3 DE4 DPT;
RUN;



/*com interação*/
DATA INTERACAO1;
	SET ListaBD_10;
	DsexDE2 = (Dsex*DE2);
	DsexDE3 = (Dsex*DE3);
	DsexDE4 = (Dsex*DE4);
	
PROC REG;
	MODEL lnWI = AGE DSEX DE2 DE3 DE4 DsexDE2 DsexDE3 DsexDE4 DPT;
RUN;


/*com interação mas sem as binarias de educação*/
DATA INTERACAO2;
	SET ListaBD_10;
	DsexDE2 = (Dsex*DE2);
	DsexDE3 = (Dsex*DE3);
	DsexDE4 = (Dsex*DE4);
PROC REG;
	MODEL lnWI = AGE DSEX DsexDE2 DsexDE3 DsexDE4 DPT;
RUN;




/*com interação entre escolaridade e tempo de trabalho*/
DATA INTERACAO3;
	SET EXEMPLO9_7;
	DPTDE2 = (DPT*DE2);
	DPTDE3 = (DPT*DE3);
	DPTDE4 = (DPT*DE4);
PROC REG;
	MODEL lnRS = idade Dgen DE2 DE3 DE4 DPT DPTDE2 DPTDE3 DPTDE4;
RUN;
