%%%%%%%%%%%%%%%%%%%%%%%
%%% Author: Chao Li %%%
%%%%%%%%%%%%%%%%%%%%%%%
%������N��Ŀ������ɸ��㼣
function [R_init, AZI_init, V_init, AM_init, objectSizeinfo] = getRandomInitObject(objectNum, map_length, map_azi, deltaR, deltaAZI)
vmin = 4;
vmax = 10;
ammin = 200;
ammax = 500;
R_init = []; %Ŀ��ĳ�ʼ����
AZI_init = [];%Ŀ��ĳ�ʼ��λ
V_init = []; %Ŀ��ĳ�ʼ�ٶ�
AM_init = [];%Ŀ��ķ�����Ϣ
maxIndexL = fix(0.9*map_length / deltaR); %���ȡ��Ŀ��ĺ���������Χ������ȡ���߽�ļ������
minIndexL = fix(0.1*map_length / deltaR);
maxIndexAZI = fix(0.9*map_azi / deltaAZI);
minIndexAZI = fix(0.1*map_azi / deltaAZI);
objectSizeinfo = ones(objectNum, 1);
for i = 1:objectNum
    R = randi([minIndexL maxIndexL])*deltaR; %Ŀ��ĳ�ʼ������룬ȡ�˶�ģ�ͷֱ��ʵ���������ȷ����������
    AZI = randi([minIndexAZI maxIndexAZI])*deltaAZI; %Ŀ��ĳ�ʼ�������
    V = randi([vmin vmax]); %Ŀ��ĳ�ʼ�ٶ�
    AM = randi([ammin ammax]);
    objectSize = randi([2 9])*deltaR; %Ŀ���С
    objectSizeinfo(i, 1) = 2*objectSize;
    [rinit, aziinit, vinit, aminit] = getRandomPoints(2*objectSize, R, AZI, V, AM, deltaR, deltaAZI);
    pointNum = size(rinit, 1);%��Ŀ��ĵ㼣��
    R_init = [R_init; rinit];
    AZI_init = [AZI_init; aziinit];
    V_init = [V_init; vinit];
    AM_init = [AM_init; aminit];
end
end