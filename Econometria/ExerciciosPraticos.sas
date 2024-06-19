/*importar xlsx*/
proc import datafile="/home/joaovitorsilvaco0/Econometria/RegMultipla/BasededadosSoftware.xlsx"
out= BaseDados dbms =xlsx replace;
getnames=yes;
run;

DATA REG;
	SET BaseDados;
	
	lnY = log(Y);
	lnX2 = log(X2);
	lnX3 = log(X3);
	lnX4 = log(X4);
	
	PROC REG;
	MODEL lnY = lnX2 lnX3 lnX4 X5;
	MODEL Y = X2; /*modelo simples*/
	run; 