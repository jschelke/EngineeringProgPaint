function zoomMoveSpeed_Callback(hObject, eventdata, handles)
% hObject    handle to zoomMoveSpeed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of zoomMoveSpeed as text
%        str2double(get(hObject,'String')) returns contents of zoomMoveSpeed as a double
    handles = guidata(hObject);
    
    handles.zoomMoveSpeedValue = str2double(get(handles.zoomMoveSpeed, 'String'));
    
    guidata(hObject, handles); 
end