% --- Executes on button press in zoomBtnLeft.
function zoomBtnLeft_Callback(hObject, eventdata, handles)
% hObject    handle to zoomBtnLeft (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    handles = guidata(hObject);
    
    guidata(hObject, handles); 
end