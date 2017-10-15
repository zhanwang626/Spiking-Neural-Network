function [val,maxT,maxU] = tempotron(spikes,w)
% val 返回是否点火，点火1，不点火0，保存每个时刻的膜电压，并返回
% maxT 最大膜电压出现的时间
% maxI 最大膜电压出现的脉冲序号
    %阈值
    thes = 1;
    %rest        
    urest = 0;
    spikenum = size(spikes,2);
    T = [];
    U = [];
    val = 0;
    maxT = 0;
    maxU = 0;
    to = 200;
    for t = 0 : 1 : 200
        u = 0;
        for i = 1 : 1 : spikenum
            %点火后的神经元不起作用
            if t > spikes(i)  && spikes(i) <= to    
                    u = u + w(i)*k(t-spikes(i));
            end
        end
        u = u + urest;
        if u >= thes
            to = t;
            val = 1;
        end
        if u > maxU
            maxU = u;
            maxT = t;
        end
    end
end