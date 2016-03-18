load example1
F=f_min:7900000:f_max;
s=2*pi*1i*F;
s0=f_max;
R=-(A-s0*E)\B;
M=(A-s0*E)\E;
z1=zeros(1001,1);
z2=zeros(1001,1);
z3=zeros(1001,1);
z4=zeros(1001,1);
for i=1:1001
    Z=C.'*inv(eye(308)-(s(i)-s0)*M)*R;
    z1(i)=Z(1,1);
    z2(i)=Z(1,2);
    z3(i)=Z(2,2);
    z4(i)=Z(2,3);
    i
end