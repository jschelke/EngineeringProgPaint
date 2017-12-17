function SliderEffects_Callback(hObject, eventdata, handles)
    % hObject    handle to SliderEffects (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)

    % Hints: get(hObject,'Value') returns position of slider
    %        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
    handles.output = hObject;
    set(handles.LabelEffects,'String', [num2str(round(get(handles.SliderEffects,'Value')*100)) '%']);
    % Update handles structure
    guidata(hObject, handles);
    
end