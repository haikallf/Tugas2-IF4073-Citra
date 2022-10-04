function varargout = Soal3(varargin)
% SOAL3 MATLAB code for Soal3.fig
%      SOAL3, by itself, creates a new SOAL3 or raises the existing
%      singleton*.
%
%      H = SOAL3 returns the handle to a new SOAL3 or the handle to
%      the existing singleton*.
%
%      SOAL3('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SOAL3.M with the given input arguments.
%
%      SOAL3('Property','Value',...) creates a new SOAL3 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Soal3_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Soal3_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Soal3

% Last Modified by GUIDE v2.5 05-Oct-2022 01:23:23

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Soal3_OpeningFcn, ...
                   'gui_OutputFcn',  @Soal3_OutputFcn, ...
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


% --- Executes just before Soal3 is made visible.
function Soal3_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Soal3 (see VARARGIN)

% Choose default command line output for Soal3
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Soal3 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Soal3_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in soal3__uploadBtn.
function soal3__uploadBtn_Callback(hObject, eventdata, handles)
[rawname, rawpath] = uigetfile(({'*.png';'*.jpg';'*.tiff'}), 'Select Image');
fullname = [rawpath rawname];
set(handles.soal3__directory, 'String', fullname);


% --- Executes on button press in soal3__goToHomeBtn.
function soal3__goToHomeBtn_Callback(hObject, eventdata, handles)
% hObject    handle to soal3__goToHomeBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function soal3__directory_Callback(hObject, eventdata, handles)
% hObject    handle to soal3__directory (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of soal3__directory as text
%        str2double(get(hObject,'String')) returns contents of soal3__directory as a double


% --- Executes during object creation, after setting all properties.
function soal3__directory_CreateFcn(hObject, eventdata, handles)
% hObject    handle to soal3__directory (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in soal3__dropdown.
function soal3__dropdown_Callback(hObject, eventdata, handles)
% hObject    handle to soal3__dropdown (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns soal3__dropdown contents as cell array
%        contents{get(hObject,'Value')} returns selected item from soal3__dropdown


% --- Executes during object creation, after setting all properties.
function soal3__dropdown_CreateFcn(hObject, eventdata, handles)
% hObject    handle to soal3__dropdown (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in soal3__executeBtn.
function soal3__executeBtn_Callback(hObject, eventdata, handles)
fullname = get(handles.soal3__directory, 'String');
img = imread(fullname);

axes(handles.soal3__inputImg);
imshow(img);
title('Input Image');

[outputImage, fSpec] = ilpf(img);

axes(handles.soal3__outputImg);
imshow(outputImage);
title('Output Image');

axes(handles.soal3__fSpec);
imshow(fSpec, []);
title('Fourier Spectrum');
