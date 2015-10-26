function rgb_Matrix = Street( array )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

%d=size(array);

%M=zeros(d(2));

%M = [M(1:d(2)/2, :); array; M(d(2)/2:end, :)];



rgb_Matrix = image(array, 'CDataMapping','scaled');

%imwrite(rgb_Matrix,jet,'C:\Users\Sebastian\Dropbox\Uraniastrasse\Matlab\rgb.png','png'); 
end

