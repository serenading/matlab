% loads previously saved ClusterProportion calculations from 
% the .mat file and returns a graph with multiple subplots visualising it

close all
clear

strains = {'N2','npr1'};
wormnums = {'40','HD'};
for numCtr = 1:length(wormnums)
    wormnum = wormnums{numCtr};
    for strainCtr = 1:length(strains)
        strain = strains{strainCtr};
        filename = strcat('TrackingQualityRed_ClusterProportion_',strain,'_',wormnum,'_withoutIsGoodSke.mat');
        load(filename);
        D(1:numel(clusterProportion(:,1)),((numCtr-1)*length(strains)+strainCtr)) = clusterProportion(:,1);
    end
end
D(D==0)=NaN;
figure;
labels = {'N2_40','npr1_40','N2_200','npr1_200'};
boxplot(D*100,'Labels',labels)
xlabel('strain/density')
ylabel('worms inside a cluster (%)')
ylim([0 100])
savefig('ClusterProportionsGreenSummary');