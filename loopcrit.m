goal_min = 2;
goal_max = 2;
goal_saddle = 1;
for a = 2:5
    for b = 0:3
        for c = 0:3
            for d = 2:5
                if a <= d
                    for f = -1:1
                        for g = -1:1
                            for h = 1:1
                                if not(and(eq(f,0),and(eq(g,0),eq(h,0))))
                                    [num_crits,num_imaginary,num_lmax,num_lmin,num_saddle] = find_crit(a,b,c,d,f,g,h,0);
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end