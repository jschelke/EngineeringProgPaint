function drawing = drawShape(handles, drawing, xPos, yPos)
    [shapeHeight, shapeWidth] = size(handles.pencilShape);
    [imageYsize, imageXsize, ~] = size(handles.Image);
    xDrawStart = round(xPos - shapeWidth / 2);
    yDrawStart = round(yPos - shapeHeight / 2);
    
    imagePart = drawing(yDrawStart:(yDrawStart+shapeHeight-1), xDrawStart:(xDrawStart+shapeWidth-1));
    imagePart = imagePart + handles.pencilShape;
    drawing(yDrawStart:(yDrawStart+shapeHeight-1), xDrawStart:(xDrawStart+shapeWidth-1)) = imagePart;
end