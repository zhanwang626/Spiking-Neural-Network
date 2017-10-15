function [spikes,pixelnum] = encoder(img)
    spikes = [];
    I = [];
    [x,y] = size(img);
    pixelnum = x * y; 
    pixel = reshape(img',1,pixelnum);
    phi = linspace(0,0,pixelnum);
    a=1;
    w=pi/100;
    for i = 1 : 1 : pixelnum
        phi(i) = (i-1)*(2*pi/pixelnum);
        if pixel(i) == 0 
            for t = 0.1 : 0.1 : 200
                osc(i) = a * cos(w * t + phi(i));
                if osc(i) <= -0.99
                    spikes = [spikes t];
                    break;
                end    
            end
        else
            for t = 0.1 : 0.1 : 200
                osc(i) = a * cos(w * t + phi(i));
                if osc(i) >= 0.99
                    spikes = [spikes t];
                    break;
                end    
            end
        end
        I = [I i];
        plot(spikes,I),xlabel('时间(ms)'),ylabel('像素点(个数)');
        
    end
  
    