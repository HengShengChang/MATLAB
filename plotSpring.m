function plotSpring(startPoint, endPoint,height)
numberOfTeeth = 10; %must be even number
delta = [(endPoint(1)-startPoint(1))/numberOfTeeth/2 (endPoint(2)-startPoint(2))/numberOfTeeth/2];
upperPeak = ([cos(pi/2) -sin(pi/2);sin(pi/2) cos(pi/2)]*[delta(1);delta(2)])'/pdist([startPoint;endPoint])*height;
lowerPeak = ([cos(-pi/2) -sin(-pi/2);sin(-pi/2) cos(-pi/2)]*[delta(1);delta(2)])'/pdist([startPoint;endPoint])*height;

%start drawing spring
points = [startPoint(1) startPoint(2)];
position = points;
points = [points;position(end,:)+numberOfTeeth/2*delta];
position = [position;points(end,:)+delta];
for i = 1:numberOfTeeth/2
    points = [points;position(end,:)+upperPeak];
    position = [position;position(end,:)+delta];
    points = [points;position(end,:)+lowerPeak];
    position = [position;position(end,:)+delta];
end
points = [points;position(end,:)];
points = [points;[endPoint(1) endPoint(2)]];
plot(points(:,1), points(:,2),'-k');

