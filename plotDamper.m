function plotDamper(startPoint, endPoint,height)
delta = [(endPoint(1)-startPoint(1))/3 (endPoint(2)-startPoint(2))/3];
upperPeak = ([cos(pi/2) -sin(pi/2); sin(pi/2) cos(pi/2)]*[delta(1);delta(2)]/6)'/pdist([startPoint;endPoint])*height;
lowerPeak = ([cos(-pi/2) -sin(-pi/2); sin(-pi/2) cos(-pi/2)]*[delta(1);delta(2)]/6)'/pdist([startPoint;endPoint])*height;
     
%start drawing spring
points = [startPoint(1) startPoint(2)];
points = [points;points(end,:)+delta];
points = [points;points(end,:)+upperPeak];
points = [points;points(end,:)+2*lowerPeak];
points = [points;points(end,:)-delta/6];
points = [points;points(end,:)+delta*7/6];
points = [points;points(end,:)+2*upperPeak];
points = [points;points(end,:)-delta*7/6];
points = [points;points(end,:)+delta*7/6];
points = [points;points(end,:)+lowerPeak];
points = [points;points(end,:)+delta];

plot(points(:,1), points(:,2),'-k');



end