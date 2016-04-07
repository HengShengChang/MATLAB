% this function plot a damper in a 2D
% startPoint is where the damper starts, and the endPoint is where the
% damper ends. height limited the width of the damper
%
% startPoint should in 2D dimention [x y]
% endPoint should in 2D dimention [x y]
% height shoudld be a scalar
%
function plotDamper(startPoint, endPoint, height)
    % delta is 1/3 of the line from startPoint to endPoint
    delta = [(endPoint(1)-startPoint(1))/3 (endPoint(2)-startPoint(2))/3];
    % upperPeak and lowerPeak are directions verticle to the line from 
    % startPoint to endPoint and there length are as same as height
    upperPeak = ([cos(pi/2) -sin(pi/2); sin(pi/2) cos(pi/2)]*[delta(1);delta(2)]/6)'/pdist([startPoint;endPoint])*height;
    lowerPeak = ([cos(-pi/2) -sin(-pi/2); sin(-pi/2) cos(-pi/2)]*[delta(1);delta(2)]/6)'/pdist([startPoint;endPoint])*height;

    % start drawing damper
    % points save the turning points of the damper
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

    % plot damper
    plot(points(:,1), points(:,2),'-k');

end