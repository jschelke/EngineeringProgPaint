function Save_Callback(hObject, eventdata, handles)
%known problem if "." is in filename extension not recognized
   [FileName,PathName] = uiputfile({...
       '*.jpg','JPEG Formats (*.jpg)';...
       '*.bmp','BITMAP Formats (*.bmp)';...
       '*.png','PNG Formats (*.png)';...
        })
    FileExtension = extractAfter(FileName,'.');
    switch FileExtension
        case 'jpg'
            imwrite(handles.Image,[PathName FileName],'jpg','Comment','JPEG made by the awesome MATLAB Paint')
        case 'bmp'
            imwrite(handles.Image,[PathName FileName],'bmp')
        case 'png'
            imwrite(handles.Image,[PathName FileName],'png')
    end
end