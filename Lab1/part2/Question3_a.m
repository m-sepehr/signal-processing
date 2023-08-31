% ELEC342 LAB1, Part II Question 3 (a)


clc;
clear;

n = [-10:10]
fn = 'Sys1(x)'
checkLinearity(n,fn)


function linear = checkLinearity(n,fn)
    k = n;
    x1 = n;
    x = x1;
    y1 = eval(fn)
    
    x2 = 2*n;
    x = x2;
    
    y2 = eval(fn)
    
    x3 = x1 + x2;
    x = x3;
    
    y3 = eval(fn)
    
    y4 = y1 + y2
    
    if ( y3 == y4 )
        disp ('Linear')
    else 
        disp ('Non-Linear')
    end
    
    
    size_y3 = size(y3);
    index_y3 = [-10:size_y3(2)-11];
    stem(index_y3,y3)
    xlabel('x')
    ylabel(' Sys1(x) ')
    

    
end


