function handles = undoWrite(handles, action)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
 
    switch action
        case "update"
            if (length(handles.ImageUndo) < handles.maxUndoSteps)
                handles.ImageUndo{end + 1} = handles.Image;
            else
                handles.ImageUndo = circshift(handles.ImageUndo, -1);       % Shift all cells 1 to the left
                handles.ImageUndo{end} = handles.Image;      % This replaces the last cell with the new image
            end
            
            % Empty redo list
            handles.ImageRedo = {};
            
        case "undo"
            if (~isempty(handles.ImageUndo))
                % Update the redo lists
                handles.ImageRedo{end + 1} = handles.Image;
                
                % Replace the shown image
                handles.ImageShow = handles.ImageUndo{end};
                handles.Image = handles.ImageShow;
                handles.ImagePlot = image(handles.ImageShow);
                setImageAxis(handles);
                
                % Update the undo lists
                handles.ImageUndo = handles.ImageUndo(1:(end - 1));
            end
            
        case "redo"
            if (~isempty(handles.ImageRedo))
                % Update the undo lists
                handles.ImageUndo{end + 1} = handles.Image;
                
                % Replace the shown image
                handles.ImageShow = handles.ImageRedo{end};
                handles.Image = handles.ImageShow;
                handles.ImagePlot = image(handles.ImageShow);
                setImageAxis(handles);

                % Update the redo lists
                handles.ImageRedo = handles.ImageRedo(1:(end - 1));
            end
            
        case "reset"
            handles.ImageUndo = {};
            handles.ImageRedo = {};
    end
end

