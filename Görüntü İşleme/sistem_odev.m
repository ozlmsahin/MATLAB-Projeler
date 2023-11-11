function varargout = sistem_odev(varargin)
% SISTEM_ODEV MATLAB code for sistem_odev.fig
%      SISTEM_ODEV, by itself, creates a new SISTEM_ODEV or raises the existing
%      singleton*.
%
%      H = SISTEM_ODEV returns the handle to a new SISTEM_ODEV or the handle to
%      the existing singleton*.
%
%      SISTEM_ODEV('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SISTEM_ODEV.M with the given input arguments.
%
%      SISTEM_ODEV('Property','Value',...) creates a new SISTEM_ODEV or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before sistem_odev_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to sistem_odev_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help sistem_odev

% Last Modified by GUIDE v2.5 27-Dec-2022 23:32:11

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @sistem_odev_OpeningFcn, ...
                   'gui_OutputFcn',  @sistem_odev_OutputFcn, ...
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


% --- Executes just before sistem_odev is made visible.
function sistem_odev_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to sistem_odev (see VARARGIN)
global orjinal_resim son_resim  dondur filtre  en boy 
en=100
boy=100
filtre=1
dondur=1

% Choose default command line output for sistem_odev
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes sistem_odev wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = sistem_odev_OutputFcn(hObject, eventdata, handles) 
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



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
global orjinal_resim son_resim  filtre karo  en boy mozaik 
[dosya,yol] = uigetfile('*.jpg; *.bmp; *.gif','Tüm Resim dosyaları');
if dosya == 0
    return;
end

set(handles.edit1,'String',[yol,dosya]); 
axes(handles.axes1); 

orjinal_resim=imread([yol,dosya]); 
imshow(orjinal_resim); 


% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)

global orjinal_resim son_resim  filtre karo  en boy mozaik 

[dosya,yol] = uiputfile('*.bmp','BMP dosyasi');
if dosya == 0
    return;
end
%kisim sonu

set(handles.edit2,'String',[yol,dosya]); % edit2 kutusuna kaydedilecek resmin adi ve yolu yazdirilir.

imwrite(son_resim,[yol,dosya],'bmp') % islenmis resim degiskeni dosyaya yazdirilir.
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double
global orjinal_resim son_resim is_resim  karo  en boy mozaik

en = str2double(get(hObject, 'String'));
if isnan(en)
    set(hObject, 'String', 0);
    errordlg('Giris sayisal bir deger olmalidir','Error');
end
guidata(hObject,handles)



% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)

% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




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


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)


% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
global orjinal_resim son_resim is_resim   boyut  en boy
orjinal_resim=getimage(handles.axes1);
            H = fspecial('sobel')
            son_resim=imfilter(orjinal_resim,H,'replicate');
            axes(handles.axes2) 
            imshow(son_resim);title(negatif_resim)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
global orjinal_resim son_resim is_resim    boyut  en boy
            orjinal_resim=getimage(handles.axes1);
            H = fspecial('disk',10);
            son_resim = imfilter(orjinal_resim,H,'replicate'); 
            axes(handles.axes2)
            imshow(son_resim);title(blur_resim)
        
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

 
% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
close(handles.figure1);
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over pushbutton13.
function pushbutton13_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)






% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu3





function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double
global orjinal_resim son_resim is_resim karo en boy mozaik

boy= str2double(get(hObject, 'String'));
if isnan(boy)
    set(hObject, 'String', 0);
    errordlg('Giris sayisal bir deger olmalidir','Error');
end
guidata(hObject,handles)



% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




% --- Executes on button press in pushbutton18.
function pushbutton18_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global orjinal_resim son_resim is_resim  
orjinal_resim=getimage(handles.axes1);
orjinal_resim(:,:,[1 2])=0;
      son_resim=(orjinal_resim);
      axes(handles.axes2);
    imshow(son_resim);



% --- Executes on button press in pushbutton19.
function pushbutton19_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global orjinal_resim son_resim is_resim  
 
orjinal_resim=getimage(handles.axes1);
orjinal_resim(:,:,[2 3])=0;
      son_resim=(orjinal_resim);
      axes(handles.axes2);
    imshow(son_resim);



% --- Executes on button press in pushbutton20.
function pushbutton20_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global orjinal_resim son_resim is_resim  
orjinal_resim=getimage(handles.axes1);
orjinal_resim(:,:,[1 3])=0;
      son_resim=(orjinal_resim);
      axes(handles.axes2);
    imshow(son_resim);


% --- Executes on button press in pushbutton22.
function pushbutton22_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global orjinal_resim son_resim is_resim  
orjinal_resim=getimage(handles.axes1);
orjinal_resim(:,1:2:end,1)=0;
orjinal_resim(:,1:2:end,2)=0;
orjinal_resim(:,1:2:end,3)=0;
son_resim=(orjinal_resim);
      axes(handles.axes2);
    imshow(son_resim);


% --- Executes on button press in pushbutton23.
function pushbutton23_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global orjinal_resim son_resim  filtre boyut  en boy mozaik
if (filtre==1)
    orjinal_resim=getimage(handles.axes1);
orjinal_resim(:,:,1)=0;
orjinal_resim(:,:,3)=255;

end

if (filtre==2)
  orjinal_resim=getimage(handles.axes1);
orjinal_resim(:,:,2)=0;
orjinal_resim(:,:,3)=0;


end

if (filtre==3)
orjinal_resim=getimage(handles.axes1);
orjinal_resim(:,:,1)=0;
orjinal_resim(:,:,3)=0;
end 

if (filtre==4)
     orjinal_resim=getimage(handles.axes1);
     orjinal_resim=rgb2gray(orjinal_resim);
            
end

son_resim=(orjinal_resim);
axes(handles.axes2);
imshow(son_resim);


% --- Executes on selection change in popupmenu5.
function popupmenu5_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global orjinal_resim son_resim  filtre boyut  en boy mozaik
val = get(hObject,'Value');
switch val 
    case 1 
       filtre=1;
        
    case 2 
       filtre=2;
   
    case 3 
         filtre=3;

    case 4
     
         filtre=4;
         
end


% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu5 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu5


% --- Executes during object creation, after setting all properties.
function popupmenu5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton24.
function pushbutton24_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global orjinal_resim son_resim  filtre boyut  en boy mozaik
orjinal_resim=getimage(handles.axes1);
orjinal_resim=orjinal_resim-30; 
son_resim=(orjinal_resim);
axes(handles.axes2);
imshow(son_resim);


% --- Executes on button press in pushbutton25.
function pushbutton25_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global orjinal_resim son_resim  filtre boyut  en boy mozaik
orjinal_resim=getimage(handles.axes1);
orjinal_resim=orjinal_resim+30; 
son_resim=(orjinal_resim);
axes(handles.axes2);
imshow(son_resim);


% --- Executes on button press in pushbutton26.
function pushbutton26_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton26 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global orjinal_resim son_resim filtre boyut  en boy mozaik is_resim
son_resim=imresize(orjinal_resim,[boy, en]);
axes(handles.axes2);
imshow(son_resim);


% --- Executes on button press in pushbutton28.
function pushbutton28_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton28 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global orjinal_resim son_resim mavi_resim kirmizi_resim yesil_resim dondur blur_resim negatif_resim filtre boyut  en boy mozaik dondur

if (dondur==1)
 orjinal_resim=getimage(handles.axes1);
 son_resim=imrotate(orjinal_resim,90,'bicubic');

end

if (dondur==2)
   orjinal_resim=getimage(handles.axes1);
   son_resim=imrotate(orjinal_resim,180,'bicubic');


end

if (dondur==3)
  orjinal_resim=getimage(handles.axes1);
  son_resim=imrotate(orjinal_resim,270,'bicubic');

end

  if (dondur==4)
  orjinal_resim=getimage(handles.axes1);
  son_resim=imrotate(orjinal_resim,360,'bicubic');

  end 

axes(handles.axes2);
imshow(son_resim);



% --- Executes on selection change in popupmenu7.
function popupmenu7_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global orjinal_resim son_resim  boyut dondur en boy mozaik
val = get(hObject,'Value');
switch val 
    case 1 
       dondur=1;
        
    case 2 
       dondur=2;
   
    case 3 
         dondur=3;

    case 4
        dondur=4;
       
end

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


% --- Executes on button press in pushbutton29.
function pushbutton29_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton29 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global orjinal_resim son_resim dondur  filtre boyut  en boy mozaik dondur level

orjinal_resim=getimage(handles.axes1);
orjinal_resim=rgb2gray(orjinal_resim);
level = graythresh(orjinal_resim);
orjinal_resim =im2bw(orjinal_resim,level);
son_resim=orjinal_resim
axes(handles.axes2);
imshow(son_resim);


% --- Executes during object deletion, before destroying properties.
function pushbutton12_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton32.
function pushbutton32_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton32 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global orjinal_resim son_resim dondur  filtre boyut  en boy mozaik dondur level

orjinal_resim=getimage(handles.axes1);
orjinal_resim=rgb2gray(orjinal_resim);
orjinal_resim=im2double(orjinal_resim);
son_resim=edge(orjinal_resim,'log',[],2);
axes(handles.axes2);
imshow(son_resim);
