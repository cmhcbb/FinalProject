load example1
F=f_min:7900000:f_max;
s=2*pi*1i*F;
s0=f_max;
R=-(A-s0*E)\B;
M=(A-s0*E)\E;
Zk=zeros(2,1001);
for i=1:1001
[V,H] = arnoldi(A,R(:,1),150,s0,E);
e1=zeros(150,1);
e1(1)=1;
Zk(:,i)=norm(R(:,1))*C'*V*inv(eye(150)-(s(i)-s0)*H)*e1;
i
end