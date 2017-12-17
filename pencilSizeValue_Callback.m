function pencilSizeValue_Callback(hObject, eventdata, handles)
% hObject    handle to pencilSizeValue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pencilSizeValue as text
%        str2double(get(hObject,'String')) returns contents of pencilSizeValue as a double


% --- Executes during object creation, after setting all properties.
    handles = guidata(hObject);
    handles.pencilSize = str2double(get(hObject, 'String'));
    
    handles.pencilShape = zeros(handles.pencilSize);
    for y = 1:handles.pencilSize
        for x = 1:handles.pencilSize
            if round(sqrt((x - handles.pencilSize / 2 - 0.5)^2 + (y - handles.pencilSize / 2 - 0.5)^2)) <= handles.pencilSize / 2
                handles.pencilShape(y, x) = 1;
            end
        end
    end

    guidata(hObject, handles);
end