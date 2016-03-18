function [T]=nonsymlanczos(A,v,c,m,s0,E)
be=norm(v);
ga=norm(c);
vi=v/be;
wi=c/ga;
vn=vi;
wn=wi;
de=wi'*vi;
[n,n]=size(A);
if m>n
    T=zeros(n,n);
end
for k=1:m
    vp=vi;
    wp=wi;
    vi=vn;
    wi=wn;
    dep=de;
    de=wi'*vi;    
    if de==0 
        return;
    end

    %q=A*vi;
    %s=A'*wi;
    %q=hw5p5a(F,G,D,vi);
    %s=hw5p5b(F,G,D,wi);
    q=lusovler(A,s0,E,vi);
    %s=tlusovler(A,s0,E,wi);
    %q=inv(A-s0*E)*E*vi;
    %s= (A\E).'*wi-s0*wi;
    s=E/(A-s0*E)*wi;
    if k>1 
        q=q-(ga*de/dep)*vp;
        s=s-(be*de/dep)*wp;
    end
    al=wi'*q/de;
    eta=ga*de/dep;
    T(k,k)=al;
    q=q-al*vi;
    s=s-al*wi;

    be=norm(q);
    ga=norm(s);
    T(k+1,k)=be;
    T(k,k+1)=eta;
    if (be==0 || ga==0)
        return;
    end
    vn=q/be;
    wn=s/ga;
    den=wn'*vn;
    eta=ga*den/de;
    T(k,k+1)=eta;
end
if m>n
    T=T(1:n,1:n);
else
    T=T(1:m,1:m);
end
end
