%(rows,iterations,xnot,Transition matrix)
function out = graphmyrows(n,iter,xnot,transm)
figure
hold on
days=zeros([n,iter+1]);
days(:,1)=xnot;
for(w=2:iter+1)
    days(:,w)=transm^w*xnot;
end
plot(0:length(days(:,:))-1,days(:,:),'linewidth',2.0)
if(n==4)
    legend('Suceptible', 'Exposed', 'Infected', 'Recovered');
end
if(n==6)
    legend('Suceptible', 'Exposed', 'Infected', 'Recovered', 'Vacinated', 'Immune');
end
title('Probability of being in each state at a given iteration');
xlabel("Iteration")
ylabel("Probability")
hold off

out = days;
end