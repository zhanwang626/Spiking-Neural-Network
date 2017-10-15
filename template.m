% for m = 1 : 1 :100    
%     for i = 1 : 1 : 10
%         [val,maxT,maxU] = tempotron(spiking(i,:), W(3,:));
%         if i == 3
%            if val == 0
%                W(3,:) = train(spiking(i,:), W(3,:), label2);
%            end
%         else
%            if val == 1
%                W(3,:) = train(spiking(i,:), W(3,:), label1);
%            end                
%         end
%     end
% end
% save W_new W;
    for j = 1 : 1 : 10
        val = tempotron(spiking(j,:),W(3,:));
        fprintf('%d\t',val);
    end