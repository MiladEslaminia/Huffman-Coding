tic
clear;
clc;
len=10^4;
len2=len;
symb1=1:4;
for ii=1:4
    for jj=1:4
        symb2(jj,ii)=ii*10+jj; 
    end
end
symb2=reshape(symb2,1,4^2);
for ii=1:4
    for jj=1:4
        for kk=1:4
            symb3(kk,jj,ii)=ii*100+jj*10+kk; 
        end
    end
end
symb3=reshape(symb3,1,4^3);
for ii=1:4
    for jj=1:4
        for kk=1:4
            for nn=1:4
                symb4(nn,kk,jj,ii)=ii*1000+jj*100+kk*10+nn; 
            end
        end
    end
end
symb4=reshape(symb4,1,4^4);
for ii=1:4
    for jj=1:4
        for kk=1:4
            for nn=1:4
                for mm=1:4
                    symb5(mm,nn,kk,jj,ii)=ii*10000+jj*1000+kk*100+nn*10+mm; 
                end
            end
        end
    end
end
symb5=reshape(symb5,1,4^5);
prob1=[.2 .3 .1 .4];
pro2=prob1'*prob1;
prob2=reshape(pro2,1,4^2);
for ii=1:4
    prob3(ii,:)=reshape((prob1'*pro2(ii,:)),1,16); 
end
prob3=reshape((prob3),1,4^3);
pro4=prob2'*prob2;
prob4=reshape(pro4,1,4^4);
for ii=1:16
    prob5(ii,:)=reshape((prob1'*pro4(ii,:)),1,64); 
end
prob5=reshape((prob5),1,4^5);


s_p1=shannonfano(prob1,symb1);
s_p1=sortrows(s_p1,1);
s_p2=shannonfano(prob2,symb2);
s_p2=sortrows(s_p2,1);
s_p3=shannonfano(prob3,symb3);
s_p3=sortrows(s_p3,1);
s_p4=shannonfano(prob4,symb4);
s_p4=sortrows(s_p4,1);
s_p5=shannonfano(prob5,symb5);
s_p5=sortrows(s_p5,1);

%% Redundancy calculation
[eff_usual1, red_usual1, eff_new1, red_new1]=eff_red(prob1,s_p1);
[eff_usual2, red_usual2, eff_new2, red_new2]=eff_red(prob2,s_p2);
[eff_usual3, red_usual3, eff_new3, red_new3]=eff_red(prob3,s_p3);
[eff_usual4, red_usual4, eff_new4, red_new4]=eff_red(prob4,s_p4);
[eff_usual5, red_usual5, eff_new5, red_new5]=eff_red(prob5,s_p5);
plot([1,2,3,4,5],[red_new1,red_new2,red_new3,red_new4,red_new5]);

out=randsrc(1,len,[symb1;prob1]);
outb1=out;
for i=1:2:len
    outb2((i+1)/2)=10*out(i)+out(i+1); 
end
if(rem(len,3)~=0)
    out=[out,zeros(1,3-rem(len,3))];
    len=len+3-rem(len,3);
end
for i=1:3:len
    outb3((i+2)/3)=100*out(i)+10*out(i+1)+out(i+2); 
end
len=len2;
if(rem(len,4)~=0)
    out=[out,zeros(1,4-rem(len,4))];
    len=len+4-rem(len,4);
end
for i=1:4:len
    outb4((i+3)/4)=1000*out(i)+100*out(i+1)+10*out(i+2)+out(i+3); 
end
len=len2;
if(rem(len,5)~=0)
    out=[out,zeros(1,5-rem(len,5))];
    len=len+5-rem(len,5);
end
for i=1:5:len
    outb5((i+4)/5)=10000*out(i)+1000*out(i+1)+100*out(i+2)+10*out(i+3)+out(i+4); 
end
i=1;j=1;
len=len2;

while(i<=len)
    si=s_p1(outb1(i),3:2+s_p1(outb1(i),end));
    outb1=[outb1(1:i-1),si,outb1(i+1:end)];
    i=i+length(si);
    len=len+length(si)-1;
end

len=ceil(len2/2);
i=1;
while(i<=len)
    si=s_p2(find(s_p2==outb2(i)),3:2+s_p2(find(s_p2==outb2(i)),end)); 
    outb2=[outb2(1:i-1),si,outb2(i+1:end)];
    i=i+length(si);
    len=len+length(si)-1;
end

len=ceil(len2/3);
i=1;
while(i<=len)
    syi=find(s_p3==outb3(i));
    si=s_p3(syi,3:2+s_p3(syi,end)); 
    outb3=[outb3(1:i-1),si,outb3(i+1:end)];
    i=i+length(si);
    len=len+length(si)-1;
end

len=ceil(len2/4);
i=1;
while(i<=len)
    syi=find(s_p4==outb4(i));
    si=s_p4(syi,3:2+s_p4(syi,end)); 
    outb4=[outb4(1:i-1),si,outb4(i+1:end)];
    i=i+length(si);
    len=len+length(si)-1;
end

len=ceil(len2/5);
i=1;
while(i<=len)
    syi=find(s_p5==outb5(i));
    si=s_p5(syi,3:2+s_p5(syi,end)); 
    outb5=[outb5(1:i-1),si,outb5(i+1:end)];
    i=i+length(si);
    len=len+length(si)-1;
end
toc