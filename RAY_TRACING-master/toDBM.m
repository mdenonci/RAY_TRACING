function power_matrixDB = toDBM(power_matrix)

Ra = 73;

power_matrixDB = power_matrix;
[ymax,xmax] = size(power_matrix);

for (x = 1:1:xmax)
    for(y = 1:1:ymax)
        hE = power_matrix(y,x);
        power = (1/(8*Ra))*(abs(hE))^2;
        power_matrixDB(y,x) = 10*log10(power/0.001);
    end
end
end