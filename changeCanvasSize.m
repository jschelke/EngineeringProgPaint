function [] = changeCanvasSize(handles,width,height)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    Position = get(handles.ImageBox, 'Position');
    Position(3) = width;
    Position(4) = height;
    set(handles.ImageBox,'Position',Position);
end

