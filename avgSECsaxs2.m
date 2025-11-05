function mt = avgSECsaxs2( ndir, fSerNum, frameRange, save2Folder, prefix, outliers )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
if nargin < 6
    outliers = [];
end
cdir = pwd;
serialN = sprintf('%05d', fSerNum);
fn = ['*_' serialN '_?????.dat'];
fn2 = fullfile(cdir, ndir, fn);
fns = dir(fn2);

fn3 = fullfile(fns(1).folder,fns(1).name);
fn4 = fn3(1:end-10)
[fdir, fntemp] =fileparts(fn4); 
%fdir = fns(1).folder;

iqs=[];
range1 = frameRange(1):1:frameRange(2);
range2 = setdiff(range1, outliers);

for kk= range2
    %cfile = fns(kk).name;
    cfile = sprintf('%s_%05d.dat',fntemp,kk);
    cName = fullfile(fdir, cfile);
    %cName = sprintf('',fn4)
    dat = readData(cName);
    q = dat(:,1);
    iq = dat(:,2);
    iqs=[iqs iq];
end
mean_iq = mean(iqs')';
std_iq = std(iqs')';

figure(444); loglog(q, mean_iq, '-or');

fn5 = fullfile(cdir, save2Folder, [prefix cfile(2:end-10) '.avg'])
fid = fopen(fn5, 'w');
fprintf(fid, '%s\n', '% q(A^-1)   I(q)    sqrt(I(q))');
for kkk=1:length(q)
    fprintf(fid, '%.4E  %.6E  %.4E\n', q(kkk), mean_iq(kkk), std_iq(kkk));
end
fclose(fid);
%dlmwrite(fn5, '% q(A^-1)   I(q)    sqrt(I(q))' );
%dlmwrite(fn5, [q mean_iq std_iq] , 'precision','%.4E','delimiter','\t', '-append');

end

