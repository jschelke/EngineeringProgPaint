function setImageAxis(handles)
    xlim(handles.imageAxesLimits(1, :));
    ylim(handles.imageAxesLimits(2, :));
    set(handles.ImageBox, 'XAxisLocation', 'top');
end