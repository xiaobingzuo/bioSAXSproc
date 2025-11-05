function err = simultSAXSbacksubFit(x, Iq_buf, Iq_samp, std_buf, std_samp, lowQ, highQ)
% err = simultSAXSbacksubFit(x, Iq_buf, Iq_samp, std_buf, std_samp, lowQ, highQ)
%
    err = 0.0; nNum = 0; nNum2 = 0;
    datN = length(x)/2;
    
    alpha = x(1:datN);
    beta  = x(datN+1:end);
    alphaMtx = diag(alpha);
    betaMtx = diag(beta);
    
    
    Iq2  = (Iq_samp - Iq_buf * alphaMtx) * betaMtx;
    std2 = (sqrt(std_samp.^2 + std_buf.^2 * alphaMtx.^2))*betaMtx; 
   
    dIq2 = Iq2(:,1:end-1) - Iq2(:,end)*ones(1,datN-1);

    for kk=1:datN
        nNum = nNum + countNegative(Iq2(:,kk),lowQ, highQ);
    end
    %nNum;
    mt2 = (dIq2(lowQ:highQ,:) ./ std2(lowQ:highQ,1:end-1)).^2;
    
    for kk=1:datN-1
        if (x(kk+1)-x(kk))*(x(datN+kk+1) - x(datN+kk)) <= 0  % alpha should descend
            nNum2 = nNum2 + 1;
        end
    end
    err = sum(sum(mt2, 'omitnan'))+ nNum*10 + nNum2 * 100;
end