function varargout = Soal6(varargin)
% SOAL6 MATLAB code for Soal6.fig
%      SOAL6, by itself, creates a new SOAL6 or raises the existing
%      singleton*.
%
%      H = SOAL6 returns the handle to a new SOAL6 or the handle to
%      the existing singleton*.
%
%      SOAL6('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SOAL6.M with the given input arguments.
%
%      SOAL6('Property','Value',...) creates a new SOAL6 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Soal6_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Soal6_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Soal6

% Last Modified by GUIDE v2.5 06-Oct-2022 23:58:03

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Soal6_OpeningFcn, ...
                   'gui_OutputFcn',  @Soal6_OutputFcn, ...
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
% End initialization code - DO NOT EDIT


% --- Executes just before Soal6 is made visible.
function Soal6_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Soal6 (see VARARGIN)

% Choose default command line output for Soal6
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Soal6 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Soal6_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in soal6__dropdown.
function soal6__dropdown_Callback(hObject, eventdata, handles)
% hObject    handle to soal6__dropdown (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns soal6__dropdown contents as cell array
%        contents{get(hObject,'Value')} returns selected item from soal6__dropdown


% --- Executes during object creation, after setting all properties.
function soal6__dropdown_CreateFcn(hObject, eventdata, handles)
% hObject    handle to soal6__dropdown (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in soal6__executeBtn.
function soal6__executeBtn_Callback(hObject, eventdata, handles)
idx = get(handles.soal6__dropdown,'Value');
items = get(handles.soal6__dropdown,'String');
selectedItem = items{idx};

[inputImage, fSpec, outputImage] = periodicNoise(selectedItem);

axes(handles.soal6__inputImg);
imshow(inputImage);
title('Input Image');

axes(handles.soal6__fSpec);
imagesc(fSpec);
colormap(gray);
title('Fourier Spectrum');

axes(handles.soal6__outputImg);
imshow(outputImage, []);
title('Output Image');


% --- Executes on button press in soal6__goToHomeBtn.
function soal6__goToHomeBtn_Callback(hObject, eventdata, handles)
close(Soal6);
Home;
