load example1
F=f_min:7900000:f_max;
s=2*pi*1i*f_max;
s0=f_min;
R=-(A-s0*E)\B;
%M=(A-s0*E)\E;
Zk=zeros(1001,1);
%for i=1:3
    %for j=1:2
    k=150;
for i=1:1
    e1=zeros(k,1);
    e1(1)=1;
    ck=e1;
    c=C(:,1);
    rk=(c.'*R(:,1))*e1;
    Tk=nonsymlanczos(A,R(:,1),c,k,s0,E);
    Zk(i)=ck.'*((eye(k)-(s(i)-s0)*Tk)\rk);
    i
    Zk(1)
end