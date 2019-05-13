function [ I ] = pre_process( I )
%PRE_PROCESS Summary of this function goes here
%   Detailed explanation goes here
I = imresize(I, [276 230]);
I = equalisation(I);
I = myfilter(I);
end

