function varargout = soal1(varargin)
% SOAL1 MATLAB code for soal1.fig
%      SOAL1, by itself, creates a new SOAL1 or raises the existing
%      singleton*.
%
%      H = SOAL1 returns the handle to a new SOAL1 or the handle to
%      the existing singleton*.
%
%      SOAL1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SOAL1.M with the given input arguments.
%
%      SOAL1('Property','Value',...) creates a new SOAL1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before soal1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to soal1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help soal1

% Last Modified by GUIDE v2.5 06-Oct-2022 21:45:51

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @soal1_OpeningFcn, ...
                   'gui_OutputFcn',  @soal1_OutputFcn, ...
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


% --- Executes just before soal1 is made visible.
function soal1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to soal1 (see VARARGIN)

% Choose default command line output for soal1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes soal1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = soal1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in home_btn.
function home_btn_Callback(hObject, eventdata, handles)
close(soal1);
Home;




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


% --- Executes on button press in browse_btn.
function browse_btn_Callback(hObject, eventdata, handles)
[rawname, rawpath] = uigetfile(({'*.png';'*.jpg';'*.tiff'}), 'Select Image');
fullname = [rawpath rawname];
set(handles.directory, 'String', fullname);



% --- Executes on button press in convolute_btn.
function convolute_btn_Callback(hObject, eventdata, handles)
fullname = get(handles.directory, 'String');
img = imread(fullname);

axes(handles.axes1);
% imshow(grayscale_img);
imshow(img);

axes(handles.axes2);
convoluted = processing_convo(img);
imshow(convoluted);
