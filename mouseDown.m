function mouseDown (hObject, eventdata)
    handles = guidata(hObject);
%     set(handles.XclickPos, 'String', ['X: ', num2str(handles.currentMousePos(1,1))]);
%     set(handles.YclickPos, 'String', ['Y: ', num2str(handles.currentMousePos(1,2))]);
    switch (get(handles.ListBoxEffects,'Value'))
        case 1 %Pensil
            handles.mouseDown = true;
            [imageYsize, imageXsize, ~] = size(handles.ImageShow);
            color(1,1,1) = handles.SelectedColor(1);
            color(1,1,2) = handles.SelectedColor(2);
            color(1,1,3) = handles.SelectedColor(3);
            colorLayer = ones(imageYsize, imageXsize, 3) .* color;
            pixelsToDraw = pencilDraw(handles);
            pixelsToDraw = repmat(pixelsToDraw, [1 1 3]);
            handles.ImageShow(pixelsToDraw) = colorLayer(pixelsToDraw);
            handles.ImagePlot = image(handles.ImageShow);
            setImageAxis(handles);
        
        case 2 %Fill
            currentXpos = ceil(handles.currentMousePos(1,2));
            currentYpos = ceil(handles.currentMousePos(1,1));
            ImageMatrix = handles.ImageShow;
            MatrixSize = size(ImageMatrix);
            
            if(currentXpos > 0 && currentXpos < MatrixSize(1) && currentYpos > 0 && currentYpos < MatrixSize(2))
                
                clickedColor = ImageMatrix(currentXpos,currentYpos,:);
                PartSize = ceil(str2double(get(handles.pencilSizeValue,'String')))/2;

                tolerance = get(handles.SliderEffects,'Value');

                LeftBound = ceil(currentXpos-PartSize);
                RightBound = ceil(currentXpos+PartSize);
                LowerBound = ceil(currentYpos-PartSize);
                UpperBound = ceil(currentYpos+PartSize);
                if(LeftBound <1)
                    LeftBound = 1;
                end
                if(RightBound>MatrixSize(1))
                    RightBound = MatrixSize(1);
                end
                if(LowerBound <1)
                    LowerBound = 1;
                end
                if(UpperBound>MatrixSize(2))
                    UpperBound = MatrixSize(2);
                end

                [imageYsize, imageXsize, ~] = size(handles.Image);
                PartMatrix = ImageMatrix(LeftBound:RightBound - 1, LowerBound:UpperBound - 1, :);
                
                redPartMatrix = PartMatrix(:, :, 1);
                greenPartMatrix = PartMatrix(:, :, 2);
                bluePartMatrix = PartMatrix(:, :, 3);
                
                [redPartUpperBoundLogicalMatrix, redPartLowerBoundLogicalMatrix, greenPartUpperBoundLogicalMatrix, ...
                    greenPartLowerBoundLogicalMatrix, bluePartUpperBoundLogicalMatrix, bluePartLowerBoundLogicalMatrix] = ...
                    deal(zeros(RightBound - LeftBound, UpperBound - LowerBound));
                
                redPartUpperBoundLogicalMatrix(redPartMatrix <= (clickedColor(1,1,1) + tolerance)) = 1;
                redPartLowerBoundLogicalMatrix(redPartMatrix >= (clickedColor(1,1,1) - tolerance)) = 1;
                greenPartUpperBoundLogicalMatrix(greenPartMatrix <= (clickedColor(1,1,2) + tolerance)) = 1;
                greenPartLowerBoundLogicalMatrix(greenPartMatrix >= (clickedColor(1,1,2) - tolerance)) = 1;
                bluePartUpperBoundLogicalMatrix(bluePartMatrix <= (clickedColor(1,1,3) + tolerance)) = 1;
                bluePartLowerBoundLogicalMatrix(bluePartMatrix >= (clickedColor(1,1,3) - tolerance)) = 1;
                
                partLogicalMatrix = redPartUpperBoundLogicalMatrix .* redPartLowerBoundLogicalMatrix .* greenPartUpperBoundLogicalMatrix ...
                    .* greenPartLowerBoundLogicalMatrix .* bluePartUpperBoundLogicalMatrix .* bluePartLowerBoundLogicalMatrix;
                logicalMatrix = zeros(imageYsize, imageXsize);
                logicalMatrix(LeftBound:RightBound - 1, LowerBound:UpperBound - 1) = partLogicalMatrix;
                logicalMatrix = logical(logicalMatrix);
                logicalMatrix = repmat(logicalMatrix, [1 1 3]);
                
                color(1,1,1) = handles.SelectedColor(1);
                color(1,1,2) = handles.SelectedColor(2);
                color(1,1,3) = handles.SelectedColor(3);
                colorLayer = ones(imageYsize, imageXsize, 3) .* color;
                ImageMatrix(logicalMatrix) = colorLayer(logicalMatrix);
                
                handles.ImageShow = ImageMatrix;
                handles.ImagePlot = image(handles.ImageShow);
                setImageAxis(handles);
            end
           
        case 3 %Remove Red Eyes
            currentXpos = ceil(handles.currentMousePos(1,2));
            currentYpos = ceil(handles.currentMousePos(1,1));
            ImageMatrix = handles.ImageShow;
            MatrixSize = size(ImageMatrix);
            
            if(currentXpos >0 && currentXpos <MatrixSize(1) && currentYpos >0 && currentYpos < MatrixSize(2))
                
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
                if(RightBound>MatrixSize(1))
                    RightBound = MatrixSize(1);
                end
                if(LowerBound <1)
                    LowerBound = 1;
                end
                if(UpperBound>MatrixSize(2))
                    UpperBound = MatrixSize(2);
                end

                [imageYsize, imageXsize, ~] = size(handles.Image);
                PartMatrix = ImageMatrix(LeftBound:RightBound - 1, LowerBound:UpperBound - 1, :);
                
                redPartMatrix = PartMatrix(:, :, 1);
                greenPartMatrix = PartMatrix(:, :, 2);
                bluePartMatrix = PartMatrix(:, :, 3);
                
                [redPartUpperBoundLogicalMatrix, redPartLowerBoundLogicalMatrix, greenPartUpperBoundLogicalMatrix, ...
                    greenPartLowerBoundLogicalMatrix, bluePartUpperBoundLogicalMatrix, bluePartLowerBoundLogicalMatrix] = ...
                    deal(zeros(RightBound - LeftBound, UpperBound - LowerBound));
                
                redPartUpperBoundLogicalMatrix(redPartMatrix <= (RedEyesColor(1,1,1) + tolerance)) = 1;
                redPartLowerBoundLogicalMatrix(redPartMatrix >= (RedEyesColor(1,1,1) - tolerance)) = 1;
                greenPartUpperBoundLogicalMatrix(greenPartMatrix <= (RedEyesColor(1,1,2) + tolerance)) = 1;
                greenPartLowerBoundLogicalMatrix(greenPartMatrix >= (RedEyesColor(1,1,2) - tolerance)) = 1;
                bluePartUpperBoundLogicalMatrix(bluePartMatrix <= (RedEyesColor(1,1,3) + tolerance)) = 1;
                bluePartLowerBoundLogicalMatrix(bluePartMatrix >= (RedEyesColor(1,1,3) - tolerance)) = 1;
                
                partLogicalMatrix = redPartUpperBoundLogicalMatrix .* redPartLowerBoundLogicalMatrix .* greenPartUpperBoundLogicalMatrix ...
                    .* greenPartLowerBoundLogicalMatrix .* bluePartUpperBoundLogicalMatrix .* bluePartLowerBoundLogicalMatrix;
                logicalMatrix = zeros(imageYsize, imageXsize);
                logicalMatrix(LeftBound:RightBound - 1, LowerBound:UpperBound - 1) = partLogicalMatrix;
                logicalMatrix = logical(logicalMatrix);
                logicalMatrix = repmat(logicalMatrix, [1 1 3]);
                
                colorLayer = zeros(imageYsize, imageXsize, 3);
                ImageMatrix(logicalMatrix) = colorLayer(logicalMatrix);
                       
                handles.ImageShow = ImageMatrix;
                handles.ImagePlot = image(handles.ImageShow);
                setImageAxis(handles);
            end
            
            
        case 4 %Gray
            ImageMatrix = handles.ImageShow;
            RedChannel = ImageMatrix(:,:,1);
            GreenChannel = ImageMatrix(:,:,2);
            BlueChannel = ImageMatrix(:,:,3);
            WeightedSum = [sum(sum(ImageMatrix(:,:,1))) sum(sum(ImageMatrix(:,:,2))) sum(sum(ImageMatrix(:,:,3)))];
            WeightedSum = WeightedSum./sum(WeightedSum);
            
            handles.ImageShow(:,:,1) = (RedChannel*WeightedSum(1) + GreenChannel*WeightedSum(2)+ BlueChannel*WeightedSum(3));
            handles.ImageShow(:,:,2) = (RedChannel*WeightedSum(1) + GreenChannel*WeightedSum(2)+ BlueChannel*WeightedSum(3));
            handles.ImageShow(:,:,3) = (RedChannel*WeightedSum(1) + GreenChannel*WeightedSum(2)+ BlueChannel*WeightedSum(3));
            handles.ImagePlot = image(handles.ImageShow);
            setImageAxis(handles);
            
        case 5 %Negative
            strength = get(handles.SliderEffects, 'Value');
            ImageMatrix = handles.ImageShow;
            ImageMatrix = (ones(size(ImageMatrix)) * 0.5 - ImageMatrix) * strength * 2 + ImageMatrix;
            handles.ImageShow = ImageMatrix;
            handles.ImagePlot = image(handles.ImageShow);
            setImageAxis(handles);
            
        case 6 %Edge detect
            strength = get(handles.SliderEffects, 'Value');
            ImageMatrix = handles.ImageShow;
            div = divergence(repmat(ImageMatrix(:, :, 1), [1, 1, 3]), repmat(ImageMatrix(:, :, 2), [1, 1, 3]), repmat(ImageMatrix(:, :, 3), [1, 1, 3]));
            handles.ImageShow = div * strength * 100;
            handles.ImagePlot = image(handles.ImageShow);
            setImageAxis(handles);
            
        case 7 %Blur
            strength = get(handles.SliderEffects, 'Value');
            ImageMatrix = handles.ImageShow;
            shape = ones(round(strength  * 100) + 1) / (round(strength * 100) + 1)^2;
            blurred(:, :, 1) = conv2(ImageMatrix(:, :, 1), shape, 'same');
            blurred(:, :, 2) = conv2(ImageMatrix(:, :, 2), shape, 'same');
            blurred(:, :, 3) = conv2(ImageMatrix(:, :, 3), shape, 'same');
            handles.ImageShow = blurred;
            handles.ImagePlot = image(handles.ImageShow);
            setImageAxis(handles);
            
        case 8 %Brightness
            strength = get(handles.SliderEffects, 'Value');
            handles.ImageShow = handles.ImageShow * strength * 2;
            handles.ImagePlot = image(handles.ImageShow);
            setImageAxis(handles);
            
        case 9 %Contrast
            strength = get(handles.SliderEffects, 'Value');
            ImageMatrix = handles.ImageShow;
            C = strength * 510 - 255;
            F = (259 * (C + 255))/(255 * (259 - C));
            ImageMatrix = F * (ImageMatrix - 0.5) + 0.5;
            handles.ImageShow = ImageMatrix;
            handles.ImagePlot = image(handles.ImageShow);
            setImageAxis(handles);
    end
        
    guidata(hObject, handles);
end