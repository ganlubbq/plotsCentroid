function observeValue = getObserveValue(value, resolution)
%���ݷֱ��ʣ���ȡʵ��ֵ�ڵ�ǰ�ֱ��������»�ȡ���Ĺ۲�ֵ
observeValue = floor(value/resolution)*resolution + 0.5*resolution;
end