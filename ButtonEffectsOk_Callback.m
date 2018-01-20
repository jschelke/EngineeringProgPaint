function ButtonEffectsOk_Callback(hObject, eventdata, handles)
    % hObject    handle to ButtonEffectsOk (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    handles.output = hObject;
    handles = undoWrite(handles, "update");
    handles.Image = handles.ImageShow;
    handles.ImagePlot = image(handles.Image);
    setImageAxis(handles);
    guidata(hObject, handles);
end