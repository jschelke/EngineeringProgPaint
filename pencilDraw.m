function pencilDraw (hObject, eventdata)
    handles = guidata(hObject);
    handles.Image(ceil(handles.currentMousePos(1,1)), ceil(handles.currentMousePos(1,2)), :) = 0;
    handles.ImagePlot = image(handles.Image);
%     imageFile = get(handles.Image);
%     imageFile(handles.currentMousePos(1,1), handles.currentMousePos(1,2), :) = 1;
%     set(handles.Image, 'Vector', imageFile);
    guidata(hObject, handles);
end