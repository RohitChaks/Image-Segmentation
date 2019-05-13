function [ t ] = myfilter( q )
%SOBELL Summary of this function goes here
%   Detailed explanation goes here
gx = [-1,-2,-1; -2,-3,-2; 0,0,0; 2,3,2; 1,2,1];
gy = [-1,-2,0,2,1; -2,-3,0,3,2; -1,-2,0,2,1];
threshold = 500; %varies for application [0 255]

[x,y] = size(q);
t = zeros(x-2,y-2);
for i = 1:x-4
    for j = 1:y-4
        %temp = double(q(i:i+2,j:j+2));
        dx = dot(double(q(i:i+4,j:j+2)),gx);
        dx = abs(sum(dx(:)));
        dy = dot(double(q(i:i+2,j:j+4)),gy);
        dy = abs(sum(dy(:)));

         t(i,j) = dx+dy;
        if (dx+dy) <= threshold
            t(i,j) = 0;
        else
            t(i,j) = 255;
        end
    end
end
t = mat2gray(t);
end
