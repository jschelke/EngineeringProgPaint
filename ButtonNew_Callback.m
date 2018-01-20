function ButtonNew_Callback(hObject, eventdata, handles)
% hObject    handle to ButtonNew (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    handles.output = hObject;
    output = NewImage();
    changeCanvasSize(handles, output(1),output(2));
    [handles.Image, handles.ImageShow] = deal(ones(output(2),output(1),3));
    handles.ImagePlot = image(handles.Image);
    
    if (max(output(1), output(2)) <= handles.maxCanvasSize)
        handles.zoomValue = 100;
    else
        handles.zoomValue = round(100 * handles.maxCanvasSize / max(output(1), output(2)));
    end
    handles.imageAxesLimits = [1 output(1); 1 output(2)];
    set(handles.zoomTextInputValue, 'String', num2str(handles.zoomValue));
    set(handles.zoomSliderValue, 'Value', handles.zoomValue);
    
    setImageAxis(handles);

    handles = undoWrite(handles, "reset");
    
    guidata(hObject, handles);
end

