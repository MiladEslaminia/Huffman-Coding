function [ls,code]=code_pwiths1(pjj,code,ls)
switch pjj
                  case 's1'
                      code(1)=code(1)+10^ls(1);
                      ls(1)=ls(1)+1;
                  case 's2'
                      code(2)=code(2)+10^ls(2);
                      ls(2)=ls(2)+1;
                  case 's3'
                      code(3)=code(3)+10^ls(3);
                      ls(3)=ls(3)+1;
                  case 's4'
                      code(4)=code(4)+10^ls(4);
                      ls(4)=ls(4)+1;
                  case 's5'
                      code(5)=code(5)+10^ls(5);
                      ls(5)=ls(5)+1;
                  case 's6'
                      code(6)=code(6)+10^ls(6);
                      ls(6)=ls(6)+1;
                  case 's7'
                      code(7)=code(7)+10^ls(7);
                      ls(7)=ls(7)+1;
                  case 's8'
                      code(8)=code(8)+10^ls(8);
                      ls(8)=ls(8)+1;
                  otherwise
                      display 'error'
end
end              