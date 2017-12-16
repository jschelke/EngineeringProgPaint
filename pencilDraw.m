function pixelsToDraw = pencilDraw (handles)
    pixelsToDraw = handles.Image;
%     pixelsToDraw(ceil(handles.currentMousePos(1,2)), ceil(handles.currentMousePos(1,1)), :) = 0;

    xDiff = handles.currentMousePos(1,2) - handles.previousMousePos(1,2);
    yDiff = handles.currentMousePos(1,1) - handles.previousMousePos(1,1);
    
    if xDiff > yDiff
        for x = handles.previousMousePos(1,2):handles.currentMousePos(1,2)
            y = round(yDiff / xDiff * (x - handles.previousMousePos(1,2)) + x);

            pixelsToDraw(x, y , :) = 0;
        end
    elseif xDiff < yDiff
        for y = handles.previousMousePos(1,1):handles.currentMousePos(1,1)
            x = round(xDiff / yDiff * (y - handles.previousMousePos(1,1)) + y);

            pixelsToDraw(x, y , :) = 0;
        end
    end
        
end