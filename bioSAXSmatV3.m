function varargout = bioSAXSmatV3(varargin)
% BIOSAXSMATV3 MATLAB code for bioSAXSmatV3.fig
%      BIOSAXSMATV3, by itself, creates a new BIOSAXSMATV3 or raises the existing
%      singleton*.
%
%      H = BIOSAXSMATV3 returns the handle to a new BIOSAXSMATV3 or the handle to
%      the existing singleton*.
%
%      BIOSAXSMATV3('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BIOSAXSMATV3.M with the given input arguments.
%
%      BIOSAXSMATV3('Property','Value',...) creates a new BIOSAXSMATV3 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before bioSAXSmatV3_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to bioSAXSmatV3_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help bioSAXSmatV3

% Last Modified by GUIDE v2.5 17-Nov-2022 16:47:29

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @bioSAXSmatV3_OpeningFcn, ...
                   'gui_OutputFcn',  @bioSAXSmatV3_OutputFcn, ...
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


% --- Executes just before bioSAXSmatV3 is made visible.
function bioSAXSmatV3_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to bioSAXSmatV3 (see VARARGIN)

% Choose default command line output for bioSAXSmatV3
handles.output = hObject;

% Initialise tabs
handles.tabManager = TabManager( hObject );

% Set-up a selection changed function on the create tab groups
tabGroups = handles.tabManager.TabGroups;
for tgi=1:length(tabGroups)
    set(tabGroups(tgi),'SelectionChangedFcn',@tabChangedCB)
end

% Update handles structure
guidata(hObject, handles);
bioSAXSdefault(handles);

% UIWAIT makes bioSAXSmatV3 wait for user response (see UIRESUME)
% uiwait(handles.mainFigure);



function bioSAXSdefault(handles)
bioSAXSData.dir = '.';
bioSAXSData.buf1Fn='buffer1.dat';
bioSAXSData.buf2Fn='buffer2.dat';
bioSAXSData.buf3Fn='buffer3.dat';
bioSAXSData.buf4Fn='buffer4.dat';
bioSAXSData.buf5Fn='buffer5.dat';

%bioSAXSData.bufPath='./';
bioSAXSData.buf1Sel=1;
bioSAXSData.buf2Sel=0;
bioSAXSData.buf3Sel=0;
bioSAXSData.buf4Sel=0;
bioSAXSData.buf5Sel=0;

bioSAXSData.samp1Fn='sample1.dat';
%bioSAXSData.samp1Path='./';
bioSAXSData.samp1Conc=1.0;
bioSAXSData.samp1Sel=1;
bioSAXSData.samp2Fn='sample2.dat';
%bioSAXSData.samp2Path='./';
bioSAXSData.samp2Conc=2.0;
bioSAXSData.samp2Sel=1;
bioSAXSData.samp3Fn='sample3.dat';
%bioSAXSData.samp3Path='./';
bioSAXSData.samp3Conc=3.0;
bioSAXSData.samp3Sel=1;
bioSAXSData.samp4Fn='sample4.dat';
%bioSAXSData.samp4Path='./';
bioSAXSData.samp4Conc=4.0;
bioSAXSData.samp4Sel=0;
bioSAXSData.samp5Fn='sample5.dat';
%bioSAXSData.samp5Path='./';
bioSAXSData.samp5Conc=5.0;
bioSAXSData.samp5Sel=0;
bioSAXSData.alpha = 1.00;

bioSAXSData.midSN=1;

bioSAXSData.buf1=[];
bioSAXSData.buf2=[];
bioSAXSData.buf3=[];
bioSAXSData.buf4=[];
bioSAXSData.buf5=[];

bioSAXSData.samp1=[];
bioSAXSData.samp2=[];
bioSAXSData.samp3=[];
bioSAXSData.samp4=[];
bioSAXSData.samp5=[];
bioSAXSData.samp1Bsub=[];
bioSAXSData.samp2Bsub=[];
bioSAXSData.samp3Bsub=[];
bioSAXSData.samp4Bsub=[];
bioSAXSData.samp5Bsub=[];

bioSAXSData.zeroConc=[];
bioSAXSData.mZeroConc=[];
bioSAXSData.gtot=[];

bioSAXSData.mZeroConcFn = '';
bioSAXSData.gtotFn='';

bioSAXSData.samp1Alpha=[0.9 1.0 1.1];
bioSAXSData.samp2Alpha=[0.9 1.0 1.1];
bioSAXSData.samp3Alpha=[0.9 1.0 1.1];
bioSAXSData.samp4Alpha=[0.9 1.0 1.1];
bioSAXSData.samp5Alpha=[0.9 1.0 1.1];
bioSAXSData.samp1Beta=[0.9 1.0 2.1];
bioSAXSData.samp2Beta=[0.9 1.0 2.1];
bioSAXSData.samp3Beta=[0.9 1.0 2.1];
bioSAXSData.samp4Beta=[0.9 1.0 2.1];
bioSAXSData.samp5Beta=[0.9 1.0 2.1];

bioSAXSData.alphaLB=0.90;
bioSAXSData.alphaUB=1.000;

bioSAXSData.betaLB=0.75;
bioSAXSData.betaUB=1.50;

bioSAXSData.qMin = 0.08;
bioSAXSData.qMax = 0.60;
bioSAXSData.qMerge = 0.09;

bioSAXSData.nq = 1.0;

set(handles.buf1Name,'String',bioSAXSData.buf1Fn);
set(handles.buf2Name,'String',bioSAXSData.buf2Fn);
set(handles.buf3Name,'String',bioSAXSData.buf3Fn);
set(handles.buf4Name,'String',bioSAXSData.buf4Fn);
set(handles.buf5Name,'String',bioSAXSData.buf5Fn);

set(handles.samp1Name,'String',bioSAXSData.samp1Fn);
set(handles.samp2Name,'String',bioSAXSData.samp2Fn);
set(handles.samp3Name,'String',bioSAXSData.samp3Fn);
set(handles.samp4Name,'String',bioSAXSData.samp4Fn);
set(handles.samp5Name,'String',bioSAXSData.samp5Fn);

set(handles.samp1Conc,'String',num2str(bioSAXSData.samp1Conc,'%6.3f'));
set(handles.samp2Conc,'String',num2str(bioSAXSData.samp2Conc,'%6.3f'));
set(handles.samp3Conc,'String',num2str(bioSAXSData.samp3Conc,'%6.3f'));
set(handles.samp4Conc,'String',num2str(bioSAXSData.samp4Conc,'%6.3f'));
set(handles.samp5Conc,'String',num2str(bioSAXSData.samp5Conc,'%6.3f'));

set(handles.buf1Sel,'Value',bioSAXSData.buf1Sel);
set(handles.buf2Sel,'Value',bioSAXSData.buf2Sel);
set(handles.buf3Sel,'Value',bioSAXSData.buf3Sel);
set(handles.buf4Sel,'Value',bioSAXSData.buf4Sel);
set(handles.buf5Sel,'Value',bioSAXSData.buf5Sel);

set(handles.samp1Sel,'Value',bioSAXSData.samp1Sel);
set(handles.samp2Sel,'Value',bioSAXSData.samp2Sel);
set(handles.samp3Sel,'Value',bioSAXSData.samp3Sel);
set(handles.samp4Sel,'Value',bioSAXSData.samp4Sel);
set(handles.samp5Sel,'Value',bioSAXSData.samp5Sel);

set(handles.chk1,'Value',bioSAXSData.samp1Sel);
set(handles.chk2,'Value',bioSAXSData.samp2Sel);
set(handles.chk3,'Value',bioSAXSData.samp3Sel);
set(handles.chk4,'Value',bioSAXSData.samp4Sel);
set(handles.chk5,'Value',bioSAXSData.samp5Sel);


set(handles.s1a0,'String',num2str(bioSAXSData.samp1Alpha(2),'%6.4f'));
set(handles.s2a0,'String',num2str(bioSAXSData.samp2Alpha(2),'%6.4f'));
set(handles.s3a0,'String',num2str(bioSAXSData.samp3Alpha(2),'%6.4f'));
set(handles.s4a0,'String',num2str(bioSAXSData.samp4Alpha(2),'%6.4f'));
set(handles.s5a0,'String',num2str(bioSAXSData.samp5Alpha(2),'%6.4f'));

set(handles.s1b0,'String',num2str(bioSAXSData.samp1Beta(2),'%6.4f'));
set(handles.s2b0,'String',num2str(bioSAXSData.samp2Beta(2),'%6.4f'));
set(handles.s3b0,'String',num2str(bioSAXSData.samp3Beta(2),'%6.4f'));
set(handles.s4b0,'String',num2str(bioSAXSData.samp4Beta(2),'%6.4f'));
set(handles.s5b0,'String',num2str(bioSAXSData.samp5Beta(2),'%6.4f'));

set(handles.alpha,'String', num2str(bioSAXSData.alpha,'%7.5f'));
set(handles.alphaLB,'String', num2str(bioSAXSData.alphaLB,'%0.3f'));
set(handles.alphaUB,'String', num2str(bioSAXSData.alphaUB,'%0.3f'));
set(handles.betaLB,'String', num2str(bioSAXSData.betaLB,'%0.3f'));
set(handles.betaUB,'String', num2str(bioSAXSData.betaUB,'%0.3f'));

set(handles.qMin,'String', num2str(bioSAXSData.qMin,'%6.3f'));
set(handles.qMax,'String', num2str(bioSAXSData.qMax,'%6.3f'));
set(handles.qMerge,'String', num2str(bioSAXSData.qMerge,'%6.3f'));

bioSAXSData.BetaRatio='';

%Guinier
bioSAXSData.Rg = 1.0;
bioSAXSData.RgErr = 1.0;
bioSAXSData.Io = 1.0;
bioSAXSData.IoErr = 1.0;
bioSAXSData.firstPts = 1;
bioSAXSData.endPts = 1000;
bioSAXSData.Qfit = 0.0;
bioSAXSData.midSN = 1;
%pddf
bioSAXSData.saxsFn='';
bioSAXSData.saxs=[];
bioSAXSData.pddfSAXSq1=0.005;
bioSAXSData.pddfSAXSq2=0.60;
bioSAXSData.pddfFn='';
bioSAXSData.pddf=[];
bioSAXSData.saxsFit=[];
bioSAXSData.RgGnom=-1;

%Data averaging

%bioSAXSData.avg.y2=1;
%bioSAXSData.avg.cheby=1;
bioSAXSData.avg.algorithm=[1 1 1]; % algorithm = [correlation y2 cheby ...]

bioSAXSData.avg.Q1 = 0.01;
bioSAXSData.avg.Q2 = 0.5;
bioSAXSData.avg.dir = bioSAXSData.dir;
bioSAXSData.avg.fileSerStr = '1:20';
bioSAXSData.avg.fnFormat = '%s_%5d_%5d.dat';
bioSAXSData.outlier.det=1;
bioSAXSData.outlier.nMAD=4.0;
bioSAXSData.outlier.alpha=0.05;
bioSAXSData.outlier.critP=0.20;
bioSAXSData.outlier.damage=1;

bioSAXSData.avg.buf=[];
bioSAXSData.avg.bufName = '';
bioSAXSData.avg.samp=[];
bioSAXSData.avg.sampName = ''; %Nov 19, 2022

bioSAXSData.outlier.qSeg = 2;  
set(handles.qSeg, 'Value',2);


assignin('base','bioSAXSData', bioSAXSData);


function bioSAXSData_set(bioSAXSData, handles)
% load meta data and set the GUI parameters
% fn = bioSAXSData.bufFn;
% set(handles.bufName,'String',fn);
%set(handles.bufName,'String',bioSAXSData.bufFn);

set(handles.buf1Name,'String',bioSAXSData.buf1Fn);
set(handles.buf2Name,'String',bioSAXSData.buf2Fn);
set(handles.buf3Name,'String',bioSAXSData.buf3Fn);
set(handles.buf4Name,'String',bioSAXSData.buf4Fn);
set(handles.buf5Name,'String',bioSAXSData.buf5Fn);

set(handles.samp1Name,'String',bioSAXSData.samp1Fn);
set(handles.samp2Name,'String',bioSAXSData.samp2Fn);
set(handles.samp3Name,'String',bioSAXSData.samp3Fn);
set(handles.samp4Name,'String',bioSAXSData.samp4Fn);
set(handles.samp5Name,'String',bioSAXSData.samp5Fn);

set(handles.samp1Conc,'String',num2str(bioSAXSData.samp1Conc,'%6.3f'));
set(handles.samp2Conc,'String',num2str(bioSAXSData.samp2Conc,'%6.3f'));
set(handles.samp3Conc,'String',num2str(bioSAXSData.samp3Conc,'%6.3f'));
set(handles.samp4Conc,'String',num2str(bioSAXSData.samp4Conc,'%6.3f'));
set(handles.samp5Conc,'String',num2str(bioSAXSData.samp5Conc,'%6.3f'));

%set(handles.bufSel,'Value',bioSAXSData.bufSel);
set(handles.buf1Sel,'Value',bioSAXSData.buf1Sel);
set(handles.buf2Sel,'Value',bioSAXSData.buf2Sel);
set(handles.buf3Sel,'Value',bioSAXSData.buf3Sel);
set(handles.buf4Sel,'Value',bioSAXSData.buf4Sel);
set(handles.buf5Sel,'Value',bioSAXSData.buf5Sel);

set(handles.samp1Sel,'Value',bioSAXSData.samp1Sel);
set(handles.samp2Sel,'Value',bioSAXSData.samp2Sel);
set(handles.samp3Sel,'Value',bioSAXSData.samp3Sel);
set(handles.samp4Sel,'Value',bioSAXSData.samp4Sel);
set(handles.samp5Sel,'Value',bioSAXSData.samp5Sel);

set(handles.chk1,'Value',bioSAXSData.samp1Sel);
set(handles.chk2,'Value',bioSAXSData.samp2Sel);
set(handles.chk3,'Value',bioSAXSData.samp3Sel);
set(handles.chk4,'Value',bioSAXSData.samp4Sel);
set(handles.chk5,'Value',bioSAXSData.samp5Sel);

set(handles.dirText,'String',bioSAXSData.dir);

set(handles.s1a0,'String',num2str(bioSAXSData.samp1Alpha(2),'%6.4f'));
set(handles.s2a0,'String',num2str(bioSAXSData.samp2Alpha(2),'%6.4f'));
set(handles.s3a0,'String',num2str(bioSAXSData.samp3Alpha(2),'%6.4f'));
set(handles.s4a0,'String',num2str(bioSAXSData.samp4Alpha(2),'%6.4f'));
set(handles.s5a0,'String',num2str(bioSAXSData.samp5Alpha(2),'%6.4f'));

set(handles.s1b0,'String',num2str(bioSAXSData.samp1Beta(2),'%6.4f'));
set(handles.s2b0,'String',num2str(bioSAXSData.samp2Beta(2),'%6.4f'));
set(handles.s3b0,'String',num2str(bioSAXSData.samp3Beta(2),'%6.4f'));
set(handles.s4b0,'String',num2str(bioSAXSData.samp4Beta(2),'%6.4f'));
set(handles.s5b0,'String',num2str(bioSAXSData.samp5Beta(2),'%6.4f'));

set(handles.alpha,'String', num2str(bioSAXSData.alpha,'%7.5f'));
set(handles.alphaLB,'String', num2str(bioSAXSData.alphaLB,'%0.3f'));
set(handles.alphaUB,'String', num2str(bioSAXSData.alphaUB,'%0.3f'));
set(handles.betaLB,'String', num2str(bioSAXSData.betaLB,'%0.3f'));
set(handles.betaUB,'String', num2str(bioSAXSData.betaUB,'%0.3f'));

set(handles.qMin,'String', num2str(bioSAXSData.qMin,'%6.3f'));
set(handles.qMax,'String', num2str(bioSAXSData.qMax,'%6.3f'));
set(handles.qMerge,'String', num2str(bioSAXSData.qMerge,'%6.3f'));
set(handles.qMerge,'String', num2str(bioSAXSData.qMerge,'%6.3f'));
set(handles.sZeroConc,'String', bioSAXSData.mZeroConcFn);
set(handles.BetaRatio,'String', bioSAXSData.BetaRatio);
% Guinier analysis
set(handles.mZeroConcDat,'String', bioSAXSData.mZeroConcFn);
set(handles.Rg,'String', num2str(bioSAXSData.Rg,'%6.3f'));
set(handles.Io,'String', num2str(bioSAXSData.Io,'%6.4f'));
set(handles.firstPts,'String', int2str(bioSAXSData.firstPts));
set(handles.endPts,'String', int2str(bioSAXSData.endPts));
set(handles.gtotFn,'String', bioSAXSData.gtotFn);
set(handles.midSN,'Value',bioSAXSData.midSN);

%PDDF
set(handles.pddfSAXS,'String', bioSAXSData.saxsFn);
set(handles.pddfFn,'String', bioSAXSData.pddfFn);
set(handles.pddfSAXSq1,'String', num2str(bioSAXSData.pddfSAXSq1,'%6.4f'));
set(handles.pddfSAXSq2,'String', num2str(bioSAXSData.pddfSAXSq2,'%6.4f'));
sprintf('Data set directory: %s.\n', bioSAXSData.dir)



function bioSAXSData=getData
bioSAXSData = evalin('base', 'bioSAXSData');

function setData(bioSAXSData)
assignin('base', 'bioSAXSData', bioSAXSData);

function updateBeta(handles)
%updata beta0 and beta LB & UB when change sample#X info
bioSAXSData = getData;
% sel = get(handles.bufSel, 'Value');
% bioSAXSData.bufSel=sel;
setData(bioSAXSData);



% Called when a user clicks on a tab
function tabChangedCB(src, eventdata)

%disp(['Changing tab from ' eventdata.OldValue.Title ' to ' eventdata.NewValue.Title ] );
disp('Changing tab');




% --- Outputs from this function are returned to the command line.
function varargout = bioSAXSmatV3_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes on selection change in popupmenu1.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1
bioSAXSData = getData;
% sel = get(handles.bufSel, 'Value');
% contents = cellstr(get(hObject,'String'))
choice = get(hObject,'Value');
switch choice
    case 1
        if bioSAXSData.samp1Sel==1 && isfield(bioSAXSData, 'samp1Bsub')
            bioSAXSData.mBsub=bioSAXSData.samp1Bsub;
        else
            disp('Sample #1 was not selected!');
            set(handles.msg, 'String', 'Sample #1 was not selected!');
            return;
        end

    case 2
        if bioSAXSData.samp2Sel==1 && isfield(bioSAXSData, 'samp1Bsub')
            bioSAXSData.mBsub=bioSAXSData.samp2Bsub;
        else
            disp('Sample #2 was not selected!');
            set(handles.msg, 'String', 'Sample #2 was not selected!');
            return;
        end
        
    case 3
        if bioSAXSData.samp3Sel==1 && isfield(bioSAXSData, 'samp1Bsub')
            bioSAXSData.mBsub=bioSAXSData.samp3Bsub;
        else
            disp('Sample #3 was not selected!');
            set(handles.msg, 'String', 'Sample #3 was not selected!');
            return;
        end
        
    case 4
        if bioSAXSData.samp4Sel==1 && isfield(bioSAXSData, 'samp1Bsub')
            bioSAXSData.mBsub=bioSAXSData.samp4Bsub;
        else
            disp('Sample #4 was not selected!');
            set(handles.msg, 'String', 'Sample #4 was not selected!');
            return;
        end
        
    case 5
        if bioSAXSData.samp5Sel==1 && isfield(bioSAXSData, 'samp1Bsub')
            bioSAXSData.mBsub=bioSAXSData.samp5Bsub;
        else
            disp('Sample #5 was not selected!');
            set(handles.msg, 'String', 'Sample #5 was not selected!');
            return;
        end        
    otherwise
end

setData(bioSAXSData);

% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




% --- Executes on button press in buf1Sel.
function buf1Sel_Callback(hObject, eventdata, handles)
% hObject    handle to bufSel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of bufSel
bioSAXSData = getData;
sel = get(handles.buf1Sel, 'Value');
bioSAXSData.buf1Sel=sel;
if sel == 1 
    bioSAXSData.buf2Fn = bioSAXSData.buf1Fn;
    bioSAXSData.buf3Fn = bioSAXSData.buf1Fn;
    bioSAXSData.buf4Fn = bioSAXSData.buf1Fn;
    bioSAXSData.buf5Fn = bioSAXSData.buf1Fn;
    
    bioSAXSData.buf2 = bioSAXSData.buf1;
    bioSAXSData.buf3 = bioSAXSData.buf1;
    bioSAXSData.buf4 = bioSAXSData.buf1;
    bioSAXSData.buf5 = bioSAXSData.buf1;
    
    %set(handles.buf1Name,'String',bioSAXSData.buf1Fn);
    set(handles.buf2Name,'String',bioSAXSData.buf2Fn);
    set(handles.buf3Name,'String',bioSAXSData.buf3Fn);
    set(handles.buf4Name,'String',bioSAXSData.buf4Fn);
    set(handles.buf5Name,'String',bioSAXSData.buf5Fn);    
end

setData(bioSAXSData);

% --- Executes on button press in buf2Sel.
function buf2Sel_Callback(hObject, eventdata, handles)
% hObject    handle to bufSel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of bufSel
bioSAXSData = getData;
sel = get(handles.buf1Sel, 'Value');
bioSAXSData.buf2Sel=sel;

if sel == 1 
    %bioSAXSData.buf2Fn = bioSAXSData.buf1Fn;
    bioSAXSData.buf3Fn = bioSAXSData.buf2Fn;
    bioSAXSData.buf4Fn = bioSAXSData.buf2Fn;
    bioSAXSData.buf5Fn = bioSAXSData.buf2Fn;
    
    %bioSAXSData.buf2 = bioSAXSData.buf1;
    bioSAXSData.buf3 = bioSAXSData.buf2;
    bioSAXSData.buf4 = bioSAXSData.buf2;
    bioSAXSData.buf5 = bioSAXSData.buf2;
    
    %set(handles.buf1Name,'String',bioSAXSData.buf1Fn);
    %set(handles.buf2Name,'String',bioSAXSData.buf2Fn);
    set(handles.buf3Name,'String',bioSAXSData.buf3Fn);
    set(handles.buf4Name,'String',bioSAXSData.buf4Fn);
    set(handles.buf5Name,'String',bioSAXSData.buf5Fn);    
end

setData(bioSAXSData);

% --- Executes on button press in buf3Sel.
function buf3Sel_Callback(hObject, eventdata, handles)
% hObject    handle to bufSel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of bufSel
bioSAXSData = getData;
sel = get(handles.buf1Sel, 'Value');
bioSAXSData.buf3Sel=sel;

if sel == 1 
    %bioSAXSData.buf2Fn = bioSAXSData.buf1Fn;
    %bioSAXSData.buf3Fn = bioSAXSData.buf2Fn;
    bioSAXSData.buf4Fn = bioSAXSData.buf3Fn;
    bioSAXSData.buf5Fn = bioSAXSData.buf3Fn;
    
    %bioSAXSData.buf2 = bioSAXSData.buf1;
    %bioSAXSData.buf3 = bioSAXSData.buf2;
    bioSAXSData.buf4 = bioSAXSData.buf3;
    bioSAXSData.buf5 = bioSAXSData.buf3;
    
    %set(handles.buf1Name,'String',bioSAXSData.buf1Fn);
    %set(handles.buf2Name,'String',bioSAXSData.buf2Fn);
    %set(handles.buf3Name,'String',bioSAXSData.buf3Fn);
    set(handles.buf4Name,'String',bioSAXSData.buf4Fn);
    set(handles.buf5Name,'String',bioSAXSData.buf5Fn);    
end

setData(bioSAXSData);

% --- Executes on button press in buf3Sel.
function buf4Sel_Callback(hObject, eventdata, handles)
% hObject    handle to bufSel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of bufSel
bioSAXSData = getData;
sel = get(handles.buf1Sel, 'Value');
bioSAXSData.buf4Sel=sel;

if sel == 1 
    %bioSAXSData.buf2Fn = bioSAXSData.buf1Fn;
    %bioSAXSData.buf3Fn = bioSAXSData.buf2Fn;
    %bioSAXSData.buf4Fn = bioSAXSData.buf3Fn;
    bioSAXSData.buf5Fn = bioSAXSData.buf4Fn;
    
    %bioSAXSData.buf2 = bioSAXSData.buf1;
    %bioSAXSData.buf3 = bioSAXSData.buf2;
    %bioSAXSData.buf4 = bioSAXSData.buf3;
    bioSAXSData.buf5 = bioSAXSData.buf4;
    
    %set(handles.buf1Name,'String',bioSAXSData.buf1Fn);
    %set(handles.buf2Name,'String',bioSAXSData.buf2Fn);
    %set(handles.buf3Name,'String',bioSAXSData.buf3Fn);
    %set(handles.buf4Name,'String',bioSAXSData.buf4Fn);
    set(handles.buf5Name,'String',bioSAXSData.buf5Fn);    
end

setData(bioSAXSData);


function bufName_Callback(hObject, eventdata, handles)
% hObject    handle to bufName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of bufName as text
%        str2double(get(hObject,'String')) returns contents of bufName as a double


% --- Executes during object creation, after setting all properties.
function bufName_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bufName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function samp1Conc_Callback(hObject, eventdata, handles)
% hObject    handle to samp1Conc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of samp1Conc as text
%        str2double(get(hObject,'String')) returns contents of samp1Conc as a double
bioSAXSData = getData;
conc = str2num(get(handles.samp1Conc, 'String'));
bioSAXSData.samp1Conc=conc;
setData(bioSAXSData);

% --- Executes during object creation, after setting all properties.
function samp1Conc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to samp1Conc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in samp1Sel.
function samp1Sel_Callback(hObject, eventdata, handles)
% hObject    handle to samp1Sel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of samp1Sel
bioSAXSData = getData;
sel = get(handles.samp1Sel, 'Value');
set(handles.chk1, 'Value',sel);
bioSAXSData.samp1Sel=sel;
setData(bioSAXSData);



function samp1Name_Callback(hObject, eventdata, handles)
% hObject    handle to samp1Name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of samp1Name as text
%        str2double(get(hObject,'String')) returns contents of samp1Name as a double


% --- Executes during object creation, after setting all properties.
function samp1Name_CreateFcn(hObject, eventdata, handles)
% hObject    handle to samp1Name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function samp3Conc_Callback(hObject, eventdata, handles)
% hObject    handle to samp3Conc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of samp3Conc as text
%        str2double(get(hObject,'String')) returns contents of samp3Conc as a double
bioSAXSData = getData;
conc = str2num(get(handles.samp3Conc, 'String'));
bioSAXSData.samp3Conc=conc;
setData(bioSAXSData);

% --- Executes during object creation, after setting all properties.
function samp3Conc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to samp3Conc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in samp3Sel.
function samp3Sel_Callback(hObject, eventdata, handles)
% hObject    handle to samp3Sel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of samp3Sel
bioSAXSData = getData;
sel = get(handles.samp3Sel, 'Value');
bioSAXSData.samp3Sel=sel;
setData(bioSAXSData);



function samp3Name_Callback(hObject, eventdata, handles)
% hObject    handle to samp3Name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of samp3Name as text
%        str2double(get(hObject,'String')) returns contents of samp3Name as a double


% --- Executes during object creation, after setting all properties.
function samp3Name_CreateFcn(hObject, eventdata, handles)
% hObject    handle to samp3Name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function samp2Conc_Callback(hObject, eventdata, handles)
% hObject    handle to samp2Conc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of samp2Conc as text
%        str2double(get(hObject,'String')) returns contents of samp2Conc as a double
bioSAXSData = getData;
conc = str2num(get(handles.samp2Conc, 'String'));
bioSAXSData.samp2Conc=conc;
setData(bioSAXSData);

% --- Executes during object creation, after setting all properties.
function samp2Conc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to samp2Conc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in samp2Sel.
function samp2Sel_Callback(hObject, eventdata, handles)
% hObject    handle to samp2Sel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of samp2Sel
bioSAXSData = getData;
sel = get(handles.samp2Sel, 'Value');
bioSAXSData.samp2Sel=sel;
setData(bioSAXSData);



function samp2Name_Callback(hObject, eventdata, handles)
% hObject    handle to samp2Name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of samp2Name as text
%        str2double(get(hObject,'String')) returns contents of samp2Name as a double


% --- Executes during object creation, after setting all properties.
function samp2Name_CreateFcn(hObject, eventdata, handles)
% hObject    handle to samp2Name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function samp4Conc_Callback(hObject, eventdata, handles)
% hObject    handle to samp4Conc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of samp4Conc as text
%        str2double(get(hObject,'String')) returns contents of samp4Conc as a double
bioSAXSData = getData;
conc = str2num(get(handles.samp4Conc, 'String'));
bioSAXSData.samp4Conc=conc;
setData(bioSAXSData);

% --- Executes during object creation, after setting all properties.
function samp4Conc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to samp4Conc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in samp4Sel.
function samp4Sel_Callback(hObject, eventdata, handles)
% hObject    handle to samp4Sel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of samp4Sel
bioSAXSData = getData;
sel = get(handles.samp4Sel, 'Value');
bioSAXSData.samp4Sel=sel;
setData(bioSAXSData);



function samp4Name_Callback(hObject, eventdata, handles)
% hObject    handle to samp4Name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of samp4Name as text
%        str2double(get(hObject,'String')) returns contents of samp4Name as a double


% --- Executes during object creation, after setting all properties.
function samp4Name_CreateFcn(hObject, eventdata, handles)
% hObject    handle to samp4Name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in samp5Sel.
function samp5Sel_Callback(hObject, eventdata, handles)
% hObject    handle to samp5Sel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of samp5Sel
bioSAXSData = getData;
sel = get(handles.samp5Sel, 'Value');
bioSAXSData.samp5Sel=sel;
setData(bioSAXSData);



function samp5Name_Callback(hObject, eventdata, handles)
% hObject    handle to samp5Name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of samp5Name as text
%        str2double(get(hObject,'String')) returns contents of samp5Name as a double


% --- Executes during object creation, after setting all properties.
function samp5Name_CreateFcn(hObject, eventdata, handles)
% hObject    handle to samp5Name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function samp5Conc_Callback(hObject, eventdata, handles)
% hObject    handle to samp5Conc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of samp5Conc as text
%        str2double(get(hObject,'String')) returns contents of samp5Conc as a double
bioSAXSData = getData;
conc = str2num(get(handles.samp5Conc, 'String'));
bioSAXSData.samp5Conc=conc;
setData(bioSAXSData);

% --- Executes during object creation, after setting all properties.
function samp5Conc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to samp5Conc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% fn='';
% fpath='';
bioSAXSData = getData;

[fn,fpath] = uigetfile({'*.dat; *.avg; *.txt'; '*.*'},'File Selection');
if fn ~= 0
    set(handles.buf1Name, 'String', fn);
    bioSAXSData.buf1Fn = fn;
    bioSAXSData.dir = fpath;
    bioSAXSData.buf1=readData(fullfile(fpath,fn));
    set(handles.dirText, 'String', fpath);
else
    disp('No file was select! Use previous selection!')
    %bioSAXSData.bufFn = fn;
    %bioSAXSData.bufPath = fpath;    
end
setData(bioSAXSData);

% --- Executes on button press in pushbutton1.
function pushbutton32_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% fn='';
% fpath='';
bioSAXSData = getData;

[fn,fpath] = uigetfile({'*.dat; *.avg; *.txt'; '*.*'},'File Selection');
if fn ~= 0
    set(handles.buf2Name, 'String', fn);
    bioSAXSData.buf2Fn = fn;
    bioSAXSData.dir = fpath;
    bioSAXSData.buf2=readData(fullfile(fpath,fn));
else
    disp('No file was select! Use previous selection!')
    %bioSAXSData.bufFn = fn;
    %bioSAXSData.bufPath = fpath;    
end
setData(bioSAXSData);


% --- Executes on button press in pushbutton1.
function pushbutton33_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% fn='';
% fpath='';
bioSAXSData = getData;

[fn,fpath] = uigetfile({'*.dat; *.avg; *.txt'; '*.*'},'File Selection');
if fn ~= 0
    set(handles.buf3Name, 'String', fn);
    bioSAXSData.buf3Fn = fn;
    bioSAXSData.dir = fpath;
    bioSAXSData.buf3=readData(fullfile(fpath,fn));
else
    disp('No file was select! Use previous selection!')
    %bioSAXSData.bufFn = fn;
    %bioSAXSData.bufPath = fpath;    
end
setData(bioSAXSData);

% --- Executes on button press in pushbutton1.
function pushbutton34_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% fn='';
% fpath='';
bioSAXSData = getData;

[fn,fpath] = uigetfile({'*.dat; *.avg; *.txt'; '*.*'},'File Selection');
if fn ~= 0
    set(handles.buf4Name, 'String', fn);
    bioSAXSData.buf4Fn = fn;
    bioSAXSData.dir = fpath;
    bioSAXSData.buf4=readData(fullfile(fpath,fn));
else
    disp('No file was select! Use previous selection!')
    %bioSAXSData.bufFn = fn;
    %bioSAXSData.bufPath = fpath;    
end
setData(bioSAXSData);

% --- Executes on button press in pushbutton1.
function pushbutton35_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% fn='';
% fpath='';
bioSAXSData = getData;

[fn,fpath] = uigetfile({'*.dat; *.avg; *.txt'; '*.*'},'File Selection');
if fn ~= 0
    set(handles.buf5Name, 'String', fn);
    bioSAXSData.buf5Fn = fn;
    bioSAXSData.dir = fpath;
    bioSAXSData.buf5=readData(fullfile(fpath,fn));
else
    disp('No file was select! Use previous selection!')
    %bioSAXSData.bufFn = fn;
    %bioSAXSData.bufPath = fpath;    
end
setData(bioSAXSData);



% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
bioSAXSData = getData;

[fn,fpath] = uigetfile({'*.dat; *.avg; *.txt'; '*.*'},'File Selection');
if fn ~= 0
    set(handles.samp1Name, 'String', fn);
    bioSAXSData.samp1Fn = fn;
    bioSAXSData.dir = fpath;
    bioSAXSData.samp1=readData(fullfile(fpath,fn));
    set(handles.dirText, 'String', fpath);
else
    disp('No file was select! Use previous selection!')
    %bioSAXSData.bufFn = fn;
    %bioSAXSData.bufPath = fpath;    
end
setData(bioSAXSData);

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
bioSAXSData = getData;

[fn,fpath] = uigetfile({'*.dat; *.avg; *.txt'; '*.*'},'File Selection');
if fn ~= 0
    set(handles.samp2Name, 'String', fn);
    bioSAXSData.samp2Fn = fn;
    bioSAXSData.dir = fpath;
    bioSAXSData.samp2=readData(fullfile(fpath,fn));
else
    disp('No file was select! Use previous selection!')
    %bioSAXSData.bufFn = fn;
    %bioSAXSData.bufPath = fpath;    
end
setData(bioSAXSData);

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
bioSAXSData = getData;

[fn,fpath] = uigetfile({'*.dat; *.avg; *.txt'; '*.*'},'File Selection');
if fn ~= 0
    set(handles.samp3Name, 'String', fn);
    bioSAXSData.samp3Fn = fn;
    bioSAXSData.dir = fpath;
    bioSAXSData.samp3=readData(fullfile(fpath,fn));
else
    disp('No file was select! Use previous selection!')
    %bioSAXSData.bufFn = fn;
    %bioSAXSData.bufPath = fpath;    
end
setData(bioSAXSData);

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
bioSAXSData = getData;

[fn,fpath] = uigetfile({'*.dat; *.avg; *.txt'; '*.*'},'File Selection');
if fn ~= 0
    set(handles.samp4Name, 'String', fn);
    bioSAXSData.samp4Fn = fn;
    bioSAXSData.dir = fpath;
    bioSAXSData.samp4=readData(fullfile(fpath,fn));
else
    disp('No file was select! Use previous selection!')
    %bioSAXSData.bufFn = fn;
    %bioSAXSData.bufPath = fpath;    
end
setData(bioSAXSData);

% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
bioSAXSData = getData;

[fn,fpath] = uigetfile({'*.dat; *.avg; *.txt'; '*.*'},'File Selection');
if fn ~= 0
    set(handles.samp5Name, 'String', fn);
    bioSAXSData.samp5Fn = fn;
    bioSAXSData.samp5Path = fpath;
    bioSAXSData.samp5=readData(fullfile(fpath,fn));
else
    disp('No file was select! Use previous selection!')
    %bioSAXSData.bufFn = fn;
    %bioSAXSData.bufPath = fpath;    
end
setData(bioSAXSData);


% --- Executes on button press in plotSelectedData.
function plotSelectedData_Callback(hObject, eventdata, handles)
% hObject    handle to plotSelectedData (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
bioSAXSData = getData;
kk=1;
figure(901);
xlabel('q, /A');
ylabel('I(q)');

if ~isempty(bioSAXSData.buf1)
    buf = bioSAXSData.buf1;
    fn = bioSAXSData.buf1Fn;
    loglog(buf(:,1), buf(:,2), '-k', 'LineWidth',2);
    legendText{kk}=fn;
    kk=kk+1;
    hold on;
end


if bioSAXSData.samp1Sel==1 && ~isempty(bioSAXSData.samp1)
    samp = bioSAXSData.samp1;
    fn = bioSAXSData.samp1Fn;
    loglog(samp(:,1), samp(:,2), '-r', 'LineWidth',2);
    legendText{kk}=fn;
    kk=kk+1;
    hold on;
end

if bioSAXSData.samp2Sel==1 && ~isempty(bioSAXSData.samp2)
    samp = bioSAXSData.samp2;
    fn = bioSAXSData.samp2Fn;
    loglog(samp(:,1), samp(:,2), '-b', 'LineWidth',2);
    legendText{kk}=fn;
    kk=kk+1;
    hold on;
end

if bioSAXSData.samp3Sel==1 && ~isempty(bioSAXSData.samp3)
    samp = bioSAXSData.samp3;
    fn = bioSAXSData.samp3Fn;
    loglog(samp(:,1), samp(:,2), '-g', 'LineWidth',2);
    legendText{kk}=fn;
    kk=kk+1;
    hold on;
end

if bioSAXSData.samp4Sel==1 && ~isempty(bioSAXSData.samp4)
    samp = bioSAXSData.samp4;
    fn = bioSAXSData.samp4Fn;
    loglog(samp(:,1), samp(:,2), '-m', 'LineWidth',2);
    legendText{kk}=fn;
    kk=kk+1;
    hold on;
end

if bioSAXSData.samp5Sel==1 && ~isempty(bioSAXSData.samp5)
    samp = bioSAXSData.samp5;
    fn = bioSAXSData.samp5Fn;
    loglog(samp(:,1), samp(:,2), '-c', 'LineWidth',2);
    legendText{kk}=fn;
    kk=kk+1;
    hold on;
end


if exist('legendText')
    legend(legendText);
end
xlabel('q, /A');
ylabel('I(q)');
hold off;



function alpha_Callback(hObject, eventdata, handles)
% hObject    handle to alpha (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of alpha as text
%        str2double(get(hObject,'String')) returns contents of alpha as a double
bioSAXSData = getData;
alpha=str2num(get(handles.alpha,'String'));
bioSAXSData.alpha=alpha;
setData(bioSAXSData);

% --- Executes during object creation, after setting all properties.
function alpha_CreateFcn(hObject, eventdata, handles)
% hObject    handle to alpha (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in subtractPlot.
function subtractPlot_Callback(hObject, eventdata, handles)
% hObject    handle to subtractPlot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
bioSAXSData = getData;

alpha=bioSAXSData.alpha;

% if bioSAXSData.bufSel==1 && isfield(bioSAXSData,'buf')
%     buf = bioSAXSData.buf;
%     %fn = bioSAXSData.bufFn;
%     %loglog(buf(:,1), buf(:,2), '-k', 'LineWidth',2);
%     %legendText{kk}=fn;
%     %kk=kk+1;
%     %hold on;
% else
%     disp('No Buffer data!');
%     return;
% end

kk=1;
figure(902);
xlabel('q, /A');
ylabel('I(q)');

if bioSAXSData.samp1Sel==1 
    if ~isempty(bioSAXSData.samp1) && ~isempty(bioSAXSData.buf1)
        samp = bioSAXSData.samp1;
        fn = bioSAXSData.samp1Fn;
        buf =  bioSAXSData.buf1;
        sampBSub = samp;
        sampBSub(:,2) = samp(:,2) - alpha*buf(:,2);
        if length(buf(1,:))>2 && length(samp(1,:))>2
            sampBSub(:,3) = sqrt(samp(:,3).^2 + alpha*alpha*buf(:,3).^2);
        else
            sampBSub(:,3) = 0.02 * sampBSub(:,2);
        end
        loglog(sampBSub(:,1), sampBSub(:,2), '-r', 'LineWidth',2);
        legendText{kk}=fn;
        kk=kk+1;
        hold on;
    else
        disp('data for sample #1 or buffer 1 are not ready!')
    end
end

if bioSAXSData.samp2Sel==1 
    if ~isempty(bioSAXSData.samp2) && ~isempty(bioSAXSData.buf2)
        samp = bioSAXSData.samp2;
        fn = bioSAXSData.samp2Fn;
        buf =  bioSAXSData.buf2;
        sampBSub = samp;
        sampBSub(:,2) = samp(:,2) - alpha*buf(:,2);
        if length(buf(1,:))>2 && length(samp(1,:))>2
            sampBSub(:,3) = sqrt(samp(:,3).^2 + alpha*alpha*buf(:,3).^2);
        else
            sampBSub(:,3) = 0.02 * sampBSub(:,2);
        end
        loglog(sampBSub(:,1), sampBSub(:,2), '-b', 'LineWidth',2);
        legendText{kk}=fn;
        kk=kk+1;
        hold on;
    else
        disp('data for sample #2 or buffer 2 are not ready!')
    end
end

if bioSAXSData.samp3Sel==1 
    if ~isempty(bioSAXSData.samp3) && ~isempty(bioSAXSData.buf3)
        samp = bioSAXSData.samp3;
        fn = bioSAXSData.samp3Fn;
        buf =  bioSAXSData.buf3;
        sampBSub = samp;
        sampBSub(:,2) = samp(:,2) - alpha*buf(:,2);
        if length(buf(1,:))>2 && length(samp(1,:))>2
            sampBSub(:,3) = sqrt(samp(:,3).^2 + alpha*alpha*buf(:,3).^2);
        else
            sampBSub(:,3) = 0.02 * sampBSub(:,2);
        end
        loglog(sampBSub(:,1), sampBSub(:,2), '-g', 'LineWidth',2);
        legendText{kk}=fn;
        kk=kk+1;
        hold on;
    else
        disp('data for sample #3 or buffer 3 are not ready!')
    end
end

if bioSAXSData.samp4Sel==1 
    if ~isempty(bioSAXSData.samp4) && ~isempty(bioSAXSData.buf4)
        samp = bioSAXSData.samp4;
        fn = bioSAXSData.samp4Fn;
        buf =  bioSAXSData.buf4;
        sampBSub = samp;
        sampBSub(:,2) = samp(:,2) - alpha*buf(:,2);
        if length(buf(1,:))>2 && length(samp(1,:))>2
            sampBSub(:,3) = sqrt(samp(:,3).^2 + alpha*alpha*buf(:,3).^2);
        else
            sampBSub(:,3) = 0.02 * sampBSub(:,2);
        end
        loglog(sampBSub(:,1), sampBSub(:,2), '-c', 'LineWidth',2);
        legendText{kk}=fn;
        kk=kk+1;
        hold on;
    else
        disp('data for sample #4 or buffer 4 are not ready!')
    end
end

if bioSAXSData.samp5Sel==1 
    if ~isempty(bioSAXSData.samp5) && ~isempty(bioSAXSData.buf5)
        samp = bioSAXSData.samp5;
        fn = bioSAXSData.samp5Fn;
        buf =  bioSAXSData.buf5;
        sampBSub = samp;
        sampBSub(:,2) = samp(:,2) - alpha*buf(:,2);
        if length(buf(1,:))>2 && length(samp(1,:))>2
            sampBSub(:,3) = sqrt(samp(:,3).^2 + alpha*alpha*buf(:,3).^2);
        else
            sampBSub(:,3) = 0.02 * sampBSub(:,2);
        end
        loglog(sampBSub(:,1), sampBSub(:,2), '-m', 'LineWidth',2);
        legendText{kk}=fn;
        kk=kk+1;
        hold on;
    else
        disp('data for sample #5 or buffer 5 are not ready!')
    end
end

% if bioSAXSData.samp2Sel==1 && isfield(bioSAXSData,'samp2')
%     samp = bioSAXSData.samp2;
%     fn = bioSAXSData.samp2Fn;
%     sampBSub = samp;
%     sampBSub(:,2) = samp(:,2) - alpha*buf(:,2);
%     %sampBSub(:,3) = sqrt(samp(:,3).^2 + alpha*alpha*buf(:,3).^2);
%     if length(buf(1,:))>2 && length(samp(1,:))>2
%         sampBSub(:,3) = sqrt(samp(:,3).^2 + alpha*alpha*buf(:,3).^2);
%     else
%         sampBSub(:,3) = 0.02 * sampBSub(:,2);
%     end    
%     loglog(sampBSub(:,1), sampBSub(:,2), '-b', 'LineWidth',2);
%     legendText{kk}=fn;
%     kk=kk+1;
%     hold on;
% end
% 
% if bioSAXSData.samp3Sel==1 && isfield(bioSAXSData,'samp3')
%     samp = bioSAXSData.samp3;
%     fn = bioSAXSData.samp3Fn;
%     sampBSub = samp;
%     sampBSub(:,2) = samp(:,2) - alpha*buf(:,2);
%     %sampBSub(:,3) = sqrt(samp(:,3).^2 + alpha*alpha*buf(:,3).^2);
%     if length(buf(1,:))>2 && length(samp(1,:))>2
%         sampBSub(:,3) = sqrt(samp(:,3).^2 + alpha*alpha*buf(:,3).^2);
%     else
%         sampBSub(:,3) = 0.02 * sampBSub(:,2);
%     end    
%     loglog(sampBSub(:,1), sampBSub(:,2), '-g', 'LineWidth',2);
%     legendText{kk}=fn;
%     kk=kk+1;
%     hold on;
% end
% 
% if bioSAXSData.samp4Sel==1 && isfield(bioSAXSData,'samp4')
%     samp = bioSAXSData.samp4;
%     fn = bioSAXSData.samp4Fn;
%     sampBSub = samp;
%     sampBSub(:,2) = samp(:,2) - alpha*buf(:,2);
%     %sampBSub(:,3) = sqrt(samp(:,3).^2 + alpha*alpha*buf(:,3).^2);
%     if length(buf(1,:))>2 && length(samp(1,:))>2
%         sampBSub(:,3) = sqrt(samp(:,3).^2 + alpha*alpha*buf(:,3).^2);
%     else
%         sampBSub(:,3) = 0.02 * sampBSub(:,2);
%     end    
%     loglog(sampBSub(:,1), sampBSub(:,2), '-m', 'LineWidth',2);
%     legendText{kk}=fn;
%     kk=kk+1;
%     hold on;
% end
% 
% if bioSAXSData.samp5Sel==1 && isfield(bioSAXSData,'samp5')
%     samp = bioSAXSData.samp5;
%     fn = bioSAXSData.samp5Fn;
%     sampBSub = samp;
%     sampBSub(:,2) = samp(:,2) - alpha*buf(:,2);
%     %sampBSub(:,3) = sqrt(samp(:,3).^2 + alpha*alpha*buf(:,3).^2);
%     if length(buf(1,:))>2 && length(samp(1,:))>2
%         sampBSub(:,3) = sqrt(samp(:,3).^2 + alpha*alpha*buf(:,3).^2);
%     else
%         sampBSub(:,3) = 0.02 * sampBSub(:,2);
%     end    
%     loglog(sampBSub(:,1), sampBSub(:,2), '-c', 'LineWidth',2);
%     legendText{kk}=fn;
%     kk=kk+1;
%     hold on;
% end

if exist('legendText')
    legend(legendText);
end
xlabel('q, /A');
ylabel('I(q)');
hold off;


% --- Executes on button press in subtractPlotSave.
function subtractPlotSave_Callback(hObject, eventdata, handles)
% hObject    handle to subtractPlotSave (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
bioSAXSData = getData;

alpha=bioSAXSData.alpha;
kk=1;
figure(903);

if ~isempty(bioSAXSData.buf1)
    buf = bioSAXSData.buf1;
    fn = bioSAXSData.buf1Fn;
    loglog(buf(:,1), buf(:,2), '-k', 'LineWidth',2);
    legendText{kk}=fn;
    kk=kk+1;
    hold on;
else
    disp('No Buffer data!');
    return;
end

% 
% if bioSAXSData.samp1Sel==1 
%     if ~isempty(bioSAXSData.samp1) && ~isempty(bioSAXSData.buf1)
%         samp = bioSAXSData.samp1;
%         fn = bioSAXSData.samp1Fn;
%         buf =  bioSAXSData.buf1;
%         sampBSub = samp;
%         sampBSub(:,2) = samp(:,2) - alpha*buf(:,2);
%         if length(buf(1,:))>2 && length(samp(1,:))>2
%             sampBSub(:,3) = sqrt(samp(:,3).^2 + alpha*alpha*buf(:,3).^2);
%         else
%             sampBSub(:,3) = 0.02 * sampBSub(:,2);
%         end
%         loglog(sampBSub(:,1), sampBSub(:,2), '-r', 'LineWidth',2);
%         legendText{kk}=fn;
%         kk=kk+1;
%         hold on;
%     else
%         disp('data for sample #1 or buffer 1 are not ready!')
%     end
% end
% 
% 


if bioSAXSData.samp1Sel==1 
    if ~isempty(bioSAXSData.samp1) && ~isempty(bioSAXSData.buf1)
        buf = bioSAXSData.buf1
        samp = bioSAXSData.samp1;
        fn = bioSAXSData.samp1Fn;
        fpath= bioSAXSData.dir;
        sampBSub = samp;
        sampBSub(:,2) = samp(:,2) - alpha*buf(:,2);
    %    sampBSub(:,3) = sqrt(samp(:,3).^2 + alpha*alpha*buf(:,3).^2);
        if length(buf(1,:))>2 && length(samp(1,:))>2
            sampBSub(:,3) = sqrt(samp(:,3).^2 + alpha*alpha*buf(:,3).^2);
        else
            sampBSub(:,3) = 0.02 * sampBSub(:,2);
        end
    else
        disp('data for sample #1 or buffer 1 are not ready!');
    end
    
%     loglog(sampBSub(:,1), sampBSub(:,2), '-r', 'LineWidth',2);
%     legendText{kk}=fn;
%     kk=kk+1;
%     hold on;
end

if bioSAXSData.samp2Sel==1 
    if ~isempty(bioSAXSData.samp2) && ~isempty(bioSAXSData.buf2)
        buf = bioSAXSData.buf2;
        samp = bioSAXSData.samp2;
        fn = bioSAXSData.samp2Fn;
        fpath= bioSAXSData.dir;
        sampBSub = samp;
        sampBSub(:,2) = samp(:,2) - alpha*buf(:,2);
    %    sampBSub(:,3) = sqrt(samp(:,3).^2 + alpha*alpha*buf(:,3).^2);
        if length(buf(1,:))>2 && length(samp(1,:))>2
            sampBSub(:,3) = sqrt(samp(:,3).^2 + alpha*alpha*buf(:,3).^2);
        else
            sampBSub(:,3) = 0.02 * sampBSub(:,2);
        end
    else
        disp('data for sample #2 or buffer 2 are not ready!');
    end
%     loglog(sampBSub(:,1), sampBSub(:,2), '-b', 'LineWidth',2);
%     legendText{kk}=fn;
%     kk=kk+1;
%     hold on;
end

if bioSAXSData.samp3Sel==1 
    if ~isempty(bioSAXSData.samp3) && ~isempty(bioSAXSData.buf3)
        buf = bioSAXSData.buf3;
        samp = bioSAXSData.samp3;
        fn = bioSAXSData.samp3Fn;
        fpath= bioSAXSData.dir;
        sampBSub = samp;
        sampBSub(:,2) = samp(:,2) - alpha*buf(:,2);
    %    sampBSub(:,3) = sqrt(samp(:,3).^2 + alpha*alpha*buf(:,3).^2);
        if length(buf(1,:))>2 && length(samp(1,:))>2
            sampBSub(:,3) = sqrt(samp(:,3).^2 + alpha*alpha*buf(:,3).^2);
        else
            sampBSub(:,3) = 0.02 * sampBSub(:,2);
        end
    else
        disp('data for sample #3 or buffer 3 are not ready!');
    end
%     loglog(sampBSub(:,1), sampBSub(:,2), '-g', 'LineWidth',2);
%     legendText{kk}=fn;
%     kk=kk+1;
%     hold on;
end

if bioSAXSData.samp4Sel==1 
    if ~isempty(bioSAXSData.samp4) && ~isempty(bioSAXSData.buf4)
        buf = bioSAXSData.buf4;
        samp = bioSAXSData.samp4;
        fn = bioSAXSData.samp4Fn;
        fpath= bioSAXSData.dir;
        sampBSub = samp;
        sampBSub(:,2) = samp(:,2) - alpha*buf(:,2);
    %    sampBSub(:,3) = sqrt(samp(:,3).^2 + alpha*alpha*buf(:,3).^2);
        if length(buf(1,:))>2 && length(samp(1,:))>2
            sampBSub(:,3) = sqrt(samp(:,3).^2 + alpha*alpha*buf(:,3).^2);
        else
            sampBSub(:,3) = 0.02 * sampBSub(:,2);
        end
    else
        disp('data for sample #4 or buffer 4 are not ready!');
    end
%     loglog(sampBSub(:,1), sampBSub(:,2), '-m', 'LineWidth',2);
%     legendText{kk}=fn;
%     kk=kk+1;
%     hold on;
end

if bioSAXSData.samp5Sel==1 
    if ~isempty(bioSAXSData.samp5) && ~isempty(bioSAXSData.buf5)
        buf = bioSAXSData.buf5;
        samp = bioSAXSData.samp5;
        fn = bioSAXSData.samp5Fn;
        fpath= bioSAXSData.dir;
        sampBSub = samp;
        sampBSub(:,2) = samp(:,2) - alpha*buf(:,2);
    %    sampBSub(:,3) = sqrt(samp(:,3).^2 + alpha*alpha*buf(:,3).^2);
        if length(buf(1,:))>2 && length(samp(1,:))>2
            sampBSub(:,3) = sqrt(samp(:,3).^2 + alpha*alpha*buf(:,3).^2);
        else
            sampBSub(:,3) = 0.02 * sampBSub(:,2);
        end
    else
        disp('data for sample #5 or buffer 5 are not ready!');
    end
%     loglog(sampBSub(:,1), sampBSub(:,2), '-c', 'LineWidth',2);
%     legendText{kk}=fn;
%     kk=kk+1;
%     hold on;
end

warning('off','MATLAB:Axes:NegativeDataInLogAxis');
loglog(samp(:,1), samp(:,2), '-r', 'LineWidth',2);
legendText{kk}=fn;
kk=kk+1;
hold on;

loglog(sampBSub(:,1), sampBSub(:,2), '-c', 'LineWidth',2);
legendText{kk}='BSub';
kk=kk+1;
hold on;

if exist('legendText')
    legend(legendText);
end
xlabel('q, /A');
ylabel('I(q)');

hold off;

str1 = strsplit(fn, '.');
nfName = [str1{1} '_BSub.dat'];
newFullfile=fullfile(fpath,nfName);
dlmwrite(newFullfile, sampBSub, ' ');



function mZeroConcDat_Callback(hObject, eventdata, handles)
% hObject    handle to mZeroConcDat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of mZeroConcDat as text
%        str2double(get(hObject,'String')) returns contents of mZeroConcDat as a double


% --- Executes during object creation, after setting all properties.
function mZeroConcDat_CreateFcn(hObject, eventdata, handles)
% hObject    handle to mZeroConcDat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in selectDatGuinier.
function selectDatGuinier_Callback(hObject, eventdata, handles)
% hObject    handle to selectDatGuinier (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
bioSAXSData = getData;

[fn,fpath] = uigetfile({'*.dat';'*.txt'; '*.*'},'File Selection');
if fn ~= 0
    set(handles.mZeroConcDat, 'String', fn);
    %bioSAXSData.bufFn = fn;    
    %ioSAXSData.bufPath = fpath;
    bioSAXSData.dir=fpath;
    bioSAXSData.mZeroConcFn=fn;    
    bioSAXSData.mZeroConc= readData(fullfile(fpath,fn)); 
else
    disp('No file was select! Use previous selection!')
    %bioSAXSData.bufFn = fn;
    %bioSAXSData.bufPath = fpath;    
end
setData(bioSAXSData);

% --- Executes on button press in runGuinierFit.
function runGuinierFit_Callback(hObject, eventdata, handles)
% hObject    handle to runGuinierFit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Run Guinier Fit 

bioSAXSData = getData;

if isfield(bioSAXSData,'mZeroConcFn') ~= 0 && isempty(bioSAXSData.mZeroConcFn) == 0
    datFull = fullfile(bioSAXSData.dir, bioSAXSData.mZeroConcFn);
    tmpLog = fullfile(bioSAXSData.dir,'tmp.log');
    
    Rgcmd= sprintf('autorg "%s" -f ssv > "%s"', datFull, tmpLog); 
    dos(Rgcmd);
    fid=fopen(tmpLog,'r');
    line = fgetl(fid);
    fclose(fid);
    str=strsplit(line, ' ');
    bioSAXSData.Rg   =str2num(str{1});
    bioSAXSData.RgErr=str2num(str{2});
    bioSAXSData.Io   =str2num(str{3});
    bioSAXSData.IoErr=str2num(str{4});
    bioSAXSData.firstPts = str2num(str{5});
    bioSAXSData.endPts = str2num(str{6});
    bioSAXSData.Qfit = str2num(str{7});
    
    set(handles.Rg, 'String', num2str(bioSAXSData.Rg, '%5.2f'));
    set(handles.Io, 'String', num2str(bioSAXSData.Io, '%0.3e'));
    set(handles.firstPts, 'String', num2str(bioSAXSData.firstPts));
    set(handles.endPts, 'String', num2str(bioSAXSData.endPts));
    
    set(handles.msg, 'String', sprintf('Fit Quality: %5.1f%%.', bioSAXSData.Qfit*100));
    
    pts1 = bioSAXSData.firstPts;
    pts2 = bioSAXSData.endPts;
    dat = bioSAXSData.mZeroConc;
    if isempty(dat)
        dat = readData(datFull);
    end
    q = dat(:,1);
    iq = dat(:,2);
    iqErr = dat(:,3);
    
    q2 = q(pts1:pts2).^2;
    iqfit = bioSAXSData.Io * exp(-1*(bioSAXSData.Rg)^2*q2/3.);
    
    RgQm=q(pts2) * bioSAXSData.Rg;
    pts3 = max(floor(pts1*0.9),1);
    pts4 = min(ceil(pts2*1.05),length(q));
    q3 = q(pts3:pts4).^2;
    figure(906); 
    h = errorbar(q3,iq(pts3:pts4),iqErr(pts3:pts4),'or');
    set(get(h,'Parent'), 'YScale', 'log'); hold on;
    semilogy(q2,iqfit,'-b', 'LineWidth',3); hold on;
    ylabel('Iq'); xlabel('q^2, A^-2');
    legend('iExp','iFit'); title('Guinier fitting');
    strlab=sprintf('Rg:%5.2f +/- %4.2f\nIo:%0.3E +/- %0.1E\nRg*qmax:%3.2f', bioSAXSData.Rg, bioSAXSData.RgErr, bioSAXSData.Io, bioSAXSData.IoErr,RgQm);
    TeXString=texlabel(strlab);
    text(median(q2)*1.2,median(iqfit)*1.02,TeXString); 
    hold off;
    
    [fpath, fn, ext] = fileparts(bioSAXSData.mZeroConcFn); 
    gtotFn = sprintf('%s_gtot.dat',fn);
    set(handles.gtotFn, 'String', gtotFn);
    bioSAXSData.gtotFn = gtotFn;
    %bioSAXSData.gtotFn = fullfile(fpath, gtotFn);   
else
    set(handles.msg, 'String','mZeroConcFn is empty!');
    return;
end 
setData(bioSAXSData);

% --- Executes on button press in extrapGuinier.
function extrapGuinier_Callback(hObject, eventdata, handles)
% hObject    handle to extrapGuinier (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Extrap & Save File
% extrapolate with Guinier equation

bioSAXSData = getData;
if isfield(bioSAXSData, 'Rg') && ~isempty(bioSAXSData.Rg) 
    Rg = bioSAXSData.Rg;
else
    disp('Rg was not specified!');
    set(handles.msg, 'String', 'Rg was not specified!');
    return;
end

if isfield(bioSAXSData, 'Io') && ~isempty(bioSAXSData.Io) 
    Io = bioSAXSData.Io;
else
    disp('Io was not specified!');
    set(handles.msg, 'String', 'Io was not specified!');
    return;
end

if isfield(bioSAXSData, 'firstPts') && ~isempty(bioSAXSData.firstPts) 
    firstPts = bioSAXSData.firstPts;
else
    disp('ptStart was not specified!');
    set(handles.msg, 'String', 'ptStart was not specified!');
    return;
end

if isfield(bioSAXSData, 'endPts') && ~isempty(bioSAXSData.endPts) 
    endPts = bioSAXSData.endPts;
else
    disp('ptEnd was not specified!');
    set(handles.msg, 'String', 'ptEnd was not specified!');
    return;
end

if isfield(bioSAXSData, 'gtotFn') && ~isempty(bioSAXSData.gtotFn) 
    gtotFn = bioSAXSData.gtotFn;
else
    disp('gtotFn was not specified!');
    set(handles.msg, 'String', 'gtotFn was not specified!');
    return;
end

if isfield(bioSAXSData, 'dir') && ~isempty(bioSAXSData.dir) 
    cdir = bioSAXSData.dir;
else
    disp('gtot directory was set to ./');
    set(handles.msg, 'String', 'gtot directory was set to ./');
    %return;
end

if isfield(bioSAXSData, 'mZeroConc') && ~isempty(bioSAXSData.mZeroConc) 
    zeroConcDat = bioSAXSData.mZeroConc;
else
    disp('mZeroConc was not specified!');
    set(handles.msg, 'String', 'mZeroConc was not specified!');
    return;
end

q=zeroConcDat(:,1);
iq =zeroConcDat(:,2);
iqErr =zeroConcDat(:,3);

midPts=round(0.5*(firstPts+endPts));
q2=q(1:midPts);
iq2 = Io * exp(-1/3.*Rg^2 * q2.^2);
newIq = [iq2;iq(midPts+1:end)];

if bioSAXSData.midSN
    cSN = mean(iqErr(midPts-2:midPts-2)./ iq(midPts-2:midPts-2));
    iqErr2 = cSN * iq2;
    iqErr = [iqErr2;iqErr(midPts+1:end)];
end
gtotDat =[q newIq iqErr];

bioSAXSData.gtot=gtotDat;

gtotFnFull = fullfile(cdir,gtotFn);
figure(907); loglog(q,newIq,'-ob',q,iq,'-r','LineWidth',2); hold on; 
legend('gtot','zeroConc');xlabel('q,/A');ylabel('I(q)');
title('Guinier Extrapolation');hold off;
dlmwrite(gtotFnFull, gtotDat, ' ');

setData(bioSAXSData);



function Rg_Callback(hObject, eventdata, handles)
% hObject    handle to Rg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)bioSAXSData = getData;

% Hints: get(hObject,'String') returns contents of Rg as text
%        str2double(get(hObject,'String')) returns contents of Rg as a double
bioSAXSData = getData;
Rg=str2num(get(handles.Rg, 'String'));
bioSAXSData.Rg=Rg;
setData(bioSAXSData);

% --- Executes during object creation, after setting all properties.
function Rg_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Rg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Io_Callback(hObject, eventdata, handles)
% hObject    handle to Io (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Io as text
%        str2double(get(hObject,'String')) returns contents of Io as a double
bioSAXSData = getData;
Io=str2num(get(handles.Io, 'String'));
bioSAXSData.Io=Io;
setData(bioSAXSData);

% --- Executes during object creation, after setting all properties.
function Io_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Io (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function firstPts_Callback(hObject, eventdata, handles)
% hObject    handle to firstPts (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of firstPts as text
%        str2double(get(hObject,'String')) returns contents of firstPts as a double
bioSAXSData = getData;
n=round(str2num(get(handles.firstPts, 'String')));
bioSAXSData.firstPts=n;
setData(bioSAXSData);

% --- Executes during object creation, after setting all properties.
function firstPts_CreateFcn(hObject, eventdata, handles)
% hObject    handle to firstPts (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function endPts_Callback(hObject, eventdata, handles)
% hObject    handle to endPts (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of endPts as text
%        str2double(get(hObject,'String')) returns contents of endPts as a double
bioSAXSData = getData;
n=round(str2num(get(handles.endPts, 'String')));
bioSAXSData.endPts=n;
setData(bioSAXSData);

% --- Executes during object creation, after setting all properties.
function endPts_CreateFcn(hObject, eventdata, handles)
% hObject    handle to endPts (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function gtotFn_Callback(hObject, eventdata, handles)
% hObject    handle to gtotFn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of gtotFn as text
%        str2double(get(hObject,'String')) returns contents of gtotFn as a double
bioSAXSData = getData;
fn=get(handles.gtotFn, 'String');
bioSAXSData.gtotFn=fn;
setData(bioSAXSData);

% --- Executes during object creation, after setting all properties.
function gtotFn_CreateFcn(hObject, eventdata, handles)
% hObject    handle to gtotFn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in kratkyPlot.
function kratkyPlot_Callback(hObject, eventdata, handles)
% hObject    handle to kratkyPlot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
bioSAXSData = getData;
if ~isempty(bioSAXSData.gtot)
    dat = bioSAXSData.gtot;
elseif ~isempty(bioSAXSData.mZeroConc)
    dat = bioSAXSData.mZeroConc;
else
    set(handles.msg, 'Data not ready!');
    return ;
end

q = dat(:,1);
iq = dat(:,2);
q2Iq = q.^2 .*iq;

figure(908); plot(q,q2Iq,'-r','LineWidth',2); hold on; 
xlabel('q,/A');ylabel('q2I(q)');
title('Kratky Plot');hold off;
setData(bioSAXSData);

% --- Executes on button press in saveMetaData.
function saveMetaData_Callback(hObject, eventdata, handles)
% hObject    handle to saveMetaData (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
bioSAXSData = getData;
[filename, pathname] = uiputfile( 'bioSAXS_meta.mat', 'Save file name(*.mat)');
if filename==0 return;
else
    save([pathname, filename], 'bioSAXSData');
end  
setData(bioSAXSData);

% --- Executes on button press in loadMetaData.
function loadMetaData_Callback(hObject, eventdata, handles)
% hObject    handle to loadMetaData (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
bioSAXSData = getData;
[fn,fpath] = uigetfile({'*.mat'; '*.*'},'Select matlab file(*.mat)');
if fn==0 return;
else
    load(fullfile(fpath, fn));
    bioSAXSData_set(bioSAXSData, handles);
end  
setData(bioSAXSData);

% --- Executes on button press in chk2.
function chk2_Callback(hObject, eventdata, handles)
% hObject    handle to chk2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of chk2
bioSAXSData = getData;
sel = get(handles.chk2, 'Value');
set(handles.samp2Sel, 'Value',sel);
bioSAXSData.samp2Sel=sel;
setData(bioSAXSData);


% --- Executes on button press in chk3.
function chk3_Callback(hObject, eventdata, handles)
% hObject    handle to chk3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of chk3
bioSAXSData = getData;
sel = get(handles.chk3, 'Value');
set(handles.samp3Sel, 'Value',sel);
bioSAXSData.samp3Sel=sel;
setData(bioSAXSData);

% --- Executes on button press in chk4.
function chk4_Callback(hObject, eventdata, handles)
% hObject    handle to chk4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of chk4
bioSAXSData = getData;
sel = get(handles.chk4, 'Value');
set(handles.samp4Sel, 'Value',sel);
bioSAXSData.samp4Sel=sel;
setData(bioSAXSData);

% --- Executes on button press in chk5.
function chk5_Callback(hObject, eventdata, handles)
% hObject    handle to chk5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of chk5
bioSAXSData = getData;
sel = get(handles.chk5, 'Value');
set(handles.samp5Sel, 'Value',sel);
bioSAXSData.samp5Sel=sel;
setData(bioSAXSData);


% --- Executes on button press in chk1.
function chk1_Callback(hObject, eventdata, handles)
% hObject    handle to chk1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of chk1
bioSAXSData = getData;
sel = get(handles.chk1, 'Value');
set(handles.samp1Sel, 'Value',sel);
bioSAXSData.samp1Sel=sel;
setData(bioSAXSData);



function s1aU_Callback(hObject, eventdata, handles)
% hObject    handle to s1aU (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of s1aU as text
%        str2double(get(hObject,'String')) returns contents of s1aU as a double
bioSAXSData = getData;
val = str2num(get(handles.s1aU, 'String'));
bioSAXSData.samp1Alpha(1)=val;
setData(bioSAXSData);

% --- Executes during object creation, after setting all properties.
function s1aU_CreateFcn(hObject, eventdata, handles)
% hObject    handle to s1aU (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function s2aU_Callback(hObject, eventdata, handles)
% hObject    handle to s2aU (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of s2aU as text
%        str2double(get(hObject,'String')) returns contents of s2aU as a double
bioSAXSData = getData;
val = str2num(get(handles.s2aU, 'String'));
bioSAXSData.samp2Alpha(1)=val;
setData(bioSAXSData);

% --- Executes during object creation, after setting all properties.
function s2aU_CreateFcn(hObject, eventdata, handles)
% hObject    handle to s2aU (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function s3aU_Callback(hObject, eventdata, handles)
% hObject    handle to s3aU (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of s3aU as text
%        str2double(get(hObject,'String')) returns contents of s3aU as a double
bioSAXSData = getData;
val = str2num(get(handles.s3aU, 'String'));
bioSAXSData.samp3Alpha(1)=val;
setData(bioSAXSData);

% --- Executes during object creation, after setting all properties.
function s3aU_CreateFcn(hObject, eventdata, handles)
% hObject    handle to s3aU (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function s4aU_Callback(hObject, eventdata, handles)
% hObject    handle to s4aU (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of s4aU as text
%        str2double(get(hObject,'String')) returns contents of s4aU as a double
bioSAXSData = getData;
val = str2num(get(handles.s4aU, 'String'));
bioSAXSData.samp4Alpha(1)=val;
setData(bioSAXSData);

% --- Executes during object creation, after setting all properties.
function s4aU_CreateFcn(hObject, eventdata, handles)
% hObject    handle to s4aU (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function s5aU_Callback(hObject, eventdata, handles)
% hObject    handle to s5aU (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of s5aU as text
%        str2double(get(hObject,'String')) returns contents of s5aU as a double
bioSAXSData = getData;
val = str2num(get(handles.s5aU, 'String'));
bioSAXSData.samp5Alpha(1)=val;
setData(bioSAXSData);

% --- Executes during object creation, after setting all properties.
function s5aU_CreateFcn(hObject, eventdata, handles)
% hObject    handle to s5aU (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function s1a0_Callback(hObject, eventdata, handles)
% hObject    handle to s1a0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of s1a0 as text
%        str2double(get(hObject,'String')) returns contents of s1a0 as a double
bioSAXSData = getData;
val = str2num(get(handles.s1aU, 'String'));
bioSAXSData.samp1Alpha(2)=val;
setData(bioSAXSData);

% --- Executes during object creation, after setting all properties.
function s1a0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to s1a0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function s2a0_Callback(hObject, eventdata, handles)
% hObject    handle to s2a0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of s2a0 as text
%        str2double(get(hObject,'String')) returns contents of s2a0 as a double
bioSAXSData = getData;
val = str2num(get(handles.s2aU, 'String'));
bioSAXSData.samp2Alpha(2)=val;
setData(bioSAXSData);

% --- Executes during object creation, after setting all properties.
function s2a0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to s2a0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function s3a0_Callback(hObject, eventdata, handles)
% hObject    handle to s3a0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of s3a0 as text
%        str2double(get(hObject,'String')) returns contents of s3a0 as a double
bioSAXSData = getData;
val = str2num(get(handles.s3aU, 'String'));
bioSAXSData.samp3Alpha(2)=val;
setData(bioSAXSData);

% --- Executes during object creation, after setting all properties.
function s3a0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to s3a0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function s4a0_Callback(hObject, eventdata, handles)
% hObject    handle to s4a0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of s4a0 as text
%        str2double(get(hObject,'String')) returns contents of s4a0 as a double
bioSAXSData = getData;
val = str2num(get(handles.s4aU, 'String'));
bioSAXSData.samp4Alpha(2)=val;
setData(bioSAXSData);

% --- Executes during object creation, after setting all properties.
function s4a0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to s4a0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function s5a0_Callback(hObject, eventdata, handles)
% hObject    handle to s5a0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of s5a0 as text
%        str2double(get(hObject,'String')) returns contents of s5a0 as a double
bioSAXSData = getData;
val = str2num(get(handles.s5aU, 'String'));
bioSAXSData.samp5Alpha(2)=val;
setData(bioSAXSData);

% --- Executes during object creation, after setting all properties.
function s5a0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to s5a0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function s1aL_Callback(hObject, eventdata, handles)
% hObject    handle to s1aL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of s1aL as text
%        str2double(get(hObject,'String')) returns contents of s1aL as a double
bioSAXSData = getData;
val = str2num(get(handles.s1aL, 'String'));
bioSAXSData.samp1Alpha(3)=val;
setData(bioSAXSData);

% --- Executes during object creation, after setting all properties.
function s1aL_CreateFcn(hObject, eventdata, handles)
% hObject    handle to s1aL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function s2aL_Callback(hObject, eventdata, handles)
% hObject    handle to s2aL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of s2aL as text
%        str2double(get(hObject,'String')) returns contents of s2aL as a double
bioSAXSData = getData;
val = str2num(get(handles.s2aL, 'String'));
bioSAXSData.samp2Alpha(3)=val;
setData(bioSAXSData);

% --- Executes during object creation, after setting all properties.
function s2aL_CreateFcn(hObject, eventdata, handles)
% hObject    handle to s2aL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function s3aL_Callback(hObject, eventdata, handles)
% hObject    handle to s3aL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of s3aL as text
%        str2double(get(hObject,'String')) returns contents of s3aL as a double
bioSAXSData = getData;
val = str2num(get(handles.s3aL, 'String'));
bioSAXSData.samp3Alpha(3)=val;
setData(bioSAXSData);

% --- Executes during object creation, after setting all properties.
function s3aL_CreateFcn(hObject, eventdata, handles)
% hObject    handle to s3aL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function s4aL_Callback(hObject, eventdata, handles)
% hObject    handle to s4aL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of s4aL as text
%        str2double(get(hObject,'String')) returns contents of s4aL as a double
bioSAXSData = getData;
val = str2num(get(handles.s4aL, 'String'));
bioSAXSData.samp4Alpha(3)=val;
setData(bioSAXSData);

% --- Executes during object creation, after setting all properties.
function s4aL_CreateFcn(hObject, eventdata, handles)
% hObject    handle to s4aL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function s5aL_Callback(hObject, eventdata, handles)
% hObject    handle to s5aL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of s5aL as text
%        str2double(get(hObject,'String')) returns contents of s5aL as a double
bioSAXSData = getData;
val = str2num(get(handles.s5aL, 'String'));
bioSAXSData.samp5Alpha(3)=val;
setData(bioSAXSData);

% --- Executes during object creation, after setting all properties.
function s5aL_CreateFcn(hObject, eventdata, handles)
% hObject    handle to s5aL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function s1bU_Callback(hObject, eventdata, handles)
% hObject    handle to s1bU (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of s1bU as text
%        str2double(get(hObject,'String')) returns contents of s1bU as a double
bioSAXSData = getData;
val = str2num(get(handles.s1bU, 'String'));
bioSAXSData.samp1Beta(1)=val;
setData(bioSAXSData);

% --- Executes during object creation, after setting all properties.
function s1bU_CreateFcn(hObject, eventdata, handles)
% hObject    handle to s1bU (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function s2bU_Callback(hObject, eventdata, handles)
% hObject    handle to s2bU (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of s2bU as text
%        str2double(get(hObject,'String')) returns contents of s2bU as a double
bioSAXSData = getData;
val = str2num(get(handles.s2bU, 'String'));
bioSAXSData.samp2Beta(1)=val;
setData(bioSAXSData);

% --- Executes during object creation, after setting all properties.
function s2bU_CreateFcn(hObject, eventdata, handles)
% hObject    handle to s2bU (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function s3bU_Callback(hObject, eventdata, handles)
% hObject    handle to s3bU (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of s3bU as text
%        str2double(get(hObject,'String')) returns contents of s3bU as a double
bioSAXSData = getData;
val = str2num(get(handles.s3bU, 'String'));
bioSAXSData.samp3Beta(1)=val;
setData(bioSAXSData);

% --- Executes during object creation, after setting all properties.
function s3bU_CreateFcn(hObject, eventdata, handles)
% hObject    handle to s3bU (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function s4bU_Callback(hObject, eventdata, handles)
% hObject    handle to s4bU (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of s4bU as text
%        str2double(get(hObject,'String')) returns contents of s4bU as a double
bioSAXSData = getData;
val = str2num(get(handles.s4bU, 'String'));
bioSAXSData.samp4Beta(1)=val;
setData(bioSAXSData);

% --- Executes during object creation, after setting all properties.
function s4bU_CreateFcn(hObject, eventdata, handles)
% hObject    handle to s4bU (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function s5bU_Callback(hObject, eventdata, handles)
% hObject    handle to s5bU (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of s5bU as text
%        str2double(get(hObject,'String')) returns contents of s5bU as a double
bioSAXSData = getData;
val = str2num(get(handles.s5bU, 'String'));
bioSAXSData.samp5Beta(1)=val;
setData(bioSAXSData);

% --- Executes during object creation, after setting all properties.
function s5bU_CreateFcn(hObject, eventdata, handles)
% hObject    handle to s5bU (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function s1b0_Callback(hObject, eventdata, handles)
% hObject    handle to s1b0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of s1b0 as text
%        str2double(get(hObject,'String')) returns contents of s1b0 as a double
bioSAXSData = getData;
val = str2num(get(handles.s1b0, 'String'));
bioSAXSData.samp1Beta(2)=val;
setData(bioSAXSData);

% --- Executes during object creation, after setting all properties.
function s1b0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to s1b0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function s2b0_Callback(hObject, eventdata, handles)
% hObject    handle to s2b0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of s2b0 as text
%        str2double(get(hObject,'String')) returns contents of s2b0 as a double
bioSAXSData = getData;
val = str2num(get(handles.s2b0, 'String'));
bioSAXSData.samp2Beta(2)=val;
setData(bioSAXSData);

% --- Executes during object creation, after setting all properties.
function s2b0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to s2b0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function s3b0_Callback(hObject, eventdata, handles)
% hObject    handle to s3b0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of s3b0 as text
%        str2double(get(hObject,'String')) returns contents of s3b0 as a double
bioSAXSData = getData;
val = str2num(get(handles.s3b0, 'String'));
bioSAXSData.samp3Beta(2)=val;
setData(bioSAXSData);

% --- Executes during object creation, after setting all properties.
function s3b0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to s3b0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function s4b0_Callback(hObject, eventdata, handles)
% hObject    handle to s4b0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of s4b0 as text
%        str2double(get(hObject,'String')) returns contents of s4b0 as a double
bioSAXSData = getData;
val = str2num(get(handles.s4b0, 'String'));
bioSAXSData.samp4Beta(2)=val;
setData(bioSAXSData);

% --- Executes during object creation, after setting all properties.
function s4b0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to s4b0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function s5b0_Callback(hObject, eventdata, handles)
% hObject    handle to s5b0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of s5b0 as text
%        str2double(get(hObject,'String')) returns contents of s5b0 as a double
bioSAXSData = getData;
val = str2num(get(handles.s5b0, 'String'));
bioSAXSData.samp5Beta(2)=val;
setData(bioSAXSData);

% --- Executes during object creation, after setting all properties.
function s5b0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to s5b0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function s1bL_Callback(hObject, eventdata, handles)
% hObject    handle to s1bL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of s1bL as text
%        str2double(get(hObject,'String')) returns contents of s1bL as a double
bioSAXSData = getData;
val = str2num(get(handles.s1bL, 'String'));
bioSAXSData.samp1Beta(3)=val;
setData(bioSAXSData);

% --- Executes during object creation, after setting all properties.
function s1bL_CreateFcn(hObject, eventdata, handles)
% hObject    handle to s1bL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function s2bL_Callback(hObject, eventdata, handles)
% hObject    handle to s2bL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of s2bL as text
%        str2double(get(hObject,'String')) returns contents of s2bL as a double
bioSAXSData = getData;
val = str2num(get(handles.s2bL, 'String'));
bioSAXSData.samp2Beta(3)=val;
setData(bioSAXSData);

% --- Executes during object creation, after setting all properties.
function s2bL_CreateFcn(hObject, eventdata, handles)
% hObject    handle to s2bL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function s3bL_Callback(hObject, eventdata, handles)
% hObject    handle to s3bL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of s3bL as text
%        str2double(get(hObject,'String')) returns contents of s3bL as a double
bioSAXSData = getData;
val = str2num(get(handles.s3bL, 'String'));
bioSAXSData.samp3Beta(3)=val;
setData(bioSAXSData);

% --- Executes during object creation, after setting all properties.
function s3bL_CreateFcn(hObject, eventdata, handles)
% hObject    handle to s3bL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function s4bL_Callback(hObject, eventdata, handles)
% hObject    handle to s4bL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of s4bL as text
%        str2double(get(hObject,'String')) returns contents of s4bL as a double
bioSAXSData = getData;
val = str2num(get(handles.s4bL, 'String'));
bioSAXSData.samp4Beta(3)=val;
setData(bioSAXSData);

% --- Executes during object creation, after setting all properties.
function s4bL_CreateFcn(hObject, eventdata, handles)
% hObject    handle to s4bL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function s5bL_Callback(hObject, eventdata, handles)
% hObject    handle to s5bL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of s5bL as text
%        str2double(get(hObject,'String')) returns contents of s5bL as a double
bioSAXSData = getData;
val = str2num(get(handles.s5bL, 'String'));
bioSAXSData.samp5Beta(3)=val;
setData(bioSAXSData);

% --- Executes during object creation, after setting all properties.
function s5bL_CreateFcn(hObject, eventdata, handles)
% hObject    handle to s5bL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function qMerge_Callback(hObject, eventdata, handles)
% hObject    handle to qMerge (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of qMerge as text
%        str2double(get(hObject,'String')) returns contents of qMerge as a double
bioSAXSData = getData;
val = str2num(get(handles.qMerge, 'String'));
bioSAXSData.qMerge=val;
setData(bioSAXSData);

% --- Executes during object creation, after setting all properties.
function qMerge_CreateFcn(hObject, eventdata, handles)
% hObject    handle to qMerge (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function qMin_Callback(hObject, eventdata, handles)
% hObject    handle to qMin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of qMin as text
%        str2double(get(hObject,'String')) returns contents of qMin as a double
bioSAXSData = getData;
val = str2num(get(handles.qMin, 'String'));
bioSAXSData.qMin=val;
setData(bioSAXSData);


% --- Executes during object creation, after setting all properties.
function qMin_CreateFcn(hObject, eventdata, handles)
% hObject    handle to qMin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function qMax_Callback(hObject, eventdata, handles)
% hObject    handle to qMax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of qMax as text
%        str2double(get(hObject,'String')) returns contents of qMax as a double
bioSAXSData = getData;
val = str2num(get(handles.qMax, 'String'));
bioSAXSData.qMax=val;
setData(bioSAXSData);


% --- Executes during object creation, after setting all properties.
function qMax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to qMax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in fitAlphaBeta.
function fitAlphaBeta_Callback(hObject, eventdata, handles)
% hObject    handle to fitAlphaBeta (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Fit Alpha, Beta, & Conc Extrop
% fit alpha, beta values and extraploate with Conc

% check selected buffer and samples
bioSAXSData = getData;

%%%%
% prepare data
%%%%%
if isempty(bioSAXSData.buf1)
    disp('No buffer data!');
    set(handles.msg,'String', 'No buffer data!');
    return;
end
indx=[0 0 0 0 0]; % indication of selections
conc=[];

q_mt = bioSAXSData.buf1(:,1);
%Iq_mt=bioSAXSData.buf1(:,2);
%std_mt=bioSAXSData.buf1(:,3);
Iq_buf=[];
Iq_samp=[];
std_buf=[];
std_samp=[];

a0=[];
aLB=[];
aUB=[];
b0=[];
bLB=[];
bUB=[];

if bioSAXSData.samp1Sel==1 && ~isempty(bioSAXSData.samp1) && ~isempty(bioSAXSData.buf1)
    indx(1)=1;
    conc = [conc bioSAXSData.samp1Conc];
    %Iq_mt=[Iq_mt bioSAXSData.samp1(:,2)];
    %std_mt=[std_mt bioSAXSData.samp1(:,3)];
    Iq_buf  =[Iq_buf bioSAXSData.buf1(:,2)];
    Iq_samp =[Iq_samp bioSAXSData.samp1(:,2)];
    std_buf =[std_buf bioSAXSData.buf1(:,3)];
    std_samp=[std_samp bioSAXSData.samp1(:,3)];
    
    aLB = [aLB bioSAXSData.samp1Alpha(1)];
    a0  = [a0  bioSAXSData.samp1Alpha(2)];
    aUB = [aUB bioSAXSData.samp1Alpha(3)];
    bLB = [bLB bioSAXSData.samp1Beta(1)];
    b0  = [b0  bioSAXSData.samp1Beta(2)];
    bUB = [bUB bioSAXSData.samp1Beta(3)];    
end

if bioSAXSData.samp2Sel==1 && ~isempty(bioSAXSData.samp2) && ~isempty(bioSAXSData.buf2)
    indx(2)=1;
    conc = [conc bioSAXSData.samp2Conc];
    %Iq_mt=[Iq_mt bioSAXSData.samp2(:,2)];
    %std_mt=[std_mt bioSAXSData.samp2(:,3)];
    Iq_buf  =[Iq_buf bioSAXSData.buf2(:,2)];
    Iq_samp =[Iq_samp bioSAXSData.samp2(:,2)];
    std_buf =[std_buf bioSAXSData.buf2(:,3)];
    std_samp=[std_samp bioSAXSData.samp2(:,3)];
    
    aLB = [aLB bioSAXSData.samp2Alpha(1)];
    a0  = [a0  bioSAXSData.samp2Alpha(2)];
    aUB = [aUB bioSAXSData.samp2Alpha(3)];
    bLB = [bLB bioSAXSData.samp2Beta(1)];
    b0  = [b0  bioSAXSData.samp2Beta(2)];
    bUB = [bUB bioSAXSData.samp2Beta(3)];    
end

if bioSAXSData.samp3Sel==1 && ~isempty(bioSAXSData.samp3) && ~isempty(bioSAXSData.buf3)
    indx(3)=1;
    conc = [conc bioSAXSData.samp3Conc];
    %Iq_mt=[Iq_mt bioSAXSData.samp3(:,2)];
    %std_mt=[std_mt bioSAXSData.samp3(:,3)];
    Iq_buf  =[Iq_buf bioSAXSData.buf3(:,2)];
    Iq_samp =[Iq_samp bioSAXSData.samp3(:,2)];
    std_buf =[std_buf bioSAXSData.buf3(:,3)];
    std_samp=[std_samp bioSAXSData.samp3(:,3)];       
    
    aLB = [aLB bioSAXSData.samp3Alpha(1)];
    a0  = [a0  bioSAXSData.samp3Alpha(2)];
    aUB = [aUB bioSAXSData.samp3Alpha(3)];
    bLB = [bLB bioSAXSData.samp3Beta(1)];
    b0  = [b0  bioSAXSData.samp3Beta(2)];
    bUB = [bUB bioSAXSData.samp3Beta(3)];
end

if bioSAXSData.samp4Sel==1 && ~isempty(bioSAXSData.samp4) && ~isempty(bioSAXSData.buf4)
    indx(4)=1;
    conc = [conc bioSAXSData.samp4Conc];
    %Iq_mt=[Iq_mt bioSAXSData.samp4(:,2)];
    %std_mt=[std_mt bioSAXSData.samp4(:,3)];
    Iq_buf  =[Iq_buf bioSAXSData.buf4(:,2)];
    Iq_samp =[Iq_samp bioSAXSData.samp4(:,2)];
    std_buf =[std_buf bioSAXSData.buf4(:,3)];
    std_samp=[std_samp bioSAXSData.samp4(:,3)]; 
    
    aLB = [aLB bioSAXSData.samp4Alpha(1)];
    a0  = [a0  bioSAXSData.samp4Alpha(2)];
    aUB = [aUB bioSAXSData.samp4Alpha(3)];
    bLB = [bLB bioSAXSData.samp4Beta(1)];
    b0  = [b0  bioSAXSData.samp4Beta(2)];
    bUB = [bUB bioSAXSData.samp4Beta(3)];
end

if bioSAXSData.samp5Sel==1 && ~isempty(bioSAXSData.samp5) && ~isempty(bioSAXSData.buf5)
    indx(5)=1;
    conc = [conc bioSAXSData.samp5Conc];
    %Iq_mt=[Iq_mt bioSAXSData.samp5(:,2)];
    %std_mt=[std_mt bioSAXSData.samp5(:,3)];
    Iq_buf  =[Iq_buf bioSAXSData.buf5(:,2)];
    Iq_samp =[Iq_samp bioSAXSData.samp5(:,2)];
    std_buf =[std_buf bioSAXSData.buf5(:,3)];
    std_samp=[sdt_samp bioSAXSData.samp5(:,3)]; 
    
    aLB = [aLB bioSAXSData.samp5Alpha(1)];
    a0  = [a0  bioSAXSData.samp5Alpha(2)];
    aUB = [aUB bioSAXSData.samp5Alpha(3)];
    bLB = [bLB bioSAXSData.samp5Beta(1)];
    b0  = [b0  bioSAXSData.samp5Beta(2)];
    bUB = [bUB bioSAXSData.samp5Beta(3)];
end

[lowQ, highQ] = findQrange(q_mt, bioSAXSData.qMin, bioSAXSData.qMax);
%lowQ=100;   % you also can specify the points 
%highQ=580;

datN = length(conc);
beta0 = conc(end)./conc; 
%%% fix beta & alpha LB& UB

%betaLb = beta0 * 0.75;
betaLb = beta0 * bioSAXSData.betaLB;
betaLb = [betaLb(1:end-1) 1.0];

%betaUb = beta0 * 1.5;
betaUb = beta0 * bioSAXSData.betaUB;
betaUb = [betaUb(1:end-1) 1.0];

alpha0= ones(1,datN);
alphaLb = alpha0 * bioSAXSData.alphaLB;
alphaUb = alpha0 * bioSAXSData.alphaUB;

xLb = [alphaLb betaLb]; % lower limits
xUb = [alphaUb betaUb]; % upper limits

x0= [alpha0 beta0]; % initials


% optimization on alpha and beta
options = optimset('Display','iter','TolFun',1e-8, 'MaxFunEvals',1e12, 'MaxIter', 1e8);
[xval, fval] = fminsearchcon(@(x) simultSAXSbacksubtraction5(x, Iq_buf, Iq_samp, std_buf, std_samp, lowQ, highQ), x0, xLb, xUb)
%[xval, fval, exitFlag, output] = fminsearchcon(@(x) simultSAXSbacksubtraction(x, Iq_mt, std_mt, lowQ, highQ), x0, xLb, xUb)

%after optimized
alpha = xval(1:datN);
beta = xval(datN+1:end);

beta2 = 1./beta;
betaRatio = beta2 / beta2(1);
betaRatioStr = num2str(betaRatio, '%5.2f');
betaRatioStr2  = regexprep(betaRatioStr, ' ', ' : ');
set(handles.BetaRatio, 'String', betaRatioStr2);
bioSAXSData.BetaRatio = betaRatioStr2;

alphaMtx = diag(alpha);
betaMtx  = diag(beta);

Iq3 = (Iq_samp - Iq_buf * alphaMtx ) * betaMtx;
std3 = (sqrt(std_samp.^2 + std_buf.^2 * alphaMtx.^2))*betaMtx; 

% for kk=1:datN
%     beta3(kk,kk) = beta(kk);
% end
% Iq3  = (Iq_mt(:, 2:end) - Iq_mt(:,1) * alpha) * beta3;


%figure(2);loglog(q_mt,Iq3)

% error analysis
% std3 = (sqrt(std_mt(:,2:end).^2 + std_mt(:,1).^2 * alpha.^2))*beta3; 
dIq3 = Iq3(:,1:end-1) - Iq3(:,end)*ones(1,datN-1);

% calculate fitting error
nNum = 0;
for kk=1:datN
    nNum = nNum + countNegative(Iq3(:,kk),lowQ, highQ);
end
nNum
mt3 = (dIq3(lowQ:highQ,:) ./ std3(lowQ:highQ,1:end-1)).^2;
err3 = sum(sum(mt3))+ nNum;

set(handles.msg, 'String', sprintf('fitting error: %.2f',err3));
%

%%%%
% updata alpha, beta & bsub values
jj=1;
maxKK=0;
legendText={};
for kk=1:5
    if indx(kk)==1  
        str1=sprintf('handles.s%da0',kk);
        str2=sprintf('handles.s%db0',kk);

        set(eval(str1),'String', num2str(alpha(jj),'%0.5f'));
        set(eval(str2),'String', num2str(beta(jj),'%0.5f'));
        
        eval(sprintf('bioSAXSData.samp%dBsub=[q_mt Iq3(:,jj) std3(:,jj)];',kk));
        eval(sprintf('bioSAXSData.samp%dAlpha(2)=alpha(jj);',kk));
        eval(sprintf('bioSAXSData.samp%dBeta(2)=beta(jj);',kk));
        legendStr = ['sample#' num2str(kk)];
        legendText{jj}=legendStr;
        maxKK=kk;
        jj=jj+1;
    end
end



set(handles.popupmenu2, 'Value', maxKK);
eval(sprintf('bioSAXSData.mBsub=bioSAXSData.samp%dBsub;',maxKK));

eval(sprintf('mZeroConcFn=bioSAXSData.samp%dFn;',maxKK));
fn = [mZeroConcFn(1:end-4) '_zConc.dat'];

bioSAXSData.mZeroConcFn = fn;
set(handles.sZeroConc, 'String', fn);
set(handles.mZeroConcDat, 'String', fn);

fn2 = [mZeroConcFn(1:end-4) '_gtot.dat'];
set(handles.gtotFn, 'String', fn2);
%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% data display and save results
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%figure(908);loglog(q_mt,Iq3, 'LineWidth',2); title('Background Subtraction and Scaling'); xlabel('q, /A'); ylabel('I(q)');
%dlmwrite('disagm_sub2', [q_mt Iq3(:,end) std3(:,end)], '\t');  % save the subtracted saxs profile, bsa at 8mg/ml data in this case

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% saxs profile extraploation against concentrations 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

iqInt = concIntraplate(Iq3, std3, conc)';
legendText{jj}='zeroConc';

figure(904);loglog(q_mt,Iq3, 'LineWidth',1.5);
hold on
loglog(q_mt, iqInt, 'm', 'LineWidth', 2);
hold on;
title('Background Subtraction and Scaling'); xlabel('q, /A'); ylabel('I(q)'); legend(legendText);
hold off

bioSAXSData.zeroConc  = [q_mt  iqInt std3(:,end)];


setData(bioSAXSData);



function sZeroConc_Callback(hObject, eventdata, handles)
% hObject    handle to sZeroConc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sZeroConc as text
%        str2double(get(hObject,'String')) returns contents of sZeroConc as a double
bioSAXSData = getData;
fn = get(handles.sZeroConc, 'String');
bioSAXSData.mZeroConcFn=fn;
set(handles.mZeroConcDat, 'String', fn);
setData(bioSAXSData);

% --- Executes during object creation, after setting all properties.
function sZeroConc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sZeroConc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in saveMergeZeroConcFile.
function saveMergeZeroConcFile_Callback(hObject, eventdata, handles)
% hObject    handle to saveMergeZeroConcFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
bioSAXSData = getData;

if isfield(bioSAXSData, 'mZeroConcFn') && ~isempty(bioSAXSData.mZeroConcFn) 
    fn = bioSAXSData.mZeroConcFn;
else
    disp('mZeroConcDatFn was not specified!');
    set(handles.msg, 'String', 'mZeroConcDatFn was not specified!');
    return;
end

if isfield(bioSAXSData, 'mZeroConc') && ~isempty(bioSAXSData.mZeroConc) 
    dat = bioSAXSData.mZeroConc;
else
    disp('mZeroConcDat was not specified!');
    set(handles.msg, 'String', 'mZeroConcDat was not specified!');
    return;
end

fullfn = fullfile(bioSAXSData.dir, fn);
dlmwrite(fullfn, dat, ' ');
setData(bioSAXSData);


% --- Executes on button press in mergeZeroConcFile.
function mergeZeroConcFile_Callback(hObject, eventdata, handles)
% hObject    handle to mergeZeroConcFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
bioSAXSData = getData;

if isfield(bioSAXSData, 'zeroConc') && ~isempty(bioSAXSData.zeroConc) 
    dat1 = bioSAXSData.zeroConc;
else
    disp('zeroConcDat was not specified!');
    set(handles.msg, 'String', 'zeroConcDat was not specified!');
    return;
end

if isfield(bioSAXSData, 'mBsub') && ~isempty(bioSAXSData.mBsub) 
    dat2 = bioSAXSData.mBsub;
else
    disp('mBsub was not specified!');
    set(handles.msg, 'String', 'mBsub was not specified!');
    return;
end

q= dat1(:,1);
[lPts, uPts] = findQrange(q, 0,bioSAXSData.qMerge);
newIq = [dat1(1:uPts,2);dat2(uPts+1:end,2)];

dat3= [q newIq dat2(:,3)];

figure(905);loglog(q,dat1(:,2), '-or', q,dat2(:,2), '-b', q,newIq, '-g','LineWidth',2);
hold on;
title('Background Subtraction and Scaling'); xlabel('q, /A'); ylabel('I(q)'); legend('zConc', 'mBsub', 'mzConc');
hold off

bioSAXSData.mZeroConc = dat3;
setData(bioSAXSData);



function alphaUB_Callback(hObject, eventdata, handles)
% hObject    handle to alphaUB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of alphaUB as text
%        str2double(get(hObject,'String')) returns contents of alphaUB as a double
bioSAXSData = getData;
bioSAXSData.alphaUB = str2num(get(handles.alphaUB, 'String'));
setData(bioSAXSData);

% --- Executes during object creation, after setting all properties.
function alphaUB_CreateFcn(hObject, eventdata, handles)
% hObject    handle to alphaUB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function alphaLB_Callback(hObject, eventdata, handles)
% hObject    handle to alphaLB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of alphaLB as text
%        str2double(get(hObject,'String')) returns contents of alphaLB as a double
bioSAXSData = getData;
bioSAXSData.alphaLB = str2num(get(handles.alphaLB, 'String'));
setData(bioSAXSData);

% --- Executes during object creation, after setting all properties.
function alphaLB_CreateFcn(hObject, eventdata, handles)
% hObject    handle to alphaLB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function betaUB_Callback(hObject, eventdata, handles)
% hObject    handle to betaUB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of betaUB as text
%        str2double(get(hObject,'String')) returns contents of betaUB as a double
bioSAXSData = getData;
bioSAXSData.betaUB = str2num(get(handbetaUBles.betaUB, 'String'));
setData(bioSAXSData);

% --- Executes during object creation, after setting all properties.
function betaUB_CreateFcn(hObject, eventdata, handles)
% hObject    handle to betaUB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function betaLB_Callback(hObject, eventdata, handles)
% hObject    handle to betaLB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of betaLB as text
%        str2double(get(hObject,'String')) returns contents of betaLB as a double
bioSAXSData = getData;
bioSAXSData.betaLB = str2num(get(handbetaUBles.betaLB, 'String'));
setData(bioSAXSData);

% --- Executes during object creation, after setting all properties.
function betaLB_CreateFcn(hObject, eventdata, handles)
% hObject    handle to betaLB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in midSN.
function midSN_Callback(hObject, eventdata, handles)
% hObject    handle to midSN (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of midSN
bioSAXSData = getData;
bioSAXSData.midSN = get(handbetaUBles.midSN, 'Value');
setData(bioSAXSData);



function pddfSAXS_Callback(hObject, eventdata, handles)
% hObject    handle to pddfSAXS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pddfSAXS as text
%        str2double(get(hObject,'String')) returns contents of pddfSAXS as a double


% --- Executes during object creation, after setting all properties.
function pddfSAXS_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pddfSAXS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in selectPDDFsaxs.
function selectPDDFsaxs_Callback(hObject, eventdata, handles)
% hObject    handle to selectPDDFsaxs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
bioSAXSData = getData;

[fn,fpath] = uigetfile({'*.dat';'*.txt'; '*.*'},'File Selection');
if fn ~= 0
    set(handles.pddfSAXS, 'String', fn);
    %bioSAXSData.bufFn = fn;    
    %ioSAXSData.bufPath = fpath;
    %%%if strfind(fpath, ' ')
    bioSAXSData.dir=fpath;
    bioSAXSData.saxsFn=fn;    
    bioSAXSData.saxs= readData(fullfile(fpath,fn)); 
    fn2 = ['g' fn(1:end-4) '.out'];
    bioSAXSData.pddfFn=fn2;
    set(handles.pddfFn, 'String', fn2);
else
    disp('No file was select! Use previous selection!')
    %bioSAXSData.bufFn = fn;
    %bioSAXSData.bufPath = fpath;    
end
setData(bioSAXSData);


function pddfSAXSq1_Callback(hObject, eventdata, handles)
% hObject    handle to pddfSAXSq1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pddfSAXSq1 as text
%        str2double(get(hObject,'String')) returns contents of pddfSAXSq1 as a double
bioSAXSData = getData;
bioSAXSData.pddfSAXSq1 = str2num(get(handles.pddfSAXSq1, 'String'));
setData(bioSAXSData);

% --- Executes during object creation, after setting all properties.
function pddfSAXSq1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pddfSAXSq1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function pddfSAXSq2_Callback(hObject, eventdata, handles)
% hObject    handle to pddfSAXSq2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pddfSAXSq2 as text
%        str2double(get(hObject,'String')) returns contents of pddfSAXSq2 as a double
bioSAXSData = getData;
bioSAXSData.pddfSAXSq2 = str2num(get(handles.pddfSAXSq2, 'String'));
setData(bioSAXSData);

% --- Executes during object creation, after setting all properties.
function pddfSAXSq2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pddfSAXSq2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function pddfFn_Callback(hObject, eventdata, handles)
% hObject    handle to pddfFn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pddfFn as text
%        str2double(get(hObject,'String')) returns contents of pddfFn as a double
bioSAXSData = getData;
bioSAXSData.pddfFn = get(handles.pddfFn, 'String');
setData(bioSAXSData);

% --- Executes during object creation, after setting all properties.
function pddfFn_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pddfFn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in autoGNOM.
function autoGNOM_Callback(hObject, eventdata, handles)
% hObject    handle to autoGNOM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
bioSAXSData = getData;

if ~isempty(bioSAXSData.saxsFn)
    saxsFile = fullfile(bioSAXSData.dir, bioSAXSData.saxsFn);
    dat = readData(saxsFile);
    q = dat(:,1);
    [lowQts, highQts] = findQrange(q, bioSAXSData.pddfSAXSq1,bioSAXSData.pddfSAXSq2);
    saxsFileN2 = '_tmp999.dat';
    saxsFile2 = fullfile(bioSAXSData.dir, saxsFileN2);
    dlmwrite(saxsFile2, dat(lowQts:highQts,:), ' ');
    
else
    disp('SAXS file not available!'); 
    return;
end

if ~isempty(bioSAXSData.pddfFn)
    pddfFn = fullfile(bioSAXSData.dir, bioSAXSData.pddfFn);
else
    disp('PDDF file name not available!'); 
    return;
end

pddfLog = fullfile(bioSAXSData.dir, 'pddf.log');
%gnomCMD = sprintf('datgnom %s --skip %d  --output %s > %s',saxsFile, lowQts, pddfFn, pddfLog);
%gnomCMD = sprintf('datgnom %s --output %s > %s',saxsFile2, pddfFn, pddfLog);
gnomCMD = sprintf('datgnom "%s" --output "%s" > "%s"',saxsFile2, pddfFn, pddfLog);
dos(gnomCMD);
%dos(eval(gnomCMD));
%     Rgcmd= sprintf('autorg "%s" -f ssv > "%s"', datFull, tmpLog); 
%     dos(Rgcmd);
%     fid=fopen(pddfLog,'r');
%     line = fgetl(fid);
%     fclose(fid);
[saxs, pddf, Rg, Io] = readGNOM(pddfFn);
bioSAXSData.pddf = pddf;
bioSAXSData.saxsFit = saxs;
bioSAXSData.RgGnom=Rg;

figure(909); loglog(saxs(:,1), saxs(:,2),'-ob',saxs(:,1), saxs(:,4),'-r','LineWidth',2); hold on; 
legend('iExp','iFit');xlabel('q,/A');ylabel('I(q)');
title('GNOM Fit');hold off;

figure(910); plot(pddf(:,1), pddf(:,2),'-r','LineWidth',3); hold on; 
legend('PDDF');xlabel('r, A');ylabel('p(r)');
title('PDDF');hold off;

setData(bioSAXSData);

% --- Executes on button press in manualGNOM.
function manualGNOM_Callback(hObject, eventdata, handles)
% hObject    handle to manualGNOM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%pddfLog = fullfile(bioSAXSData.dir, 'pddf.log');
%gnomCMD = sprintf('datgnom %s --skip %d  --output %s > %s',saxsFile, lowQts, pddfFn, pddfLog);
%gnomCMD = sprintf('datgnom %s --output %s > %s',saxsFile2, pddfFn, pddfLog);
%gnomCMD = sprintf('datgnom "%s" --output "%s" > "%s"',saxsFile2, pddfFn, pddfLog);
dos('gnomqw')

% --- Executes on button press in saveSAXSFitFile.
function saveSAXSFitFile_Callback(hObject, eventdata, handles)
% hObject    handle to saveSAXSFitFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
bioSAXSData = getData;
saxs=bioSAXSData.saxsFit;
fn = bioSAXSData.pddfFn;

if isempty(fn) || isempty(saxs)
    disp('GNOM data not ready!');
    return;
end

saxsFitFn = [fn(1:end-4) '_sFit.dat'];

[file,path] = uiputfile(saxsFitFn,'Save SAXS Fit File');
saxsFitFull = fullfile(path, file);
dlmwrite(saxsFitFull, [saxs(:,1) saxs(:,4) saxs(:,3)], ' ');

setData(bioSAXSData);

% --- Executes on button press in pddfNorm.
function pddfNorm_Callback(hObject, eventdata, handles)
% hObject    handle to pddfNorm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of pddfNorm


% --- Executes on button press in pddfFile.
function pddfFile_Callback(hObject, eventdata, handles)
% hObject    handle to pddfFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
bioSAXSData = getData;
pddf=bioSAXSData.pddf;
fn = bioSAXSData.pddfFn;
if isempty(fn) || isempty(pddf)
    disp('GNOM data not ready!');
    return;
end

pddfFn = [fn(1:end-4) '_pr.dat'];

scale = 1;
if get(handles.pddfNorm, 'Value')
    scale = max(pddf(:,2));
end
[file,path] = uiputfile(pddfFn,'Save PDDF File');
pddfFull = fullfile(path, file);
dlmwrite(pddfFull, [pddf(:,1) pddf(:,2)/scale pddf(:,3)/scale], ' ');

setData(bioSAXSData);

% --- Executes on button press in selectGNOMout.
function selectGNOMout_Callback(hObject, eventdata, handles)
% hObject    handle to selectGNOMout (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
bioSAXSData = getData;

[fn,fpath] = uigetfile({'*.out; *.dat; *.txt'; '*.*'},'File Selection');
if fn ~= 0
    set(handles.pddfFn, 'String', fn);
    bioSAXSData.pddfFn = fn;
    bioSAXSData.dir = fpath;
    [saxs,pddf,Rg,Io]=readGNOM(fullfile(fpath,fn));
    bioSAXSData.saxsFit=saxs;
    bioSAXSData.pddf=pddf;
    bioSAXSData.RgGnom=Rg;
    
    figure(909); loglog(saxs(:,1), saxs(:,2),'-ob',saxs(:,1), saxs(:,4),'-r','LineWidth',2); hold on; 
    legend('iExp','iFit');xlabel('q,/A');ylabel('I(q)');
    title('GNOM Fit');hold off;

    figure(910); plot(pddf(:,1), pddf(:,2),'-r','LineWidth',3); hold on; 
    legend('PDDF');xlabel('r, A');ylabel('p(r)');
    title('PDDF');hold off;
else
    disp('No file was select! Use previous selection!')
    %bioSAXSData.bufFn = fn;
    %bioSAXSData.bufPath = fpath;    
end
setData(bioSAXSData);

% --- Executes on button press in plotSAXSFit.
function plotSAXSFit_Callback(hObject, eventdata, handles)
% hObject    handle to plotSAXSFit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
bioSAXSData = getData;
saxs = bioSAXSData.saxsFit;
if ~isempty(saxs)
    figure(909); loglog(saxs(:,1), saxs(:,2),'-ob',saxs(:,1), saxs(:,4),'-r','LineWidth',2); hold on; 
    legend('iExp','iFit');xlabel('q,/A');ylabel('I(q)');
    title('GNOM Fit');hold off;
else
    disp('SAXS Fit data not available!')
    %bioSAXSData.bufFn = fn;
    %bioSAXSData.bufPath = fpath;    
end
setData(bioSAXSData);

% --- Executes on button press in plotPDDF.
function plotPDDF_Callback(hObject, eventdata, handles)
% hObject    handle to plotPDDF (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
bioSAXSData = getData;
pddf = bioSAXSData.pddf;
if ~isempty(pddf)
    figure(910); plot(pddf(:,1), pddf(:,2),'-r','LineWidth',3); hold on; 
    legend('PDDF');xlabel('r, A');ylabel('p(r)');
    title('PDDF');hold off;
else
    disp('PDDF data not available!')
    %bioSAXSData.bufFn = fn;
    %bioSAXSData.bufPath = fpath;    
end
setData(bioSAXSData);


% --- Executes on button press in checkbox22.
function checkbox22_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox22



function qAvg2_Callback(hObject, eventdata, handles)
% hObject    handle to qAvg2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of qAvg2 as text
%        str2double(get(hObject,'String')) returns contents of qAvg2 as a double


% --- Executes during object creation, after setting all properties.
function qAvg2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to qAvg2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit63_Callback(hObject, eventdata, handles)
% hObject    handle to edit63 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit63 as text
%        str2double(get(hObject,'String')) returns contents of edit63 as a double


% --- Executes during object creation, after setting all properties.
function edit63_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit63 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in selectMultiFilesAvg.
function selectMultiFilesAvg_Callback(hObject, eventdata, handles)
% hObject    handle to selectMultiFilesAvg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
bioSAXSData = getData;

[filenames, pathname, filterindex] = uigetfile( ...
{  '*.dat,*.txt','SAXS Data File (*.dat)'; ...
   '*.*',  'All Files (*.*)'}, ...
   'Pick a file', ...
   'MultiSelect', 'on');

%if filenames==0 return; end

for nfile = filenames
    file = nfile{1,1};
    outputFileName=[file(1:end-3) 'dat'];

    cfile = [pathname file];
    disp(cfile)
end

pddf = bioSAXSData.pddf;
if ~isempty(pddf)
    figure(910); plot(pddf(:,1), pddf(:,2),'-r','LineWidth',3); hold on; 
    legend('PDDF');xlabel('r, A');ylabel('p(r)');
    title('PDDF');hold off;
else
    disp('PDDF data not available!')
    %bioSAXSData.bufFn = fn;
    %bioSAXSData.bufPath = fpath;    
end
setData(bioSAXSData);

% --- Executes on button press in pushbutton29.
function pushbutton29_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton29 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function nq_Callback(hObject, eventdata, handles)
% hObject    handle to nq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nq as text
%        str2double(get(hObject,'String')) returns contents of nq as a double
bioSAXSData = getData;
bioSAXSData.nq = str2num(get(handles.nq, 'String'));
setData(bioSAXSData);

% --- Executes during object creation, after setting all properties.
function nq_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in qnIq.
function qnIq_Callback(hObject, eventdata, handles)
% hObject    handle to qnIq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
bioSAXSData = getData;
n=bioSAXSData.nq;

if ~isempty(bioSAXSData.gtot)
    dat = bioSAXSData.gtot;
elseif ~isempty(bioSAXSData.mZeroConc)
    dat = bioSAXSData.mZeroConc;
else
    set(handles.msg, 'Data not ready!');
    return ;
end

q = dat(:,1);
iq = dat(:,2);
qnIq = q.^n .*iq;

figure(912); plot(q,qnIq,'-r','LineWidth',2); hold on; 
xlabel('q,/A');ylabel('qnI(q)');
title('q^nI(q) Plot');hold off;
setData(bioSAXSData);


% --- Executes on button press in saveBackSubs.
function saveBackSubs_Callback(hObject, eventdata, handles)
% hObject    handle to fitAlphaBeta (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
bioSAXSData = getData;
fpath= bioSAXSData.dir;
%buf1Fn =  bioSAXSData.buf1Fn;  

if bioSAXSData.samp1Sel == 1
    fn = bioSAXSData.samp1Fn;
    bSub = bioSAXSData.samp1Bsub;
    beta = bioSAXSData.samp1Beta(2);
    alpha = bioSAXSData.samp1Alpha(2);
    str1 = strsplit(fn, '.');
    nfName = [str1{1} '_BSub2.dat'];
    newFullfile=fullfile(fpath,nfName);
    %dlmwrite(newFullfile, sampBSub, ' ');
    fid = fopen(newFullfile, 'w');
    nn = length(bSub);
    fprintf(fid, '%% file name: %s\n', newFullfile);
    fprintf(fid, '%% buffer file: %s\n', bioSAXSData.buf1Fn);
    fprintf(fid, '%% sample file: %s\n', fn);
    fprintf(fid, '%% alpha = %7.5f; beta = %7.4f \n', alpha, beta);
    for kk=1:nn
        fprintf(fid, '%.5E   %.5E   %.5E\n', bSub(kk,:));
    end
    fclose(fid);
end


if bioSAXSData.samp2Sel == 1
    fn = bioSAXSData.samp2Fn;
    bSub = bioSAXSData.samp2Bsub;
    beta = bioSAXSData.samp2Beta(2);
    alpha = bioSAXSData.samp2Alpha(2);
    str1 = strsplit(fn, '.');
    nfName = [str1{1} '_BSub2.dat'];
    newFullfile=fullfile(fpath,nfName);
    %dlmwrite(newFullfile, sampBSub, ' ');
    fid = fopen(newFullfile, 'w');
    nn = length(bSub);
    fprintf(fid, '%% file name: %s\n', newFullfile);
    fprintf(fid, '%% buffer file: %s\n', bioSAXSData.buf2Fn);
    fprintf(fid, '%% sample file: %s\n', fn);
    fprintf(fid, '%% alpha = %7.5f; beta = %7.4f \n', alpha, beta);
    for kk=1:nn
        fprintf(fid, '%.5E   %.5E   %.5E\n', bSub(kk,:));
    end
    fclose(fid);
end

if bioSAXSData.samp3Sel == 1
    fn = bioSAXSData.samp3Fn;
    bSub = bioSAXSData.samp3Bsub;
    beta = bioSAXSData.samp3Beta(2);
    alpha = bioSAXSData.samp3Alpha(2);
    str1 = strsplit(fn, '.');
    nfName = [str1{1} '_BSub2.dat'];
    newFullfile=fullfile(fpath,nfName);
    %dlmwrite(newFullfile, sampBSub, ' ');
    fid = fopen(newFullfile, 'w');
    nn = length(bSub);
    fprintf(fid, '%% file name: %s\n', newFullfile);
    fprintf(fid, '%% buffer file: %s\n', bioSAXSData.buf3Fn);
    fprintf(fid, '%% sample file: %s\n', fn);
    fprintf(fid, '%% alpha = %7.5f; beta = %7.4f \n', alpha, beta);
    for kk=1:nn
        fprintf(fid, '%.5E   %.5E   %.5E\n', bSub(kk,:));
    end
    fclose(fid);
end

if bioSAXSData.samp4Sel == 1
    fn = bioSAXSData.samp4Fn;
    bSub = bioSAXSData.samp4Bsub;
    beta = bioSAXSData.samp4Beta(2);
    alpha = bioSAXSData.samp4Alpha(2);
    str1 = strsplit(fn, '.');
    nfName = [str1{1} '_BSub2.dat'];
    newFullfile=fullfile(fpath,nfName);
    %dlmwrite(newFullfile, sampBSub, ' ');
    fid = fopen(newFullfile, 'w');
    nn = length(bSub);
    fprintf(fid, '%% file name: %s\n', newFullfile);
    fprintf(fid, '%% buffer file: %s\n', bioSAXSData.buf4Fn);
    fprintf(fid, '%% sample file: %s\n', fn);
    fprintf(fid, '%% alpha = %7.5f; beta = %7.4f \n', alpha, beta);
    for kk=1:nn
        fprintf(fid, '%.5E   %.5E   %.5E\n', bSub(kk,:));
    end
    fclose(fid);
end

if bioSAXSData.samp5Sel == 1
    fn = bioSAXSData.samp5Fn;
    bSub = bioSAXSData.samp5Bsub;
    beta = bioSAXSData.samp5Beta(2);
    alpha = bioSAXSData.samp5Alpha(2);
    str1 = strsplit(fn, '.');
    nfName = [str1{1} '_BSub.dat'];
    newFullfile=fullfile(fpath,nfName);
    %dlmwrite(newFullfile, sampBSub, ' ');
    fid = fopen(newFullfile, 'w');
    nn = length(bSub);
    fprintf(fid, '%% file name: %s\n', newFullfile);
    fprintf(fid, '%% buffer file: %s\n', bioSAXSData.buf5Fn);
    fprintf(fid, '%% sample file: %s\n', fn);
    fprintf(fid, '%% alpha = %7.5f; beta = %7.4f \n', alpha, beta);
    for kk=1:nn
        fprintf(fid, '%.5E   %.5E   %.5E\n', bSub(kk,:));
    end
    fclose(fid);
end

setData(bioSAXSData);


% --- Executes on button press in checkbox17.
function checkbox17_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox17



function buf1Name_Callback(hObject, eventdata, handles)
% hObject    handle to buf1Name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of buf1Name as text
%        str2double(get(hObject,'String')) returns contents of buf1Name as a double


% --- Executes during object creation, after setting all properties.
function buf1Name_CreateFcn(hObject, eventdata, handles)
% hObject    handle to buf1Name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function buf2Name_Callback(hObject, eventdata, handles)
% hObject    handle to buf2Name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of buf2Name as text
%        str2double(get(hObject,'String')) returns contents of buf2Name as a double


% --- Executes during object creation, after setting all properties.
function buf2Name_CreateFcn(hObject, eventdata, handles)
% hObject    handle to buf2Name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function buf3Name_Callback(hObject, eventdata, handles)
% hObject    handle to buf3Name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of buf3Name as text
%        str2double(get(hObject,'String')) returns contents of buf3Name as a double


% --- Executes during object creation, after setting all properties.
function buf3Name_CreateFcn(hObject, eventdata, handles)
% hObject    handle to buf3Name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function buf4Name_Callback(hObject, eventdata, handles)
% hObject    handle to buf4Name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of buf4Name as text
%        str2double(get(hObject,'String')) returns contents of buf4Name as a double


% --- Executes during object creation, after setting all properties.
function buf4Name_CreateFcn(hObject, eventdata, handles)
% hObject    handle to buf4Name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in buf5Sel.
function buf5Sel_Callback(hObject, eventdata, handles)
% hObject    handle to buf5Sel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of buf5Sel



function buf5Name_Callback(hObject, eventdata, handles)
% hObject    handle to buf5Name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of buf5Name as text
%        str2double(get(hObject,'String')) returns contents of buf5Name as a double


% --- Executes during object creation, after setting all properties.
function buf5Name_CreateFcn(hObject, eventdata, handles)
% hObject    handle to buf5Name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function qAvg1_Callback(hObject, eventdata, handles)
% hObject    handle to qAvg1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of qAvg1 as text
%        str2double(get(hObject,'String')) returns contents of qAvg1 as a double


% --- Executes during object creation, after setting all properties.
function qAvg1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to qAvg1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function xlim1_Callback(hObject, eventdata, handles)
% hObject    handle to xlim1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of xlim1 as text
%        str2double(get(hObject,'String')) returns contents of xlim1 as a double


% --- Executes during object creation, after setting all properties.
function xlim1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to xlim1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function xlim2_Callback(hObject, eventdata, handles)
% hObject    handle to xlim2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of xlim2 as text
%        str2double(get(hObject,'String')) returns contents of xlim2 as a double


% --- Executes during object creation, after setting all properties.
function xlim2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to xlim2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ylim1_Callback(hObject, eventdata, handles)
% hObject    handle to ylim1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ylim1 as text
%        str2double(get(hObject,'String')) returns contents of ylim1 as a double


% --- Executes during object creation, after setting all properties.
function ylim1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ylim1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ylim2_Callback(hObject, eventdata, handles)
% hObject    handle to ylim2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ylim2 as text
%        str2double(get(hObject,'String')) returns contents of ylim2 as a double


% --- Executes during object creation, after setting all properties.
function ylim2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ylim2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function xlabel_Callback(hObject, eventdata, handles)
% hObject    handle to xlabel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of xlabel as text
%        str2double(get(hObject,'String')) returns contents of xlabel as a double


% --- Executes during object creation, after setting all properties.
function xlabel_CreateFcn(hObject, eventdata, handles)
% hObject    handle to xlabel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ylabel_Callback(hObject, eventdata, handles)
% hObject    handle to ylabel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ylabel as text
%        str2double(get(hObject,'String')) returns contents of ylabel as a double


% --- Executes during object creation, after setting all properties.
function ylabel_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ylabel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit97_Callback(hObject, eventdata, handles)
% hObject    handle to edit97 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit97 as text
%        str2double(get(hObject,'String')) returns contents of edit97 as a double


% --- Executes during object creation, after setting all properties.
function edit97_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit97 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit98_Callback(hObject, eventdata, handles)
% hObject    handle to edit98 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit98 as text
%        str2double(get(hObject,'String')) returns contents of edit98 as a double


% --- Executes during object creation, after setting all properties.
function edit98_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit98 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in lineColor.
function lineColor_Callback(hObject, eventdata, handles)
% hObject    handle to lineColor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns lineColor contents as cell array
%        contents{get(hObject,'Value')} returns selected item from lineColor


% --- Executes during object creation, after setting all properties.
function lineColor_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lineColor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu7.
function popupmenu7_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu7 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu7


% --- Executes during object creation, after setting all properties.
function popupmenu7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Data Average functions
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes on button press in selectAvgDir.
function selectAvgDir_Callback(hObject, eventdata, handles)
% hObject    handle to selectAvgDir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
bioSAXSData = getData;
bioSAXSData.avg.dir=uigetdir;
set(handles.avgDir, 'String', bioSAXSData.avg.dir);
setData(bioSAXSData);


function avgDir_Callback(hObject, eventdata, handles)
% hObject    handle to avgDir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of avgDir as text
%        str2double(get(hObject,'String')) returns contents of avgDir as a double
bioSAXSData = getData;
dirStr=get(handles.avgDir, 'String');
if exist(dirStr)==7
    bioSAXSData.avg.dir = dirStr;
else
    disp('Data directory input does NOT exist!!!');
end
setData(bioSAXSData);


% --- Executes during object creation, after setting all properties.
function avgDir_CreateFcn(hObject, eventdata, handles)
% hObject    handle to avgDir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit103_Callback(hObject, eventdata, handles)
% hObject    handle to edit103 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit103 as text
%        str2double(get(hObject,'String')) returns contents of edit103 as a double


% --- Executes during object creation, after setting all properties.
function edit103_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit103 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit104_Callback(hObject, eventdata, handles)
% hObject    handle to edit104 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit104 as text
%        str2double(get(hObject,'String')) returns contents of edit104 as a double


% --- Executes during object creation, after setting all properties.
function edit104_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit104 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit105_Callback(hObject, eventdata, handles)
% hObject    handle to edit105 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit105 as text
%        str2double(get(hObject,'String')) returns contents of edit105 as a double


% --- Executes during object creation, after setting all properties.
function edit105_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit105 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit106_Callback(hObject, eventdata, handles)
% hObject    handle to edit106 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit106 as text
%        str2double(get(hObject,'String')) returns contents of edit106 as a double


% --- Executes during object creation, after setting all properties.
function edit106_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit106 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit107_Callback(hObject, eventdata, handles)
% hObject    handle to edit107 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit107 as text
%        str2double(get(hObject,'String')) returns contents of edit107 as a double


% --- Executes during object creation, after setting all properties.
function edit107_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit107 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit108_Callback(hObject, eventdata, handles)
% hObject    handle to edit108 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit108 as text
%        str2double(get(hObject,'String')) returns contents of edit108 as a double


% --- Executes during object creation, after setting all properties.
function edit108_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit108 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit109_Callback(hObject, eventdata, handles)
% hObject    handle to edit109 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit109 as text
%        str2double(get(hObject,'String')) returns contents of edit109 as a double


% --- Executes during object creation, after setting all properties.
function edit109_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit109 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit110_Callback(hObject, eventdata, handles)
% hObject    handle to edit110 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit110 as text
%        str2double(get(hObject,'String')) returns contents of edit110 as a double


% --- Executes during object creation, after setting all properties.
function edit110_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit110 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu9.
function popupmenu9_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu9 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu9


% --- Executes during object creation, after setting all properties.
function popupmenu9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu10.
function popupmenu10_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu10 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu10


% --- Executes during object creation, after setting all properties.
function popupmenu10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu11.
function popupmenu11_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu11 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu11


% --- Executes during object creation, after setting all properties.
function popupmenu11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in correlationRB.
function correlationRB_Callback(hObject, eventdata, handles)
% hObject    handle to correlationRB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of correlationRB
bioSAXSData = getData;
bioSAXSData.avg.algorithm(1)=get(handles.correlationRB, 'Value');
setData(bioSAXSData);


% --- Executes on button press in y2RB.
function y2RB_Callback(hObject, eventdata, handles)
% hObject    handle to y2RB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of y2RB
bioSAXSData = getData;
bioSAXSData.avg.algorithm(2)=get(handles.y2RB, 'Value');
setData(bioSAXSData);


% --- Executes on button press in chebyRB.
function chebyRB_Callback(hObject, eventdata, handles)
% hObject    handle to chebyRB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of chebyRB
bioSAXSData = getData;
bioSAXSData.avg.algorithm(3)=get(handles.chebyRB, 'Value');
setData(bioSAXSData);


function avgFileSerStr_Callback(hObject, eventdata, handles)
% hObject    handle to avgFileSerStr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of avgFileSerStr as text
%        str2double(get(hObject,'String')) returns contents of avgFileSerStr as a double



% --- Executes during object creation, after setting all properties.
function avgFileSerStr_CreateFcn(hObject, eventdata, handles)
% hObject    handle to avgFileSerStr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in AvgbySerials.
function AvgbySerials_Callback(hObject, eventdata, handles)
% hObject    handle to AvgbySerials (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
bioSAXSData = getData;

outlierParam = [bioSAXSData.outlier.det bioSAXSData.outlier.nMAD bioSAXSData.outlier.alpha bioSAXSData.outlier.critP];
q1pt=1;
q2pt=9999;
isLog = 1; % by default, data curves comparison on log scale

bioSAXSData.avg.Q1=str2num(get(handles.qAvg1, 'String'));
bioSAXSData.avg.Q2=str2num(get(handles.qAvg2, 'String'));
chkDamage = bioSAXSData.outlier.damage;

strSer=strrep(get(handles.avgFileSerStr, 'String'), ';', ',');
[serial, status]=str2num(strSer);

% Example: Sapc2mg_00036_00045.dat, serial#: 36, scan#: 45

if status
    bioSAXSData.avg.fileSer =serial;
    bioSAXSData.avg.fileSerStr = strSer;
else
    disp('Wrong file serial numbers! Should be like: 2, 9:21 ');
    return ;
end

bioSAXSData.avg.fnFormat=get(handles.fileNameFormat, 'String');
a=strsplit(bioSAXSData.avg.fnFormat, '_');
fnFormatStr= ['*_' '%0' num2str(str2num(a{2}(2:end-1))) 'd_*.dat'];

%if motherDir.
%%avgDir = fullfile(bioSAXSData.avg.dir, 'Avg');
% Z:\2022_Data\2022_3\xFang\SAXS\Averaged
avgDir = fullfile(bioSAXSData.avg.dir(1:end-13), 'Processed');  %Nov 19, 2022
if ~exist(avgDir)
    dos(sprintf('mkdir %s', avgDir));
end

logFileFull = fullfile(avgDir, 'Auto_Avg.log');
rstFileFull = fullfile(avgDir, 'Auto_result.log');
if ~exist(logFileFull)
    fid=fopen(logFileFull, 'w');
    fprintf(fid, '1-D data sets directory: %s.\n\n', bioSAXSData.avg.dir);
    fprintf(fid, 'Time: %s.\n\n', datetime('now'));
else
    fid = fopen(logFileFull, 'a');
end

if ~exist(rstFileFull)
    fid2=fopen(rstFileFull, 'w');
    fprintf(fid2, '1-D data sets directory: %s.\n\n', bioSAXSData.avg.dir);
    fprintf(fid2, 'Time: %s.\n\n', datetime('now'));
else
    fid2 = fopen(rstFileFull, 'a');
end

fprintf(fid, '### Outerlier detection parameters: %s. ###\n', num2str(outlierParam));

for kk=1:length(bioSAXSData.avg.fileSer)
    t1=datetime;
    damg = 0;
    fileSearchStr = sprintf(sprintf('%s',fnFormatStr), bioSAXSData.avg.fileSer(kk));
    fns=findFilesbySerNum(bioSAXSData.avg.dir, fileSearchStr);
    if length(fns)>=3
        newAvgFn = '';
        serialNum = 1;
        scanNum = zeros(1,length(fns));
        q = [];
        iqs = [];
        errs = [];
        %if length(fns)<=3
        for mm = 1:length(fns)
            fn1 = fns(mm).name;
            mt = readData(fullfile(bioSAXSData.avg.dir,fn1));
            if ~isempty(mt)
                b = strsplit(fn1, '_');  % strsplit into cell format, char() --> string

                scanNum(mm) = str2num(char(strtok(b(end), '.'))); 

                if mm==1
                    q = mt(:,1);
                    serialNum = str2num(char(b(end-1)));
                    newAvgFn = char(b(1));
                    for jj=2:length(b)-2
                        newAvgFn = sprintf('%s_%s',newAvgFn, char(b(jj)));
                    end
                    newAvgFn = sprintf('%s_%s.avg',newAvgFn, char(b(end-1)));
                end
                iqs = [iqs mt(:,2)];  
                errs = [errs mt(:,3)];
            end
        end  
        newFn = newAvgFn(1:end-4);
        disp(sprintf('\n-------------------------------------------------------'));
        disp(sprintf('Average file Name in processing: %s.', newAvgFn));
        %sprintf('Scan numbers Read in: %s.\n', num2str(scanNum));
        % q, Iqs, scan#index ready 
        % averaging go here!!!!!!! 
        
        [rows cols] = size(iqs);
        
        [q1pt, q2pt]=findQrange(q, bioSAXSData.avg.Q1, bioSAXSData.avg.Q2);
        [q3pt, q4pt]=findQrange(q, 0.05, 0.1);                
 
       % detect non-positive values  % positive value row index
        if sum(sum((mt(q1pt:q2pt, :)<=0)'))> 0    
            isLog = 0;  % turn to compare curves at linear scale
            disp(sprintf('Non-positive value data points! Check the q range!'));
        end         
        

        if bioSAXSData.outlier.qSeg ==1
            outIndex = findCurveOutliers(iqs(q1pt:q2pt, :), bioSAXSData.avg.algorithm, outlierParam, chkDamage, isLog);
        elseif bioSAXSData.outlier.qSeg == 2
                [outIndex1, damg] = findCurveOutliers(iqs(q1pt:q4pt+10, :), bioSAXSData.avg.algorithm, outlierParam, chkDamage, isLog);
                [outIndex2, ~] = findCurveOutliers(iqs(q4pt-10:q2pt, :), bioSAXSData.avg.algorithm,outlierParam+[0 0.50 0 0], 0, isLog);
                outIndex = union(outIndex1, outIndex2);
        elseif bioSAXSData.outlier.qSeg == 3
            if bioSAXSData.avg.Q1 < 0.02 & bioSAXSData.avg.Q2 > 0.1
                %[q3pt, q4pt]=findQrange(q, 0.05, 0.1);
                [outIndex1, damg] = findCurveOutliers(iqs(q1pt:q3pt+10, :), bioSAXSData.avg.algorithm, outlierParam, chkDamage, isLog);
                [outIndex2, ~] = findCurveOutliers(iqs(q3pt-10:q4pt+10, :), bioSAXSData.avg.algorithm,outlierParam+[0 0.25 0 0], 0, isLog);
                [outIndex3, ~] = findCurveOutliers(iqs(q4pt-10:q2pt, :), bioSAXSData.avg.algorithm, outlierParam+[0 0.5 0 0], 0, isLog);
                outIndex = union(union(outIndex1, outIndex2), outIndex3);
            else
                [outIndex, damg] = findCurveOutliers(iqs(q1pt:q2pt, :), bioSAXSData.avg.algorithm, outlierParam, chkDamage, isLog);
            end
        else 
            [outIndex, damg] = findCurveOutliers(iqs(q1pt:q2pt, :), bioSAXSData.avg.algorithm, outlierParam, chkDamage, isLog);
        end
%         outIndex = findCurveOutliers(iqs(q1pt:q2pt, :), bioSAXSData.avg.algorithm, outlierParam, 1);        

        %outIndex1 = findCurveOutliers(iqs(q1pt:q3pt+10, :), bioSAXSData.avg.algorithm,1);
        %outIndex2 = findCurveOutliers(iqs(q3pt-10:q2pt, :), bioSAXSData.avg.algorithm,1);
        %outIndex = union(outIndex1, outIndex2);
        
        oIndex=true(1,cols);
        oIndex(outIndex)=false;
        f1=figure(1001); %xlabel('Q /A'); ylabel('Intensity'); txtStr=sprintf('%s,   total %d outliers', newFn, length(outIndex));  title(txtStr); hold on;
        try
            if ~isempty(outIndex)                
                loglog(q,iqs(:,outIndex), '-r', 'Linewidth',2); xlabel('Q /A'); ylabel('Intensity'); txtStr=sprintf('%s,   total %d outliers', newFn, length(outIndex));  title(strrep(txtStr, '_', '\_')); hold on;
            end
            if sum(oIndex)>0
                loglog(q,iqs(:,oIndex)); xlabel('Q /A'); ylabel('Intensity'); txtStr=sprintf('%s,   total %d outliers', newFn, length(outIndex));  title(strrep(txtStr, '_', '\_')); hold on;
            end
            hold off;
            saveas(gcf, fullfile(avgDir, [newFn '.jpg']));
        catch
            disp('problem in plot q vs iqs');
        end
        pause(1);
        %f1=figure(1001); set(f1, 'Name','Before filtering', 'position', [50, 300, 550, 400]); loglog(q,iqs); 
        %f2=figure(1002); set(f2, 'Name', 'After filtering', 'position', [700, 300, 550, 400]); loglog(q,iqs(:,oIndex));
        datAvg = mean(iqs(:,oIndex)')';
        %datErr2 = std(iqs(:,oIndex)')';
        %fullnewAvgFn2 = [fullnewAvgFn(1:end-4) 'B.avg'];
        datErr = sqrt(sum((errs(:,oIndex).^2)')') / sum(oIndex);
 
        fullnewAvgFn = fullfile(avgDir,newAvgFn);
        headerStr = sprintf('%% File name with serial #: %s. Total %d scans.\n%% Outliers scan #: %s.\n%%\n%% Date & Time: %s\n%%\n%% q(A^-1)    I(q)    err', newAvgFn(1:end-4), length(fns), num2str(scanNum(~oIndex)), datetime);
        dlmwrite(fullnewAvgFn, headerStr, 'delimiter', '');
        dlmwrite(fullnewAvgFn, [q datAvg datErr], 'delimiter', ' ', 'precision', '%.5E', '-append');
        %dlmwrite(fullnewAvgFn2, [q datAvg datErr2], 'delimiter', ' ', 'precision', '%.5E');
        t2 = datetime;
        if fid ~= -1
            fprintf(fid, 'File name with serial #: %s.\n', newAvgFn(1:end-4));
            fprintf(fid2, 'File name with serial #: %s.\n', newAvgFn(1:end-4));
            fprintf(fid, '   Total %d scans in this serial: %s.\n', length(fns), num2str(scanNum));
            fprintf(fid, '   Outliers scan #: %s.\n', num2str(scanNum(~oIndex)));
            fprintf(fid, '   Averaging starts at: %s; ends at: %s; takes %s.\n', t1, t2, t2-t1);

            
            if chkDamage
                damStr=' ';
                if sign(damg) == 0
                    %fprintf(fid, '   No damage detected. \n');
                    damStr= '   No damage detected in cleaned data. ';
                elseif sign(damg) == -1
                    %fprintf(fid, '   Radiation induced break-down, ');
                    damStr= '   Radiation induced break-down, ';
                else
                    %fprintf(fid, '   Radiation induced aggregation, ');
                    damStr= '   Radiation induced aggregation, ';
                end
                if abs(damg) >= 5
                    %fprintf(fid, 'SEVERE dammage (>=4S). \n');
                    damStr=sprintf('%sSEVERE dammage (>=5S). ', damStr);
                elseif abs(damg) >= 3
                    %fprintf(fid, 'SIGNIFICANT dammage(2-4S). \n');
                    damStr=sprintf('%sSIGNIFICANT dammage(3-5S). ', damStr);
                elseif abs(damg) >= 1
                    %fprintf(fid, 'DETECTABLE dammage (1-2S). \n');
                    damStr=sprintf('%sDETECTABLE dammage (1-3S). ', damStr);
                else
                    disp('NO damage in cleaned data!')
                end
                fprintf(fid, '%s\n', damStr);
                disp(damStr);
            end
            if (sum(~oIndex) / length(fns) > 1./3)
                fprintf(fid, 'Warning on %s: %3d%% (more than 1/3) are outliers, Check the data!!!.\n', newAvgFn(1:end-4), round(sum(~oIndex) / length(fns)*100) );
                fprintf(fid2, 'Warning on %s: %3d%% (more than 1/3) are outliers, Check the data!!!.\n', newAvgFn(1:end-4), round(sum(~oIndex) / length(fns)*100) );
            end
            fprintf(fid, '   Averaged data file name: %s.\n\n', fullnewAvgFn);
        end
    elseif ~isempty(fns)   % 1-2 curves
        disp('Too few data sets!!!');
        fprintf(fid, 'Too few data sets!!!\n\n');
    else
        disp(sprintf('%s NOT found!!!', fileSearchStr));
        fprintf(fid, '%s NOT found!!!\n\n', fileSearchStr);
    end
    disp(sprintf('-------------------------------------------------------\n'));

    % automatic data background subtraction, only for SAXS
    if ~isempty(datAvg) && newFn(1)=='S'
        if contains(lower(newAvgFn), 'buf') || contains(lower(newAvgFn), 'bkg')
            bioSAXSData.avg.buf = [q datAvg datErr];
            bioSAXSData.avg.bufName = fullnewAvgFn;
            fprintf(fid2, '  This is a Buffer data.\n\n\n');
        else
            bioSAXSData.avg.samp = [q datAvg datErr];
            bioSAXSData.avg.sampName = fullnewAvgFn;
            fprintf(fid2, '  This is a Sample data.\n');
    
            if ~isempty(bioSAXSData.avg.buf)
                Qbsub =  bioSAXSData.avg.buf(:,1);
                iQbsub =  bioSAXSData.avg.samp(:,2) -  bioSAXSData.avg.buf(:,2);
                errbsub = sqrt(bioSAXSData.avg.samp(:,3).^2 + bioSAXSData.avg.buf(:,3).^2);
    
                bsub = [Qbsub iQbsub errbsub];
                bsubFn = [fullnewAvgFn(1:end-4) '_bsub.dat'];
                bsubStr = sprintf('%% Sample file: %s\n%% Buffer file: %s\n%% alpha = 1.0 \n%% Date & Time: %s\n%%\n%% q(A^-1)    I(q)    err', bioSAXSData.avg.sampName, bioSAXSData.avg.bufName, datetime);
                dlmwrite(bsubFn, bsubStr, 'delimiter', '');
                dlmwrite(bsubFn, bsub, 'delimiter', ' ', 'precision', '%.5E', '-append');

                figure(1002); loglog(Qbsub, iQbsub, '-r', Qbsub, bioSAXSData.avg.buf(:,2), '-b', Qbsub, bioSAXSData.avg.samp(:,2), '-g'); 
                xlabel('Q /A'); ylabel('Intensity');  title([strrep(newFn, '_', '\_') ' bkg subtraction']); legend({'bsub','bkg', 'samp'});
                saveas(gcf, fullfile(avgDir, [newFn '_bsub.jpg']));

                % analysis goes here
                
                try
                    result = autoRgMat(bsubFn);
                    if ~isempty(result)
                        fprintf(fid2,'  Rg =  %6.2f  +/-  %6.2f;  Rg =  %.3E  +/-  %.2E \n', result.Rg, result.RgErr, result.Io, result.IoErr);
                        fprintf(fid2,'  Quality : %3d%%; Aggregated: %4.2f\n\n\n', round(result.Qfit*100), result.aggr);
                    end
                catch
                    disp('BAD data for Guinier analysis!!!');
                    fprintf(fid2, '  BAD data for Guinier analysis!!!\n\n\n');
                end
    
            end
    end
    end
end
fclose(fid);
fclose(fid2);

setData(bioSAXSData);


function fileNameFormat_Callback(hObject, eventdata, handles)
% hObject    handle to fileNameFormat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of fileNameFormat as text
%        str2double(get(hObject,'String')) returns contents of fileNameFormat as a double


% --- Executes during object creation, after setting all properties.
function fileNameFormat_CreateFcn(hObject, eventdata, handles)
% hObject    handle to fileNameFormat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes on button press in checkbox27.
function checkbox27_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox27 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox27


% --- Executes on button press in checkbox28.
function checkbox28_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox28 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox28



function nMAD_Callback(hObject, eventdata, handles)
% hObject    handle to nMAD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nMAD as text
%        str2double(get(hObject,'String')) returns contents of nMAD as a double
bioSAXSData = getData;
bioSAXSData.outlier.nMAD=str2num(get(handles.nMAD, 'String'));
setData(bioSAXSData);

% --- Executes during object creation, after setting all properties.
function nMAD_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nMAD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function alphaSTD_Callback(hObject, eventdata, handles)
% hObject    handle to alphaSTD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of alphaSTD as text
%        str2double(get(hObject,'String')) returns contents of alphaSTD as a double
bioSAXSData = getData;
bioSAXSData.outlier.alpha=str2num(get(handles.alphaSTD, 'String'));
setData(bioSAXSData);

% --- Executes during object creation, after setting all properties.
function alphaSTD_CreateFcn(hObject, eventdata, handles)
% hObject    handle to alphaSTD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function critP_Callback(hObject, eventdata, handles)
% hObject    handle to critP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of critP as text
%        str2double(get(hObject,'String')) returns contents of critP as a double
bioSAXSData = getData;
bioSAXSData.outlier.critP=str2num(get(handles.critP, 'String'));
setData(bioSAXSData);

% --- Executes during object creation, after setting all properties.
function critP_CreateFcn(hObject, eventdata, handles)
% hObject    handle to critP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in madRB.
function madRB_Callback(hObject, eventdata, handles)
% hObject    handle to madRB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of madRB
bioSAXSData = getData;
if get(handles.madRB, 'Value')    
    bioSAXSData.outlier.det = 1;
else
    bioSAXSData.outlier.det = 2;
end

setData(bioSAXSData);


% --- Executes on button press in stdRB.
function stdRB_Callback(hObject, eventdata, handles)
% hObject    handle to stdRB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of stdRB
bioSAXSData = getData;
if get(handles.stdRB, 'Value')    
    bioSAXSData.outlier.det = 2;
else
    bioSAXSData.outlier.det = 1;
end

setData(bioSAXSData);


% --- Executes on button press in damage.
function damage_Callback(hObject, eventdata, handles)
% hObject    handle to damage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of damage
bioSAXSData = getData;

bioSAXSData.outlier.damage= get(handles.damage, 'Value');    

setData(bioSAXSData);


% --- Executes on selection change in segment.
function segment_Callback(hObject, eventdata, handles)
% hObject    handle to segment (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns segment contents as cell array
%        contents{get(hObject,'Value')} returns selected item from segment


% --- Executes during object creation, after setting all properties.
function segment_CreateFcn(hObject, eventdata, handles)
% hObject    handle to segment (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit116_Callback(hObject, eventdata, handles)
% hObject    handle to edit116 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit116 as text
%        str2double(get(hObject,'String')) returns contents of edit116 as a double


% --- Executes during object creation, after setting all properties.
function edit116_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit116 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function listbox3_Callback(hObject, eventdata, handles)
% hObject    handle to listbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function listbox3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on selection change in qSeg.
function qSeg_Callback(hObject, eventdata, handles)
% hObject    handle to qSeg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns qSeg contents as cell array
%        contents{get(hObject,'Value')} returns selected item from qSeg
bioSAXSData = getData;

qSegStr= get(handles.qSeg, 'String');    
qSegID= get(handles.qSeg, 'Value');
bioSAXSData.outlier.qSeg= str2num(qSegStr{qSegID});

setData(bioSAXSData);

% --- Executes during object creation, after setting all properties.
function qSeg_CreateFcn(hObject, eventdata, handles)
% hObject    handle to qSeg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in motherDir.
function motherDir_Callback(hObject, eventdata, handles)
% hObject    handle to motherDir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of motherDir


% --- Executes on button press in apply2WAXS.
function apply2WAXS_Callback(hObject, eventdata, handles)
% hObject    handle to apply2WAXS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of apply2WAXS
