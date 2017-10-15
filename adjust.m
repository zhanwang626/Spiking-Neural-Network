function w = adjust(spikes,w,val,maxT)
    lambda = 0.05;
    spikenum = size(spikes,2);
    %如果不点火，则调整权重增大w，使其点火
    if val == 0
        for i = 1 : 1 : spikenum
            if spikes(i)<maxT
                w(i) = w(i) + lambda * k(maxT-spikes(i));
            end
        end
    %反之，则减小w，使其抑制
    else
        for i = 1 : 1 : spikenum
            if spikes(i)<maxT
                w(i) = w(i) - lambda * k(maxT-spikes(i));
            end
        end
     end
end