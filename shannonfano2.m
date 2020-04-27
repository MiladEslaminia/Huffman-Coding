%% this function is for coding with shannon&fanno model.
% this program is ok
function s_p=shannonfano(p) %#ok<STOUT>
u=length(p);
s=1:u; %symbols
l=3;
ls=zeros(1,u);
s_pn=[s;p]';
flag=0;
%% calculation
s_p=sortrows(s_pn,2);
k=find_middle(transpose(s_p(:,2)),u);
s_p(1:k-1,3)=0;
s_p(k:u,3)=1;
ii=1;
while(sum(s_p(:,l))~=2*u)
    while (ii<u)
        if(s_p(ii,l)==2)
            s_p(ii,l+1)=2;
            ii=ii+1;
            continue;
        elseif(s_p(ii,l)==s_p(ii+1,l))
            d=find(s_p(ii:end,l)~=s_p(ii,l));
            if(isempty(d))
                d=ii+2;
            end
            k=find_middle(transpose(s_p(ii:d-1,2)),d-ii);
            s_p(ii:ii+k-2,l+1)=0;
            s_p(ii+k-1:d-1,l+1)=1;
            ii=d(1);
        else
            s_p(ii,l+1)=2;
            ls(ii)=l-2;
            ii=ii+1;
        end
    end
    if(ii==u)
        s_p(ii,l+1)=2;
        if(flag==0)
            ls(ii)=l-2;
            flag=1;
        end
    end
    ii=1;
    l=l+1;
end
s_p(:,end+1)=ls';
%s_p