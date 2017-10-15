function w = adjust_new(spikes,w,val,maxT,maxU)
    lambda = 0.05;
    thes = 1;
    spikenum = size(spikes,2);
    %如果不点火，则调整权重增大w，使其点火
    if val == 0
        for i = 1 : 1 : spikenum
            if spikes(i)<maxT
                %动态调整权值
                w(i) = w(i) + (thes-maxU) * lambda * k(maxT-spikes(i));
            end
        end
    %反之，则减小w，使其抑制
    else
        for i = 1 : 1 : spikenum
            if spikes(i)<maxT
                if maxU > thes
                    w(i) = w(i) - (maxU-thes) * lambda * k(maxT-spikes(i));
                else
                    w(i) = w(i) - lambda * k(maxT-spikes(i));
                end
            end
        end
     end
end