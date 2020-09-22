#include <math.h>

void trans_circ(x,y,w,base)
/*
	maps hom. point (x,y,w) into unit circle point (x,y);
	Old value of x,y is overwritten.

	returns flag: base==1 if base point.
*/
	
double *x, *y, *w;
int *base;

	{
	double r,ww;


	*base = 0;
	if (fabs(*w)>0.0000001)
	{
	
	/* project onto upper half of unit sphere: */

		ww = fabs(*w);

		if (*w>0.0)
		{
		r = sqrt (*x * *x + *y * *y + ww * ww);
		}
		else
		r = - sqrt (*x * *x + *y * *y + ww * ww);

		*x = *x /  r;
		*y = *y / r;
		*w = 1.0;

		

	}
	else /* map to boundary of unit circle */
	{


		r = sqrt( *x * *x + *y * *y);
	
	/* base point: */
		if (r < 0.00001){*base = 1; return;}


		*x = (*x) /  r;
		*y = (*y) /  r;

		*w = 1.0;


	}

}
