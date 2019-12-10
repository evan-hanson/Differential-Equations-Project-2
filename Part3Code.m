%%3.1a
clear
clc
close all
%transition matrix
tran = [.7 .4 0 .2;.3 0 0 0 ;0 .3 0 0 ; 0 .3 1 .8];

%state Vecotor for 3.1a
state1 = [1;0;0;0];

%3.1b
state2 = [.15;.85;0;0];

XnState1 = graphmyrows(4,31,state1,tran);
XnState2 = graphmyrows(4,31,state2,tran);

%Useing function SEIRmarkov
[Stationary1,ten1] = SEIRmarkov(state1,tran,31);
[Stationary2,ten2] = SEIRmarkov(state2,tran,31);

%%
%3.4d
%We know that the eigenvalue when calcluating X_infinity is 1
[alleigenvec,~] = eig(tran);
alleigenval = eig(tran);

for i=1:4
  temp = alleigenval(i);
    if temp == max(alleigenval)
       lambda1loc = i;
    end
end

eigenvecof1 = alleigenvec(:,lambda1loc);
S = sum(eigenvecof1);
Xinfinity = zeros(4,1);
for i=1:4
    Xinfinity(i) = eigenvecof1(i)/S;
end

AbsError1 = zeros(4,32);
%Initial Condition S=1
for j=1:32
    for i=1:4
        AbsError1(i,j)= abs(Xinfinity(i)-XnState1(i,j));
    end
end
figure
semilogy(0:length(AbsError1(:,:))-1,AbsError1(:,:),'linewidth',2.0)
title("Absolute Error of the SEIR model")
legend('Suceptible', 'Exposed', 'Infected', 'Recovered');
xlabel("Iteration")
ylabel("Absolute Error")
%Initial Condition S=0.15 E=0.85
AbsError2 = zeros(4,32);
for j=1:32
    for i=1:4
        AbsError2(i,j)= abs(Xinfinity(i)-XnState2(i,j));
    end
end
figure
semilogy(0:length(AbsError2(:,:))-1,AbsError2(:,:),'linewidth',2.0)
title("Absolute Error of the SEIR model")
legend('Suceptible', 'Exposed', 'Infected', 'Recovered');
xlabel("Iteration")
ylabel("Absolute Error")
%%
tranIm = [.7 .4 0 .1 0;.3 0 0 0 0 ;0 .3 0 0 0 ; 0 .3 1 .8 0; 0 0 0 .1 1];
state3 = [1;0;0;0;0];
Stationary3 = SEIRmarkov(state3,tranIm,250);

graphmyrows(5,250,state3,tranIm);
