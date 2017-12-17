function mouseDown (hObject, eventdata)
    handles = guidata(hObject);
%     set(handles.XclickPos, 'String', ['X: ', num2str(handles.currentMousePos(1,1))]);
%     set(handles.YclickPos, 'String', ['Y: ', num2str(handles.currentMousePos(1,2))]);
    switch (get(handles.ListBoxEffects,'Value'))
        case 1 %Pensil
            handles.mouseDown = true;
            [imageYsize, imageXsize, ~] = size(handles.Image);
            color(1,1,1) = handles.SelectedColor(1);
            color(1,1,2) = handles.SelectedColor(2);
            color(1,1,3) = handles.SelectedColor(3);
            colorLayer = ones(imageYsize, imageXsize, 3) .* color;
            pixelsToDraw = pencilDraw(handles);
            pixelsToDraw = repmat(pixelsToDraw, [1 1 3]);
            handles.Image(pixelsToDraw) = colorLayer(pixelsToDraw);
            handles.ImagePlot = image(handles.Image);
        
        case 2 %Remove Red Eyes
            currentXpos = ceil(handles.currentMousePos(1,2));
            currentYpos = ceil(handles.currentMousePos(1,1));
            Position = handles.ImageBox.Position;
            
            if(currentXpos >0 && currentXpos <Position(3) && currentYpos >0 && currentYpos < Position(4))
                ImageMatrix = handles.Image;
                RedEyesColor = ImageMatrix(currentXpos,currentYpos,:);
                PartSize = ceil(str2double(get(handles.pencilSizeValue,'String')))/2;

                tolerance = get(handles.SliderEffects,'Value');

                LeftBound = ceil(currentXpos-PartSize);
                RightBound = ceil(currentXpos+PartSize);
                LowerBound = ceil(currentYpos-PartSize);
                UpperBound = ceil(currentYpos+PartSize);
                if(LeftBound <1)
                    LeftBound = 1;
                end
                if(RightBound>Position(3))
                    RightBound = Postion(3);
                end
                if(LowerBound <1)
                    LowerBound = 1;
                end
                if(UpperBound>Position(4))
                    UpperBound = Postion(4);
                end

%                 PartMatrix = ImageMatrix(LeftBound:RightBound , LowerBound:UpperBound , :);
%                 LogicalMatrix = (PartMatrix(:,:,1)<=(RedEyesColor(1,1,1)*(1+tolerance))) + (PartMatrix(:,:,1) >= (RedEyesColor(1,1,1)*(1-tolerance)));
%                 LogicalMatrix = LogicalMatrix + (PartMatrix(:,:,2)<=(RedEyesColor(1,1,2)*(1+tolerance))) + (PartMatrix(:,:,2) >= (RedEyesColor(1,1,2)*(1-tolerance)));
%                 LogicalMatrix = LogicalMatrix + (PartMatrix(:,:,3)<=(RedEyesColor(1,1,3)*(1+tolerance))) + (PartMatrix(:,:,3) >= (RedEyesColor(1,1,3)*(1-tolerance)));
%                 LogicalMatrix = floor(LogicalMatrix/6);
%                 colorLayer = zeros(size(PartMatrix));
%                 LogicalMatrix = ceil(repmat(LogicalMatrix, [1 1 3]));
%                 PartMatrix(LogicalMatrix) = colorLayer(LogicalMatrix);
                [imageYsize, imageXsize, ~] = size(handles.Image);
                PartMatrix = ImageMatrix(LeftBound:RightBound - 1, LowerBound:UpperBound - 1, :);
                
                redPartMatrix = PartMatrix(:, :, 1);
                greenPartMatrix = PartMatrix(:, :, 2);
                bluePartMatrix = PartMatrix(:, :, 3);
                
                [redPartUpperBoundLogicalMatrix, redPartLowerBoundLogicalMatrix, greenPartUpperBoundLogicalMatrix, ...
                    greenPartLowerBoundLogicalMatrix, bluePartUpperBoundLogicalMatrix, bluePartLowerBoundLogicalMatrix] = ...
                    deal(zeros(RightBound - LeftBound, UpperBound - LowerBound));
                
                redPartUpperBoundLogicalMatrix(redPartMatrix <= RedEyesColor(1,1,1) * (1 + tolerance)) = 1;
                redPartLowerBoundLogicalMatrix(redPartMatrix >= RedEyesColor(1,1,1) * (1 - tolerance)) = 1;
                greenPartUpperBoundLogicalMatrix(greenPartMatrix <= RedEyesColor(1,1,2) * (1 + tolerance)) = 1;
                greenPartLowerBoundLogicalMatrix(greenPartMatrix >= RedEyesColor(1,1,2) * (1 - tolerance)) = 1;
                bluePartUpperBoundLogicalMatrix(bluePartMatrix <= RedEyesColor(1,1,3) * (1 + tolerance)) = 1;
                bluePartLowerBoundLogicalMatrix(bluePartMatrix >= RedEyesColor(1,1,3) * (1 - tolerance)) = 1;
                
                partLogicalMatrix = redPartUpperBoundLogicalMatrix .* redPartLowerBoundLogicalMatrix .* greenPartUpperBoundLogicalMatrix ...
                    .* greenPartLowerBoundLogicalMatrix .* bluePartUpperBoundLogicalMatrix .* bluePartLowerBoundLogicalMatrix;
                logicalMatrix = zeros(imageYsize, imageXsize);
                logicalMatrix(LeftBound:RightBound - 1, LowerBound:UpperBound - 1) = partLogicalMatrix;
                logicalMatrix = logical(logicalMatrix);
                logicalMatrix = repmat(logicalMatrix, [1 1 3]);
                
                color(1,1,1) = handles.SelectedColor(1);
                color(1,1,2) = handles.SelectedColor(2);
                color(1,1,3) = handles.SelectedColor(3);
                colorLayer = ones(imageYsize, imageXsize, 3) .* color * 255;
                ImageMatrix(logicalMatrix) = colorLayer(logicalMatrix);

%                 ImageMatrix(LeftBound:RightBound,LowerBound:UpperBound,:) = PartMatrix;
                handles.Image = ImageMatrix;
                handles.ImagePlot = image(handles.Image);
               

            end

        case 3 %Gray
            
            
            
            
        case 4 %Negative
       
            
    end
        
    guidata(hObject, handles);
end