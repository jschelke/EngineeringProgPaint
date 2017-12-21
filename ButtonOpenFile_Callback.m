function ButtonOpenFile_Callback(hObject, eventdata, handles)
%TODO: do check for file formats and zoom capabilities
SupportedFormats = {'*.jpg;*.bmp;*.png*',...
 'Picture Formats (*.jpg,*.bmp,*.png)'}; %These formats are now supported

[filename, pathname] = uigetfile(SupportedFormats);
%pathname = [pwd, '\'];

%filename = 'test.png';

%filename = 'RedEyes2.jpg';

handles.Image = imread([pathname filename]);
handles.Image = double(handles.Image) / 255;
caxis([0 1]);
ImageSize = size(handles.Image);
changeCanvasSize(handles,ImageSize(2),ImageSize(1));

handles.ImageShow = handles.Image;
handles.ImagePlot = image(handles.Image);

handles.imageAxesLimits = [1 ImageSize(2); 1 ImageSize(1)];
handles.zoomValue = 100;
set(handles.zoomTextInputValue, 'String', num2str(handles.zoomValue));
set(handles.zoomSliderValue, 'Value', handles.zoomValue);
setImageAxis(handles);

guidata(hObject, handles);

end
