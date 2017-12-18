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
    handles.imageAxesLimits = [1 (imageXsize * 100 / handles.zoomValue); 1 (imageYsize * 100 / handles.zoomValue)];
    setImageAxis(handles);
    
    guidata(hObject, handles); 
end