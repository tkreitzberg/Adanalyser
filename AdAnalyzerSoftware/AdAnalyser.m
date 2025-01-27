% adanalyser class
% gui controller
function varargout = AdAnalyser(varargin)
% ADANALYSER MATLAB code for AdAnalyser.fig
%      ADANALYSER, by itself, creates a new ADANALYSER or raises the existing
%      singleton*.
%
%      H = ADANALYSER returns the handle to a new ADANALYSER or the handle to
%      the existing singleton*.
%
%      ADANALYSER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ADANALYSER.M with the given input arguments.
%
%      ADANALYSER('Property','Value',...) creates a new ADANALYSER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before AdAnalyser_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to AdAnalyser_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help AdAnalyser

% Last Modified by GUIDE v2.5 14-Sep-2015 15:39:56

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @AdAnalyser_OpeningFcn, ...
    'gui_OutputFcn',  @AdAnalyser_OutputFcn, ...
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


%% Executes just before AdAnalyser is made visible.
%   global variables initialisation happens here 
function AdAnalyser_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);
global conf
global configManager
conf = Config;
configManager = ConfigManager; 

% --- Outputs from this function are returned to the command line.
function varargout = AdAnalyser_OutputFcn(hObject, eventdata, handles)
varargout{1} = handles.output;

%%% BUTTONS 

% % --- Executes on button press in allOutputs.
% function allOutputs_Callback(hObject, eventdata, handles)
% global conf
% conf.EEGFig = 1;
% conf.FrequencyFig = 1;
% conf.EDAFig = 1;
% conf.DetrendedEDAFig = 1; 
% conf.HRVFig = 1; 
% conf.SubVideoEDAFig = 1;
% conf.QualityFig = 1;
% conf.BehaveFig = 1; 
% conf.Statistics = 1;  
% conf.RecurrenceFig = 1; 
% updateUI(handles);

% % --- Executes on button press in noOutputs.
% function noOutputs_Callback(hObject, eventdata, handles)
% global conf
% conf.EEGFig = 0;
% conf.FrequencyFig = 0;
% conf.EDAFig = 0;
% conf.DetrendedEDAFig = 0; 
% conf.HRVFig = 0; 
% conf.SubVideoEDAFig = 0;
% conf.QualityFig = 0;
% conf.BehaveFig = 0; 
% conf.Statistics = 0;  
% conf.RecurrenceFig =0; 
% updateUI(handles)

%% Executes when save config button pressed.
%   Uses _ConfigManager_ to save config 
function saveSettings_Callback(hObject, eventdata, handles)
global conf;
global configManager
configManager.save(conf);

%% Executes on button press in loadconf.
%   Loads _Config_ from file using global _ConfigManager_ instance
%   TODO error handling
function loadSettings_Callback(hObject, eventdata, handles)
global conf;
global configManager;
conf = configManager.load();
updateUI(handles);

%% Helper method to update ui on base of _Config_ values
function updateUI(handles)
global conf;
set(handles.outputDirectory,'String',conf.OutputDirectory);
set(handles.videoDef,'String',conf.VideoDef);
set(handles.edaFiles,'String',conf.EDAFiles);
set(handles.eegFiles,'String',conf.EEGFiles);
set(handles.ecgFiles,'String',conf.ECGFiles);

%% Brings up choose directory dialog and saves value in _Config_
function browseOutput_Callback(hObject, eventdata, handles)
global conf;
outputDirectory=uigetdir(ctfroot,'Select output directory');
if outputDirectory~=0
    conf.OutputDirectory=outputDirectory;
    set(handles.outputDirectory,'String',conf.OutputDirectory);
end

%% Brings up choose file dialog and saves choosen EDA files in _Config_
function browseEDA_Callback(hObject, eventdata, handles)
global conf;
[filenames, pathname] = uigetfile('*.txt;*.csv', 'Select EDA files','MultiSelect', 'on');
empty = isempty(pathname) || pathname(1:1)==0;
if empty==0
    if ~iscell(filenames) && ischar(filenames)
        filenames = {filenames}; % force it to be a cell array of strings
    end
    edaFiles = cell(size(filenames))
    for file = 1:numel(filenames)
        fullpath = fullfile(pathname,filenames{file});
        edaFiles = [edaFiles, fullpath];
    end
    edaFiles(cellfun('isempty',edaFiles)) = [];
    conf.EDAFiles = edaFiles;
    set(handles.edaFiles,'Value',1); %needed to avoid selection error
    set(handles.edaFiles,'String',conf.EDAFiles);
end

%% Brings up choose file dialog and saves choosen EEG files in _Config_
function browseEEG_Callback(hObject, eventdata, handles)
global conf;
[filenames, pathname] = uigetfile('*.txt;*.csv', 'Select EEG files','MultiSelect', 'on');
empty = isempty(pathname) || pathname(1:1)==0;
if empty==0
    if ~iscell(filenames) && ischar(filenames)
        filenames = {filenames}; % force it to be a cell array of strings
    end
    eegFiles = cell(size(filenames));
    for file = 1:numel(filenames)
        fullpath = fullfile(pathname,filenames{file});
        eegFiles = [eegFiles, fullpath];
    end
    eegFiles(cellfun('isempty',eegFiles)) = [];
    conf.EEGFiles = eegFiles;
    set(handles.eegFiles,'Value',1); %needed to avoid selection error
    set(handles.eegFiles,'String',conf.EEGFiles);
end

% --- Executes on button press in browseECG.
function browseECG_Callback(hObject, eventdata, handles)
global conf;
[filenames, pathname] = uigetfile('*.txt;*.csv', 'Select ECG files','MultiSelect', 'on');
empty = isempty(pathname) || pathname(1:1)==0;
if empty==0
    if ~iscell(filenames) && ischar(filenames)
        filenames = {filenames}; % force it to be a cell array of strings
    end
    ecgFiles = cell(size(filenames));
    for file = 1:numel(filenames)
        fullpath = fullfile(pathname,filenames{file});
        ecgFiles = [ecgFiles, fullpath];
    end
    ecgFiles(cellfun('isempty',ecgFiles)) = [];
    conf.ECGFiles = ecgFiles;
    set(handles.ecgFiles,'Value',1); %needed to avoid selection error
    set(handles.ecgFiles,'String',conf.ECGFiles);
end

%% Brings up choose file dialog and saves choosen video definition file in _Config_
function browseVideoDefinitions_Callback(hObject, eventdata, handles)
global conf;
[filename, pathname]=uigetfile('*.txt;*.csv','Select video definitions');
if filename~=0
    conf.VideoDef = fullfile(pathname, filename);
    set(handles.videoDef,'String',conf.VideoDef);
end

%% Starts _AnalyseAction_ when analyse button was pressed
function analyse_Callback(hObject, eventdata, handles)
global conf;
global data;
a = AnalyseAction();
a.analyse(data,conf);
disp('Done');

%% Reads data from files using _DataFactory_ when prepare button was pressed
function prepare_Callback(hObject, eventdata, handles)
global conf; 
global data; 
action = PrepareAction(); 
data = action.prepare(conf); 
if (data.isValid)
    disp('Done');
    set(handles.filter,'enable','on');
end

%% Starts _FilterAction_ when filter button was pressed
function filter_Callback(hObject, eventdata, handles)
global conf
global data
filter = FilterAction();
data = filter.filter(data,conf);
set(handles.analyse,'enable','on');
disp('Done');

%% Output directory textfield
function outputDirectory_Callback(hObject, eventdata, handles)
global conf
input = get(hObject,'String');
conf.OutputDirectory = input;

%% Video definition textfield
function videoDef_Callback(hObject, eventdata, handles)
global conf
input = get(hObject,'String');
conf.VideoDef = input;



%%% Create functions and unused callbacks generated by matlab gui editor 

% --- Executes during object creation, after setting all properties.
function outputDirectory_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function edaFiles_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edaFiles_Callback(hObject, eventdata, handles)


function eegFiles_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function eegFiles_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function lowerEEGThreshold_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function videoDef_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
% --- Executes during object creation, after setting all properties.

function upperEEGThreshold_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function qualityIndex_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function ecgFiles_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes on button press in settings.
function settings_Callback(hObject, eventdata, handles)
ConfigDialog; 


% --- Executes on button press in electrodesSettings.
function electrodesSettings_Callback(hObject, eventdata, handles)
ElectrodesDialog; 
