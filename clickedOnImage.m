function [] = clickedOnImage(hObject,~,handles)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    %handles.output = hObject;
    handles = guidata(hObject);
    %MousePosition = get(handles.ImagePlot,'CurrentPoint')
    %set(handles.XclickPos, 'String', handles.currentMousePos(1,1));
    guidata(hObject, handles)
end

