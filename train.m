function w = train(spikes,w,label)
% 训练过程
% w，初始权重，需要通过训练调整权重
% label,样本所属标签，0或1两种
    %计算膜电压，返回是否点火和最大膜电压出现的时间
    [val,maxT,maxU] = tempotron(spikes,w);
    %根据输出结果调整权重，当输出与标签不匹配，一直训练，直到结果符合要求
    while val ~= label;  %输出和标签不一致，调整权值
        %w = adjust(spikes,w,val,maxT);  %调整权重
        w = adjust_new(spikes,w,val,maxT,maxU);  %调整权重
        [val,maxT,maxU] = tempotron(spikes,w);%计算膜电压，返回是否点火和最大膜电压出现的时间
    end
end


