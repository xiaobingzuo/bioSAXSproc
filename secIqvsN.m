function [num, area, num2] = secIqvsN( ndir, fSerNum, qLow, qHigh, save2Folder )
%[ output_args ] = secIqvsN( ndir, fn, qLow, qHigh )
%   ndir: folder dir relative current folder
%   fn: file name
%  num: all good scan#
%  area: area values for all good scans
%  num2: outliers

if nargin==4
    save2Folder = 'Processed';
end

cdir = pwd;
serialN = sprintf('%05d', fSerNum);
fn = ['*_' serialN '_?????.dat'];
fn2 = fullfile(cdir, ndir, fn);
fns = dir(fn2);
fn3 = fullfile(fns(1).folder,fns(1).name);
fn4 = fn3(1:end-10)
[fdir, fntemp] =fileparts(fn4); 

mt = readData(fullfile(fns(1).folder,fns(1).name));
q = mt(:,1);
[qLowN, qHighN] = findQrange(q, qLow, qHigh); 

num =[];
area=[];
num2 = [];
for kk=1:length(fns)
    cfile = fns(kk).name;
    if mod(kk,10) ==0
        fprintf('%s, %4d of %4d.\n', cfile, kk, length(fns));
    end
    cName = fullfile(fns(kk).folder, cfile);
    dat = readData(cName);
%     iq = dat(:,2) - iqbkg;
%     dat2 = [q iq];
%     figure(4); loglog(q, iq);
%     pause(0.2);
    mt3 = curveArea(dat, qLowN, qHighN);
    aa=split(cfile, '_');
    bb=split(aa(end), '.');
    if mt3<1.0 % elimite not It-normalized curve
        num = [num; str2num(bb{1}) ];
        area = [area; mt3];
    else
        num2 =[num2; str2num(bb{1}) ];
    end
end
disp("outliers:")
num2'

figure(333); plot(num, area, '-or')
fn3 = fullfile(cdir, save2Folder, ['IqArea_vs_N_' serialN '.dat']);

fid = fopen(fn3, 'w');
fprintf(fid, '%s\n', '% frame_Num   Integrate_I(q)');
for kkk=1:length(num)
    fprintf(fid, '%5d  %.6E\n', num(kkk), area(kkk));
end
fclose(fid);
%dlmwrite(fn3, [num area] , ' ');

mt4 = [num area];

end

