% --- Executes on slider movement.
function zoomSliderValue_Callback(hObject, eventdata, handles)
% hObject    handle to zoomSliderValue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
    handles = guidata(hObject);
    handles.zoomValue = round(get(handles.zoomSliderValue, 'Value'));
    set(handles.zoomTextInputValue, 'String', num2str(handles.zoomValue));
    
    [imageYsize, imageXsize, ~] = size(handles.Image);
    viewXcenter = (handles.imageAxesLimits(1,1) + handles.imageAxesLimits(1,2)) / 2;
    viewYcenter = (handles.imageAxesLimits(2,1) + handles.imageAxesLimits(2,2)) / 2;
    viewNewWidth = (imageXsize * 100 / handles.zoomValue) / 2;
    viewNewHeight = (imageYsize * 100 / handles.zoomValue) / 2;
    handles.imageAxesLimits = [round(viewXcenter - viewNewWidth) round(viewXcenter + viewNewWidth); ...
        round(viewYcenter - viewNewHeight) round(viewYcenter + viewNewHeight)];
    setImageAxis(handles);
    
    guidata(hObject, handles); 
end