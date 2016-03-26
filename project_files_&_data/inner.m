function [c] = inner(a,b)

c=0;
n=length(a);
for k=1:n
	c=c+a(k)*b(k);
end

end