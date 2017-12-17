function shape = updatePencilShape(handles)
    switch handles.pencilShapeSelected
        case 1  % Circle
            shape = zeros(handles.pencilSize);
            for y = 1:handles.pencilSize
                for x = 1:handles.pencilSize
                    if round(sqrt((x - handles.pencilSize / 2 - 0.5)^2 + (y - handles.pencilSize / 2 - 0.5)^2)) <= handles.pencilSize / 2
                        shape(y, x) = 1;
                    end
                end
            end
            
        case 2  % Square
            shape = ones(handles.pencilSize);
            
        case 3  % Horizontal line
            shape = ones(1, handles.pencilSize);
            
        case 4  % Vertical line
            shape = ones(handles.pencilSize, 1);
            
        otherwise
            shape = 1;
    end
end