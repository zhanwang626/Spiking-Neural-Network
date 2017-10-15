%将十个光学字符图片编码成时间脉冲
%[spikes1,pixelnum1] = encoder(image1);
%[spikes4,pixelnum4] = encoder(image4);
%[spikes5,pixelnum5] = encoder(image5);
%[spikes6,pixelnum6] = encoder(image6);
%[spikes7,pixelnum7] = encoder(image7);
%[spikes8,pixelnum8] = encoder(image8);
%[spikes9,pixelnum9] = encoder(image9);
%[spikes10,pixelnum10] = encoder(image10);
%spiking = [spikes1; spikes2; spikes3; spikes4; spikes5; spikes6; spikes7; spikes8; spikes9; spikes10];
%save spiking spiking;

label1 = 0;%标签1为不点火，若测试样本点火则调整权重
label2 = 1;%标签2为点火，若测试样本点火则调整权重

% 随机生成10组权重值 
% w1 = rand(1,400);
% w2 = rand(1,400);
% w3 = rand(1,400);
% w4 = rand(1,400);
% w5 = rand(1,400);
% w6 = rand(1,400);
% w7 = rand(1,400);
% w8 = rand(1,400);
% w9 = rand(1,400);
% w10 = rand(1,400);
% W = [w1; w2; w3; w4; w5; w6; w7; w8; w9; w10];


%训练十个输出神经元识别image1~10，使对应序号神经元点火，其他不点火
for k = 1 : 1 : 300 %100次训练
    for i = 1 : 1 : 10 %10个输出神经元
        for j = 1 : 1 : 10 %10个脉冲时间序列 
            [val,maxT,maxU] = tempotron(spiking(j,:), W(i,:));
            if j == i
                if val == 0
                    W(i,:) = train(spiking(j,:), W(i,:), label2);
                    %[val,maxT,maxI,U1,T1] = tempotron(spiking(j,:),W(i,:));
                    %plot(T1,U1),xlabel('时间(ms)'),ylabel('模电压(mv)');
                end
            else
                if val == 1
                    W(i,:) = train(spiking(j,:), W(i,:), label1);
                    %[val,maxT,maxI,U1,T1] = tempotron(spiking(j,:),W(i,:));
                    %plot(T1,U1),xlabel('时间(ms)'),ylabel('模电压(mv)');
                end                
            end
        end
    end
    %resultname = strcat('w_',num2str(k),'.mat');
    %save(resultname,'W');
end
save W_new W;


