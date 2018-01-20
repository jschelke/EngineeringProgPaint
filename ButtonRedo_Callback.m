% --- Executes on button press in ButtonRedo.
function ButtonRedo_Callback(hObject, eventdata, handles)
% hObject    handle to ButtonRedo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    handles.output = hObject;
    
    handles = undoWrite(handles, "redo");
    
    guidata(hObject, handles);
end