function pencilSizeValue_Callback(hObject, eventdata, handles)
% hObject    handle to pencilSizeValue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pencilSizeValue as text
%        str2double(get(hObject,'String')) returns contents of pencilSizeValue as a double


% --- Executes during object creation, after setting all properties.
    handles.pencilSize = str2double(get(hObject, 'String'));
end