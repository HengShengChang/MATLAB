% this function plot a square in 2D
% center is the center of the square, which should be in 2D [x y]
% length is the length of the edge of the square, which should be a scalar
%
function plotSquare(center,length)
    % points save the turning points of the square
    points = [center(1)-length/2 center(2)-length/2;
              center(1)+length/2 center(2)-length/2;
              center(1)+length/2 center(2)+length/2;
              center(1)-length/2 center(2)+length/2;
              center(1)-length/2 center(2)-length/2];
    % plot square
    plot(points(:,1),points(:,2),'-k');  
end