#include <stdio.h>
#include <math.h>

/* this program plots several to plot  bez. curve in circular map*/

	FILE *file,  *psfile;

main()
{

	int i,j,degree,pol,dense,howmany,compseg,count_curve,base;
	double x,y,w,delt,dum,t,r;
	double bx[200],by[200],bw[20];
	double sx[1000],sy[1000],sw[1000];
  
	/* ----------------------------- */

	file = fopen("circ.dat","r");  /*input file*/
	psfile= fopen("circ.ps","w");  /*output file*/
	

	fscanf(file,"\n");

        fprintf(psfile,"%2s\n","%!");

	fprintf(psfile,"230 230 translate\n");

	fprintf(psfile,"150 150 scale \n");

	fprintf(psfile,"0.1 setgray \n");

	fprintf(psfile,".02 setlinewidth\n");



/*draw circular projective plane, independent of input*/


fprintf(psfile,"/r 1 def\n");
fprintf(psfile,"/numcirc 100 def\n");  /* how many circles */
fprintf(psfile,"/delgray 1 numcirc div def\n");
fprintf(psfile,"/t 0.15 def\n");


fprintf(psfile,".01 setlinewidth\n");

fprintf(psfile,"0  1 numcirc\n");
fprintf(psfile,"{\n");
fprintf(psfile,"\n");
fprintf(psfile,"	/t  t delgray  add def\n");
fprintf(psfile,"	/gray  1 t sub 1 t sub mul def\n");
fprintf(psfile,"	/gray  gray gray gray gray  mul mul  mul def\n");
fprintf(psfile,"	/gray  1  gray sub  def\n");
fprintf(psfile,"	/r r 0.004 sub def\n");
fprintf(psfile,"\n");
fprintf(psfile,"	gray setgray\n");
fprintf(psfile,"\n");
fprintf(psfile,"\n");
fprintf(psfile,"	0 0 r 0 360 arc stroke\n");
fprintf(psfile,"}for\n");

fprintf(psfile,"0 setgray \n");

fprintf(psfile,"%1s","%");
fprintf(psfile," ********** end horizon ************\n");


fscanf(file,"%d", &howmany); /*first input: how many curves to plot */
/* each curve is now handled the same way.*/

for (count_curve=1; count_curve <= howmany; count_curve++)
{
	fscanf(file,"\n");
	fscanf(file,"%d", &degree); 
	fscanf(file,"%d", &pol);	/* 1: plot control polygon. 0: don't*/
	fscanf(file,"%d", &dense);	/* how many points to plot */
	fscanf(file,"%d", &compseg);	/*1: plot complementary segment. 0: don't*/
	fscanf(file,"\n");
	
	for(i=0; i <= degree ; i++) /* read in hom. coords of control points*/
	{
	        fscanf(file,"%lf",&dum);
		bx[i]= dum;
	        fscanf(file,"%lf",&dum);
		by[i]= dum;	   
		fscanf(file,"%lf", &dum);
		bw[i]= dum;
 	}	 
	fscanf(file,"\n");





	
	fprintf(psfile,"0 setgray \n");


	

	fprintf(psfile,".02 setlinewidth\n");

	/* Plot curve segment: */


	fprintf(psfile,"%1s","%");
	fprintf(psfile," ********** plot curve ************\n");

	bez_circ(degree,dense,bx,by,bw,sx,sy,sw);
	draw_segment(dense,sx,sy,sw);
	


	/* Now repeat for complementary curve segment:  */

	fprintf(psfile,".02 setlinewidth\n");


	
	if(compseg == 1) /* plot comp. seg.*/
	{
		for(i=1; i<=degree; i=i+2)
		{  	
		/* compute control points of comp seg: */
	
			bx[i] = -bx[i];
			by[i] = -by[i];
			bw[i] = -bw[i];
		}

		fprintf(psfile,"%1s","%");
		fprintf(psfile," ********** plot comp ************\n");

	
		bez_circ(degree,dense,bx,by,bw,sx,sy,sw);
		draw_segment(dense,sx,sy,sw);

		for(i=1; i<=degree; i=i+2)
		{  	
		/* bring control points into old homog. form: */
	
			bx[i] = -bx[i];
			by[i] = -by[i];
			bw[i] = -bw[i];
		}
	}




	/* plot control polygon? */

	if (pol == 1)
	{
		fprintf(psfile,"%1s","%");
		fprintf(psfile," ********** plot poly ************\n");

	
		fprintf(psfile,".006 setlinewidth\n");
		delt = 1.0/dense;
		fprintf(psfile,"0 setgray \n");
		for (i=0;i < degree;i++)
	{
		/*plot segment #i */

		t = -delt;
	
		for (j=0; j<=dense;j++)
		{
			t= t+delt;

			sx[j] = (1-t)*bx[i]+ t*bx[i+1];
			sy[j] = (1-t)*by[i]+ t*by[i+1];
			sw[j] = (1-t)*bw[i]+ t*bw[i+1];

			trans_circ(&sx[j],&sy[j],&sw[j],&base);	
		}
		draw_segment(dense,sx,sy,sw);
	
	}/*end seg. i */

	for (i=0;i <= degree;i++)
	{
		x = bx[i];
		y = by[i];
		w = bw[i];

		trans_circ(&x,&y,&w);
		fprintf(psfile,"%f %f %f %f %f arc fill\n",
		x,y,0.03,0.0,360.0);
	}
	
	fprintf(psfile,"1 setgray \n");
	for (i=1; i < degree;i++)
	{
		x = bx[i];
		y = by[i];
		w = bw[i];

		trans_circ(&x,&y,&w);
		fprintf(psfile,"%f %f %f %f %f arc fill\n",
		x,y,0.025,0.0,360.0);
	}

	}/*end draw polygon */

	fprintf(psfile,"0 setgray \n");
	
}/*end howmany-loop*/
	fclose(file);

	fprintf(psfile,"showpage\n");
	return;

}		
