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
            currentXpos = ceil(handles.currentMousePos(1,1));
            currentYpos = ceil(handles.currentMousePos(1,2));
            Position = handles.ImageBox.Position;
           if(currentXpos >0 && currentXpos <Position(3) && currentYpos >0 && currentYpos < Position(4))
               ImageMatrix = handles.Image;
               RedEyesColor = ImageMatrix(currentXpos,currentYpos,:);
               PartSize = ceil(str2double(get(handles.pencilSizeValue,'String')))/2;
               
               tolerance = get(handles.SliderEffects,'Value');
               
               LeftBound = currentXpos-PartSize;
               RightBound = currentXpos+PartSize;
               LowerBound = currentYpos-PartSize;
               UpperBound = currentYpos+PartSize;
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
               
               PartMatrix = ImageMatrix(LeftBound:RightBound,LowerBound:UpperBound,:);
               LogicalMatrix = (PartMatrix(:,:,1)<=(RedEyesColor(1,1,1)*(1+tolerance))) + (PartMatrix(:,:,1) >= (RedEyesColor(1,1,1)*(1-tolerance)));
               LogicalMatrix = LogicalMatrix + (PartMatrix(:,:,2)<=(RedEyesColor(1,1,2)*(1+tolerance))) + (PartMatrix(:,:,2) >= (RedEyesColor(1,1,2)*(1-tolerance)));
               LogicalMatrix = LogicalMatrix + (PartMatrix(:,:,3)<=(RedEyesColor(1,1,3)*(1+tolerance))) + (PartMatrix(:,:,3) >= (RedEyesColor(1,1,3)*(1-tolerance)));


           end
               
           RedEyesColor = RedEyesColor(1)
        case 3 %Gray
            
            
            
            
        case 4 %Negative
       
            
    end
        
    guidata(hObject, handles);
end