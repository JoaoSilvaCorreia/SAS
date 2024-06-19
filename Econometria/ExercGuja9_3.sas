/*importa txt*/
proc import datafile="/home/joaovitorsilvaco0/Econometria/Binaria/GujaratiT9.8.xlsx"
out= GUJAtab9_8 dbms = xlsx replace;
getnames=yes;
RUN;

DATA EXE9_3;
	SET WORK.gujatab9_8;
PROC REG ;
	MODEL TD = D V DV ;
RUN;

