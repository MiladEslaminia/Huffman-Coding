function k=find_middle(s_p,u)
sumsp_down=sum(s_p(2:end));
sumsp_up=sum(s_p(1:1));
diff1=abs(sumsp_down-sumsp_up);
for ii=3:u+1
    sumsp_down2=sum(s_p(ii:end));
    sumsp_up2=sum(s_p(1:ii-1));
    diff2=abs(sumsp_down2-sumsp_up2);
    if(diff1<=diff2)
        k=ii-1;
        break;
    else
        diff1=diff2;
        continue;
    end
end
