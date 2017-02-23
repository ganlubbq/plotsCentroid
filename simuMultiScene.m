clear;
close all;
points = [90  10   10   400;
    91  10.2 9.8  405;
    92  10.4 10.2 398;
    88  9.6  10   402
    89  9.8  9.8  403];%[���� �Ƕ� �ٶ� ����]
R = points(:,1)';
AZI = points(:,2)';
V = points(:,3)';
Am = points(:,4)';
realR = geomean(R);
realAZI = geomean(AZI);

%% ��������
figure(1);
[centerDis, centerAzi, centerV] = centerOfMass(R, AZI, V, Am);
[new2Dis, new2Azi] = group2Estimation(R, AZI, Am);
[newDis, newAzi, aveVel] = groupEstimation(R, AZI, V, Am);
plot(R,AZI, '*');
xlabel('����R/m');
ylabel('�Ƕ�\theta/\circ');
axis([85 95 9 11]);
hold on;
plot(centerDis, centerAzi, '^');
hold on;
plot(new2Dis, new2Azi, 'ro');
hold on;
plot(newDis, newAzi, 'rh');
legend('ԭʼ�㼣','���ķ�','��ά��Ȩ�㷨', '��ά��Ȩ�㷨');
deltaRpure = [abs(centerDis - realR) abs(new2Dis - realR) abs(newDis - realR)]
deltaAZIpure = [abs(centerAzi - realAZI) abs(new2Azi - realAZI) abs(newAzi - realAZI)]

%% ����ǿ�Ӳ�
falsePoints = [95  8.5   2   600];
R = [points(:,1)' falsePoints(:, 1)'];
AZI = [points(:,2)' falsePoints(:, 2)'];
V = [points(:,3)' falsePoints(:, 3)'];
Am = [points(:,4)' falsePoints(:, 4)'];
[centerDis, centerAzi, centerV] = centerOfMass(R, AZI, V, Am);
[new2Dis, new2Azi] = group2Estimation(R, AZI, Am);
[newDis, newAzi, aveVel] = groupEstimation(R, AZI, V, Am);
figure(2)
plot(R,AZI, '*');
xlabel('����R/m');
ylabel('�Ƕ�\theta/\circ');
axis([85 98 8 11]);
hold on;
plot(centerDis, centerAzi, '^');
hold on;
plot(new2Dis, new2Azi, 'ro');
hold on;
plot(newDis, newAzi, 'rh');
legend('ԭʼ�㼣','���ķ�','��ά��Ȩ�㷨', '��ά��Ȩ�㷨');
deltaRstrong = [abs(centerDis - realR) abs(new2Dis - realR) abs(newDis - realR)]
deltaAZIstrong = [abs(centerAzi - realAZI) abs(new2Azi - realAZI) abs(newAzi - realAZI)]
%% �������Ӳ�
falsePoints = [95  8.5  2   80
               96  8.7  3   81
               97  8.8  3.5 82
               96  8.9  4   83];
R = [points(:,1)' falsePoints(:, 1)'];
AZI = [points(:,2)' falsePoints(:, 2)'];
V = [points(:,3)' falsePoints(:, 3)'];
Am = [points(:,4)' falsePoints(:, 4)'];
[centerDis, centerAzi, centerV] = centerOfMass(R, AZI, V, Am);
[new2Dis, new2Azi] = group2Estimation(R, AZI, Am);
[newDis, newAzi, aveVel] = groupEstimation(R, AZI, V, Am);
figure(3)
plot(R,AZI, '*');
xlabel('����R/m');
ylabel('�Ƕ�\theta/\circ');
axis([85 98 8 11]);
hold on;
plot(centerDis, centerAzi, '^');
hold on;
plot(new2Dis, new2Azi, 'ro');
hold on;
plot(newDis, newAzi, 'rh');
legend('ԭʼ�㼣','���ķ�','��ά��Ȩ�㷨', '��ά��Ȩ�㷨');
deltaRweak = [abs(centerDis - realR) abs(new2Dis - realR) abs(newDis - realR)]
deltaAZIweak = [abs(centerAzi - realAZI) abs(new2Azi - realAZI) abs(newAzi - realAZI)]