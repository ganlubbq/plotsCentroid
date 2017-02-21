%����4���㼣������һ��Ϊ��ٵ㼣���ֱ�ͨ���ı���ٵ���ķ�ֵ�����룬�Ƕȣ����ж����㷨������ٵ����Ӧ��
clear;
close all;
points = [90  1   10   400;
    92  1.1 9.8  405;
    94  1.4 10.2 398;
    97  2   30    500];%[���� �Ƕ� �ٶ� ����],���һ��Ϊ��ٵ�
R = points(:,1)';
AZI = points(:,2)';
V = points(:,3)';
Am = points(:,4)';
realR = mean(R(1:3));
realAZI = mean(AZI(1:3));
realV = mean(AZI(1:3));
realAm = mean(Am(1:3));
varrealAm = sum((Am(1:3) - realAm).^2)/3;
sigma = sqrt(varrealAm);
%% an example
figure(1);
[centerDis, centerAzi, centerV] = centerOfMass(R, AZI, V, Am);
[new2Dis, new2Azi] = group2Estimation(R, AZI, Am);
[newDis, newAzi, aveVel] = groupEstimation(R, AZI, V, Am);
plot(R,AZI, '*');
hold on;
% plot(mean(R), mean(AZI), 'd');
% hold on;
plot(centerDis, centerAzi, '^');
hold on;
plot(new2Dis, new2Azi, 'ro');
hold on;
plot(newDis, newAzi, 'rh');
legend('ԭʼ�㼣','���ķ�','��ά��Ȩ�㷨', '��ά��Ȩ�㷨');
axis([88 102 0.5 3]);
xlabel('����R/m');
ylabel('�Ƕ�\theta/\circ');

%% amplitutde variation
deltaA = -200:40:300;
deltaAngleCenter = zeros(1,length(deltaA));
deltaAnglenew2 = zeros(1,length(deltaA));
deltaAnglenew = zeros(1,length(deltaA));
deltaRCenter = zeros(1,length(deltaA));
deltaRnew2 = zeros(1,length(deltaA));
deltaRnew = zeros(1,length(deltaA));
deltaVCenter = zeros(1, length(deltaA));
deltaVnew = zeros(1, length(deltaA));
for i = 1:length(deltaA)
    Am1 = Am;
    Am1(end) = Am1(end) + deltaA(i);
    [centerDis, centerAzi, centerV] = centerOfMass(R, AZI, V, Am1);
    [new2Dis, new2Azi] = group2Estimation(R, AZI, Am1);
    [newDis, newAzi, newV] = groupEstimation(R, AZI, V, Am1);
    deltaAngleCenter(i) = centerAzi - realAZI;
    deltaAnglenew2(i) = new2Azi - realAZI;
    deltaAnglenew(i) = newAzi - realAZI;
    deltaRCenter(i) = centerDis - realR;
    deltaRnew2(i) = new2Dis - realR;
    deltaRnew(i) = newDis - realR;
    deltaVCenter(i) = centerV - realV;
    deltaVnew(i) = newV - realV;
end
figure(2)
plot(deltaA, deltaAngleCenter, '-^');
hold on;
plot(deltaA, deltaAnglenew2, '-*');
hold on;
plot(deltaA, deltaAnglenew, '-ro');
xlabel('\Delta A');
ylabel('\Delta \theta(\circ)');
legend('���ķ�', '��ά��Ȩ�㷨', '��ά��Ȩ�㷨');
figure(3)
plot(deltaA, deltaRCenter, '-^');
hold on;
plot(deltaA, deltaRnew2, '-*');
hold on;
plot(deltaA, deltaRnew, '-ro');
xlabel('\Delta A');
ylabel('\Delta R(m)');
legend('���ķ�', '��ά��Ȩ�㷨', '��ά��Ȩ�㷨');
figure(4)
plot(deltaA, deltaVCenter, '-*');
hold on;
plot(deltaA, deltaVnew, '-ro');
xlabel('\Delta A');
ylabel('\Delta V(m/s)');
legend('���ķ�', '��ά��Ȩ�㷨');