%Writes the table for 2.1.1 correctly
%Output file is "table1.xlsx"
filename = 'table1.xlsx';

i(1) = quad1mod(0.5, .001);
i(5) = quad1mod(0.5, .01);
i(9) = quad1mod(0.5, .03);
i(13) = quad1mod(0.5, 0.1);
i(17) = quad1mod(0.5, 0.3);
i(21) = quad1mod(0.5, 1);
i(25) = quad1mod(0.5, 3);

i(2) = quad1mod(1, .001);
i(6) = quad1mod(1, .01);
i(10) = quad1mod(1, .03);
i(14) = quad1mod(1, 0.1);
i(16) = quad1mod(1, 0.3);
i(20) = quad1mod(1, 1);
i(24) = quad1mod(1, 3);

i(3) = quad1mod(2, .001);
i(7) = quad1mod(2, .01);
i(11) = quad1mod(2, .03);
i(15) = quad1mod(2, 0.1);
i(19) = quad1mod(2, 0.3);
i(23) = quad1mod(2, 1);
i(27) = quad1mod(2, 3);

i(4) = quad1mod(5, .001);
i(8) = quad1mod(5, .01);
i(12) = quad1mod(5, .03);
i(16) = quad1mod(5, 0.1);
i(20) = quad1mod(5, 0.3);
i(24) = quad1mod(5, 1);
i(28) = quad1mod(5, 3);

a = i(1:4)
xlswrite(filename, a, 'Range','C4');
b = i(5:8)
xlswrite(filename, b, 'Range','C5');
c = i(9:12)
xlswrite(filename, c, 'Range','C6');
d = i(13:16)
xlswrite(filename, d, 'Range','C7');
e = i(17:20)
xlswrite(filename, e, 'Range','C8');
f = i(21:24)
xlswrite(filename, f, 'Range','C9');
g = i(25:28)
xlswrite(filename, g, 'Range','C10');

