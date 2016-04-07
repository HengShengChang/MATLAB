% this function plot a spring in a 2D
% startPoint is where the spring starts, and the endPoint is where the
% spring ends. height limited the width of the spring
%
% startPoint should in 2D dimention [x y]
% endPoint should in 2D dimention [x y]
% height shoudld be a scalar
%
function plotSpring(startPoint, endPoint, height)
    % numberOfTeeth describe the number of rounds which the spring has
    numberOfTeeth = 10; %must be even number
    % delta is a constant fraction of the line from startPoint to endPoint
    delta = [(endPoint(1)-startPoint(1))/numberOfTeeth/2 (endPoint(2)-startPoint(2))/numberOfTeeth/2];
    % upperPeak and lowerPeak are directions verticle to the line from 
    % startPoint to endPoint and there length are as same as height
    upperPeak = ([cos(pi/2) -sin(pi/2);sin(pi/2) cos(pi/2)]*[delta(1);delta(2)])'/pdist([startPoint;endPoint])*height;
    lowerPeak = ([cos(-pi/2) -sin(-pi/2);sin(-pi/2) cos(-pi/2)]*[delta(1);delta(2)])'/pdist([startPoint;endPoint])*height;

    % start drawing spring
    % points save the turning points of the spring
    % position is a helping variable, which helps draw spring turning points
    points = [startPoint(1) startPoint(2)];
    position = points;
    points = [points;position(end,:)+numberOfTeeth/2*delta];
    position = [position;points(end,:)+delta];
    % the for loop draw the rounds of the spring
    for i = 1:numberOfTeeth/2
        points = [points;position(end,:)+upperPeak];
        position = [position;position(end,:)+delta];
        points = [points;position(end,:)+lowerPeak];
        position = [position;position(end,:)+delta];
    end
    points = [points;position(end,:)];
    points = [points;[endPoint(1) endPoint(2)]];

    % plot spring
    plot(points(:,1), points(:,2),'-k');

end
