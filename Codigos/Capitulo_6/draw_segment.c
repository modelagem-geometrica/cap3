#include <stdio.h>
#include <math.h>
extern FILE *psfile;
void draw_segment(dense,sx,sy,sw)
/*	plot curve segment sx,sy in dense increments.
	The array sx,sy is expected to hold points that are
	transformed into the circular model of P2.
	
input	dense:		no of points
	sx,sy,sw:	point array to be plotted
	
*/


	int dense;
	double sx[], sy[], sw[];

{
	int i,j;
	double r;



	for (j=1; j<=dense;j++)
	{
		r=sqrt(( sx[j]-sx[j-1])*( sx[j]-sx[j-1])

			+(sy[j]-sy[j-1])*( sy[j]-sy[j-1])  );

   		if (r < 1.9 )
		{	
		fprintf(psfile,"newpath\n");
		fprintf(psfile,"%f %f moveto\n",sx[j-1],sy[j-1]);
		fprintf(psfile,"%f %f lineto\n",sx[j],sy[j]);
		fprintf(psfile,"stroke\n");
		}
	}
		
		

}
