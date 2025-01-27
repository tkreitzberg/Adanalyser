function varargout = ElectrodesDialog(varargin)
% ELECTRODESDIALOG MATLAB code for ElectrodesDialog.fig
%      ELECTRODESDIALOG, by itself, creates a new ELECTRODESDIALOG or raises the existing
%      singleton*.
%
%      H = ELECTRODESDIALOG returns the handle to a new ELECTRODESDIALOG or the handle to
%      the existing singleton*.
%
%      ELECTRODESDIALOG('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ELECTRODESDIALOG.M with the given input arguments.
%
%      ELECTRODESDIALOG('Property','Value',...) creates a new ELECTRODESDIALOG or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ElectrodesDialog_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ElectrodesDialog_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ElectrodesDialog

% Last Modified by GUIDE v2.5 16-Sep-2015 20:01:03

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ElectrodesDialog_OpeningFcn, ...
                   'gui_OutputFcn',  @ElectrodesDialog_OutputFcn, ...
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


% --- Executes just before ElectrodesDialog is made visible.
function ElectrodesDialog_OpeningFcn(hObject, eventdata, handles, varargin)
% Choose default command line output for ElectrodesDialog
handles.output = hObject;
% create an axes that spans the whole gui
ah = axes('unit', 'normalized', 'position', [0.0 0.07 0.5 0.85]); 
% import the background image and show it on the axes
bg = imread('background.jpg'); 
imagesc(bg);
% prevent plotting over the background and turn the axis off
set(ah,'handlevisibility','off','visible','off')
% making sure the background is behind all the other uicontrols
uistack(ah, 'bottom');
% Update handles structure
guidata(hObject, handles);



% --- Outputs from this function are returned to the command line.
function varargout = ElectrodesDialog_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in fp1.
function fp1_Callback(hObject, eventdata, handles)
[filename, pathname] = uigetfile('*.txt;*.csv', 'Select EDA File','MultiSelect', 'off');

% --- Executes on button press in fp2.
function fp2_Callback(hObject, eventdata, handles)
[filename, pathname] = uigetfile('*.txt;*.csv', 'Select EDA File','MultiSelect', 'off');

% --- Executes on button press in fpz.
function fpz_Callback(hObject, eventdata, handles)
[filename, pathname] = uigetfile('*.txt;*.csv', 'Select EDA File','MultiSelect', 'off');

% --- Executes on button press in fz.
function fz_Callback(hObject, eventdata, handles)
[filename, pathname] = uigetfile('*.txt;*.csv', 'Select EDA File','MultiSelect', 'off');

% --- Executes on button press in f3.
function f3_Callback(hObject, eventdata, handles)
[filename, pathname] = uigetfile('*.txt;*.csv', 'Select EDA File','MultiSelect', 'off');

% --- Executes on button press in f4.
function f4_Callback(hObject, eventdata, handles)
[filename, pathname] = uigetfile('*.txt;*.csv', 'Select EDA File','MultiSelect', 'off');

% --- Executes on button press in f7.
function f7_Callback(hObject, eventdata, handles)
[filename, pathname] = uigetfile('*.txt;*.csv', 'Select EDA File','MultiSelect', 'off');

% --- Executes on button press in f8.
function f8_Callback(hObject, eventdata, handles)
[filename, pathname] = uigetfile('*.txt;*.csv', 'Select EDA File','MultiSelect', 'off');

% --- Executes on button press in t3.
function t3_Callback(hObject, eventdata, handles)
[filename, pathname] = uigetfile('*.txt;*.csv', 'Select EDA File','MultiSelect', 'off');

% --- Executes on button press in t4.
function t4_Callback(hObject, eventdata, handles)
[filename, pathname] = uigetfile('*.txt;*.csv', 'Select EDA File','MultiSelect', 'off');

% --- Executes on button press in cz.
function cz_Callback(hObject, eventdata, handles)
[filename, pathname] = uigetfile('*.txt;*.csv', 'Select EDA File','MultiSelect', 'off');

% --- Executes on button press in c4.
function c4_Callback(hObject, eventdata, handles)
[filename, pathname] = uigetfile('*.txt;*.csv', 'Select EDA File','MultiSelect', 'off');

% --- Executes on button press in c3.
function c3_Callback(hObject, eventdata, handles)
[filename, pathname] = uigetfile('*.txt;*.csv', 'Select EDA File','MultiSelect', 'off');

% --- Executes on button press in p3.
function p3_Callback(hObject, eventdata, handles)
[filename, pathname] = uigetfile('*.txt;*.csv', 'Select EDA File','MultiSelect', 'off');

% --- Executes on button press in p4.
function p4_Callback(hObject, eventdata, handles)
[filename, pathname] = uigetfile('*.txt;*.csv', 'Select EDA File','MultiSelect', 'off');

% --- Executes on button press in pz.
function pz_Callback(hObject, eventdata, handles)
[filename, pathname] = uigetfile('*.txt;*.csv', 'Select EDA File','MultiSelect', 'off');

% --- Executes on button press in t5.
function t5_Callback(hObject, eventdata, handles)
[filename, pathname] = uigetfile('*.txt;*.csv', 'Select EDA File','MultiSelect', 'off');

% --- Executes on button press in t6.
function t6_Callback(hObject, eventdata, handles)
[filename, pathname] = uigetfile('*.txt;*.csv', 'Select EDA File','MultiSelect', 'off');

% --- Executes on button press in o1.
function o1_Callback(hObject, eventdata, handles)
[filename, pathname] = uigetfile('*.txt;*.csv', 'Select EDA File','MultiSelect', 'off');

% --- Executes on button press in o2.
function o2_Callback(hObject, eventdata, handles)
[filename, pathname] = uigetfile('*.txt;*.csv', 'Select EDA File','MultiSelect', 'off');

% --- Executes on button press in oz.
function oz_Callback(hObject, eventdata, handles)
[filename, pathname] = uigetfile('*.txt;*.csv', 'Select EDA File','MultiSelect', 'off');


% --- Executes on button press in ok.
function ok_Callback(hObject, eventdata, handles)
% hObject    handle to ok (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in cancel.
function cancel_Callback(hObject, eventdata, handles)
% hObject    handle to cancel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
