function avgTRSAXS2( ndir, fName, fSerNums, shotNum, save2Folder, bkgFn )
%[ output_args ] = secIqvsN( ndir, fn, qLow, qHigh )
%   ndir: folder dir relative current folder
%   fn: file name
if nargin==4
    save2Folder = 'Processed';
    bkgFn = '';
elseif nargin == 5
    bkgFn= '';
else
   try
     bkg = readData(bkgFn);  
   catch ME
     bkg = [];  
end
fid = fopen('Rg_rst.txt','a');
fprintf(fid, '\n# file_name    Rg    RgErr    Io    IoErr\n');
fprintf(fid, '# file: %s; shotNum: %d; ser#: %s\n', fName, shotNum, num2str(fSerNums));
Rgs=[];
I0s=[];
%cdir = pwd;
cdir='';
for kk = 1:shotNum
    Iqs=[];
    Iqerrs=[];
    shotN = sprintf('%05d', kk);
    fNameSave = fullfile(cdir, save2Folder, [fName '_' shotN '.avg']);
    fnStr='% Files averaged: ';
    for jj = fSerNums
       serialN = sprintf('%05d', jj);        
       fn = [fName '_' serialN '_' shotN '.dat'];
       fn2 = fullfile(cdir, ndir, fn);
       try
       mt = readData(fn2);
       catch ME
           rethrow(ME);
       end
       if ~isempty(mt)
          q = mt(:,1);
          Iqs= [Iqs mt(:,2)];
          Iqerrs=[Iqerrs mt(:,3)];  
          fnStr = [fnStr ' ' fn];
       end
    end
    %q = q;
    IqAvg = mean(Iqs')';
    IqErr = std(Iqs')';
    % not use Iqerrs
    dlmwrite(fNameSave, fnStr, 'delimiter', '', 'Precision', '%s');
    dlmwrite(fNameSave, '% ', 'delimiter', '', 'Precision', '%s','-append' );
    dlmwrite(fNameSave, '% q(A^-1)   I(q)    sqrt(I(q))', 'delimiter', '', 'Precision', '%s', '-append');
    dlmwrite(fNameSave, [q IqAvg IqErr], 'delimiter', ' ', 'precision', '%.4E', '-append');
    if ~isempty(bkg)
        fNameSave2 = fullfile(cdir, save2Folder, [fName '_' shotN '_bsub.dat']);       
        iqBsub = IqAvg - bkg(:,2);
        iqErrBsub = sqrt(IqErr.^2 + bkg(:,3).^2);
        dlmwrite(fNameSave2, fnStr, 'delimiter', '', 'Precision', '%s');
        dlmwrite(fNameSave2, ['% bkg: ' bkgFn], 'delimiter', '', 'Precision', '%s','-append' );
        dlmwrite(fNameSave2, '% ', 'delimiter', '', 'Precision', '%s','-append' );
        dlmwrite(fNameSave2, '% q(A^-1)   I(q)    sqrt(I(q))', 'delimiter', '', 'Precision', '%s', '-append')
        dlmwrite(fNameSave2, [q iqBsub iqErrBsub], 'delimiter', ' ', 'precision', '%.4E', '-append');
    end
    rst = calDatRg(fNameSave2);
    if isempty(rst)
        continue;
    else
        [~, fn, ext] = fileparts(fNameSave2);
        Rgs=[Rgs ;[kk rst.Rg rst.RgErr]];
        figure(100); errorbar(Rgs(:,1), Rgs(:,2), Rgs(:,3));
        I0s=[I0s ;[kk rst.Io rst.IoErr]];
        figure(200); errorbar(I0s(:,1), I0s(:,2), I0s(:,3));
        fprintf(fid, '%s  %.4E  %.4E  %.4E  %.4E\n', [fn ext], rst.Rg, rst.RgErr, rst.Io, rst.IoErr);
        disp( [fNameSave ' done!']);
    end
    
end

fclose(fid);
end