function varargout = NewImage(varargin)
% NEWIMAGE MATLAB code for NewImage.fig
%      NEWIMAGE, by itself, creates a new NEWIMAGE or raises the existing
%      singleton*.
%
%      H = NEWIMAGE returns the handle to a new NEWIMAGE or the handle to
%      the existing singleton*.
%
%      NEWIMAGE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in NEWIMAGE.M with the given input arguments.
%
%      NEWIMAGE('Property','Value',...) creates a new NEWIMAGE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before NewImage_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to NewImage_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help NewImage

% Last Modified by GUIDE v2.5 16-Dec-2017 18:55:40

% Begin initialization code - DO NOT EDIT
    gui_Singleton = 1;
    gui_State = struct('gui_Name',       mfilename, ...
                       'gui_Singleton',  gui_Singleton, ...
                       'gui_OpeningFcn', @NewImage_OpeningFcn, ...
                       'gui_OutputFcn',  @NewImage_OutputFcn, ...
                       'gui_LayoutFcn',  [] , ...
                       'gui_Callback',   []);
    if nargin && ischar(varargin{1})
        gui_State.gui_Callback = str2func(varargin{1});
    end

    if nargout
        [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
    else
        gui_mainfcn(gui_State, varargin{:});
    end
end
% End initialization code - DO NOT EDIT


% --- Executes just before NewImage is made visible.
function NewImage_OpeningFcn(hObject, eventdata, handles, varargin)
    
    handles.output = hObject;

    guidata(hObject, handles);
    uiwait(handles.figure1);

end


% --- Outputs from this function are returned to the command line.
function varargout = NewImage_OutputFcn(hObject, eventdata, handles)
    handles.output = hObject;
    varargout{1} = [ceil(str2double(get(handles.EditWidth,'String')))  ceil(str2double(get(handles.EditHeight,'String')))];
    
    % The figure can be deleted now
    delete(handles.figure1);
end



function EditWidth_Callback(hObject, eventdata, handles)

end

% --- Executes during object creation, after setting all properties.
function EditWidth_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EditWidth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
end



function EditHeight_Callback(hObject, eventdata, handles)

end

% --- Executes during object creation, after setting all properties.
function EditHeight_CreateFcn(hObject, eventdata, handles)

    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
end


% --- Executes on button press in ButtonOK.
function ButtonOK_Callback(hObject, eventdata, handles)
    handles.output = hObject;
    Height = get(handles.EditHeight,'String');
    Width = get(handles.EditWidth,'String');
    
    Height = str2double(Height);
    Width = str2double(Width);
    
    if(Height<800 && Width<800)
        handles.Width = Width;
        handles.Height = Height;
        guidata(hObject, handles);
        close;
    end
    handles.Height = 0;
    handles.Width = 0;
end


% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure
    if isequal(get(hObject, 'waitstatus'), 'waiting')
    % The GUI is still in UIWAIT, us UIRESUME
        uiresume(hObject);
    else
    % The GUI is no longer waiting, just close it
        delete(hObject);
    end
end
