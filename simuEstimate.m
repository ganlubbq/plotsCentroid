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

figure(1);
[centerDis, centerAzi] = centerOfMass(R, AZI, Am);
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
xlabel('����/m');
ylabel('�Ƕ�/��');