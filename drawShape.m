function drawing = drawShape(handles, drawing, xPos, yPos)
    [shapeHeight, shapeWidth] = size(handles.pencilShape);
    [imageYsize, imageXsize, ~] = size(handles.Image);
    xDrawStart = round(xPos - shapeWidth / 2);
    yDrawStart = round(yPos - shapeHeight / 2);
    
    try
        imagePart = drawing(yDrawStart:(yDrawStart+shapeHeight-1), xDrawStart:(xDrawStart+shapeWidth-1));
        imagePart = imagePart + handles.pencilShape;
        drawing(yDrawStart:(yDrawStart+shapeHeight-1), xDrawStart:(xDrawStart+shapeWidth-1)) = imagePart;
    catch
        [imageYsize, imageXsize, ~] = size(handles.ImageShow);
        if (xDrawStart < 1)
            xStartOffset = 1 - xDrawStart;
        else
            xStartOffset  = 0;
        end
        
        if (yDrawStart < 1)
            yStartOffset = 1 - yDrawStart;
        else
            yStartOffset = 0;
        end
        
        if (xDrawStart + shapeWidth > imageXsize)
            xEndOffset = imageXsize - (xDrawStart + shapeWidth);
        else
            xEndOffset = 0;
        end
        
        if (yDrawStart + shapeHeight > imageYsize)
            yEndOffset = imageYsize - (yDrawStart + shapeHeight);
        else
            yEndOffset = 0;
        end
            
        imagePart = drawing((yDrawStart + yStartOffset):(yDrawStart + shapeHeight + yEndOffset - 1), ...
            (xDrawStart + xStartOffset):(xDrawStart + shapeWidth + xEndOffset - 1));
        
        imagePart = imagePart + handles.pencilShape((1 + yStartOffset):(shapeHeight + yEndOffset), (1 + xStartOffset):(xEndOffset + shapeWidth));
        
        drawing((yDrawStart + yStartOffset):(yDrawStart + shapeHeight + yEndOffset - 1), ...
            (xDrawStart + xStartOffset):(xDrawStart + shapeWidth + xEndOffset - 1)) = imagePart;
    end
    
end