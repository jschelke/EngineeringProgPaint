function [] = clickedOnImage(hObject,~,handles)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    handles.output = hObject;
    MousePosition = get(handles.ImagePlot,'CurrentPoint')
    guidata(hObject, handles)
end

