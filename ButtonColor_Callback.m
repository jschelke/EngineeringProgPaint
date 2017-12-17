function ButtonColor_Callback(hObject, eventdata, handles)
    SelectedColor = ColorPalette();
    if(isempty(SelectedColor)==false)
        handles.SelectedColor = SelectedColor;
    end
    guidata(hObject, handles);    
end