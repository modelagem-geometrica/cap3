
/*draw circular projective plane*/

fprintf(psfile,"/gray 0.2 def\n");
fprintf(psfile,"/r 1 def\n");




fprintf(psfile,".01 setlinewidth\n");

fprintf(psfile,"0  1 80\n");
fprintf(psfile,"{\n");
fprintf(psfile,"\n");
fprintf(psfile,"	/gray  gray 0.01  add def\n");
fprintf(psfile,"	/r r 0.1 sub def\n");
fprintf(psfile,"\n");
fprintf(psfile,"	gray setgray\n");
fprintf(psfile,"\n");
fprintf(psfile,"\n");
fprintf(psfile,"	0 0 r 0 360 arc stroke\n");
fprintf(psfile,"}for\n");
