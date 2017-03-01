%%%%%%%%%%%%%%%%%%%%%%%
%%% Author: Chao Li %%%
%%%%%%%%%%%%%%%%%%%%%%%
%��ָ���뾶�ڣ�����������ɸ�����ĵ�,һ���ֱ�����ֻ����һ����
function [rinit, aziinit, vinit, aminit] = getSqurePoints(width1, length1, R, AZI, V, AM, deltaR, deltaAZI)
%radius = objectSize; %����İ뾶
rinit = [];
aziinit = [];
vinit = [];
aminit = [];
%aziradius = fix(radius/R*180/pi/2);
for i = R - width1/2:deltaR: R + width1/2
    for j = AZI - length1/2 :deltaAZI: AZI + length1/2
        rinit = [rinit; i];
        aziinit = [aziinit; j];
        vinit = [vinit; V + randi([-1 1])];
        aminit = [aminit; AM + randi([-10 10])];
        
    end
end