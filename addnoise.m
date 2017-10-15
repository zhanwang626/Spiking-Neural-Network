function sample = addnoise(spikes) 
%I = open('image1.fig');
%simple1_003 = imnoise(I,'gaussian',0.03);
%save simple1_003 simple1_003;
    B = 0.4 * randn(size(spikes));
    sample = B + spikes;
end
