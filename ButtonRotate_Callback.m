function ButtonRotate_Callback(hObject, eventdata, handles)

    handles.Image = rot90(handles.Image);
    ImageSize = size(handles.Image);
    changeCanvasSize(handles,ImageSize(2),ImageSize(1));


    handles.ImagePlot = image(handles.Image);

    guidata(hObject, handles);

end