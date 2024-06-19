/*EXEMPLO 1*/
DATA EMPRESA;
	INPUT PROPAGANDA VENDAS;
	CARDS;
	2.4 225
	1.6 184
	2.0 220
	2.6 240
	1.4 180
	1.6 184
	2.0 186
	2.2 215
	;

TITLE 'DIAGRAMA DE DISPERSÃO';
PROC PLOT;
	PLOT PROPAGANDA*VENDAS;
RUN;


TITLE 'COEFICIENTE DE CORRELAÇÃO';
PROC CORR;
	VAR PROPAGANDA VENDAS;
RUN;

TITLE 'REGRESSÃO';
PROC REG;
	MODEL VENDAS = PROPAGANDA;
RUN; 
QUIT;



/*EXERCICIO 1 - SALA*/
DATA GANHOS;
	INPUT GANHO DIVIDENDOS;
	CARDS;
	2.34 1.33
	1.96 1.07
	1.39 1.15
	3.07 0.85
	0.65 1.00
	5.21 1.00
	0.88 1.59
	3.32 1.20
	2.54 1.42
	1.03 1.20
	;

PROC PLOT;
	PLOT GANHO*DIVIDENDOS;
	RUN;

PROC CORR;
	VAR GANHO DIVIDENDOS;
RUN;

PROC REG;
	MODEL DIVIDENDOS = GANHO;
RUN; 


/*EXERCICIO 2 - SALA*/
DATA CONSUMO;
	INPUT RENDA GASTO;
	CARDS;
	3 2
	5 3
	10 6
	20 9
	30 15
	40 20
	50 23
	70 25
	100 40
	;

PROC PLOT;
	PLOT RENDA*GASTO;
	RUN;

PROC CORR;
	VAR RENDA GASTO;
RUN;


PROC REG;
	MODEL GASTO = RENDA;
RUN; 



/*EXERCICIO 3 - SALA*/
DATA ANALFABETISMO;
	INPUT REGIAO SETOR ANALFABETISMO;
	CARDS;
	SP 2.0 17.5
	RJ 2.5 18.5
	BE 2.9 19.5
	BH 3.3 22.2
	SA 4.1 26.5
	PO 4.3 16.6
	RE 7.0 36.6
	FO 12.0 38.3
	;
PROC PLOT;
	PLOT ANALFABETISMO*SETOR;
	RUN;

PROC CORR;
	VAR SETOR ANALFABETISMO;
RUN;


PROC REG;
	MODEL ANALFABETISMO = SETOR;
RUN; 
	

/*EXE 1 - COMPLEMENTAR*/
DATA DIGITADORES;
	INPUT MESES ERROS;
	CARDS;
	1 30
	2 28
	3 24
	4 20
	5 18
	6 14
	7 13
	8 10
	9 7
	10 6
	;
PROC PLOT;
	PLOT ERROS*MESES;
RUN;

PROC CORR;
	VAR ERROS MESES;
RUN;

PROC REG;
	MODEL ERROS = MESES;
RUN; 




/*EXE 2 - COMPLEMENTARES*/
DATA EFICIENCIA;
	INPUT LOCAL ESTAB DEPOSIT;
	CARDS;
	A 16 14
	B 30 16
	C 35 19
	D 70 30
	E 90 31
	F 120 33
	G 160 35
	H 237 43
	I 379 50
	;
PROC PLOT;
	PLOT DEPOSIT*ESTAB;
RUN;

PROC CORR;
	VAR DEPOSIT ESTAB;
RUN;

PROC REG;
	MODEL DEPOSIT = ESTAB;
RUN;



/*EXE3 - COMPLEMENTARES*/
DATA TREINAMENTO;
	INPUT HORAS ERROS;
	CARDS;
	6 5
	12 6 
	18 1
	;

PROC PLOT;
	PLOT ERROS*HORAS;
RUN;

PROC CORR;
	VAR ERROS HORAS;
RUN;

PROC REG;
	MODEL ERROS = HORAS;
RUN; 

