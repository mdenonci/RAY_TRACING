function [transmitOK,th_inc,th_ref,intersect1,intersect2] = Snell_Descartes(wall,rx,ry,tx,ty)

transmitOK = false;
th_inc = 0;
th_ref = 0;
intersect1 = zeros(2);
intersect2 = zeros(2);

