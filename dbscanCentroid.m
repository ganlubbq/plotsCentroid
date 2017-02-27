function combineGroup = dbscanCentroid(data, AM_init)
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

combineGroup = [];
for j = 1:clusternum
    cludis = objectCell{j}(:,1);%ȡ���еľ���ά
    cluazi = objectCell{j}(:,2);%ȡ���еķ�λ��
    cluv = objectCell{j}(:,3);%ȥ���е��ٶ�ά
    cluam = objectCell{j}(:,4);
    clusterDis = max(cludis) - min(cludis);
    clusterAzi = max(cluazi) - min(cluazi);
    [centerDis, centerAzi, centerV] = centerOfMass(cludis, cluazi, cluv, cluam);
    combineGroup = [combineGroup; centerDis centerAzi centerV mean(cluam) clusterDis clusterAzi];
end
end