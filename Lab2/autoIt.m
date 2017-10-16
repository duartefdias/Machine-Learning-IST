%Este script gera qualquer tabela do lab 2 num ficheiro excel
%Para obter tabelas diferentes basta mudar onde diz "mudar esta funcao"
%ToDo: aprender a usar alias para os nomes das funções
columns = [.001 .01 .03 .1 .3 1 3 0;
            .01 .03 .1 .3 1 3 0 0;
            .003 .01 .03 .1 .3 1 3 10;
            .001 .01 .1 1 10 0 0 0];
rows = [.5 1 2 5 0 0;
        2 20 0 0 0 0;
        0 .5 .7 .9 .95 0;
        0 .5 .7 .9 .95 .99];


for i1 = 1:6
    for i2 = 1:8          %mudar esta funcao
        result1(i2, i1) = quad1mod(rows(1,i1), columns(1, i2));
    end
end

filename = 'table1.xlsx';
xlswrite(filename, result1, 'Range','I4');
result1


