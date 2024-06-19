DATA canetas;
INPUT Y X;
CARDS;
20.0 0.50
21.0 0.50
19.0 0.55
19.5 0.55
20.5 0.60
19.0 0.60
16.0 0.65
15.0 0.65
14.5 0.70
15.5 0.70
13.0 0.80
14.0 0.80
11.5 0.90
11.0 0.90
17.0 0.40
;
PROC CORR;
	VAR Y X;
RUN;

PROC REG;
	MODEL Y = X;
RUN; 