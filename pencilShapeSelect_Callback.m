% --- Executes on selection change in pencilShapeSelect.
function pencilShapeSelect_Callback(hObject, eventdata, handles)
% hObject    handle to pencilShapeSelect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns pencilShapeSelect contents as cell array
%        contents{get(hObject,'Value')} returns selected item from pencilShapeSelect

    handles = guidata(hObject);
    
    handles.pencilShapeSelected = get(handles.pencilShapeSelect, 'Value');
    handles.pencilShape = updatePencilShape(handles);
    
    guidata(hObject, handles);
end