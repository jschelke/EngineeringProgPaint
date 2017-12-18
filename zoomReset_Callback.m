% --- Executes on button press in zoomReset.
function zoomReset_Callback(hObject, eventdata, handles)
% hObject    handle to zoomReset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    handles = guidata(hObject);
    
    [imageYsize, imageXsize, ~] = size(handles.Image);
    handles.zoomValue = 100;
    handles.imageAxesLimits = [1 imageXsize; 1 imageYsize];
    handles.zoomMoveSpeedValue = 10;
    
    set(handles.zoomTextInputValue, 'String', num2str(handles.zoomValue));
    set(handles.zoomSliderValue, 'Value', handles.zoomValue);
    set(handles.zoomMoveSpeed, 'String', num2str(handles.zoomMoveSpeedValue));
    
    setImageAxis(handles);
    
    guidata(hObject, handles); 
end