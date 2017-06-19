prefix = 'Scene_4_MI_Dataset';
 
trans   = [prefix '_trans.avi'];
metal   = [prefix '_metal.avi'];
weather = [prefix '_weather.avi'];

v_trans = VideoReader(trans);
v_metal = VideoReader(metal);
v_weather = VideoReader(weather);

i = 1;
mov = struct('cdata',zeros(v_trans.Height,v_trans.Width,3,'uint8'),...
    'colormap',[]);

place = [300 460];
placepeak = [300+80 460];
%% Showing transperent %%
text = 'Original          Translucent';
for ftrans = 1:v_trans.Duration * v_trans.FrameRate
    frame = read(v_trans, ftrans);
    if rem(ftrans, 9) == 0
        index = strfind(text, ' ');
        index = index(1);
        text(index) = '.';
    end
    mov(i).cdata = insertText(frame, place, text, 'FontSize',22);
    i = i+1;
    disp(i);
end

%% Showing peak of Transperency for half second %%
text = 'Translucent';
peaktrans = read(v_trans, v_trans.Duration * v_trans.FrameRate);
for j = 1:50
    mov(i).cdata = insertText(peaktrans, placepeak, text, 'BoxColor', 'magenta', 'FontSize',22);
    i = i+1; disp(i);
end
    
text = 'Original..........Translucent';
for ftrans = v_trans.Duration * v_trans.FrameRate: -1: 1
    if rem(ftrans, 9) == 0
        index = strfind(text, '.');
        index = index(end);
        text(index) = ' ';
    end
    mov(i).cdata = insertText(read(v_trans, ftrans), place, text, 'FontSize',22);
    i = i+1;
    disp(i);
end

text = 'Original          Metallic';
for fmetal = 1:v_metal.Duration * v_metal.FrameRate
    if rem(fmetal, 9) == 0
        index = strfind(text, ' ');
        index = index(1);
        text(index) = '.';
    end
    mov(i).cdata = insertText(read(v_metal, fmetal), place, text, 'FontSize',22);
    i=i+1;
    disp(i);
end

%% Showing peak of Metallic-Look for half second %%
text = 'Metallic';
peakmetal = read(v_metal, v_metal.Duration * v_metal.FrameRate);
for j = 1:50
    mov(i).cdata = insertText(peakmetal, placepeak, text, 'BoxColor', 'magenta', 'FontSize',22);
    i = i+1; disp(i);
end

text = 'Original..........Metallic';
for fmetal = v_metal.Duration * v_metal.FrameRate: -1: 1
    if rem(fmetal, 9) == 0
        index = strfind(text, '.');
        index = index(end);
        text(index) = ' ';
    end
    mov(i).cdata = insertText(read(v_metal, fmetal), place, text, 'FontSize',22);
    i = i+1;
    disp(i);
end

text = 'Original          Weathered';
for fweather = 1:v_weather.Duration * v_weather.FrameRate
    if rem(fweather, 9) == 0
        index = strfind(text, ' ');
        index = index(1);
        text(index) = '.';
    end
    mov(i).cdata = insertText(read(v_weather, fweather), place, text, 'FontSize',22);
    i=i+1;
    disp(i);
end


%% Showing peak of Metallic-Look for half second %%
text = 'Weathered';
peakweather = read(v_weather, v_weather.Duration * v_weather.FrameRate);
for j = 1:50
    mov(i).cdata = insertText(peakweather, placepeak, text, 'BoxColor', 'magenta', 'FontSize',22);
    i = i+1; disp(i);
end

text = 'Original..........Weathered';
for fweather = v_weather.Duration * v_weather.FrameRate: -1: 1
    if rem(fweather, 9) == 0
        index = strfind(text, '.');
        index = index(end);
        text(index) = ' ';
    end
    mov(i).cdata = insertText(read(v_weather, fweather), place, text, 'FontSize',22);
    i = i+1;
    disp(i);
end

v = VideoWriter('summedup.avi');
open(v)
writeVideo(v,mov)
close(v)
