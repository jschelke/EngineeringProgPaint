function pixelsToDraw = pencilDraw (handles)
    pixelsToDraw = handles.Image;
    pixelsToDraw(ceil(handles.currentMousePos(1,2)), ceil(handles.currentMousePos(1,1)), :) = 0;
    
end