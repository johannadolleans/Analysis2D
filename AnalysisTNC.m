function AnalysisTNC = AnalysisTNC(trialname)
% trialname=strcat(trialname,'_releases');
result=load(trialname);

            xtarget = .0;
            ytarget = .89;
Velo=Velocityxyz(trialname);
for i = 1:size(result)
    r(i)=sqrt(result(i,4)^2+result(i,5)^2);
%    A(i,1)=atan2(result(i,4),result(i,5))*180/pi;
     A(i,1)=asin(result(i,5)/r(i))*360/pi%Calucltaion of alpha using x and y
     A(i,2)=Velo(i,2);%VXY
     A(i,3)=result(i,12);%Error  
end

% for i = 1:length(releaseData)
%     A(i,1)=releaseData(i,2); %angle
%     A(i,2)=releaseData(i,3); %velocity
%     A(i,3)=releaseData(i,4); %error
% end
     C=covariationCost(0,A,xtarget,ytarget);
%      N=noiseCost(0,A,xtarget,ytarget);
    d=generateSolM([xtarget, ytarget]);
%     d=d';
     T=toleranceCost(0,A,d);
% %      AnalysisTNC=[T,N,C]
% % figure (2)
% % openfig('SolMan.38.43.fig') %in centimeters
% % hold on;
% % A(:,1)=A(:,1);
% % A(:,2)=A(:,2);
% % plot(A(:,1),A(:,2), 'rd', 'MarkerSize', 2.5)
% scatter(A(:,1),A(:,2))
C
T
end