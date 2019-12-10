clear
clc
close all

tran = [.7 .4 0 .2;.3 0 0 0 ;0 .3 0 0 ; 0 .3 1 .8];
state = [1;0;0;0];

%The eigenvalues of the transition matrix
eigenval = eig(tran);

%We know that the eigenvalue when calcluating X_infinity is 1
[alleigenvec,alleigenval] = eig(tran);

eigenvecof1 = alleigenvec(:,3);
S = sum(eigenvecof1);
for i=1:4
    Xinfinity(i) = eigenvecof1(i)/S;
end





