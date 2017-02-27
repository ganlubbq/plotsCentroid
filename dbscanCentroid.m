function [combineGroup, objectCell, object] = dbscanCentroid(data, AM_init, deltaR, deltaAZI)
disDoor = 1;
aziDoor = 1;
vDoor = 2;
[class, type] = dbscan(data, 4, sqrt(disDoor^2 + aziDoor^2 + vDoor^2));
clusternum = max(class); %�ۺϺ�ص�����
if clusternum ~= -1
    objectCell = cell(1, clusternum);%��Ÿ����ص�cell��Ԫ
    %objectSize = zeros(1, clusternum); %��������صĴ�ųߴ磬�û������ĵ㼣����
    %��Ŀ�����dbscan������class�����ֱ�ֵ���Ӧ��cell�ص�Ԫ��
    for j = 1:size(data,1)
        if class(j) ~= -1
            if isempty(objectCell{class(j)})
                objectCell{class(j)} = [data(j,:) AM_init(j)];
            else
                objectCell{class(j)} = [objectCell{class(j)}; data(j,:) AM_init(j)];
            end
        end
    end
else
    objectCell = [];
    clusternum = 0;
end
deltaam = 20;
object = {};
for i = 1:clusternum
    group = {objectCell{i}(1,:)};
    if size(objectCell{i},1) > 1
        for k = 2:size(objectCell{i},1)
            flag = 0;
            for j = 1:length(group)
                if abs(objectCell{i}(k, 4) - group{j}(end, 4)) <= deltaam
                    group{j} = [group{j}; objectCell{i}(k, :)];
                    flag = 1;
                    break;
                end
            end
            if flag == 0
                group = [group objectCell{i}(k, :)];
            end
        end
    end
    object = [object group];
end

combineGroup = [];
for j = 1:length(object)
    cludis = object{j}(:,1);%ȡ���еľ���ά
    cluazi = object{j}(:,2);%ȡ���еķ�λ��
    cluv = object{j}(:,3);%ȥ���е��ٶ�ά
    cluam = object{j}(:,4);
    clusterDis = max(cludis) - min(cludis);
    clusterAzi = max(cluazi) - min(cluazi);
    if clusterDis == 0 
      clusterDis = deltaR;
    end
    if clusterAzi == 0
       clusterAzi = deltaAZI; 
    end
    [centerDis, centerAzi, centerV] = centerOfMass(cludis, cluazi, cluv, cluam);
    combineGroup = [combineGroup; centerDis centerAzi centerV mean(cluam) clusterDis clusterAzi];
end
end