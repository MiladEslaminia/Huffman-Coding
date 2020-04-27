%hoffman coding
s=[1/16 2/16 4/16 2/16 3/16 1/16 2/16 1/16];
prob=s;
syms s1 s2 s3 s4 s5 s6 s7 s8;
syms p1 p2 p3 p4 p5 p6 p7;
ssym=[s1 s2 s3 s4 s5 s6 s7 s8];
psym=[p1 p2 p3 p4 p5 p6 p7];
p=[];
n=[];
ls=zeros(1,8);
code=zeros(1,8);
for i=1:7
   [value1 I1]=min(s);
   s(I1)=2;
   [value2 I2]=min(s);
   s(I2)=2;
   s(8+i)=value1+value2;
   p=build_p(p,I1,I2);
      size_p=size(p);
end
pt=transpose(p);
for j=1:size_p(1)*size_p(2);
          if(rem(j,2)==0)
          if(find(ssym==pt(j)))
              [ls,code]=code_pwiths1(char(pt(j)),code,ls);
          else   
          n=j;
          while (n)
                  k=2*psym2pn(char(pt(n(end))));
                  if(find(ssym==pt(k)))
                     [ls,code]=code_pwiths1(char(pt(k)),code,ls);
                     
                  else 
                      n=[k n]; 
                     
                  end
                  if(find(ssym==pt(k-1)))
                     [ls,code]=code_pwiths1(char(pt(k-1)),code,ls);
                     
                  else 
                      n=[k-1 n];
                      
                  end
                  n(end)=[];
           end
          end
          end 
          if(rem(j,2)==1)
          if(find(ssym==pt(j)))
              ls=code_pwiths0(char(pt(j)),ls);
          else
              n=j;
          while (n)
                  k=2*psym2pn(char(pt(n(end))));
                  if(find(ssym==pt(k)))
                     ls=code_pwiths0(char(pt(k)),ls);
                     
                  else 
                      n=[k n]; 
                      
                  end
                  if(find(ssym==pt(k-1)))
                     ls=code_pwiths0(char(pt(k-1)),ls);
                     
                  else 
                      n=[k-1 n];
                  end
                  n(end)=[];
          end
          end
          end
end
result=transpose([ssym;prob;ls;code]);
disp ('Probablity of hoffman coded symbols')
disp (result)



%*********************************************
%PART2 Redundancy and Efficiency calculation
%*********************************************

Hmax=prob.*(log(1./prob)/log(2));
for kk=1:8
    if(prob(kk)==0)
        Hmax(kk)=0;
    end
end
H=sum(Hmax);
eff=H/(log(8)/log(2));  
red=1-eff;

nbm=ls.*prob;
nb=sum(nbm);
H_new=H/nb;
eff_new=H_new;

red_new=1-eff_new;

result2=[eff, red, eff_new, red_new];
%Comparing old & new redundancy

disp ('Old Efficiency Old Redundancy   New Efficiency   New Redundancy')
disp (result2);
