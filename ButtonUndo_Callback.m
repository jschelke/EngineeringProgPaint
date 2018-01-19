% --- Executes on button press in ButtonUndo.
function ButtonUndo_Callback(hObject, eventdata, handles)
% hObject    handle to ButtonUndo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    handles.output = hObject;
    
    handles.ImageShow = handles.ImageUndo{handles.UndoCurrentPos-1,1};
    handles.Image = handles.ImageUndo{handles.UndoCurrentPos-1,1};
    handles.ImagePlot = image(handles.Image);
    
    handles.UndoCurrentPos = handles.UndoCurrentPos-1;
    if(handles.UndoCurrentPos <= 1)
        handles.UndoCurrentPos =1;
    end
    guidata(hObject, handles);
end