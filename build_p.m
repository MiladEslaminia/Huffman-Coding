function p=build_p(p,I1,I2)
syms s1 s2 s3 s4 s5 s6 s7 s8;
syms p1 p2 p3 p4 p5 p6 p7;
switch(I1)
       case 1
           p=[p;s1 0];
       case 2
           p=[p;s2 0];
       case 3
           p=[p;s3 0];
       case 4
           p=[p;s4 0];
       case 5
           p=[p;s5 0];
       case 6
           p=[p;s6 0];
       case 7
           p=[p;s7 0];
       case 8
           p=[p;s8 0];
       case 9
           p=[p;p1 0];
       case 10
           p=[p;p2 0];
       case 11
           p=[p;p3 0];
       case 12
           p=[p;p4 0];
       case 13
           p=[p;p5 0];
       case 14
           p=[p;p6 0];
       case 15
           p=[p;p7 0];
       otherwise
           display 'error'
end
switch(I2)
       case 1
           p(end)=s1;
       case 2
           p(end)=s2;
       case 3
           p(end)=s3;
       case 4
           p(end)=s4;
       case 5
           p(end)=s5;
       case 6
           p(end)=s6;
       case 7
           p(end)=s7;
       case 8
           p(end)=s8;
       case 9
           p(end)=p1;
       case 10
           p(end)=p2;
       case 11
           p(end)=p3;
       case 12
           p(end)=p4;
       case 13
           p(end)=p5;
       case 14
           p(end)=p6;
       case 15
           p(end)=p7;
       otherwise
           display 'error'
end
end