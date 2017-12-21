function [handles] = undoWrite(handles,hObject,Image)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    if(handles.Redo)
        handles.ImageUndo(1:CurrentUndoPos,:) = [];
        handles.ImageUndo{10,1} = [];
        handles.ImageUndo(handles.CurrentUndoPos,1) = handles.Image;
        handles.CurrentUndoPos = handles.CurrentUndoPos+1;
    elseif(handles.CurrentUndoPos == 11)
        handles.ImageUndo(2:end,:) = [];
        handles.ImageUndo{10,1} = [];
        handles.ImageUndo{10,1} = handles.Image;
        handles.CurrentUndoPos = 11;
    else
        handles.ImageUndo(handles.CurrentUndoPos,1) = handles.Image;
        handles.CurrentUndoPos = handles.CurrentUndoPos+1;
    end
end

