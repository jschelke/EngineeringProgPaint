function [handles] = undoWrite(handles)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    if(handles.Redo)
        handles.ImageUndo(1:UndoCurrentPos,:) = [];
        handles.ImageUndo{10,1} = [];
        handles.ImageUndo(handles.UndoCurrentPos,1) = handles.Image;
        handles.UndoCurrentPos = handles.UndoCurrentPos+1;
    elseif(handles.UndoCurrentPos == 11)
        handles.ImageUndo(2:end,:) = [];
        handles.ImageUndo{10,1} = [];
        handles.ImageUndo{10,1} = handles.Image;
        handles.UndoCurrentPos = 11;
    else
        handles.ImageUndo{handles.UndoCurrentPos,1} = handles.Image;
        handles.UndoCurrentPos = handles.UndoCurrentPos+1;
    end
end

