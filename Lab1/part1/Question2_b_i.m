% ELEC342 LAB1, Part I Question 2 (b_i_ii)


clc;
clear;

n1 = [ 0 : 1 ]; % first dataset
n2 = [ 0 : 20 ]; % second dataset

fn1 = 'x.^2';
fn2 = '2*x+5.*dirac(k)';

checkLinearity(n1,fn1)
checkLinearity(n2,fn1)
checkTi(n1,fn1)
checkTi(n2,fn1)

checkLinearity(n1,fn2)
checkLinearity(n2,fn2)
checkTi(n1,fn2)
checkTi(n2,fn2)


function linear = checkLinearity(n,fn)
    k = n;
    x1 = n;
    x = x1;
    y1 = eval(fn);
    
    x2 = 2*n;
    x = x2;
    
    y2 = eval(fn);
    
    x3 = x1 + x2;
    x = x3;
    
    y3 = eval(fn);
    
    y4 = y1 + y2;
    
    if ( y3 == y4 )
        disp ('Linear')
    else 
        disp ('Non-Linear')
    end
end

function ti = checkTi(n,fn)
    
    k = n;
    x = k - 2;
    
    y1 = eval(fn);
    
    k = n - 2;
    x = n - 2;
    y2 = eval(fn);
    
    if ( y1 == y2 )
        disp ('Time Invariant')
    else 
        disp ('Time Variant')
    end
end

    
    
    
    

