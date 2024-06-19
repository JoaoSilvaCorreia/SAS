proc import datafile="/home/joaovitorsilvaco0/Econometria/EquacoesSimultaneas/Sexta Avaliação Prática.xlsx"
out= Prova6 dbms = xlsx replace;
RUN;

/*1 equação estrutural:   R = M + Y */

/*1 equação Reduzida*/

data EqReduz1;
	set work.prova6;
	keep R M I ;
run; 

proc reg data=eqreduz1;
		model R = M I;
		/*output out= segundoEstagio p = yhat zhat;*/
		
run; 



/*2 equação estrutural:  Y = R + I*/


