%Este script gera qualquer tabela do lab 2 num ficheiro excel
%Para obter tabelas diferentes basta mudar onde diz "mudar esta funcao"
%ToDo: aprender a usar alias para os nomes das funções


%Exercise 2.1.1 - prints to an excel file
clear;
tablesvalues;
quad1ini;
for i1 = 1:6
    for i2 = 1:8          %mudar esta funcao
        result1(i2, i1) = quad1mod(rows(1,i1), columns(1, i2));
    end
end

filename = 'table1.xlsx';
xlswrite(filename, result1, 'Range','I4');

%Exercise 2.2.1 - prints all results on the console
clear;
tablesvalues;
quad2ini;
anim = 0;
for i1 = 1:6
    for i2 = 1:8          %mudar esta funcao
        a = rows(2, i1);
        eta = columns(2, i2);
        quad2
    end
end



