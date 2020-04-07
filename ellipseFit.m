function [xx,yy,p]=ellipseFit(x,y)
%% ellipseFit
% Author: S. DeWolf
% Modified by: R. Moak (08/16/19

% Details in Zumberge et al. (2004) - Resolving Quadrature Fringes in Real Time

%% Documentation:
% Program to read in binary x and y data from fringe signal
% and calculate phase.
% The data are read in from the matlab command line and put into x and y
% An ellipse is fit, the phase calculated.
% based on ellipse2phase2
% here's the ellipse fit
% xy = input;
% Given xy, a set of x-y pairs in the form of an n x 2 array,
% does a least-squares fit to an ellipse.
% First finds (A, B, C, D, E) in the general quadratic equation:
% A + By^2 + Cxy + Dx + Ey = x^2

% R. Moak Alterations:
% 1) change alpha to r

% function [a,b,p0,x0,y0] = ellipseFit(x,y)

%% construct Vandermonde matrix and invert
A=[ones(length(x),1),y.^2,x.*y,x,y];
C=A\x.^2;
clear('A');

%  Here C = [A, B, C, D, E]' in the quadratic form
% we want the parametric equation (x=x0+a*sin(t+p0),y=y0+b*cos(t))
r = sqrt(abs(C(2)));
sinp0=C(3)/(2*r);
cp=sqrt(abs(1-sinp0^2));
y0=(r*C(4)*sinp0+C(5))/(2*r^2*cp^2);
x0=C(4)/2+y0*r*sinp0;
a=sqrt(abs(C(1)+x0^2+r^2*y0^2-2*x0*y0*r*sinp0))/cp;
b=a/r;
p0=atan2(sinp0,cp);

% calculate phase data
cosp=cos(p0);
tanp=tan(p0);
c1=1/(a*cosp);
c2=tanp/b;
c3=1/b;
sint=c1*(x-x0)-c2*(y-y0);
cost=c3*(y-y0);
p=unwrap(atan2(sint,cost));

% compute best-fit ellipse
pp=linspace(0,2*pi,1000);
xx=x0+a*sin(pp+p0);
yy=y0+b*cos(pp);

figure;
plot(x,y,'.k','MarkerSize',6);hold on;
plot(xx,yy,'.r');
set(gca,'FontSize',12);hold off;grid on;axis square;