/* jenner-check substitution note:
   Upstream ExercGuja9_7.sas reads GujaratiT9.7.xlsx via PROC IMPORT from a
   hardcoded path. Replaced with an inline DATA step carrying a 25-row sample
   of the same seven columns (RS, Idade, Dgen, DE2, DE3, DE4, DPT) from that
   workbook -- the Gujarati Indian weekly-wage dataset used in the exercise.
   Everything from "DATA EXEMPLO9_7;" onward is unmodified. */
DATA GUJAtab9_7;
	INPUT RS Idade Dgen DE2 DE3 DE4 DPT;
	CARDS;
120 57 0 0 0 0 0
224 48 0 0 0 1 1
132 38 0 0 0 0 0
75 27 0 0 1 0 0
111 23 1 0 1 0 0
127 22 0 0 1 0 0
30 18 0 0 0 0 0
24 12 0 0 0 0 0
119 38 0 0 0 0 1
75 55 0 0 0 0 0
324 26 0 0 1 0 0
42 18 0 0 0 0 0
100 32 0 0 0 0 0
135.5 41 0 0 0 0 0
107 48 0 0 0 0 0
50 16 1 1 0 0 0
90 45 0 0 0 0 0
377 46 0 0 0 0 1
150 30 0 0 1 0 0
162 40 0 0 0 0 0
18 19 0 1 0 0 0
127.6 25 0 1 0 0 0
47.5 46 1 0 0 0 0
135 25 0 0 1 0 0
400 57 0 0 0 0 1
;

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
