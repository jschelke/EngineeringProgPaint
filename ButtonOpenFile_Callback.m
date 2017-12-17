function ButtonOpenFile_Callback(hObject, eventdata, handles)
%TODO: do check for file formats and zoom capabilities
SupportedFormats = {'*.jpg;*.bmp;*.png*',...
 'Picture Formats (*.jpg,*.bmp,*.png)'}; %These formats are now supported

%[filename, pathname] = uigetfile(SupportedFormats);
pathname = [pwd, '\'];
filename = 'RedEyes.png';

handles.Image = imread([pathname filename]);
ImageSize = size(handles.Image);
changeCanvasSize(handles,ImageSize(2),ImageSize(1));

handles.ImageShow = handles.Image;
handles.ImagePlot = image(handles.Image);

guidata(hObject, handles);

end
