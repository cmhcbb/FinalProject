load example1
F=f_min:7900000:f_max;
s=2*pi*1i*F;
s0=f_max;
R=-(A-s0*E)\B;
M=(A-s0*E)\E;
Zk=zeros(1001,1);
%for i=1:3
    %for j=1:2
for i=1:1
    e1=zeros(150,1);
    e1(1)=1;
    ck=e1;
    c=C(:,1);
    rk=(c.'*R(:,1))*e1;
    Tk=nonsymlanczos(A,R(:,1),c,150,s0,E);
    Zk(i)=ck.'*((eye(150)-(s(1)-s0)*Tk)\rk);
    i
end
%end