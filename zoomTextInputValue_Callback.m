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
    handles.imageAxesLimits = [1 (imageXsize * 100 / handles.zoomValue); 1 (imageYsize * 100 / handles.zoomValue)];
    setImageAxis(handles);
    
    guidata(hObject, handles); 
end