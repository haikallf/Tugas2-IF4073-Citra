function varargout = soal2_smoothing_blpf(varargin)
% SOAL2_SMOOTHING_BLPF MATLAB code for soal2_smoothing_blpf.fig
%      SOAL2_SMOOTHING_BLPF, by itself, creates a new SOAL2_SMOOTHING_BLPF or raises the existing
%      singleton*.
%
%      H = SOAL2_SMOOTHING_BLPF returns the handle to a new SOAL2_SMOOTHING_BLPF or the handle to
%      the existing singleton*.
%
%      SOAL2_SMOOTHING_BLPF('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SOAL2_SMOOTHING_BLPF.M with the given input arguments.
%
%      SOAL2_SMOOTHING_BLPF('Property','Value',...) creates a new SOAL2_SMOOTHING_BLPF or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before soal2_smoothing_blpf_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to soal2_smoothing_blpf_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help soal2_smoothing_blpf

% Last Modified by GUIDE v2.5 06-Oct-2022 23:13:05

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @soal2_smoothing_blpf_OpeningFcn, ...
                   'gui_OutputFcn',  @soal2_smoothing_blpf_OutputFcn, ...
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


% --- Executes just before soal2_smoothing_blpf is made visible.
function soal2_smoothing_blpf_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to soal2_smoothing_blpf (see VARARGIN)

% Choose default command line output for soal2_smoothing_blpf
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes soal2_smoothing_blpf wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = soal2_smoothing_blpf_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in browse_btn.
function browse_btn_Callback(hObject, eventdata, handles)
[rawname, rawpath] = uigetfile(({'*.png';'*.jpg';'*.tiff'}), 'Select Image');
fullname = [rawpath rawname];
set(handles.directory, 'String', fullname);


function directory_Callback(hObject, eventdata, handles)
% hObject    handle to directory (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of directory as text
%        str2double(get(hObject,'String')) returns contents of directory as a double


% --- Executes during object creation, after setting all properties.
function directory_CreateFcn(hObject, eventdata, handles)
% hObject    handle to directory (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in home_btn.
function home_btn_Callback(hObject, eventdata, handles)

close(soal2_smoothing_blpf);



function dnol_Callback(hObject, eventdata, handles)
% hObject    handle to dnol (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of dnol as text
%        str2double(get(hObject,'String')) returns contents of dnol as a double


% --- Executes during object creation, after setting all properties.
function dnol_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dnol (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in blpf_smooth.
function blpf_smooth_Callback(hObject, eventdata, handles)
fullname = get(handles.directory, 'String');
dnol = get(handles.dnol, 'String');
dnol = str2double(dnol);
n = get(handles.n, 'String');
n = str2double(n);
img = imread(fullname);

axes(handles.axes1);
% imshow(grayscale_img);
imshow(img);

axes(handles.axes2);
img = im2gray(img);
blpf_smooth = blpf(img, dnol, n);
imshow(blpf_smooth);



function n_Callback(hObject, eventdata, handles)
% hObject    handle to n (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of n as text
%        str2double(get(hObject,'String')) returns contents of n as a double


% --- Executes during object creation, after setting all properties.
function n_CreateFcn(hObject, eventdata, handles)
% hObject    handle to n (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
