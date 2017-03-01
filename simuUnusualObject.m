clc
clear
close all;
deltaR = 1;
deltaAZI = 1;
[R_init, AZI_init, V_init, AM_init, objectSizeinfo] = getUnusalInitObject(1, 100, 90,deltaR, deltaAZI);
data = [R_init AZI_init V_init];
% resolutionR = 1;
% resolutionAzi = 1;
% deltafd = 4;
% deltaA = 30;
figure(1)
plot(AZI_init,R_init, '*');
axis([0 100 0 100]);
ylabel('����/m');
xlabel('��λ��/��');
%% �ܶȾ��෽��
[combineGroup, objectCell, object] = dbscanCentroid(data, AM_init, deltaR, deltaAZI);
figure(2);
axis([0 100 0 100]);
ylabel('����/m');
xlabel('��λ��/��');
for i = 1:size(combineGroup, 1)
    rectangle('Position', [combineGroup(i,2) - combineGroup(i, 6)/2, combineGroup(i,1) - combineGroup(i, 5)/2, combineGroup(i, 6), combineGroup(i, 5)]);
    hold on;
end
%% ��ͳ���෽��
combineGroup1 = traCentroid(data, AM_init);
figure(3)
axis([0 100 0 100]);
ylabel('����/m');
xlabel('��λ��/��');
for i = 1:size(combineGroup1, 1)
    rectangle('Position', [combineGroup1(i,2) - combineGroup1(i, 6)/2, combineGroup1(i,1) - combineGroup1(i, 5)/2, combineGroup1(i, 6), combineGroup1(i, 5)]);
    hold on;
end