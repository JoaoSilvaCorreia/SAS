/*importa txt*/
proc import datafile="/home/joaovitorsilvaco0/Econometria/Binaria/GujaratiT9.7.xlsx"
out= GUJAtab9_7 dbms = xlsx replace;
getnames=yes;
RUN;

DATA EXEMPLO9_7;
	SET WORK.GUJATAB9_7;
	
	lnRS = LOG(RS);

PROC CORR;
VAR lnRS idade Dgen DE2 DE3 DE4 DPT;

/*normal*/
PROC REG;
	MODEL lnRS = idade Dgen DE2 DE3 DE4 DPT;
RUN;

/*com interação*/
DATA INTERACAO;
	SET EXEMPLO9_7;
	DgenDE2 = (Dgen*DE2);
	DgenDE3 = (Dgen*DE3);
	DgenDE4 = (Dgen*DE4);
	
PROC REG;
	MODEL lnRS = idade Dgen DE2 DE3 DE4 DPT DgenDE2 DgenDE3 DgenDE4;
RUN;



/*com interação mas sem as binarias de educação*/
DATA INTERACAO;
	SET EXEMPLO9_7;
	DgenDE2 = (Dgen*DE2);
	DgenDE3 = (Dgen*DE3);
	DgenDE4 = (Dgen*DE4);
PROC REG;
	MODEL lnRS = idade Dgen DPT DgenDE2 DgenDE3 DgenDE4;
RUN;




/*com interação entre escolaridade e tempo de trabalho*/
DATA INTERACAO2;
	SET EXEMPLO9_7;
	DPTDE2 = (DPT*DE2);
	DPTDE3 = (DPT*DE3);
	DPTDE4 = (DPT*DE4);
PROC REG;
	MODEL lnRS = idade Dgen DE2 DE3 DE4 DPT DPTDE2 DPTDE3 DPTDE4;
RUN;





