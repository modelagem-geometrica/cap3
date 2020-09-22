void  bez_circ(degree,npoints,bx,by,bw,pointsx,pointsy,pointsw)
/*	Converts rational Bezier curve into point sequence. 

	Input:   degree:  degree of curve.
	         npoints: # of coordinates to be generated. (counting
		          from 0!)
	         bx,by:   coordinates of control polygon.
		 bw	  weights  of control polygon.
	Output:  pointsx, pointsy:  coordinates of points on curve.

*/

	int degree, npoints;
	double bx[], by[], bw[], pointsx[], pointsy[], pointsw[];

{	
	double t,delt;
	int i,base;
	double w;
	double decas();

	delt=1.0/(float)npoints;
	t=0.0;
	for(i=0; i<=npoints; i++) 
	{
		pointsx[i] = decas(degree,bx,t); 
		pointsy[i] = decas(degree,by,t); 
		pointsw[i] = decas(degree,bw,t);



	/* Now map to unit circle */

		trans_circ(&pointsx[i], &pointsy[i], 
		&pointsw[i], &base);

	
		if (base==1){pointsx[i]=pointsx[i-1];
			     pointsy[i]=pointsy[i-1];
			     pointsw[i]=pointsw[i-1];

			    }
/*
	printf("%lf, %lf,%lf,%lf\n",
		t,pointsx[i],pointsy[i],pointsw[i]);
	printf("\n");
*/
		t = t+delt;
	}
}
