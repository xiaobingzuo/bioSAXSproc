function rst = callAutoRg(dataFile, resultLog, atsasPath)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
% tmpLog = fullfile(bioSAXSData.dir,'tmp.log');
%Rgcmd= sprintf('C:\\ATSAS3\\bin\\autorg "%s" -f ssv > "%s"', datFull, tmpLog); 
if nargin < 3
    if nargin < 2
        if nargin < 1
            fprintf('missing arguments!\n');
            return;
        else
            resultLog = 'RgRst.log';
            %atsasPath = 'C:\atsas\bin';
        end
    end
    atsasPath = 'C:\atsas\bin';
end

rst = {};
rst.Rg   =0;
rst.RgErr=0;
rst.Io   =0;
rst.IoErr=0;
rst.Qfit = 0;

tmpLog = 'tmp.log';
Rgcmd= sprintf('%s "%s" -f ssv > "%s"', fullfile(atsasPath, 'autorg'), dataFile, tmpLog); 
dos(Rgcmd);
fid=fopen(tmpLog,'r');
line = fgetl(fid);
fclose(fid);
str=strsplit(line, ' ');
rst.Rg   =str2num(str{1});
rst.RgErr=str2num(str{2});
rst.Io   =str2num(str{3});
rst.IoErr=str2num(str{4});
rst.firstPts = str2num(str{5});
rst.endPts = str2num(str{6});
rst.Qfit = str2num(str{7});


% set(handles.Rg, 'String', num2str(bioSAXSData.Rg, '%5.2f'));
% set(handles.Io, 'String', num2str(bioSAXSData.Io, '%0.3e'));
% set(handles.firstPts, 'String', num2str(bioSAXSData.firstPts));
% set(handles.endPts, 'String', num2str(bioSAXSData.endPts));
% 
% set(handles.msg, 'String', sprintf('Fit Quality: %5.1f%%.', bioSAXSData.Qfit*100));

pts1 = rst.firstPts;
pts2 = rst.endPts;
% dat = bioSAXSData.mZeroConc;
% if isempty(dat)
%     dat = readData(dataFile);
% end
dat = readData(dataFile);
q = dat(:,1);
iq = dat(:,2);
iqErr = dat(:,3);

q2 = q(pts1:pts2).^2;
iqfit = rst.Io * exp(-1*(rst.Rg)^2*q2/3.);

RgQm=q(pts2) * rst.Rg;
pts3 = max(floor(pts1*0.9),1);
pts4 = min(ceil(pts2*1.05),length(q));
q3 = q(pts3:pts4).^2;
figure(906); 
h = errorbar(q3,iq(pts3:pts4),iqErr(pts3:pts4),'or');
set(get(h,'Parent'), 'YScale', 'log'); hold on;
semilogy(q2,iqfit,'-b', 'LineWidth',3); hold on;
ylabel('Iq'); xlabel('q^2, A^-2');
legend('iExp','iFit'); title('Guinier fitting');
strlab=sprintf('Rg:%5.2f +/- %4.2f\nIo:%0.3E +/- %0.1E\nRg*qmax:%3.2f', rst.Rg, rst.RgErr, rst.Io, rst.IoErr,RgQm);
TeXString=texlabel(strlab);
text(median(q2)*1.2,median(iqfit)*1.02,TeXString); 
hold off;

fid2 = fopen(resultLog, 'a');
if fid2 > 0
    fprintf(fid2,'%s    %.4E   %.4E    %.4E    %.4E   %.4E\n', dataFile, rst.Rg, rst.RgErr, rst.Io, rst.IoErr, rst.Qfit);
end
fclose(fid2);

% [fpath, fn, ext] = fileparts(bioSAXSData.mZeroConcFn); 
% gtotFn = sprintf('%s_gtot.dat',fn);
% set(handles.gtotFn, 'String', gtotFn);
% bioSAXSData.gtotFn = gtotFn;
end