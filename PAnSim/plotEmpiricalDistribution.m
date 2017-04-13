function [] = plotEmpiricalDistribution (respTimes)

RT = testArrivalFrequence (respTimes);
RT=sortRandVar(RT);
uCDFrt = unuMinusCDF(RT);

plot(uCDFrt(1,:),uCDFrt(2,:));

end