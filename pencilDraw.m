function pixelToDraw = pencilDraw (handles)
    %pixelToDraw = handles.Image;
    
    % ------------------------------------
    %      Mouse positon calculations
    % ------------------------------------
    [imageYsize, imageXsize, ~] = size(handles.ImageShow);
    
    currentXpos = round(handles.currentMousePos(1,1));
    if currentXpos > imageXsize; currentXpos = imageXsize; end
    if currentXpos < 1; currentXpos = 1; end
    
    currentYpos = round(handles.currentMousePos(1,2));
    if currentYpos > imageYsize; currentYpos = imageYsize; end
    if currentYpos < 1; currentYpos = 1; end
    
    prevXpos = round(handles.previousMousePos(1,1));
    if prevXpos > imageXsize; prevXpos = imageXsize; end
    if prevXpos < 1; prevXpos = 1; end
    
    prevYpos = round(handles.previousMousePos(1,2));
    if prevYpos > imageYsize; prevYpos = imageYsize; end
    if prevYpos < 1; prevYpos = 1; end

    xDiff = currentXpos - prevXpos;
    yDiff = currentYpos - prevYpos;
    
    pixelToDraw = zeros(imageYsize, imageXsize);
    
    % -----------------------------------------
    %      Interpolate between mouse jumps
    % -----------------------------------------
    if xDiff == 0 && yDiff == 0
        % Do nothing
    elseif abs(xDiff) >= abs(yDiff)
        gradient = yDiff/xDiff;
        if xDiff >= 0
            for x = prevXpos:currentXpos
                y = round(gradient * (x - prevXpos) + prevYpos);  
                %drawing(y, x, :) = 0;
                pixelToDraw = drawShape(handles, pixelToDraw, x, y);
            end
        else
            for x = prevXpos:-1:currentXpos
                y = round(gradient * (x - prevXpos) + prevYpos);
                pixelToDraw = drawShape(handles, pixelToDraw, x, y);
            end
        end 
    else
        gradient = xDiff/yDiff;
        if yDiff >= 0
            for y = prevYpos:currentYpos
                x = round(gradient * (y - prevYpos) + prevXpos);
                pixelToDraw = drawShape(handles, pixelToDraw, x, y);
            end
        else
            for y = prevYpos:-1:currentYpos
                x = round(gradient * (y - prevYpos) + prevXpos);
                pixelToDraw = drawShape(handles, pixelToDraw, x, y);
                %pixelToDraw(y, x , :) = 0;
            end
        end
    end
        
    pixelToDraw = logical(pixelToDraw);
end