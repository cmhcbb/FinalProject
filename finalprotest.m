load example3
a=9:2/1000:11;
F=10.^a;
s=2*pi*1i*F;
s0=f_max;
R=-(A-s0*E)\B;
%M=(A-s0*E)\E;
Zk=zeros(15,1001);
k=100;
iter=1;
for i=1:50:1001
[V,H] = arnoldi(A,R(:,16),k,s0,E);
e1=zeros(k,1);
e1(1)=1;
Zk(:,iter)=norm(R(:,16))*C'*V*((eye(k)-(s(i)-s0)*H)\e1);
iter=iter+1;
iter
end