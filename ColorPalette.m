function varargout = ColorPalette(varargin)
% COLORPALETTE MATLAB code for ColorPalette.fig
%      COLORPALETTE, by itself, creates a new COLORPALETTE or raises the existing
%      singleton*.
%
%      H = COLORPALETTE returns the handle to a new COLORPALETTE or the handle to
%      the existing singleton*.
%
%      COLORPALETTE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in COLORPALETTE.M with the given input arguments.
%
%      COLORPALETTE('Property','Value',...) creates a new COLORPALETTE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ColorPalette_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ColorPalette_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ColorPalette

% Last Modified by GUIDE v2.5 17-Dec-2017 13:26:38

% Begin initialization code - DO NOT EDIT
    gui_Singleton = 1;
    gui_State = struct('gui_Name',       mfilename, ...
                       'gui_Singleton',  gui_Singleton, ...
                       'gui_OpeningFcn', @ColorPalette_OpeningFcn, ...
                       'gui_OutputFcn',  @ColorPalette_OutputFcn, ...
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


% --- Executes just before ColorPalette is made visible.
function ColorPalette_OpeningFcn(hObject, eventdata, handles, varargin)
    handles.output = hObject;
    handles.Color = [0 0 0];
    handles.ColorMatrix = zeros(75,75,3);
    handles.ImageDisplay = image(handles.ColorMatrix);
    handles.Ok = false;
    % Update handles structure
    guidata(hObject, handles);
    
    uiwait(handles.figure1);
end

% UIWAIT makes ColorPalette wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ColorPalette_OutputFcn(hObject, eventdata, handles) 
    handles.output = hObject;
    if(handles.Ok)
        varargout{1} = handles.Color;
    else
        varargout{1} = [];
    end
    
    % The figure can be deleted now
    delete(handles.figure1);
end


% --- Executes on slider movement.
function SliderRed_Callback(hObject, eventdata, handles)
    handles.output = hObject;
    handles.Color(1) = get(handles.SliderRed,'Value');
    changeMatrix(handles)
    
    set(handles.LabelRed,'String',round(get(handles.SliderRed,'Value')*255));
    % Update handles structure
    guidata(hObject, handles);
end

function SliderRed_CreateFcn(hObject, eventdata, handles)
    % hObject    handle to SliderRed (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    empty - handles not created until after all CreateFcns called

    % Hint: slider controls usually have a light gray background.
    if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor',[.9 .9 .9]);
    end
end


% --- Executes on slider movement.
function SliderGreen_Callback(hObject, eventdata, handles)
    handles.output = hObject;
    handles.Color(2) = get(handles.SliderGreen,'Value');
    changeMatrix(handles)
    set(handles.LabelGreen,'String',round(get(handles.SliderGreen,'Value')*255));
    % Update handles structure
    guidata(hObject, handles);
end

% --- Executes during object creation, after setting all properties.
function SliderGreen_CreateFcn(hObject, eventdata, handles)
    % hObject    handle to SliderGreen (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    empty - handles not created until after all CreateFcns called

    % Hint: slider controls usually have a light gray background.
    if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor',[.9 .9 .9]);
    end
end


% --- Executes on slider movement.
function SliderBlue_Callback(hObject, eventdata, handles)
    handles.output = hObject;
    handles.Color(3) = get(handles.SliderBlue,'Value');
    changeMatrix(handles)
    set(handles.LabelBlue,'String',round(get(handles.SliderBlue,'Value')*255));
    % Update handles structure
    guidata(hObject, handles);
end


% --- Executes during object creation, after setting all properties.
function SliderBlue_CreateFcn(hObject, eventdata, handles)
    % hObject    handle to SliderBlue (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    empty - handles not created until after all CreateFcns called

    % Hint: slider controls usually have a light gray background.
    if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor',[.9 .9 .9]);
    end
end


% --- Executes on button press in ButtonOK.
function ButtonOK_Callback(hObject, eventdata, handles)
    % hObject    handle to ButtonOK (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    handles.Ok = true;
    guidata(hObject, handles);
    close;
end

% --- Executes on button press in ButtonCancel.
function ButtonCancel_Callback(hObject, eventdata, handles)
    % hObject    handle to ButtonCancel (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    close;
end

function changeMatrix(handles)
    for i = 1:3
        handles.ColorMatrix(:,:,i) =  handles.Color(i);
    end
    handles.ImageDisplay = image(handles.ColorMatrix);
end


% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
    if isequal(get(hObject, 'waitstatus'), 'waiting')
    % The GUI is still in UIWAIT, us UIRESUME
        uiresume(hObject);
    else
    % The GUI is no longer waiting, just close it
        delete(hObject);
    end
end
