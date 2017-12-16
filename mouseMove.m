function mouseMove (hObject, eventdata)
    handles = guidata(hObject);
    handles.previousMousePos = handles.currentMousePos;
    handles.currentMousePos = get (gca, 'CurrentPoint');
    set(handles.XposText, 'String', ['X: ', num2str(handles.currentMousePos(1,1))]);
    set(handles.YposText, 'String', ['Y: ', num2str(handles.currentMousePos(1,2))]);
    
    if handles.mouseDown == true
        set(handles.XclickPos, 'String', ['X: ', num2str(handles.currentMousePos(1,1))]);
        set(handles.YclickPos, 'String', ['Y: ', num2str(handles.currentMousePos(1,2))]);
        
        pixelsToDraw = pencilDraw(handles);
        
        handles.Image = pixelsToDraw;
        handles.ImagePlot = image(handles.Image);
    end
    
    
    guidata(hObject, handles);
end