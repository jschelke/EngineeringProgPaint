% --- Executes on button press in zoomBtnUp.
function zoomBtnUp_Callback(hObject, eventdata, handles)
% hObject    handle to zoomBtnUp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    handles = guidata(hObject);
    
    guidata(hObject, handles); 
end