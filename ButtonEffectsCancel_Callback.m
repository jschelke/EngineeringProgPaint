function ButtonEffectsCancel_Callback(hObject, eventdata, handles)
    % hObject    handle to ButtonEffectsCancel (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    
    
    handles.output = hObject;
    handles.ImageShow = handles.Image;
    handles.ImagePlot = image(handles.Image);
    setImageAxis(handles);
    guidata(hObject, handles);
end