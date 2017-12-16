function ButtonOpenFile_Callback(hObject, eventdata, handles)
%TODO: do check for file formats and zoom capabilities
SupportedFormats = {'*.jpg;*.bmp;*.png*',...
 'Picture Formats (*.jpg,*.bmp,*.png)'}; %These formats are now supported

%[filename, pathname] = uigetfile(SupportedFormats);
pathname = 'D:\Users\Jeroen\Pictures\';
filename = 'test1.png';

handles.Image = imread([pathname filename]);
ImageSize = size(handles.Image);
changeCanvasSize(handles,ImageSize(2),ImageSize(1));


handles.ImagePlot = image(handles.Image);

guidata(hObject, handles);

end
