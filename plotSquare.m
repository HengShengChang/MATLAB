function plotSquare(center,length,delta_x, delta_y)
x=[center(1)-length/2 center(1)+length/2 center(1)+length/2 center(1)-length/2 center(1)-length/2];    %save corner x position
y=[center(2)-length/2 center(2)-length/2 center(2)+length/2 center(2)+length/2 center(2)-length/2];    %save corner y position
plot(x+delta_x,y+delta_y,'-k');  %plot square