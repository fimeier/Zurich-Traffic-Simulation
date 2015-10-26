function v = hang_behind( v_n, rho )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

t=rand;
if t<rho
    v=max(v_n-1,0);
else
    v=v_n;
end

end

