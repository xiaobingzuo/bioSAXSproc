function pddfRst = callAutoGnom(dataFile, rstRg, resultLog, atsasPath)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

if nargin < 4
    if nargin < 3
        if nargin < 2
            if nargin < 1
                fprintf('missing arguments!\n');
                return;
            end
            rstRg = 20.;
        end       
        resultLog = 'gnomRst.log';
    end
    atsasPath = 'C:\atsas\bin';
end


[fpath, fn, ext] = fileparts(dataFile);
pddfFn = fullfile(fpath, [fn '.out']);
pddfFn2 = [fn '_pr.dat'];
pddfLog = 'pddf.log'; % fullfile(bioSAXSData.dir, 'pddf.log');
%gnomCMD = sprintf('datgnom %s --skip %d  --output %s > %s',saxsFile, lowQts, pddfFn, pddfLog);
%gnomCMD = sprintf('datgnom %s --output %s > %s',saxsFile2, pddfFn, pddfLog);
gnomCMD = sprintf('%s %s -r %f -o %s > %s', fullfile(atsasPath, 'datgnom4'),dataFile, rstRg, pddfFn, pddfLog);
dos(gnomCMD);
%dos(eval(gnomCMD));
%     Rgcmd= sprintf('autorg "%s" -f ssv > "%s"', datFull, tmpLog); 
%     dos(Rgcmd);
%     fid=fopen(pddfLog,'r');
%     line = fgetl(fid);
%     fclose(fid);
[saxs, pddf, Rg, Io] = readGNOM(pddfFn);
pddfRst.pddf = pddf;
pddfRst.saxsFit = saxs;
pddfRst.RgGnom=Rg;
pddfRst.IoGnom=Io;

dlmwrite(pddfFn2, pddfRst.pddf, 'precision','.4E', 'delimiter',' ');

fid2 = fopen(resultLog, 'a');
if fid2 > 0
    fprintf(fid2,'%s    %.4E   %.4E\n', dataFile, Rg, Io);
end
fclose(fid2);

figure(909); loglog(saxs(:,1), saxs(:,2),'-ob',saxs(:,1), saxs(:,4),'-r','LineWidth',2); hold on; 
legend('iExp','iFit');xlabel('q,/A');ylabel('I(q)');
title('GNOM Fit');hold off;

figure(910); plot(pddf(:,1), pddf(:,2),'-r','LineWidth',3); hold on; 
legend('PDDF');xlabel('r, A');ylabel('p(r)');
title('PDDF');hold off;

end