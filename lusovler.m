function [x]=lusovler(A,s0,E,v)
b=E*v;
S=A-s0*E;
[L,U,p,q,D]=lu(S,'vector');
b=D(:,p)\b;
c=L\b;
x=U\c;
x(q,:)=x;
end