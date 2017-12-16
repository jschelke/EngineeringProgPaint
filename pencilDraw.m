function pixelsToDraw = pencilDraw (handles)
    pixelsToDraw = handles.Image;
%     pixelsToDraw(ceil(handles.currentMousePos(1,2)), ceil(handles.currentMousePos(1,1)), :) = 0;

    xDiff = round(handles.currentMousePos(1,1) - handles.previousMousePos(1,1));
    yDiff = round(handles.currentMousePos(1,2) - handles.previousMousePos(1,2));
    
    if abs(xDiff) >= abs(yDiff)
        if xDiff >= 0
            for x = round(handles.previousMousePos(1,1)):round(handles.currentMousePos(1,1))
                y = round(yDiff / xDiff * (x - handles.previousMousePos(1,1)) + handles.previousMousePos(1,2));  
                pixelsToDraw(y, x, :) = 0;
            end
        else
            for x = round(handles.previousMousePos(1,1)):-1:round(handles.currentMousePos(1,1))
                y = round(yDiff / xDiff * (x - handles.previousMousePos(1,1)) + handles.previousMousePos(1,2));
                pixelsToDraw(y, x, :) = 0;
            end
        end 
    else
        if yDiff >= 0
            for y = round(handles.previousMousePos(1,2)):round(handles.currentMousePos(1,2))
                x = round(xDiff / yDiff * (y - handles.previousMousePos(1,2)) + handles.previousMousePos(1,1));

                pixelsToDraw(y, x, :) = 0;
            end
        else
            for y = round(handles.previousMousePos(1,2)):-1:round(handles.currentMousePos(1,2))
                x = round(xDiff / yDiff * (y - handles.previousMousePos(1,2)) + handles.previousMousePos(1,1));

                pixelsToDraw(y, x , :) = 0;
            end
        end
    end
        
end