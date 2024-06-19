/*EXEMPLO 1*/
TITLE "TESTAR O EFEITO DAS EMBALAGENS DE BALA";
ODS NOPROCTITLE;
DATA BALA;
	INPUT TRATAMENTO $ VENDA;
	CARDS;
	A 22
	A 26
	A 28
	A 25
	A 29
	B 33
	B 29
	B 31
	B 34
	B 28
	C 31
	C 25
	C 28
	C 27
	C 24
	D 25
	D 26
	D 20
	D 23
	D 21
	;
PROC ANOVA;
CLASS TRATAMENTO;
MODEL VENDA = TRATAMENTO;
RUN;
MEAN TRATAMENTO / TUKEY;
MEAN TRATAMENTO / DUNNETT;
RUN; 


/*EXERCICIO 1 SALA*/
TITLE "SETORES E SALARIOS";
ODS NOPROCTITLE;
DATA EMPRESA;
	INPUT SETORES $ MEDIASALARIO;
	CARDS;
	RH 3.2
	RH 2.8
	RH 3.5
	RH 2.5
	RH 2.9
	AD 4.5
	AD 2.5
	AD 3.3
	AD 4.1
	AD 3.2
	FI 5.2
	FI 3.8
	FI 4.1
	FI 2.3
	FI 3.5
	;
	PROC ANOVA;
	CLASS SETORES;
	MODEL MEDIASALARIO = SETORES;
	RUN;
	

/*EXERCICIO 1 COMPLEMENTAR */
title "1 - INFLUÊNCIA DO TIPO DE GASOLINA NO RENDIMENTO DO CARRO";
ods noproctitle;
DATA EXPER;
	INPUT FUEL_TYPE $ CONSUM;
	CARDS;
	A 15.1
	A 15.0
	A 14.9
	A 15.7
	A 15.4 
	A 15.1
	B 14.9
	B 15.2
	B 14.9
	B 14.8
	B 14.9
	B 15.3
	C 15.4
	C 15.2
	C 16.1
	C 15.3
	C 15.2
	C 15.2
	D 15.6
	D 15.5
	D 15.8
	D 15.3
	D 15.7
	D 15.7
	;
	title "1 - INFLUÊNCIA DO TIPO DE GASOLINA NO RENDIMENTO DO CARRO";
	ods noproctitle;
	PROC ANOVA;
		CLASS FUEL_TYPE;
		MODEL CONSUM = FUEL_TYPE;
	MEAN FUEL_TYPE/TUKEY;
	MEAN FUEL_TYPE/DUNNETT;
	RUN; 
	
	

/*EXERCICIO 2*/
title "2 - DIFERENÇA DE MÉDIA DE VENDAS MENSAIS DE UMA EMPRESA EM QUATRO REGIÕES";
ods noproctitle;
DATA VENDAS_MEDIAS;
	INPUT REGIAO $ VENDAS;
	CARDS;
	NORTE 34
	NORTE 28
	NORTE 18
	NORTE 24
	NORTE 30
	LESTE 47
	LESTE 36
	LESTE 30
	LESTE 38
	LESTE 33
	SUL 40
	SUL 30
	SUL 41
	SUL 29
	SUL 30
	OESTE 21
	OESTE 30
	OESTE 24
	OESTE 37
	OESTE 23
	;
	title "2 - DIFERENÇA DE MÉDIA DE VENDAS MENSAIS DE UMA EMPRESA EM QUATRO REGIÕES";
	ods noproctitle;
	PROC ANOVA;
	CLASS REGIAO;
	MODEL VENDAS = REGIAO;
	RUN;
	MEAN REGIAO/TUKEY alpha= 0.01;
	RUN; 
	
	
title "3 - RELAÇÃO DE GORJETA COM O CLIMA";
ods noproctitle;	
/*EXERCICIO 3*/
DATA GORJETA_TEMPO;
	INPUT TEMPO $ GORJETA;
	CARDS;
	SEM 19.9
	SEM 16.0
	SEM 15.0
	SEM 20.1
	SEM 19.3
	SEM 19.2
	SEM 18.0
	SEM 21.2
	SEM 21.3
	SEM 20.6
	BOM 20.8
	BOM 18.7
	BOM 19.9
	BOM 20.6
	BOM 22.0
	BOM 23.4
	BOM 22.8
	BOM 27.0
	BOM 22.2
	BOM 24.9
	MAU 18.0
	MAU 19.0
	MAU 19.2
	MAU 18.8
	MAU 18.4
	MAU 19.0
	MAU 18.5
	MAU 16.8
	MAU 16.1
	MAU 14.0
	
	;
	title "3 - RELAÇÃO DE GORJETA COM O CLIMA";
	ods noproctitle;
	PROC ANOVA;
	CLASS TEMPO;
	MODEL GORJETA = TEMPO;
	RUN;
	PROC GLM;
	CLASS TEMPO;
	MODEL GORJETA = TEMPO;
	MEANS TEMPO/TUKEY;
	MEANS TEMPO /DUNNETT;
	RUN;
	

title "4 - SALÁRIOS DO SETOR DE TI EM REGIÕES DISTINTAS";
ods noproctitle;	
/*EXERCICIO 4*/
DATA REGION_WAGE;
	INPUT REGION $ WAGE;
	CARDS;
	NY 82
	NY 79
	NY 72
	NY 89
	NY 79
	NY 85
	BO 85
	BO 80
	BO 74
	BO 78
	BO 75
	BO 80
	BO 86
	BO 74
	VS 82
	VS 91
	VS 94
	VS 88
	VS 85
	;
	PROC ANOVA;
	CLASS REGION;
	MODEL WAGE = REGION;
	RUN;
	MEAN REGION/TUKEY;
	MEAN REGION/DUNNETT;
	RUN;
	
	