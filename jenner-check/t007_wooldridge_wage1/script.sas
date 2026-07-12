/* jenner-check substitution note:
   Upstream WooldExemplo7.1WAGE1.sas reads wage1.xls via PROC IMPORT from a
   hardcoded Windows path (C:\Users\joaov\Google Drive\...). Replaced with an
   inline DATA step carrying a 25-row sample of the columns the model uses
   (wage, educ, exper, tenure, female), taken directly from the wage1.xls
   shipped in the repo (Wooldridge's WAGE1 dataset). The PROC REG model
   statement is unmodified from the author's script. */
DATA WAGE1;
	INPUT wage educ exper tenure female;
	CARDS;
3.1 11 2 0 1
3.24 12 22 2 1
3 11 2 0 0
6 8 44 28 0
5.3 12 7 2 0
8.75 16 9 8 0
11.25 18 15 7 0
5 12 5 3 1
3.6 12 26 4 1
18.18 17 22 21 0
6.25 16 8 2 1
8.13 13 3 0 1
8.77 12 15 0 0
5.5 12 18 3 0
22.2 12 31 15 0
17.33 16 14 0 0
7.5 12 10 0 1
10.63 13 16 10 1
3.6 12 13 0 1
4.5 12 36 6 1
6.88 12 11 4 1
8.48 12 29 13 0
6.33 16 9 9 1
0.53 12 3 1 1
6 11 37 8 1
;

proc reg data=work.wage1;
	model wage = female educ exper tenure;
run;
