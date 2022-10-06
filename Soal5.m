function varargout = Soal5(varargin)
% SOAL5 MATLAB code for Soal5.fig
%      SOAL5, by itself, creates a new SOAL5 or raises the existing
%      singleton*.
%
%      H = SOAL5 returns the handle to a new SOAL5 or the handle to
%      the existing singleton*.
%
%      SOAL5('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SOAL5.M with the given input arguments.
%
%      SOAL5('Property','Value',...) creates a new SOAL5 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Soal5_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Soal5_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Soal5

% Last Modified by GUIDE v2.5 05-Oct-2022 21:58:18

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Soal5_OpeningFcn, ...
                   'gui_OutputFcn',  @Soal5_OutputFcn, ...
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


% --- Executes just before Soal5 is made visible.
function Soal5_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Soal5 (see VARARGIN)

% Choose default command line output for Soal5
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Soal5 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Soal5_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in soal5__uploadBtn.
function soal5__uploadBtn_Callback(hObject, eventdata, handles)
[rawname, rawpath] = uigetfile(({'*.png';'*.jpg';'*.tiff'}), 'Select Image');
fullname = [rawpath rawname];
set(handles.soal5__directory, 'String', fullname);


% --- Executes on button press in soal5__goToHomeBtn.
function soal5__goToHomeBtn_Callback(hObject, eventdata, handles)
% hObject    handle to soal5__goToHomeBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function soal5__directory_Callback(hObject, eventdata, handles)
% hObject    handle to soal5__directory (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of soal5__directory as text
%        str2double(get(hObject,'String')) returns contents of soal5__directory as a double


% --- Executes during object creation, after setting all properties.
function soal5__directory_CreateFcn(hObject, eventdata, handles)
% hObject    handle to soal5__directory (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in soal5__executeBtn.
function soal5__executeBtn_Callback(hObject, eventdata, handles)
fullname = get(handles.soal5__directory, 'String');
img = imread(fullname);
[x, y, z] = size(img);

noisyImage = imnoise(img,'salt & pepper', 0.1);

axes(handles.soal5__inputImg);
imshow(noisyImage);
title('Input Image');

if (z == 1)
    outputImage = medfil(noisyImage);
else
    outputImageR = medfil(noisyImage(:, :, 1));
    outputImageG = medfil(noisyImage(:, :, 2));
    outputImageB = medfil(noisyImage(:, :, 3));
    outputImage = cat(3, outputImageR, outputImageG, outputImageB);
    outputImage = uint8(outputImage);
    disp("dah")
end

axes(handles.soal5__outputImg);
imshow(outputImage);
title('Output Image');

