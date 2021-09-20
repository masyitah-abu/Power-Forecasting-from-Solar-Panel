clear
clc
[input]=xlsread('input.xlsx');
[output]= xlsread('output.xlsx');
%input=normalize(input);
%output=normalize(output);
%inputmin=min(input);
outputmin=min(output);
%inputmax=max(input);
outputmax=max(output);

%input = (input - inputmin) / ( inputmax - inputmin );
output = (output - outputmin) / ( outputmax - outputmin );