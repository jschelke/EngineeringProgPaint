function setImageAxis(handles)
    xlim(handles.imageAxesLimits(1, :));
    ylim(handles.imageAxesLimits(2, :));
    %set(handles.ImageBox, 'XAxisLocation', 'top');
    
    [imageYsize, imageXsize, ~] = size(handles.Image);
    if max(imageXsize, imageYsize) > handles.maxCanvasSize
        axisLengthModifier = max(imageXsize, imageYsize) / handles.maxCanvasSize;
        changeCanvasSize(handles, round(imageXsize / axisLengthModifier), round(imageYsize / axisLengthModifier))
    end
end