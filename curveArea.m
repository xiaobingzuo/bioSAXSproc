function mt = curveArea(data, fpnt, lpnt)
%
%

%[sx, sy] = size(data);
mt = 0.;
q = data(:,1);
iq = data(:,2);

if fpnt==1
    fpnt = 2;
end
if lpnt == length(q)
   lpnt = length(q) -1;
end

dq2 = q(fpnt:lpnt) - q(fpnt -1 : lpnt-1);
dq3 = q(fpnt+1:lpnt+1) - q(fpnt : lpnt);
dq = 0.5 *(dq2 + dq3);

mt =sum(dq .* iq(fpnt:lpnt) );
end
