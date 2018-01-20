% --- Executes on button press in ButtonUndo.
function ButtonUndo_Callback(hObject, eventdata, handles)
% hObject    handle to ButtonUndo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    handles.output = hObject;
    
    handles = undoWrite(handles, "undo");
    
    guidata(hObject, handles);
end