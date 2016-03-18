function [x]=tlusovler(A,s0,E,v)
b=v;
[L,U,p,q,D]=lu((A-s0*E).','vector');
b=D(:,p)\b;
c=L\b;
a=U\c;
a(q,:)=a;
x=E.'*a;
end