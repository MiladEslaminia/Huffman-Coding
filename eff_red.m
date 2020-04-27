function [eff_usual, red_usual, eff_new, red_new]=eff_red(prob,s_p)
%%
Hm=prob.*(log(1./prob)/log(2));
[s,size_symb]=size(s_p);
for kk=1:s
    if(prob(kk)==0)
        Hm(kk)=0;
    end
end
H=sum(Hm);
eff_usual=H/(log(8)/log(2));  %Efficiency in usual mode
red_usual=1-eff_usual;

nbm=transpose(s_p(:,end)).*prob;
nb=sum(nbm);
H_new=H/nb;
eff_new=H_new;
red_new=1-eff_new;
end