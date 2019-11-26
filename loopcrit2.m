goal_min = 2;
goal_max = 2;
goal_saddle = 1;
for a = 2:4
    for b = 2:4
        for c = 2:4
            for d = 2:5
                [num_crits,num_imaginary,num_lmax,num_lmin,num_saddle]= find_crit(a,b,c,d,1,-1,1,0);
                [num_crits,num_imaginary,num_lmax,num_lmin,num_saddle]= find_crit(a,b,c,d,-1,1,-1,0);
            end
        end
    end
end