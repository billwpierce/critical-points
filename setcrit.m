syms x y
a = 4;
b = 3;
c = 2;
d = 4;
f = -1;
g = 0;
h = 1;
l = 0;
temp_a = f*x^a;
temp_d = h*y^d;
% f_all = f*x^a + g*x^b*y^c+h*y^d+1*l;
if a > 2
    if a == 5
        temp_a = f*(x^a-x^3+.2*x);
    else
        temp_a = f*(x^a-x^2);
    end
end
if d > 2
    if d == 5
        temp_d = h*(y^d-y^3+.2*y);
    else
        temp_d = h*(y^d-y^2);
    end
end
f_all = temp_a + g*x^b*y^c + temp_d+1*l;
f_eq = eval(f_all);
f_x = diff(f_eq,'x');
f_y = diff(f_eq,'y');
f_xx = diff(f_x, 'x');
f_yy = diff(f_y, 'y');
f_xy = diff(f_x, 'y');
D = f_xx*f_yy-(f_xy)^2;
eqn_crit_x =  f_x == 0;
eqn_crit_y =  f_y == 0;
eqns_crit = [eqn_crit_x eqn_crit_y];
crit_points = solve(eqns_crit, [x y], 'MaxDegree', 4);
cp_raw = size(crit_points.x);
num_crits = cp_raw(1);
num_saddle = 0;
num_lmax = 0;
num_lmin = 0;
num_unknown = 0;
num_imaginary = 0;
num_zs = 0;
for i = 1:num_crits
    try
        x = crit_points.x(i);
        y = crit_points.y(i);
        if or(not(isreal(x)),not(isreal(y)))
            num_imaginary = num_imaginary + 1;
        else
            deter = subs(D);
            if deter < 0
                num_saddle = num_saddle + 1;
            elseif deter > 0
                sderiv = subs(f_xx);
                if sderiv < 0
                    num_lmax = num_lmax + 1;
                elseif sderiv > 0
                    num_lmin = num_lmin + 1;
                end
            elseif eq(deter,0)
                num_unknown = num_unknown + 1;
            end
        end
    catch
        num_zs = num_zs + 1;
    end
end
to_write = [a b c d f g h l num_crits num_imaginary num_lmax num_lmin num_saddle num_unknown num_zs];
dlmwrite('trial.csv',to_write,'delimiter',',','-append');
% out2 = solve(eqn_crit_y);