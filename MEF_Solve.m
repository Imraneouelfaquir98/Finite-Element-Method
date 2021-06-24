function varargout = MEF_Solve(varargin)
% MEF_SOLVE MATLAB code for MEF_Solve.fig
%      MEF_SOLVE, by itself, creates a new MEF_SOLVE or raises the existing
%      singleton*.
%
%      H = MEF_SOLVE returns the handle to a new MEF_SOLVE or the handle to
%      the existing singleton*.
%
%      MEF_SOLVE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MEF_SOLVE.M with the given input arguments.
%
%      MEF_SOLVE('Property','Value',...) creates a new MEF_SOLVE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before MEF_Solve_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to MEF_Solve_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help MEF_Solve

% Last Modified by GUIDE v2.5 13-Jun-2019 00:36:43

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @MEF_Solve_OpeningFcn, ...
                   'gui_OutputFcn',  @MEF_Solve_OutputFcn, ...
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


% --- Executes just before MEF_Solve is made visible.
function MEF_Solve_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to MEF_Solve (see VARARGIN)

% Choose default command line output for MEF_Solve
handles.output = hObject;

% Update handles structure

guidata(hObject, handles);

initialize_MEF_P1_gui(hObject, handles, false);
initialize_MEF_P2_gui(hObject, handles, false);
initialize_MEF_2D_gui(hObject, handles, false);

set(handles.existe_MEF_P1 ,'string','Connue');
set(handles.nexiste_MEF_P1,'string','Non connue');
set(handles.existe_MEF_P2 ,'string','Connue');
set(handles.nexiste_MEF_P2,'string','Non connue');
 
% UIWAIT makes MEF_Solve wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = MEF_Solve_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Accueil.
function Accueil_Callback(hObject, eventdata, handles)
% hObject    handle to Accueil (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(handles.uipanel1,'visible','on');
set(handles.uipanel_MEF_1D,'visible','off');
set(handles.uipanel_MEF_P1,'visible','off');
set(handles.uipanel_MEF_P2,'visible','off');
set(handles.uipanel_MEF_2D,'visible','off');
set(handles.uipanel_Rep_1D,'visible','off');
set(handles.uipanel_Rep_2D,'visible','off');
% --- Executes on button press in MEF_1D.
function MEF_1D_Callback(hObject, eventdata, handles)
% hObject    handle to MEF_1D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.uipanel1,'visible','off');
set(handles.uipanel_MEF_1D,'visible','on');
% --- Executes on button press in MEF_2D.
function MEF_2D_Callback(hObject, eventdata, handles)
% hObject    handle to MEF_2D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.uipanel1,'visible','off');
set(handles.uipanel_MEF_2D,'visible','on');
% --- Executes on button press in MEF_P1.


% --- Executes on button press in MEF_P1.
function MEF_P1_Callback(hObject, eventdata, handles)
% hObject    handle to MEF_P1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.uipanel_MEF_1D,'visible','off');
set(handles.uipanel_MEF_P1,'visible','on');

% --- Executes on button press in MEF_P2.
function MEF_P2_Callback(hObject, eventdata, handles)
% hObject    handle to MEF_P2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.uipanel_MEF_1D,'visible','off');
set(handles.uipanel_MEF_P2,'visible','on');


function a_MEF_P1_Callback(hObject, eventdata, handles)
% hObject    handle to a_MEF_P1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of a_MEF_P1 as text
%        str2double(get(hObject,'String')) returns contents of a_MEF_P1 as a double
a_MEF_P1 = str2double(get(hObject, 'String'));
if isnan(a_MEF_P1)
    set(hObject, 'String', '');
    errordlg('a doit etre un nombre','Error');
end
handles.metricdata.a_MEF_P1 = a_MEF_P1;
guidata(hObject,handles)

% --- Executes during object creation, after setting all properties.
function a_MEF_P1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to a_MEF_P1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function b_MEF_P1_Callback(hObject, eventdata, handles)
% hObject    handle to b_MEF_P1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of b_MEF_P1 as text
%        str2double(get(hObject,'String')) returns contents of b_MEF_P1 as a double

b_MEF_P1 = str2double(get(hObject, 'String'));
if isnan(b_MEF_P1)
    set(hObject, 'String', '');
    errordlg('b doit etre un nombre','Error');
end
handles.metricdata.b_MEF_P1 = b_MEF_P1;
guidata(hObject,handles)

% --- Executes during object creation, after setting all properties.
function b_MEF_P1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to b_MEF_P1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function N_MEF_P1_Callback(hObject, eventdata, handles)
% hObject    handle to N_MEF_P1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of N_MEF_P1 as text
%        str2double(get(hObject,'String')) returns contents of N_MEF_P1 as a double

N_MEF_P1 = str2double(get(hObject, 'String'));
if (N_MEF_P1==1)
    errordlg('N ne doit pas etre vide','Error');
end

if isnan(N_MEF_P1)
    set(hObject, 'String', '');
    errordlg('N doit etre un nombre','Error');
end

handles.metricdata.N_MEF_P1 = N_MEF_P1;
guidata(hObject,handles)

% --- Executes during object creation, after setting all properties.
function N_MEF_P1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to N_MEF_P1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function q_MEF_P1_Callback(hObject, eventdata, handles)
% hObject    handle to q_MEF_P1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of q_MEF_P1 as text
%        str2double(get(hObject,'String')) returns contents of q_MEF_P1 as a double

q_MEF_P1 = str2double(get(hObject, 'String'));
if isnan(q_MEF_P1)
    set(hObject, 'String', '');
    errordlg('q doit etre un nombre');
end
handles.metricdata.q_MEF_P1 = q_MEF_P1;
guidata(hObject,handles)

% --- Executes during object creation, after setting all properties.
function q_MEF_P1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to q_MEF_P1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function p_MEF_P1_Callback(hObject, eventdata, handles)
% hObject    handle to p_MEF_P1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of p_MEF_P1 as text
%        str2double(get(hObject,'String')) returns contents of p_MEF_P1 as a double

p_MEF_P1 = str2double(get(hObject, 'String'));
if isnan(p_MEF_P1) ;
    set(hObject, 'String', '');
    errordlg('p doit etre un nombre','Error');
end
handles.metricdata.p_MEF_P1 = p_MEF_P1;
guidata(hObject,handles)
% --- Executes during object creation, after setting all properties.
function p_MEF_P1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to p_MEF_P1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Ue_MEF_P1_Callback(hObject, eventdata, handles)
% hObject    handle to Ue_MEF_P1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Ue_MEF_P1 as text
%        str2double(get(hObject,'String')) returns contents of Ue_MEF_P1 as a double


% --- Executes during object creation, after setting all properties.
function Ue_MEF_P1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Ue_MEF_P1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Resolve_MEF_P1.
function Resolve_MEF_P1_Callback(hObject, eventdata, handles)
% hObject    handle to Resolve_MEF_P1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


Ue_MEF_P1= get(handles.Ue_MEF_P1,'string');
N_MEF_P1 = handles.metricdata.N_MEF_P1;
a_MEF_P1 = handles.metricdata.a_MEF_P1;
b_MEF_P1 = handles.metricdata.b_MEF_P1;
q_MEF_P1 = handles.metricdata.q_MEF_P1;
p_MEF_P1 = handles.metricdata.p_MEF_P1;

%Les conditions aux limites
Ua_MEF_P1 = handles.metricdata.Ua_MEF_P1;
Ub_MEF_P1= handles.metricdata.Ub_MEF_P1;

%Le pas h
h_MEF_P1=(b_MEF_P1-a_MEF_P1)/(N_MEF_P1+1);        

%Initialisation du système linéaire
A_MEF_P1 = zeros(N_MEF_P1+2);      % initialisation de la  Matrice globale.
F_MEF_P1 = zeros(N_MEF_P1+2,1);    % initialisation du seconde membre globale.

% Discrétisation du domaine Omega en N éléments
x=linspace(a_MEF_P1,b_MEF_P1,N_MEF_P1+2); 
%Déclaration du seconde membre
Ff_MEF_P1 = @(t)(eval(get(handles.Ft_MEF_P1,'string')));
f_MEF_P1  = Ff_MEF_P1(x);

% Matrice elementaire
      Ke_MEF_P1 = q_MEF_P1*(1/h_MEF_P1)*[1 -1;-1  1] ;      % Matrice elementaire de rigidité
      Me_MEF_P1 = p_MEF_P1*(h_MEF_P1/6)*[2  1; 1  2] ;      % Matrice elementaire de masse
      Ae_MEF_P1 = Ke_MEF_P1 + Me_MEF_P1 ;  % Matrice elementaire globale
      
% Assemblage
   for i=1:N_MEF_P1+1
      t=[i i+1];
      A_MEF_P1(t,t) = A_MEF_P1(t,t) + Ae_MEF_P1;
      % Seconde membre elementaire
         Fe_MEF_P1=(h_MEF_P1/2)*f_MEF_P1(t);
      F_MEF_P1(t) = F_MEF_P1(t) + Fe_MEF_P1';
   end
% Application des conditions aux limites
   %Pour le borde b
       F_MEF_P1 = F_MEF_P1 - A_MEF_P1(:,N_MEF_P1+2)*Ub_MEF_P1;
       A_MEF_P1(N_MEF_P1+2,:) = [];
       A_MEF_P1(:,N_MEF_P1+2) = [];
       F_MEF_P1(N_MEF_P1+2) = [];
   %Pour le borde a
       F_MEF_P1      = F_MEF_P1 - A_MEF_P1(:,1)*Ua_MEF_P1;
       A_MEF_P1(1,:) = [];
       A_MEF_P1(:,1) = [];
       F_MEF_P1(1)   = [];
       
%Résolution du système linéaire globale
   % initialisation du vecteur d'inconnus
     global U_MEF_P1;
     U_MEF_P1=zeros(N_MEF_P1+2,1);  
     U_MEF_P1(1)         =Ua_MEF_P1;  
     U_MEF_P1(N_MEF_P1+2)=Ub_MEF_P1;           
     U_MEF_P1([2:N_MEF_P1+1])=A_MEF_P1\F_MEF_P1;               % Résolution du système
 
   if(handles.existe_MEF_P1.Value==1)
       t=linspace(a_MEF_P1,b_MEF_P1,100);
       axes(handles.axes_MEF_P1); 
       plot(x,U_MEF_P1,'o-',t,eval(Ue_MEF_P1),'linewidth',1.2); 
   else
       axes(handles.axes_MEF_P1);
       plot(x,U_MEF_P1,'o-','linewidth',1.2);
   end

% --- Executes when selected object is changed in uibuttongroup_P2.
function uibuttongroup_P1_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uibuttongroup_P2 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


if (hObject == handles.existe_MEF_P1)
    set(handles.Ue_MEF_P1,'enable','on');
else
    set(handles.Ue_MEF_P1,'enable','off');
end



function Ft_MEF_P1_Callback(hObject, eventdata, handles)
% hObject    handle to Ft_MEF_P1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Ft_MEF_P1 as text
%        str2double(get(hObject,'String')) returns contents of Ft_MEF_P1 as a double


% --- Executes during object creation, after setting all properties.
function Ft_MEF_P1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Ft_MEF_P1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Initialiser_MEF_P1.

function Ub_MEF_P1_Callback(hObject, eventdata, handles)
% hObject    handle to Ub_MEF_P1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Ub_MEF_P1 as text
%        str2double(get(hObject,'String')) returns contents of Ub_MEF_P1 as a double
Ub_MEF_P1 = str2double(get(hObject, 'String'));
if isnan(Ub_MEF_P1)
    set(hObject, 'String', '');
    errordlg('Ub doit etre un nombre','Error');
end
handles.metricdata.Ub_MEF_P1 = Ub_MEF_P1;
guidata(hObject,handles)

% --- Executes during object creation, after setting all properties.
function Ub_MEF_P1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Ub_MEF_P1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Ua_MEF_P1_Callback(hObject, eventdata, handles)
% hObject    handle to Ua_MEF_P1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Ua_MEF_P1 as text
%        str2double(get(hObject,'String')) returns contents of Ua_MEF_P1 as a double

Ua_MEF_P1 = str2double(get(hObject, 'String'));
if isnan(Ua_MEF_P1)
    set(hObject, 'String', '');
    errordlg('Ua doit etre un nombre','Error');
end
handles.metricdata.Ua_MEF_P1 = Ua_MEF_P1;
guidata(hObject,handles)

% --- Executes during object creation, after setting all properties.
function Ua_MEF_P1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Ua_MEF_P1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Initialiser_MEF_P1_Callback(hObject, eventdata, handles)
% hObject    handle to Initialiser_MEF_P1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

initialize_MEF_P1_gui(gcbf, handles, true);

function initialize_MEF_P1_gui(fig_handle, handles, isreset)
% If the metricdata field is present and the reset flag is false, it means
% we are we are just re-initializing a GUI by calling it from the cmd line
% while it is up. So, bail out as we dont want to reset the data.
if isfield(handles, 'metricdata') && ~isreset
    return;
end

handles.metricdata.N_MEF_P1  = '';
handles.metricdata.p_MEF_P1  = '';
handles.metricdata.q_MEF_P1  = '';
handles.metricdata.a_MEF_P1  = '';
handles.metricdata.b_MEF_P1  = '';
handles.metricdata.Ua_MEF_P1 = '';
handles.metricdata.Ub_MEF_P1 = '';
handles.metricdata.i_MEF_P1  = '';
handles.metricdata.Ui_MEF_P1  = '';

set(handles.N_MEF_P1  ,  'String', handles.metricdata.N_MEF_P1);
set(handles.p_MEF_P1  ,  'String', handles.metricdata.p_MEF_P1);
set(handles.q_MEF_P1  ,  'String', handles.metricdata.q_MEF_P1);
set(handles.a_MEF_P1  ,  'String', handles.metricdata.a_MEF_P1);
set(handles.b_MEF_P1  ,  'String', handles.metricdata.b_MEF_P1);
set(handles.Ua_MEF_P1 ,  'String', handles.metricdata.Ua_MEF_P1);
set(handles.Ub_MEF_P1 ,  'String', handles.metricdata.Ub_MEF_P1);
set(handles.i_MEF_P1  ,  'String', handles.metricdata.i_MEF_P1);
set(handles.Ui_MEF_P1 ,  'String', handles.metricdata.Ui_MEF_P1);
set(handles.Ue_MEF_P1 ,  'String', '' );
set(handles.Ft_MEF_P1 ,  'String', '' );

x=[0:10:10];
axes(handles.axes_MEF_P1);
plot(x,0);



function N_MEF_P2_Callback(hObject, eventdata, handles)
% hObject    handle to N_MEF_P2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of N_MEF_P2 as text
%        str2double(get(hObject,'String')) returns contents of N_MEF_P2 as a double

N_MEF_P2 = str2double(get(hObject, 'String'));
if isnan(N_MEF_P2)
    set(hObject, 'String', '');
    errordlg('N doit etre un nombre','Error');
end
handles.metricdata.N_MEF_P2 = N_MEF_P2;
guidata(hObject,handles)

% --- Executes during object creation, after setting all properties.
function N_MEF_P2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to N_MEF_P2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function q_MEF_P2_Callback(hObject, eventdata, handles)
% hObject    handle to q_MEF_P2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of q_MEF_P2 as text
%        str2double(get(hObject,'String')) returns contents of q_MEF_P2 as a double
q_MEF_P2 = str2double(get(hObject, 'String'));
if isnan(q_MEF_P2)
    set(hObject, 'String', '');
    errordlg('q doit etre un nombre','Error');
end
handles.metricdata.q_MEF_P2 = q_MEF_P2;
guidata(hObject,handles)

% --- Executes during object creation, after setting all properties.
function q_MEF_P2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to q_MEF_P2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function p_MEF_P2_Callback(hObject, eventdata, handles)
% hObject    handle to p_MEF_P2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of p_MEF_P2 as text
%        str2double(get(hObject,'String')) returns contents of p_MEF_P2 as a double

p_MEF_P2 = str2double(get(hObject, 'String'));
if isnan(p_MEF_P2)
    set(hObject, 'String', '');
    errordlg('p doit etre un nombre','Error');
end
handles.metricdata.p_MEF_P2 = p_MEF_P2;
guidata(hObject,handles)

% --- Executes during object creation, after setting all properties.
function p_MEF_P2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to p_MEF_P2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Ft_MEF_P2_Callback(hObject, eventdata, handles)
% hObject    handle to Ft_MEF_P2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Ft_MEF_P2 as text
%        str2double(get(hObject,'String')) returns contents of Ft_MEF_P2 as a double


% --- Executes during object creation, after setting all properties.
function Ft_MEF_P2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Ft_MEF_P2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function a_MEF_P2_Callback(hObject, eventdata, handles)
% hObject    handle to a_MEF_P2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of a_MEF_P2 as text
%        str2double(get(hObject,'String')) returns contents of a_MEF_P2 as a double
a_MEF_P2 = str2double(get(hObject, 'String'));
if isnan(a_MEF_P2)
    set(hObject, 'String', '');
    errordlg('a doit etre un nombre','Error');
end
handles.metricdata.a_MEF_P2 = a_MEF_P2;
guidata(hObject,handles)

% --- Executes during object creation, after setting all properties.
function a_MEF_P2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to a_MEF_P2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function b_MEF_P2_Callback(hObject, eventdata, handles)
% hObject    handle to b_MEF_P2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of b_MEF_P2 as text
%        str2double(get(hObject,'String')) returns contents of b_MEF_P2 as a double

b_MEF_P2 = str2double(get(hObject, 'String'));
if isnan(b_MEF_P2)
    set(hObject, 'String', '');
    errordlg('b doit etre un nombre','Error');
end
handles.metricdata.b_MEF_P2 = b_MEF_P2;
guidata(hObject,handles)

% --- Executes during object creation, after setting all properties.
function b_MEF_P2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to b_MEF_P2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Ua_MEF_P2_Callback(hObject, eventdata, handles)
% hObject    handle to Ua_MEF_P2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Ua_MEF_P2 as text
%        str2double(get(hObject,'String')) returns contents of Ua_MEF_P2 as a double

Ua_MEF_P2 = str2double(get(hObject, 'String'));
if isnan(Ua_MEF_P2)
    set(hObject, 'String', '');
    errordlg('Ua doit etre un nombre','Error');
end
handles.metricdata.Ua_MEF_P2 = Ua_MEF_P2;
guidata(hObject,handles)

% --- Executes during object creation, after setting all properties.
function Ua_MEF_P2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Ua_MEF_P2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Ub_MEF_P2_Callback(hObject, eventdata, handles)
% hObject    handle to Ub_MEF_P2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Ub_MEF_P2 as text
%        str2double(get(hObject,'String')) returns contents of Ub_MEF_P2 as a double

Ub_MEF_P2 = str2double(get(hObject, 'String'));
if isnan(Ub_MEF_P2)
    set(hObject, 'String', '');
    errordlg('Ub doit etre un nombre','Error');
end
handles.metricdata.Ub_MEF_P2 = Ub_MEF_P2;
guidata(hObject,handles)

% --- Executes during object creation, after setting all properties.
function Ub_MEF_P2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Ub_MEF_P2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Ue_MEF_P2_Callback(hObject, eventdata, handles)
% hObject    handle to Ue_MEF_P2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Ue_MEF_P2 as text
%        str2double(get(hObject,'String')) returns contents of Ue_MEF_P2 as a double


% --- Executes during object creation, after setting all properties.
function Ue_MEF_P2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Ue_MEF_P2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Resolve_MEF_P2.
function Resolve_MEF_P2_Callback(hObject, eventdata, handles)
% hObject    handle to Resolve_MEF_P2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

Ue_MEF_P2= get(handles.Ue_MEF_P2,'string');
N_MEF_P2 = handles.metricdata.N_MEF_P2;
a_MEF_P2 = handles.metricdata.a_MEF_P2;
b_MEF_P2 = handles.metricdata.b_MEF_P2;
q_MEF_P2 = handles.metricdata.q_MEF_P2;
p_MEF_P2 = handles.metricdata.p_MEF_P2;

%Les conditions aux limites
Ua_MEF_P2 = handles.metricdata.Ua_MEF_P2;
Ub_MEF_P2= handles.metricdata.Ub_MEF_P2;

h_MEF_P2=(b_MEF_P2-a_MEF_P2)/(N_MEF_P2);       %Le pas h 

%Initialisation du système linéaire
A_MEF_P2 = zeros(2*N_MEF_P2+1);      % initialisation de la  Matrice globale.
F_MEF_P2 = zeros(2*N_MEF_P2+1,1);    % initialisation du seconde membre globale.

% Discrétisation du domaine Omega en N éléments
x=linspace(a_MEF_P2,b_MEF_P2,2*N_MEF_P2+1); 
%Déclaration du seconde membre
f_MEF_P2 = @(t)(eval(get(handles.Ft_MEF_P2,'string')));

% Matrice elementaire
      Ke_MEF_P2 = (q_MEF_P2/(3*h_MEF_P2))*[ 7 -8  1     % Matrice de rigidité
                                          ;-8 16 -8
                                          ; 1 -8  7];    
      Me_MEF_P2 = p_MEF_P2*(h_MEF_P2/30)*[  4  2 -1     % Matrice de masse
                                          ; 2 16  2
                                          ;-1  2  4];        
      Ae_MEF_P2 = Ke_MEF_P2 + Me_MEF_P2 ;               % Matrice globale Assemblage
   for i=1:1:N_MEF_P2
      t=[2*i-1 2*i 2*i+1];  % Degre de liberte d'element Ti
      A_MEF_P2(t,t) = A_MEF_P2(t,t) + Ae_MEF_P2;
      % Seconde membre elementaire
         Fe_MEF_P2=(h_MEF_P2/6)*[f_MEF_P2(x(2*i-1)) 4*f_MEF_P2(x(2*i)) f_MEF_P2(x(2*i+1))];
      F_MEF_P2(t) = F_MEF_P2(t) + Fe_MEF_P2';
   end
% Application des conditions aux limites
   %Pour le borde b
       F_MEF_P2 = F_MEF_P2 - A_MEF_P2(:,2*N_MEF_P2+1)*Ub_MEF_P2;
       A_MEF_P2(2*N_MEF_P2+1,:) = [];
       A_MEF_P2(:,2*N_MEF_P2+1) = [];
       F_MEF_P2(2*N_MEF_P2+1)   = [];
   %Pour le borde a
       F_MEF_P2 = F_MEF_P2 - A_MEF_P2(:,1)*Ua_MEF_P2;
       A_MEF_P2(1,:)   = [];
       A_MEF_P2(:,1)   = [];
       F_MEF_P2(1)     = [];
       
%Résolution du système linéaire globale
   % initialisation du vecteur d'inconnus
     global U_MEF_P2;
     U_MEF_P2=zeros(2*N_MEF_P2+1,1);     
     U_MEF_P2(1)=Ua_MEF_P2; U_MEF_P2(2*N_MEF_P2+1)=Ub_MEF_P2;
   % Résolution du système 
     U_MEF_P2([2:2*N_MEF_P2])=A_MEF_P2\F_MEF_P2; 
     
   if(handles.existe_MEF_P2.Value==1)
       t=linspace(a_MEF_P2,b_MEF_P2,100);
       axes(handles.axes_MEF_P2); 
       plot(x,U_MEF_P2,'o-',t,eval(Ue_MEF_P2),'linewidth',1.2); 
   else
       axes(handles.axes_MEF_P2);
       plot(x,U_MEF_P2,'o-','linewidth',1.2);
   end

% --- Executes on button press in Initialiser_MEF_P2.

% --- Executes when selected object is changed in uibuttongroup_P2.
function uibuttongroup_P2_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uibuttongroup_P2 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if (hObject == handles.existe_MEF_P2)
    set(handles.Ue_MEF_P2,'enable','on');
else
    set(handles.Ue_MEF_P2,'enable','off');
end

% --- Executes on button press in Initialiser_MEF_P2.
function Initialiser_MEF_P2_Callback(hObject, eventdata, handles)
% hObject    handle to Initialiser_MEF_P2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

initialize_MEF_P2_gui(gcbf, handles, true);

function initialize_MEF_P2_gui(fig_handle, handles, isreset)
% If the metricdata field is present and the reset flag is false, it means
% we are we are just re-initializing a GUI by calling it from the cmd line
% while it is up. So, bail out as we dont want to reset the data.
if isfield(handles, 'metricdata') && ~isreset
    return;
end

handles.metricdata.N_MEF_P2  = '';
handles.metricdata.p_MEF_P2  = '';
handles.metricdata.q_MEF_P2  = '';
handles.metricdata.a_MEF_P2  = '';
handles.metricdata.b_MEF_P2  = '';
handles.metricdata.i_MEF_P2  = '';
handles.metricdata.Ua_MEF_P2 = '';
handles.metricdata.Ub_MEF_P2 = '';
handles.metricdata.Ui_MEF_P2 = '';

set(handles.N_MEF_P2 ,  'String', handles.metricdata.N_MEF_P2);
set(handles.p_MEF_P2 ,  'String', handles.metricdata.p_MEF_P2);
set(handles.q_MEF_P2 ,  'String', handles.metricdata.q_MEF_P2);
set(handles.a_MEF_P2 ,  'String', handles.metricdata.a_MEF_P2);
set(handles.b_MEF_P2 ,  'String', handles.metricdata.b_MEF_P2);
set(handles.i_MEF_P2 ,  'String', handles.metricdata.i_MEF_P2);
set(handles.Ua_MEF_P2,  'String', handles.metricdata.Ua_MEF_P2);
set(handles.Ub_MEF_P2,  'String', handles.metricdata.Ub_MEF_P2);
set(handles.Ui_MEF_P2,  'String', handles.metricdata.Ui_MEF_P2);
set(handles.Ue_MEF_P2,  'String', '' );
set(handles.Ft_MEF_P2,  'String', '' );
x=[0:10:10];
axes(handles.axes_MEF_P2);
plot(x,0);


function N_MEF_2D_Callback(hObject, eventdata, handles)
% hObject    handle to N_MEF_2D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of N_MEF_2D as text
%        str2double(get(hObject,'String')) returns contents of N_MEF_2D as a double
N_MEF_2D = str2double(get(hObject, 'String'));
if isnan(N_MEF_2D)
    set(hObject, 'String', '');
    errordlg('N doit etre un nombre','Error');
end

handles.metricdata.N_MEF_2D = N_MEF_2D;
guidata(hObject,handles)


% --- Executes during object creation, after setting all properties.
function N_MEF_2D_CreateFcn(hObject, eventdata, handles)
% hObject    handle to N_MEF_2D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function q_MEF_2D_Callback(hObject, eventdata, handles)
% hObject    handle to q_MEF_2D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of q_MEF_2D as text
%        str2double(get(hObject,'String')) returns contents of q_MEF_2D as a double
q_MEF_2D = str2double(get(hObject, 'String'));
if isnan(q_MEF_2D)
    set(hObject, 'String', '');
    errordlg('q doit etre un nombre','Error');
end

handles.metricdata.q_MEF_2D = q_MEF_2D;
guidata(hObject,handles)

% --- Executes during object creation, after setting all properties.
function q_MEF_2D_CreateFcn(hObject, eventdata, handles)
% hObject    handle to q_MEF_2D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function p_MEF_2D_Callback(hObject, eventdata, handles)
% hObject    handle to p_MEF_2D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of p_MEF_2D as text
%        str2double(get(hObject,'String')) returns contents of p_MEF_2D as a double
p_MEF_2D = str2double(get(hObject, 'String'));
if isnan(p_MEF_2D)
    set(hObject, 'String', '');
    errordlg('p doit etre un nombre','Error');
end

handles.metricdata.p_MEF_2D = p_MEF_2D;
guidata(hObject,handles)

% --- Executes during object creation, after setting all properties.
function p_MEF_2D_CreateFcn(hObject, eventdata, handles)
% hObject    handle to p_MEF_2D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function M_MEF_2D_Callback(hObject, eventdata, handles)
% hObject    handle to text111 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of text111 as text
%        str2double(get(hObject,'String')) returns contents of text111 as a double
M_MEF_2D = str2double(get(hObject, 'String'));
if isnan(M_MEF_2D)
    set(hObject, 'String', '');
    errordlg('M doit etre un nombre','Error');
end

handles.metricdata.M_MEF_2D = M_MEF_2D;
guidata(hObject,handles)

% --- Executes during object creation, after setting all properties.

function M_MEF_2D_CreateFcn(hObject, eventdata, handles)
% hObject    handle to p_MEF_2D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Fxy_MEF_2D_Callback(hObject, eventdata, handles)
% hObject    handle to Fxy_MEF_2D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Fxy_MEF_2D as text
%        str2double(get(hObject,'String')) returns contents of Fxy_MEF_2D as a double

% --- Executes during object creation, after setting all properties.
function Fxy_MEF_2D_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Fxy_MEF_2D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function a_MEF_2D_Callback(hObject, eventdata, handles)
% hObject    handle to a_MEF_2D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of a_MEF_2D as text
%        str2double(get(hObject,'String')) returns contents of a_MEF_2D as a double
a_MEF_2D = str2double(get(hObject, 'String'));
if isnan(a_MEF_2D)
    set(hObject, 'String', '');
    errordlg('a doit etre un nombre','Error');
end

handles.metricdata.a_MEF_2D = a_MEF_2D;
guidata(hObject,handles)

% --- Executes during object creation, after setting all properties.
function a_MEF_2D_CreateFcn(hObject, eventdata, handles)
% hObject    handle to a_MEF_2D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function c_MEF_2D_Callback(hObject, eventdata, handles)
% hObject    handle to c_MEF_2D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of c_MEF_2D as text
%        str2double(get(hObject,'String')) returns contents of c_MEF_2D as a double

c_MEF_2D = str2double(get(hObject, 'String'));
if isnan(c_MEF_2D)
    set(hObject, 'String', '');
    errordlg('c doit etre un nombre','Error');
end

handles.metricdata.c_MEF_2D = c_MEF_2D;
guidata(hObject,handles)
% --- Executes during object creation, after setting all properties.
function c_MEF_2D_CreateFcn(hObject, eventdata, handles)
% hObject    handle to c_MEF_2D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function d_MEF_2D_Callback(hObject, eventdata, handles)
% hObject    handle to d_MEF_2D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of d_MEF_2D as text
%        str2double(get(hObject,'String')) returns contents of d_MEF_2D as a double
d_MEF_2D = str2double(get(hObject, 'String'));
if isnan(d_MEF_2D)
    set(hObject, 'String', '');
    errordlg('d doit etre un nombre','Error');
end

handles.metricdata.d_MEF_2D = d_MEF_2D;
guidata(hObject,handles)

% --- Executes during object creation, after setting all properties.
function d_MEF_2D_CreateFcn(hObject, eventdata, handles)
% hObject    handle to d_MEF_2D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function b_MEF_2D_Callback(hObject, eventdata, handles)
% hObject    handle to b_MEF_2D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of b_MEF_2D as text
%        str2double(get(hObject,'String')) returns contents of b_MEF_2D as a double
b_MEF_2D = str2double(get(hObject, 'String'));
if isnan(b_MEF_2D)
    set(hObject, 'String', '');
    errordlg('b doit etre un nombre','Error');
end

handles.metricdata.b_MEF_2D = b_MEF_2D;
guidata(hObject,handles)

% --- Executes during object creation, after setting all properties.
function b_MEF_2D_CreateFcn(hObject, eventdata, handles)
% hObject    handle to b_MEF_2D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Ul_MEF_2D_Callback(hObject, eventdata, handles)
% hObject    handle to Ul_MEF_2D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Ul_MEF_2D as text
%        str2double(get(hObject,'String')) returns contents of Ul_MEF_2D as a double


% --- Executes during object creation, after setting all properties.
function Ul_MEF_2D_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Ul_MEF_2D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Utop_MEF_2D_Callback(hObject, eventdata, handles)
% hObject    handle to Utop_MEF_2D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Utop_MEF_2D as text
%        str2double(get(hObject,'String')) returns contents of Utop_MEF_2D as a double


% --- Executes during object creation, after setting all properties.
function Utop_MEF_2D_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Utop_MEF_2D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Ubot_MEF_2D_Callback(hObject, eventdata, handles)
% hObject    handle to Ubot_MEF_2D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Ubot_MEF_2D as text
%        str2double(get(hObject,'String')) returns contents of Ubot_MEF_2D as a double


% --- Executes during object creation, after setting all properties.
function Ubot_MEF_2D_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Ubot_MEF_2D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Resolve_MEF_2D.
function Resolve_MEF_2D_Callback(hObject, eventdata, handles)
% hObject    handle to Resolve_MEF_2D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Les ordres de aillage
N_MEF_2D = handles.metricdata.N_MEF_2D;
M_MEF_2D = handles.metricdata.M_MEF_2D;

%Les caractères de l'équations
q_MEF_2D = handles.metricdata.q_MEF_2D;
p_MEF_2D = handles.metricdata.p_MEF_2D;

%Domaine de définition 
a_MEF_2D = handles.metricdata.a_MEF_2D;
b_MEF_2D = handles.metricdata.b_MEF_2D;
c_MEF_2D = handles.metricdata.c_MEF_2D;
d_MEF_2D = handles.metricdata.d_MEF_2D;

%Conditions aux limites
Ul_MEF_2D   = @(y)(eval(get(handles.Ul_MEF_2D  ,'string')));
Ur_MEF_2D   = @(y)(eval(get(handles.Ur_MEF_2D  ,'string')));
Utop_MEF_2D = @(x)(eval(get(handles.Utop_MEF_2D,'string')));
Ubot_MEF_2D = @(x)(eval(get(handles.Ubot_MEF_2D,'string')));

%Initialisation du système linéaire globale
A_MEF_2D=zeros((N_MEF_2D+1)*(M_MEF_2D+1));
F_MEF_2D=zeros((N_MEF_2D+1)*(M_MEF_2D+1),1);

%Maillage
x_MEF_2D  =  linspace(  a_MEF_2D  ,  b_MEF_2D  ,  N_MEF_2D+1  );
y_MEF_2D  =  linspace(  c_MEF_2D  ,  d_MEF_2D  ,  M_MEF_2D+1  );

%Seconde Membre
Fxy_MEF_2D = @(x,y)(eval(get(handles.Fxy_MEF_2D  ,'string')));

%Matrices élémentaires

Ke1_MEF_2D=q_MEF_2D*N_MEF_2D/(2*M_MEF_2D)*[  1 ,-1 , 0
                                           ;-1 , 1 , 0
                                           ; 0 , 0 , 0];
Ke2_MEF_2D=q_MEF_2D*M_MEF_2D/(2*N_MEF_2D)*[  0 , 0 , 0
                                           ; 0 , 1 ,-1
                                           ; 0 ,-1 , 1];
Ke_MEF_2D = Ke1_MEF_2D + Ke2_MEF_2D ;
Me_MEF_2D = p_MEF_2D / (6*N_MEF_2D*M_MEF_2D) * eye(3);
Ae_MEF_2D = Ke_MEF_2D + Me_MEF_2D ;

%Résolutions des systèmes élémentaire et l'Assemblage
for j=1:M_MEF_2D
   for i=1:N_MEF_2D
      Vs=[(j-1)*(N_MEF_2D+1)+i  (j-1)*(N_MEF_2D+1)+i+1  j*(N_MEF_2D+1)+i+1];
      A_MEF_2D(Vs,Vs)=A_MEF_2D(Vs,Vs)+Ae_MEF_2D;
      Fe1_MEF_2D=1/(6*N_MEF_2D*M_MEF_2D)*[Fxy_MEF_2D(x_MEF_2D(i),y_MEF_2D(j)) Fxy_MEF_2D(x_MEF_2D(i),y_MEF_2D(j+1)) Fxy_MEF_2D(x_MEF_2D(i+1),y_MEF_2D(j+1))];
      F_MEF_2D(Vs)=F_MEF_2D(Vs)+Fe1_MEF_2D';
       
      Vi=[(j-1)*(N_MEF_2D+1)+i  (j-1)*(N_MEF_2D+1)+i+1  j*(N_MEF_2D+1)+i+1];
      A_MEF_2D(Vi,Vi)=A_MEF_2D(Vi,Vi)+Ae_MEF_2D;
      Fe2_MEF_2D=1/(6*N_MEF_2D*M_MEF_2D)*[Fxy_MEF_2D(x_MEF_2D(i),y_MEF_2D(j)) Fxy_MEF_2D(x_MEF_2D(i+1),y_MEF_2D(j)) Fxy_MEF_2D(x_MEF_2D(i+1),y_MEF_2D(j+1))];
      F_MEF_2D(Vi)=F_MEF_2D(Vi)+Fe2_MEF_2D';
   end
end

%Applications des conditions aux limites
m=(N_MEF_2D+1)*(M_MEF_2D+1)
for i=1:N_MEF_2D+1
   F_MEF_2D = F_MEF_2D - A_MEF_2D(:,m)*Utop_MEF_2D(x_MEF_2D(N_MEF_2D+2-i));
   A_MEF_2D(m,:)=[];  A_MEF_2D(:,m)=[];  F_MEF_2D(m)=[];
   m=m-1;
end

k=M_MEF_2D*(N_MEF_2D+1);
for i=1:M_MEF_2D-1
    
   F_MEF_2D = F_MEF_2D - A_MEF_2D(:,k)*Ur_MEF_2D(y_MEF_2D(M_MEF_2D+1-i));
   A_MEF_2D(k,:)=[];  A_MEF_2D(:,k)=[];  F_MEF_2D(k)=[];
   k=k-N_MEF_2D;
   
   F_MEF_2D = F_MEF_2D - A_MEF_2D(:,k)*Ul_MEF_2D(y_MEF_2D(M_MEF_2D+1-i));
   A_MEF_2D(k,:)=[];  A_MEF_2D(:,k)=[];  F_MEF_2D(k)=[];
   k=k-1;
end

p=N_MEF_2D+1
for i=1:N_MEF_2D+1
    F_MEF_2D = F_MEF_2D - A_MEF_2D(:,p)*Ubot_MEF_2D(x_MEF_2D(N_MEF_2D+2-i));
    A_MEF_2D(p,:)=[];  A_MEF_2D(:,p)=[];  F_MEF_2D(p)=[];
    p=p-1;
end

%Résolutions de système linéaire globale
U1_MEF_2D=A_MEF_2D\F_MEF_2D;
D1_MEF_2D=zeros((M_MEF_2D-1),(N_MEF_2D-1));

s=0;
for i=1:M_MEF_2D-1
   t=[s+1:1:N_MEF_2D-1+s];
   D1_MEF_2D(i,:)=U1_MEF_2D(t);
   s=s+N_MEF_2D-1;
end

Xx_MEF_2D=linspace(a_MEF_2D,b_MEF_2D,M_MEF_2D+1);
Yy_MEF_2D=linspace(c_MEF_2D,d_MEF_2D,N_MEF_2D+1);

%Initialisation du tableau de la solution approchée sous forme une matrice
global D_MEF_2D;
D_MEF_2D=zeros(M_MEF_2D+1,N_MEF_2D+1);

%Insertion des conditions aux limites à la solution approchée
D_MEF_2D(1,:)=Ul_MEF_2D(Yy_MEF_2D);
D_MEF_2D(:,N_MEF_2D+1)=Utop_MEF_2D(Xx_MEF_2D);
D_MEF_2D(M_MEF_2D+1,:)=Ur_MEF_2D(Yy_MEF_2D);
D_MEF_2D(:,1)=Ubot_MEF_2D(Xx_MEF_2D);

D_MEF_2D([2:M_MEF_2D],[2:N_MEF_2D])=D1_MEF_2D;

%Représentation graphique de la solution approchée
x_MEF_2D=linspace( a_MEF_2D , b_MEF_2D , N_MEF_2D + 1 );
y_MEF_2D=linspace( c_MEF_2D , d_MEF_2D , M_MEF_2D + 1 );
 
axes(handles.axes_MEF_2D);

[X_MEF_2D,Y_MEF_2D]=meshgrid(x_MEF_2D,y_MEF_2D );
 
 mesh ( X_MEF_2D , Y_MEF_2D , D_MEF_2D );
 surf ( X_MEF_2D , Y_MEF_2D , D_MEF_2D );
% --- Executes on button press in Initialiser_MEF_2D.
function Initialiser_MEF_2D_Callback(hObject, eventdata, handles)
% hObject    handle to Initialiser_MEF_2D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
initialize_MEF_2D_gui(gcbf, handles, true);


function Ur_MEF_2D_Callback(hObject, eventdata, handles)
% hObject    handle to Ur_MEF_2D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Ur_MEF_2D as text
%        str2double(get(hObject,'String')) returns contents of Ur_MEF_2D as a double


% --- Executes during object creation, after setting all properties.
function Ur_MEF_2D_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Ur_MEF_2D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function initialize_MEF_2D_gui(fig_handle, handles, isreset)
% If the metricdata field is present and the reset flag is false, it means
% we are we are just re-initializing a GUI by calling it from the cmd line
% while it is up. So, bail out as we dont want to reset the data.
if isfield(handles, 'metricdata') && ~isreset
    return;
end

handles.metricdata.N_MEF_2D  = '';
handles.metricdata.M_MEF_2D  = '';
handles.metricdata.p_MEF_2D  = '';
handles.metricdata.q_MEF_2D  = '';
handles.metricdata.a_MEF_2D  = '';
handles.metricdata.b_MEF_2D  = '';
handles.metricdata.c_MEF_2D  = '';
handles.metricdata.d_MEF_2D  = '';
handles.metricdata.Ur_MEF_2D = '';
handles.metricdata.Ul_MEF_2D = '';
handles.metricdata.Fxy_MEF_2D  = '';
handles.metricdata.Utop_MEF_2D = '';
handles.metricdata.Ubot_MEF_2D = '';
handles.metricdata.i_MEF_2D  = '';
handles.metricdata.j_MEF_2D  = '';
handles.metricdata.Uij_MEF_2D  = '';

set(handles.N_MEF_2D   , 'String', handles.metricdata.N_MEF_2D)   ;
set(handles.M_MEF_2D   , 'String', handles.metricdata.M_MEF_2D)   ;
set(handles.q_MEF_2D   , 'String', handles.metricdata.q_MEF_2D)   ;
set(handles.p_MEF_2D   , 'String', handles.metricdata.p_MEF_2D)   ;
set(handles.a_MEF_2D   , 'String', handles.metricdata.a_MEF_2D)   ;
set(handles.b_MEF_2D   , 'String', handles.metricdata.b_MEF_2D)   ;
set(handles.c_MEF_2D   , 'String', handles.metricdata.c_MEF_2D)   ;
set(handles.d_MEF_2D   , 'String', handles.metricdata.d_MEF_2D)   ;
set(handles.Ur_MEF_2D  , 'String', handles.metricdata.Ur_MEF_2D)  ;
set(handles.Ul_MEF_2D  , 'String', handles.metricdata.Ul_MEF_2D)  ;
set(handles.Fxy_MEF_2D , 'String', handles.metricdata.Fxy_MEF_2D) ;
set(handles.Utop_MEF_2D, 'String', handles.metricdata.Utop_MEF_2D);
set(handles.Ubot_MEF_2D, 'String', handles.metricdata.Ubot_MEF_2D);
set(handles.i_MEF_2D  , 'String', handles.metricdata.i_MEF_2D); 
set(handles.j_MEF_2D  , 'String', handles.metricdata.j_MEF_2D); 
set(handles.Uij_MEF_2D  , 'String', handles.metricdata.Uij_MEF_2D);  

x=[0:10:10];
axes(handles.axes_MEF_2D);
plot(x,0);

% --- Executes when figure1 is resized.
function figure1_SizeChangedFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Representer_1D.
function Representer_1D_Callback(hObject, eventdata, handles)
% hObject    handle to Representer_1D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.uipanel1,'visible','off');
set(handles.uipanel_Rep_1D,'visible','on');


% --- Executes on button press in Representer_2D.
function Representer_2D_Callback(hObject, eventdata, handles)
% hObject    handle to Representer_2D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.uipanel1,'visible','off');
set(handles.uipanel_Rep_2D,'visible','on');


% --- Executes on button press in Tracer_button_2D.
function Tracer_button_2D_Callback(hObject, eventdata, handles)
% hObject    handle to Tracer_button_2D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a_Rep_2D = handles.metricdata.a_Rep_2D;
b_Rep_2D = handles.metricdata.b_Rep_2D;
c_Rep_2D = handles.metricdata.c_Rep_2D;
d_Rep_2D = handles.metricdata.d_Rep_2D;

funct_2D=get(handles.Tracer_edit_2D,'string');
ax1=linspace(a_Rep_2D,b_Rep_2D,100);
ay1=linspace(c_Rep_2D,d_Rep_2D,1000);
axes(handles.axes_Rep_2D);
[x,y]=meshgrid(ax1,ay1);
mesh (x , y , eval(funct_2D));

function Tracer_button_1D_Callback(hObject, eventdata, handles)
% hObject    handle to Tracer_button_2D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

a_1D = handles.metricdata.a_1D;
b_1D = handles.metricdata.b_1D;


funct_1D=get(handles.Tracer_edit_1D,'string');
axes(handles.axes_Rep_1D);
x=linspace(a_1D,b_1D,100);
plot(x , eval(funct_1D));

function Tracer_edit_1D_Callback(hObject, eventdata, handles)
% hObject    handle to Tracer_edit_1D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Tracer_edit_1D as text
%        str2double(get(hObject,'String')) returns contents of Tracer_edit_1D as a double


% --- Executes during object creation, after setting all properties.
function Tracer_edit_1D_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Tracer_edit_1D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Reset_Rep_1D.
function Reset_Rep_1D_Callback(hObject, eventdata, handles)
% hObject    handle to Reset_Rep_1D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function Tracer_edit_2D_Callback(hObject, eventdata, handles)
% hObject    handle to Tracer_edit_2D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Tracer_edit_2D as text
%        str2double(get(hObject,'String')) returns contents of Tracer_edit_2D as a double


% --- Executes during object creation, after setting all properties.
function Tracer_edit_2D_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Tracer_edit_2D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Reset_Rep_2D.
function Reset_Rep_2D_Callback(hObject, eventdata, handles)
% hObject    handle to Reset_Rep_2D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function a_Rep_2D_Callback(hObject, eventdata, handles)
% hObject    handle to a_Rep_2D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of a_Rep_2D as text
%        str2double(get(hObject,'String')) returns contents of a_Rep_2D as a double
a_Rep_2D= str2double(get(hObject, 'String'));
if isnan(a_Rep_2D)
    set(hObject, 'String', '');
    errordlg('ce champ doit etre un nombre','Error');
end

% Save the new density value
handles.metricdata.a_Rep_2D = a_Rep_2D;
guidata(hObject,handles)

% --- Executes during object creation, after setting all properties.
function a_Rep_2D_CreateFcn(hObject, eventdata, handles)
% hObject    handle to a_Rep_2D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


%%%
function b_Rep_2D_Callback(hObject, eventdata, handles)
% hObject    handle to a_Rep_2D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of a_Rep_2D as text
%        str2double(get(hObject,'String')) returns contents of a_Rep_2D as a double
b_Rep_2D= str2double(get(hObject, 'String'));
if isnan(b_Rep_2D)
    set(hObject, 'String', '');
    errordlg('ce champ doit etre un nombre','Error');
end

% Save the new density value
handles.metricdata.b_Rep_2D = b_Rep_2D;
guidata(hObject,handles)

% --- Executes during object creation, after setting all properties.
function b_Rep_2D_CreateFcn(hObject, eventdata, handles)
% hObject    handle to a_Rep_2D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end






function c_Rep_2D_Callback(hObject, eventdata, handles)
% hObject    handle to c_Rep_2D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of c_Rep_2D as text
%        str2double(get(hObject,'String')) returns contents of c_Rep_2D as a double

c_Rep_2D= str2double(get(hObject, 'String'));
if isnan(c_Rep_2D)
    set(hObject, 'String', '');
    errordlg('ce champ doit etre un nombre','Error');
end

% Save the new density value
handles.metricdata.c_Rep_2D = c_Rep_2D;
guidata(hObject,handles)


% --- Executes during object creation, after setting all properties.
function c_Rep_2D_CreateFcn(hObject, eventdata, handles)
% hObject    handle to c_Rep_2D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function d_Rep_2D_Callback(hObject, eventdata, handles)
% hObject    handle to d_Rep_2D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of d_Rep_2D as text
%        str2double(get(hObject,'String')) returns contents of d_Rep_2D as a double

d_Rep_2D= str2double(get(hObject, 'String'));
if isnan(d_Rep_2D)
    set(hObject, 'String', '');
    errordlg('ce champ doit etre un nombre','Error');
end

% Save the new density value
handles.metricdata.d_Rep_2D = d_Rep_2D;
guidata(hObject,handles)


% --- Executes during object creation, after setting all properties.
function d_Rep_2D_CreateFcn(hObject, eventdata, handles)
% hObject    handle to d_Rep_2D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function a_1D_Callback(hObject, eventdata, handles)
% hObject    handle to a_1D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of a_1D as text
%        str2double(get(hObject,'String')) returns contents of a_1D as a double

a_1D= str2double(get(hObject, 'String'));
if isnan(a_1D)
    set(hObject, 'String', '');
    errordlg('ce champ doit etre un nombre','Error');
end

% Save the new density value
handles.metricdata.a_1D = a_1D;
guidata(hObject,handles)


% --- Executes during object creation, after setting all properties.
function a_1D_CreateFcn(hObject, eventdata, handles)
% hObject    handle to a_1D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function b_1D_Callback(hObject, eventdata, handles)
% hObject    handle to b_1D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of b_1D as text
%        str2double(get(hObject,'String')) returns contents of b_1D as a double

b_1D= str2double(get(hObject, 'String'));
if isnan(b_1D)
    set(hObject, 'String', '');
    errordlg('ce champ doit etre un nombre','Error');
end

% Save the new density value
handles.metricdata.b_1D = b_1D;
guidata(hObject,handles)


% --- Executes during object creation, after setting all properties.
function b_1D_CreateFcn(hObject, eventdata, handles)
% hObject    handle to b_1D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in existe_MEF_P1.
function existe_MEF_P1_Callback(hObject, eventdata, handles)
% hObject    handle to existe_MEF_P1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of existe_MEF_P1


% --- Executes on button press in Ut_MEF_P1.
function Ut_MEF_P1_Callback(hObject, eventdata, handles)
% hObject    handle to Ut_MEF_P1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global U_MEF_P1;
i_MEF_P1=handles.metricdata.i_MEF_P1;

set(handles.Ui_MEF_P1 , 'string' , U_MEF_P1(i_MEF_P1));


function i_MEF_P1_Callback(hObject, eventdata, handles)
% hObject    handle to i_MEF_P1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of i_MEF_P1 as text
%        str2double(get(hObject,'String')) returns contents of i_MEF_P1 as a double

i_MEF_P1 = str2double(get(hObject, 'String'));
if isnan(i_MEF_P1)
    set(hObject, 'String', '');
    errordlg('ce champ doit etre un nombre','Error');
end
handles.metricdata.i_MEF_P1 = i_MEF_P1;
guidata(hObject,handles)

% --- Executes during object creation, after setting all properties.
function i_MEF_P1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to i_MEF_P1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Ut_MEF_P2.
function Ut_MEF_P2_Callback(hObject, eventdata, handles)
% hObject    handle to Ut_MEF_P2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global U_MEF_P2;
i_MEF_P2=handles.metricdata.i_MEF_P2;

set(handles.Ui_MEF_P2 , 'string' , U_MEF_P2(i_MEF_P2));

function i_MEF_P2_Callback(hObject, eventdata, handles)
% hObject    handle to i_MEF_P2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of i_MEF_P2 as text
%        str2double(get(hObject,'String')) returns contents of i_MEF_P2 as a double
i_MEF_P2 = str2double(get(hObject, 'String'));
if isnan(i_MEF_P2)
    set(hObject, 'String', '');
    errordlg('ce champ doit etre un nombre','Error');
end
handles.metricdata.i_MEF_P2 = i_MEF_P2;
guidata(hObject,handles)

% --- Executes during object creation, after setting all properties.
function i_MEF_P2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to i_MEF_P2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Ut_MEF_2D.
function Ut_MEF_2D_Callback(hObject, eventdata, handles)
% hObject    handle to Ut_MEF_2D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global D_MEF_2D;

i_MEF_2D=handles.metricdata.i_MEF_2D;
j_MEF_2D=handles.metricdata.j_MEF_2D;
set(handles.Uij_MEF_2D , 'string' , D_MEF_2D(i_MEF_2D,j_MEF_2D));

function i_MEF_2D_Callback(hObject, eventdata, handles)
% hObject    handle to i_MEF_2D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of i_MEF_2D as text
%        str2double(get(hObject,'String')) returns contents of i_MEF_2D as a double

i_MEF_2D = str2double(get(hObject, 'String'));
if isnan(i_MEF_2D)
    set(hObject, 'String', '');
    errordlg('ce champ doit etre un nombre','Error');
end
handles.metricdata.i_MEF_2D = i_MEF_2D;
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function i_MEF_2D_CreateFcn(hObject, eventdata, handles)
% hObject    handle to i_MEF_2D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function j_MEF_2D_Callback(hObject, eventdata, handles)
% hObject    handle to j_MEF_2D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of j_MEF_2D as text
%        str2double(get(hObject,'String')) returns contents of j_MEF_2D as a double
j_MEF_2D = str2double(get(hObject, 'String'));
if isnan(j_MEF_2D)
    set(hObject, 'String', '');
    errordlg('ce champ doit etre un nombre','Error');
end
handles.metricdata.j_MEF_2D = j_MEF_2D;
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function j_MEF_2D_CreateFcn(hObject, eventdata, handles)
% hObject    handle to j_MEF_2D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
