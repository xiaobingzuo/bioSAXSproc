%% sample #C1 Buffer PBS
serialNum = 52;
saxsFolder = 'SAXS\Averaged';
qLow = 0.01;
qHigh = 0.6;

[goodScans, area, outliers]=secIqvsN(saxsFolder, serialNum, qLow, qHigh);
%%
outliers
totRange = 1:max(goodScans); totRange = totRange(:);
missing1 =  setdiff(totRange, goodScans);
totMissing = setdiff(missing1, outliers)

%%
% average background and sample saxs data
avgSECsaxs(saxsFolder, serialNum, [350 450], 'Processed','bkg1', goodScans);
%%%
avgSECsaxs(saxsFolder, serialNum, [1700 1800], 'Processed','bkg2', goodScans);
%%%
avgSECsaxs(saxsFolder, serialNum, [618 638], 'Processed','pk1', goodScans);

avgSECsaxs(saxsFolder, serialNum, [769 796], 'Processed','pk2', goodScans);


%% sample #C2 Buffer PBS
serialNum = 53;
saxsFolder = 'SAXS\Averaged';
qLow = 0.01;
qHigh = 0.6;

[goodScans, area, outliers]=secIqvsN(saxsFolder, serialNum, qLow, qHigh);
% outliers:  371   575   669   857


serialNum = 53;
outliers=[371   575   669   857];
% average background and sample saxs data
%avgSECsaxs2(saxsFolder, serialNum, [400 500], 'Processed','Bkg1', outliers);
avgSECsaxs(saxsFolder, serialNum, [400 500], 'Processed','Bkg1', goodScans);
avgSECsaxs(saxsFolder, serialNum, [1450 1650], 'Processed','Bkg2', goodScans);
%%%
%avgSECsaxs(saxsFolder, serialNum, [1450 1650], 'Processed','Bkg2', outliers);
%%%
avgSECsaxs(saxsFolder, serialNum, [643 673], 'Processed','Pk1b', goodScans);
%avgSECsaxs(saxsFolder, serialNum, [668 671], 'Processed','Pk1', outliers);
%avgSECsaxs(saxsFolder, serialNum, [763 777], 'Processed','Pk2');

%% sample #C3 Buffer PBS
serialNum = 54;
saxsFolder = 'SAXS\Averaged';
qLow = 0.01;
qHigh = 0.6;

[goodScans, area, outliers]=secIqvsN(saxsFolder, serialNum, qLow, qHigh);
% outliers:   93         329         439         627        1393

%%
serialNum = 54;
%outliers=  [ 93         329         439         627        1393];
% average background and sample saxs data
avgSECsaxs(saxsFolder, serialNum, [420 520], 'Processed','Bkg1', goodScans);
%%%
avgSECsaxs(saxsFolder, serialNum, [1500 1700], 'Processed','Bkg2', goodScans);
%%%
avgSECsaxs(saxsFolder, serialNum, [718 745], 'Processed','Pk1', goodScans);

%avgSECsaxs(saxsFolder, serialNum, [763 777], 'Processed','Pk2');


%%
%% sample #C3 Buffer PBS
serialNum = 54;
saxsFolder = 'SAXS\Averaged';
qLow = 0.01;
qHigh = 0.6;

secIqvsN(saxsFolder, serialNum, qLow, qHigh);


%%
% average background and sample saxs data
avgSECsaxs(saxsFolder, serialNum, [350 450], 'Processed','bkg1');
%%%
avgSECsaxs(saxsFolder, serialNum, [1700 1800], 'Processed','bkg2');
%%%
avgSECsaxs(saxsFolder, serialNum, [991 1022], 'Processed','pk1');

avgSECsaxs(saxsFolder, serialNum, [723 738], 'Processed','pk2');



%% sample #1 Buffer A
serialNum = 3879;
saxsFolder = 'SAXS\Averaged';
qLow = 0.02;
qHigh = 0.6;

secIqvsN(saxsFolder, serialNum, qLow, qHigh);

%% sample #1 Buffer A2
fName = 'SBufA2'; % SA1_?????_?????.dat
saxsFolder = 'SAXS\Averaged';
qLow = 0.01;
qHigh = 0.6;

secIqvsN2(saxsFolder, fName, qLow, qHigh);


%% sample #1 sample A2
fName = 'SA2'; % SA1_?????_?????.dat
saxsFolder = 'SAXS\Averaged';
qLow = 0.01;
qHigh = 0.6;

secIqvsN2(saxsFolder, fName, qLow, qHigh);


%% sample #1 Buffer A2
fName = 'SA1'; % SA1_?????_?????.dat
saxsFolder = 'SAXS\Averaged';
qLow = 0.01;
qHigh = 0.6;

secIqvsN2(saxsFolder, fName, qLow, qHigh);
%%
%% sample #1 Buffer A2
fName = 'SA1A2mix'; % SA1_?????_?????.dat
saxsFolder = 'SAXS\Averaged';
qLow = 0.01;
qHigh = 0.6;

secIqvsN2(saxsFolder, fName, qLow, qHigh);
%% sample #B
fName = 'SB'; % SA1_?????_?????.dat
saxsFolder = 'SAXS\Averaged';
qLow = 0.01;
qHigh = 0.6;

secIqvsN2(saxsFolder, fName, qLow, qHigh);
%%
% average background and sample saxs data
avgSECsaxs(saxsFolder, serialNum, [1 102], 'Processed','bkg1');
%%%
avgSECsaxs(saxsFolder, serialNum, [900 1000], 'Processed','bkg2');
%%%
avgSECsaxs(saxsFolder, serialNum, [350 405], 'Processed','samp');


%% sample #1 HTT
serialNum = 29;
saxsFolder = 'SAXS\Averaged';
qLow = 0.01;
qHigh = 0.6;

secIqvsN(saxsFolder, serialNum, qLow, qHigh);
%%
% average background and sample saxs data
avgSECsaxs(saxsFolder, serialNum, [10 250], 'Processed','bkg1');
avgSECsaxs(saxsFolder, serialNum, [1800 2050], 'Processed','bkg2');
avgSECsaxs(saxsFolder, serialNum, [1193 1243], 'Processed','samp');


%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% sample #3 usp5R221AUbq
serialNum = 60;
saxsFolder = 'SAXS\Averaged';
qLow = 0.01;
qHigh = 0.6;

secIqvsN(saxsFolder, serialNum, qLow, qHigh);
%%
% average background and sample saxs data
avgSECsaxs(saxsFolder, serialNum, [66 299], 'Processed','bkg1');
%%
avgSECsaxs(saxsFolder, serialNum, [1388 1454], 'Processed','bkg2');
%%
avgSECsaxs(saxsFolder, serialNum, [1193 1239], 'Processed','samp');

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% sample #4 usp5C335SUbq
serialNum = 63;
saxsFolder = 'SAXS\Averaged';
qLow = 0.01;
qHigh = 0.6;

secIqvsN(saxsFolder, serialNum, qLow, qHigh);
%%
% average background and sample saxs data
avgSECsaxs(saxsFolder, serialNum, [10 250], 'Processed','bkg1');
%%%
avgSECsaxs(saxsFolder, serialNum, [1745 1856], 'Processed','bkg2');
%%%
avgSECsaxs(saxsFolder, serialNum, [1192 1245], 'Processed','samp');
avgSECsaxs(saxsFolder, serialNum, [850 977], 'Processed','samp2');
%%
avgSECsaxs(saxsFolder, serialNum, [1070 1130], 'Processed','bkg');
%%
avgSECsaxs(saxsFolder, serialNum, [375 511], 'Processed','bkg0');
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% sample #5 usp5C335S
serialNum = 65;
saxsFolder = 'SAXS\Averaged';
qLow = 0.01;
qHigh = 0.6;

secIqvsN(saxsFolder, serialNum, qLow, qHigh);
%%
% average background and sample saxs data
avgSECsaxs(saxsFolder, serialNum, [40 220], 'Processed','bkg1');
%%%
avgSECsaxs(saxsFolder, serialNum, [900 1000], 'Processed','bkg2');
avgSECsaxs(saxsFolder, serialNum, [1390 1450], 'Processed','bkg3');
%%%
avgSECsaxs(saxsFolder, serialNum, [1198 1248], 'Processed','samp');

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% sample #6 usp5R221A
serialNum = 68;
saxsFolder = 'SAXS\Averaged';
qLow = 0.01;
qHigh = 0.6;

secIqvsN(saxsFolder, serialNum, qLow, qHigh);
%%
% average background and sample saxs data
avgSECsaxs(saxsFolder, serialNum, [50 250], 'Processed','bkg1');
%%%
avgSECsaxs(saxsFolder, serialNum, [600 750], 'Processed','bkg');
%%%
avgSECsaxs(saxsFolder, serialNum, [1198 1259], 'Processed','samp');
avgSECsaxs(saxsFolder, serialNum, [1800 1950], 'Processed','bkg2');
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% sample #7
serialNum = 17;
saxsFolder = 'SAXS\Averaged';
qLow = 0.01;
qHigh = 0.6;

secIqvsN(saxsFolder, serialNum, qLow, qHigh);
%%
% average background and sample saxs data
avgSECsaxs(saxsFolder, serialNum, [17 120], 'Processed','bkg1');
%%
avgSECsaxs(saxsFolder, serialNum, [350 500], 'Processed','bkg2');
%%
avgSECsaxs(saxsFolder, serialNum, [176 217], 'Processed','samp');
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% sample #8
serialNum = 18;
saxsFolder = 'SAXS\Averaged';
qLow = 0.01;
qHigh = 0.6;

secIqvsN(saxsFolder, serialNum, qLow, qHigh);
%%
% average background and sample saxs data
avgSECsaxs(saxsFolder, serialNum, [62 134], 'Processed','bkg1');
%%
avgSECsaxs(saxsFolder, serialNum, [355 500], 'Processed','bkg2');
%%
avgSECsaxs(saxsFolder, serialNum, [181 207], 'Processed','samp');
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% sample #9
serialNum = 19;
saxsFolder = 'SAXS\Averaged';
qLow = 0.01;
qHigh = 0.6;

secIqvsN(saxsFolder, serialNum, qLow, qHigh);
%%
% average background and sample saxs data
avgSECsaxs(saxsFolder, serialNum, [91 135], 'Processed','bkg1');
%%
avgSECsaxs(saxsFolder, serialNum, [403 500], 'Processed','bkg2');
%%
avgSECsaxs(saxsFolder, serialNum, [178 193], 'Processed','samp');
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% sample #9
serialNum = 19;
saxsFolder = 'SAXS\Averaged';
qLow = 0.01;
qHigh = 0.6;

secIqvsN(saxsFolder, serialNum, qLow, qHigh);
%%
% average background and sample saxs data
avgSECsaxs(saxsFolder, serialNum, [91 135], 'Processed','bkg1');
%%
avgSECsaxs(saxsFolder, serialNum, [403 500], 'Processed','bkg2');
%%
avgSECsaxs(saxsFolder, serialNum, [211 226], 'Processed','samp2');
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% sample #10
serialNum = 36;
saxsFolder = 'SAXS\Averaged';
qLow = 0.01;
qHigh = 0.6;

secIqvsN(saxsFolder, serialNum, qLow, qHigh);
%%
% average background and sample saxs data
avgSECsaxs(saxsFolder, serialNum, [50 112], 'Processed','bkg1');
%%
avgSECsaxs(saxsFolder, serialNum, [356 500], 'Processed','bkg2');
%%
avgSECsaxs(saxsFolder, serialNum, [173 206], 'Processed','samp');
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% sample #11
serialNum = 58;
saxsFolder = 'SAXS\Averaged';
qLow = 0.01;
qHigh = 0.6;

secIqvsN(saxsFolder, serialNum, qLow, qHigh);
%%
% average background and sample saxs data
avgSECsaxs(saxsFolder, serialNum, [62 104], 'Processed','bkg1');
%%
avgSECsaxs(saxsFolder, serialNum, [400 500], 'Processed','bkg2');
%%
avgSECsaxs(saxsFolder, serialNum, [159 200], 'Processed','samp');
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% sample #12
serialNum = 60;
saxsFolder = 'SAXS\Averaged';
qLow = 0.01;
qHigh = 0.6;

secIqvsN(saxsFolder, serialNum, qLow, qHigh);
%%
% average background and sample saxs data
avgSECsaxs(saxsFolder, serialNum, [34 88], 'Processed','bkg1');
%%
avgSECsaxs(saxsFolder, serialNum, [440 500], 'Processed','bkg2');
%%
avgSECsaxs(saxsFolder, serialNum, [194 220], 'Processed','samp');