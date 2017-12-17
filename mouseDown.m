function mouseDown (hObject, eventdata)
    handles = guidata(hObject);
%     set(handles.XclickPos, 'String', ['X: ', num2str(handles.currentMousePos(1,1))]);
%     set(handles.YclickPos, 'String', ['Y: ', num2str(handles.currentMousePos(1,2))]);
    handles.mouseDown = true;
    
    [imageYsize, imageXsize, ~] = size(handles.Image);
    color(1,1,1) = handles.SelectedColor(1);
    color(1,1,2) = handles.SelectedColor(2);
    color(1,1,3) = handles.SelectedColor(3);
    colorLayer = ones(imageYsize, imageXsize, 3) .* color;
    pixelsToDraw = pencilDraw(handles);
    pixelsToDraw = repmat(pixelsToDraw, [1 1 3]);
    handles.Image(pixelsToDraw) = colorLayer(pixelsToDraw);
    handles.ImagePlot = image(handles.Image);   
        
    guidata(hObject, handles);
end