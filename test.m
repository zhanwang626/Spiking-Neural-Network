%≤‚ ‘
%[spikes1,pixelnum1] = encoder(image1);
%[spikes2,pixelnum2] = encoder(image2);
%[spikes3,pixelnum3] = encoder(image3);
%[spikes4,pixelnum4] = encoder(image4);
%[spikes5,pixelnum5] = encoder(image5);
%[spikes6,pixelnum6] = encoder(image6);
%[spikes7,pixelnum7] = encoder(image7);
%[spikes8,pixelnum8] = encoder(image8);
%[spikes9,pixelnum9] = encoder(image9);
%[spikes10,pixelnum10] = encoder(image10);
%save spikes1 spikes1
%save spikes2 spikes2
%save spikes3 spikes3
%save spikes4 spikes4
%save spikes5 spikes5
%save spikes6 spikes6
%save spikes7 spikes7
%save spikes8 spikes8
%save spikes9 spikes9
%save spikes10 spikes10
%[spikes,pixelnum] = encoder(image10);
%[spikes,pixelnum] = encoder(sample3);
for i = 1 : 1 : 10
    for j = 1 : 1 : 10
        %val = tempotron(spiking(i,:),W(j,:));
        val = tempotron(sample(i,:),W(j,:));
        fprintf('%d\t',val);
    end
    fprintf('\n');
end

