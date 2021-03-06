% --- Executes on button press in zoomBtnDown.
function zoomBtnDown_Callback(hObject, eventdata, handles)
% hObject    handle to zoomBtnDown (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    handles = guidata(hObject);
    
    handles.imageAxesLimits = handles.imageAxesLimits + [0; handles.zoomMoveSpeedValue];
    setImageAxis(handles);
    
    guidata(hObject, handles); 
end