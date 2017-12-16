function mouseMove (hObject, eventdata)
    handles = guidata(hObject);
    handles.currentMousePos = get (gca, 'CurrentPoint');
    set(handles.XposText, 'String', ['X: ', num2str(handles.currentMousePos(1,1))]);
    set(handles.YposText, 'String', ['Y: ', num2str(handles.currentMousePos(1,2))]);
    guidata(hObject, handles);
end