load example2
a=9:2/1000:11;
F=10.^a;
s=2*pi*1i*F;
s0=f_max;
R=-(A-s0*E)\B;
M=(A-s0*E)\E;
Zk=zeros(16,1001);
k=130;
for i=1:1001
[V,H] = arnoldi(A,R(:,5),k,s0,E);
e1=zeros(k,1);
e1(1)=1;
Zk(:,i)=norm(R(:,5))*C'*V*((eye(k)-(s(i)-s0)*H)\e1);
i
end