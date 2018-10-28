function [bestIndividual,bestFit]=bestCal(group,fitValue)
[raw,col]=size(group);
bestIndividual=group(1,:);
bestFit=fitValue(1);
for i=2:raw
    if(fitValue(i)>bestFit)
        bestIndividual=group(i,:);
        bestFit=fitValue(i);
    end
end



















