function varargout = Main(varargin)
% MAIN MATLAB code for Main.fig
%      MAIN, by itself, creates a new MAIN or raises the existing
%      singleton*.
%
%      H = MAIN returns the handle to a new MAIN or the handle to
%      the existing singleton*.
%
%      MAIN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAIN.M with the given input arguments.
%
%      MAIN('Property','Value',...) creates a new MAIN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Main_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Main_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Main

% Last Modified by GUIDE v2.5 17-Dec-2017 19:51:36

% Begin initialization code - DO NOT EDIT
    gui_Singleton = 1;
    gui_State = struct('gui_Name',       mfilename, ...
                       'gui_Singleton',  gui_Singleton, ...
                       'gui_OpeningFcn', @Main_OpeningFcn, ...
                       'gui_OutputFcn',  @Main_OutputFcn, ...
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


function Main_OpeningFcn(hObject, eventdata, handles, varargin)

    handles.output = hObject;
    Position = get(handles.ImageBox,'Position');
    % --------------------------
    %      Global variables
    % --------------------------
    handles.mouseDown = false;
    handles.Image = ones(Position(3),Position(4),3);
    handles.ImagePlot = image(handles.Image);
    handles.currentMousePos = [0 0];
    handles.previousMousePos = [0 0];
    handles.pencilSize = 1;
    handles.pencilShape = [1];
    handles.pencilShapeSelected = 1;
    handles.SelectedColor = [0,0,0];
    
    % ----------------------
    %      Mouse events
    % ----------------------
    set(handles.ImagePlot,'ButtonDownFcn',@clickedOnImage);
    set(gcf, 'WindowButtonMotionFcn', @mouseMove);
    set(gcf, 'WindowButtonDownFcn', @mouseDown);
    set(gcf, 'WindowButtonUpFcn', @mouseUp);
    
    
    % Update handles structure
    guidata(hObject, handles);

end


function varargout = Main_OutputFcn(hObject, eventdata, handles) 

    varargout{1} = handles.output;
end
