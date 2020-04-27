%% in this program we genrate an array with hufman symbols and binary symbols
%out=hufman array   outb=binary array   outs=symbolic array 
%outbb=regenerated symbolic array
%program is complete 
clear; 
clc;
s1b=[0 0 0];s2b=[0 0 1];s3b=[0 1 0];s4b=[0 1 1];
s5b=[1 0 0];s6b=[1 0 1];s7b=[1 1 0];s8b=[1 1 1];
s1=[1 1 0 0];s2=[0 0 1];s3=[0 1]; s4=[1 0 0];
s5=[1 1 1];s6=[1 1 0 1];s7=[1 0 1];s8=[0 0 0];
ii=1;jj=1;
lengt=10^4;
len=lengt;
prob=[1/16 2/16 4/16 2/16 3/16 1/16 2/16 1/16];
symb=[1 2 3 4 5 6 7 8];
out=randsrc(1,len,[symb;prob]);
outs=out;
outb=out;
while(ii<=len)
    switch out(ii)
        case 1
            outb=[outb(1:jj-1),s1b,outb(jj+1:end)];
            jj=jj+3;
            out=[out(1:ii-1),s1,out(ii+1:end)];
            ii=ii+length(s1);
            len=len+length(s1)-1;
        case 2
            outb=[outb(1:jj-1),s2b,outb(jj+1:end)];
            jj=jj+3;
            out=[out(1:ii-1),s2,out(ii+1:end)];
            ii=ii+length(s2);
            len=len+length(s2)-1;            
        case 3
            outb=[outb(1:jj-1),s3b,outb(jj+1:end)];
            jj=jj+3;
            out=[out(1:ii-1),s3,out(ii+1:end)];
            ii=ii+length(s3);
            len=len+length(s3)-1;
        case 4
            outb=[outb(1:jj-1),s4b,outb(jj+1:end)];
            jj=jj+3;
            out=[out(1:ii-1),s4,out(ii+1:end)];
            ii=ii+length(s4);
            len=len+length(s4)-1;
        case 5
            outb=[outb(1:jj-1),s5b,outb(jj+1:end)];
            jj=jj+3;
            out=[out(1:ii-1),s5,out(ii+1:end)];
            ii=ii+length(s5);
            len=len+length(s5)-1;
        case 6
            outb=[outb(1:jj-1),s6b,outb(jj+1:end)];
            jj=jj+3;
            out=[out(1:ii-1),s6,out(ii+1:end)];
            ii=ii+length(s6);
            len=len+length(s6)-1;
        case 7
            outb=[outb(1:jj-1),s7b,outb(jj+1:end)];
            jj=jj+3;
            out=[out(1:ii-1),s7,out(ii+1:end)];
            ii=ii+length(s7);
            len=len+length(s7)-1;
        case 8
            outb=[outb(1:jj-1),s8b,outb(jj+1:end)];
            jj=jj+3;
            out=[out(1:ii-1),s8,out(ii+1:end)];
            ii=ii+length(s8);
            len=len+length(s8)-1;
    end
end

%%
len=lengt;
ii=1;outbb=out;
while(ii<=len)
    switch outbb(ii)
        case 1
            switch outbb(ii+1)
                case 1
                    switch outbb(ii+2)
                        case 1
                            outbb=[outbb(1:ii-1),5,outbb(ii+3:end)];
                            ii=ii+1;
                            continue;
                        case 0
                            switch outbb(ii+3)
                                case 1
                                    outbb=[outbb(1:ii-1),6,outbb(ii+4:end)];
                                    ii=ii+1;
                                    continue;
                                case 0
                                    outbb=[outbb(1:ii-1),1,outbb(ii+4:end)];
                                    ii=ii+1;
                                    continue;
                            end
                    end
                case 0
                    switch outbb(ii+2)
                        case 1
                            outbb=[outbb(1:ii-1),7,outbb(ii+3:end)];
                            ii=ii+1;
                            continue;
                        case 0
                            outbb=[outbb(1:ii-1),4,outbb(ii+3:end)];
                            ii=ii+1;
                            continue;
                    end
            end
        case 0
            switch outbb(ii+1)
                case 1
                    outbb=[outbb(1:ii-1),3,outbb(ii+2:end)];
                    ii=ii+1;
                    continue;
                case 0
                    switch outbb(ii+2)
                        case 1
                            outbb=[outbb(1:ii-1),2,outbb(ii+3:end)];
                            ii=ii+1;
                            continue;
                        case 0
                            outbb=[outbb(1:ii-1),8,outbb(ii+3:end)];
                            ii=ii+1;
                            continue;
                    end
            end
    end
end
if(outbb==outs)
    disp (outs)
    disp ('hoooooraaaaa')
else
    disp (outs);
    disp (outbb);
    disp ('error')
end