function [ A ] = equalisation( A)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    freq = zeros(1,256);
    base = zeros(1,256);

    for i = 0:255
        freq(i+1) = double(sum(A(:) == i));
        bases(i+1) = i;
    end
    
    cdf = zeros(size(freq));
    cdf(1) = freq(1);
    n = size(cdf);
    dimension = size(A);
    for i = 2:n(2)
        cdf(i) = cdf(i-1)+freq(i);
    end
    cdf = (cdf/(dimension(1)*dimension(2)))*255;
    temp = floor(cdf);
    
    for i = 1:dimension(1)
        for j = 1:dimension(2)
            A(i,j) = temp(A(i,j)+1);
        end
    end
    A = uint8(A);
end

