function spikes = encoding(img)
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
        osci=1;
        if(pixel(i)==0)
            osci=-1;
            osci =osci*a;
            if phi(i) > pi
                t = (acos(osci/a) + 2 * pi - phi(i))/w;
                result = (w * t + phi(i))/100;
                t = t + fix(result) * 100; 
            else
                t = (acos(osci/a) - phi(i))/w;
                result = (w * t + phi(i))/100;
                t = t + fix(result) * 100;
            end
        else
            osci =osci*a;
            t = (acos(osci/a) + 2 * pi - phi(i))/w;
            result = (w * t + phi(i))/100;
            t = t + fix(result) * 100;
        end
        spikes = [spikes t];
        I = [I i];
        plot(spikes,I),xlabel('时间(ms)'),ylabel('像素点(个数)');
        plot(spikes);
    end
end
