function pixelsToDraw = pencilDraw (handles)
    pixelsToDraw = handles.Image;
%     pixelsToDraw(ceil(handles.currentMousePos(1,2)), ceil(handles.currentMousePos(1,1)), :) = 0;

    xDiff = handles.currentMousePos(1,2) - handles.previousMousePos(1,2)
    yDiff = handles.currentMousePos(1,1) - handles.previousMousePos(1,1)
    
    if abs(xDiff) >= abs(yDiff)
        if xDiff >= 0
            for x = handles.previousMousePos(1,2):handles.currentMousePos(1,2)
                y = round(yDiff / xDiff * (handles.previousMousePos(1,2)) + handles.previousMousePos(1,2));

                pixelsToDraw(round(x), round(y) , :) = 0;
            end
        else
            for x = handles.previousMousePos(1,2):-1:handles.currentMousePos(1,2)
                y = round(yDiff / xDiff * (handles.previousMousePos(1,2)) + handles.previousMousePos(1,2));

                pixelsToDraw(round(x), round(y) , :) = 0;
            end
        end 
    else
        if yDiff >= 0
            for y = handles.previousMousePos(1,1):handles.currentMousePos(1,1)
                x = round(xDiff / yDiff * (handles.previousMousePos(1,1)) + handles.previousMousePos(1,1));

                pixelsToDraw(round(x), round(y) , :) = 0;
            end
        else
            for y = handles.previousMousePos(1,1):-1:handles.currentMousePos(1,1)
                x = round(xDiff / yDiff * (handles.previousMousePos(1,1)) + handles.previousMousePos(1,1));

                pixelsToDraw(round(x), round(y) , :) = 0;
            end
        end
    end
        
end