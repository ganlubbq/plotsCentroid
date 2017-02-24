%%%%%%%%%%%%%%%%%%%%%%%
%%% Author: Chao Li %%%
%%%%%%%%%%%%%%%%%%%%%%%
%��ָ���뾶�ڣ�����������ɸ�����ĵ�,һ���ֱ�����ֻ����һ����
function [rinit, aziinit, vinit, aminit] = getRandomPoints(objectSize, R, AZI, V, AM, deltaR, deltaAZI)
radius = objectSize; %����İ뾶
rinit = [];
aziinit = [];
vinit = [];
aminit = [];
aziradius = fix(radius/R*180/pi/2);
for i = R - radius:deltaR: R + radius
    for j = AZI - aziradius:deltaAZI: AZI + aziradius
        flag = randi([0 1]);
        if flag == 1
            rinit = [rinit; i];
            aziinit = [aziinit; j];
            vinit = [vinit; V + randi([-2 2])];
            aminit = [aminit; AM + randi([-10 10])];
        end
    end
end