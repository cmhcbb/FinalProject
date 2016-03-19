load example1
F=f_min:7900000:f_max;
s=2*pi*1i*f_max;
Z=C.'*inv(s*E-A)*B;
Zk=zeros(1001,1);
%for i=1:3
    %for j=1:2
i=1;
for s0=2*pi*(1:5e8:f_max)
    R=-(A-s0*E)\B;
    i
    for k=1:10:308
    k
    e1=zeros(k,1);
    e1(1)=1;
    ck=e1;
    c=C(:,1);
    rk=(c.'*R(:,1))*e1;
    Tk=nonsymlanczos(A,R(:,1),c,k,s0,E);
    Zk(1)=ck.'*((eye(k)-(s(1)-s0)*Tk)\rk);
    if abs(Zk(1)-Z(1))<abs(0.01*Z(1))
        resk(i)=k;
        break;
    end
    end
    i=i+1;
end