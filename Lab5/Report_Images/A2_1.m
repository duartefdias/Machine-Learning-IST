x = -2:2;

y=-x+1;
figure
plot(x, y)
hold on

y=-x;
plot(x, y)
hold on

y=-x+2;
plot(x, y)
hold on

x = [1];
y = [1];
scatter(x,y,'o')

x = [-1 -1 1];
y = [1  -1 -1];
scatter(x,y,'s')
