%%%%%%%%%%%%%%%%%%%%%%%
%%% Author: Chao Li %%%
%%%%%%%%%%%%%%%%%%%%%%%
%������N��Ŀ������ɸ��㼣
function [R_init, AZI_init, V_init, AM_init, objectSizeinfo] = getUnusalInitObject(objectNum, map_length, map_azi, deltaR, deltaAZI)
vmin = 4;
vmax = 20;
ammin = 150;
ammax = 500;
R_init = []; %Ŀ��ĳ�ʼ����
AZI_init = [];%Ŀ��ĳ�ʼ��λ
V_init = []; %Ŀ��ĳ�ʼ�ٶ�
AM_init = [];%Ŀ��ķ�����Ϣ
maxIndexL = fix(0.8*map_length / deltaR); %���ȡ��Ŀ��ĺ���������Χ������ȡ���߽�ļ������
minIndexL = fix(0.2*map_length / deltaR);
maxIndexAZI = fix(0.8*map_azi / deltaAZI);
minIndexAZI = fix(0.2*map_azi / deltaAZI);
objectSizeinfo = ones(objectNum, 1);
for i = 1:objectNum
    R = randi([minIndexL maxIndexL])*deltaR; %Ŀ��ĳ�ʼ������룬ȡ�˶�ģ�ͷֱ��ʵ���������ȷ����������
    AZI = randi([minIndexAZI maxIndexAZI])*deltaAZI; %Ŀ��ĳ�ʼ�������
    V = randi([vmin vmax]); %Ŀ��ĳ�ʼ�ٶ�
    AM = randi([ammin ammax]);
    width1 = randi([4 5])*deltaR; %Ŀ���С
    length1 = randi([11 15])*deltaR; %Ŀ���С
    
%    fprintf('��%d��Ŀ�����ϢΪ(%f, %f, %f, %f)����СΪ%d\n', i, R, AZI, V, AM, objectSize*2);
%    objectSizeinfo(i, 1) = 2*objectSize;
    [rinit1, aziinit1, vinit1, aminit1] = getSqurePoints(width1, length1, R, AZI, V, AM, deltaR, deltaAZI);
    [rinit2, aziinit2, vinit2, aminit2] = getSqurePoints(width1, length1, R - length1, AZI, V, AM, deltaR, deltaAZI);
    [rinit3, aziinit3, vinit3, aminit3] = getSqurePoints(length1 + width1 , width1, R - length1/2, AZI + length1/2 + width1/2 , V, AM, deltaR, deltaAZI);
%    pointNum = size(rinit, 1);%��Ŀ��ĵ㼣��
    R_init = [R_init; rinit1; rinit2; rinit3];
    AZI_init = [AZI_init; aziinit1; aziinit2; aziinit3];
    V_init = [V_init; vinit1; vinit2; vinit3];
    AM_init = [AM_init; aminit1; aminit2; aminit3];
end
end