function zoomTextInputValue_Callback(hObject, eventdata, handles)
% hObject    handle to zoomTextInputValue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of zoomTextInputValue as text
%        str2double(get(hObject,'String')) returns contents of zoomTextInputValue as a double
    handles = guidata(hObject);
    handles.zoomValue = str2double(get(handles.zoomTextInputValue, 'String'));
    set(handles.zoomSliderValue, 'Value', handles.zoomValue);
    
    [imageYsize, imageXsize, ~] = size(handles.Image);
    if max(imageXsize, imageYsize) > handles.maxCanvasSize
        axisLengthModifier = max(imageXsize, imageYsize) / handles.maxCanvasSize;
    else
        axisLengthModifier = 1;
    end
    viewXcenter = (handles.imageAxesLimits(1,1) + handles.imageAxesLimits(1,2)) / 2;
    viewYcenter = (handles.imageAxesLimits(2,1) + handles.imageAxesLimits(2,2)) / 2;
    viewNewWidth = (imageXsize * 100 / handles.zoomValue / axisLengthModifier) / 2;
    viewNewHeight = (imageYsize * 100 / handles.zoomValue / axisLengthModifier) / 2;
    handles.imageAxesLimits = [round(viewXcenter - viewNewWidth) round(viewXcenter + viewNewWidth); ...
        round(viewYcenter - viewNewHeight) round(viewYcenter + viewNewHeight)];
    setImageAxis(handles);
    
    guidata(hObject, handles); 
end