function mouseDown (hObject, eventdata)
    handles = guidata(hObject);
    set(handles.XclickPos, 'String', ['X: ', num2str(handles.currentMousePos(1,1))]);
    set(handles.YclickPos, 'String', ['Y: ', num2str(handles.currentMousePos(1,2))]);
    guidata(hObject, handles);
end