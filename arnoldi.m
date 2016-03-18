function [Q,H] = arnoldi(A,q1,m,s0,E)
n = length(A);
if nargin < 3, m = n; end
q1 = q1/norm(q1);
Q = zeros(n,m); 
Q(:,1) = q1;
H = zeros(m+1,m);
for k=1:m
    %z = A*Q(:,k);
    %z=hw5p5a(F,G,D,Q(:,k));
    z=lusovler(A,s0,E,Q(:,k));
    %z=inv(A-s0*E)*E*Q(:,k);
    for i=1:k
        H(i,k) = Q(:,i)'*z;
        z = z - H(i,k)*Q(:,i);
    end
    if k < n
       H(k+1,k) = norm(z);
       if H(k+1,k) == 0, return, end
       Q(:,k+1) = z/H(k+1,k);
    end
end
if m>n
    H=H(1:n,1:n);
else
    H=H(1:m,1:m);
    Q=Q(1:n,1:m);
end
end