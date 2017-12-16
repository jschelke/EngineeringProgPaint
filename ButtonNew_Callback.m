function ButtonNew_Callback(hObject, eventdata, handles)
% hObject    handle to ButtonNew (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    handles.output = hObject;
    output = NewImage();
    changeCanvasSize(handles, output(1),output(2));
    handles.Image = ones(output(1),output(2),3);
    handles.ImagePlot = image(handles.Image);
    guidata(hObject, handles);
end

