clc;
clear;

Impluse_response = load('g.mat');
Markov_series = Impluse_response.g;
Markov_series(1) = [];%删掉第一个g(0)
Markov_series = Markov_series';
%构造hankle矩阵
Hankle_Matrix_n = (length(Markov_series))/2;
fprintf("hankle矩阵的阶为%d \n",Hankle_Matrix_n);
Hankle_Matrix = zeros(Hankle_Matrix_n, Hankle_Matrix_n);
for i = 1:Hankle_Matrix_n
    Hankle_Matrix(i,:) = Markov_series(i:Hankle_Matrix_n+i-1);
end
[U,S,V] = svd(Hankle_Matrix);
s = svd(Hankle_Matrix);
k = 1:Hankle_Matrix_n;
plot(k,s);


