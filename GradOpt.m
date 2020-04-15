function [v,steps] = GradOpt(f,v0,n,m,tol,type)
%GRADESC Summary of this function goes here
%   Detailed explanation goes here
v = v0;
gf = gradient(f);
tol = 10^-tol;

gfvStr = "gf(";
for i = 1:length(v0)
    gfvStr = gfvStr + "v(" + i +")";
    if (i~=length(v0))
        gfvStr = gfvStr + ",";
    end
end
gfvStr = gfvStr + ")";
gfv = eval(gfvStr);
steps = v;

if (type == "Ascent")
    while any(abs(vpa(gfv)) > tol)
    
        gfvStr = "gf(";
        for i = 1:length(v0)
            gfvStr = gfvStr + "v(" + i +")";
            if (i~=length(v0))
                gfvStr = gfvStr + ",";
            end
        end
        gfvStr = gfvStr + ")";
        gfv = eval(gfvStr);
    
    
        if(size(steps,2) > 1)
            
            v = v + n*vpa(gfv) + m*(steps(:,end) - steps(:,end-1));
            
        else
            v = v + n*vpa(gfv); 
        end
    
        steps = [steps v];
    end
    
elseif (type == "Descent")
    
    while any(abs(vpa(gfv)) > tol)
    
    gfvStr = "gf(";
    for i = 1:length(v0)
        gfvStr = gfvStr + "v(" + i +")";
        if (i~=length(v0))
            gfvStr = gfvStr + ",";
        end
    end
    gfvStr = gfvStr + ")";
    gfv = eval(gfvStr);
    
    
    if(size(steps,2) > 1)
        v = v - n*vpa(gfv) + m*(steps(:,end) - steps(:,end-1));
    else
        v = v - n*vpa(gfv); 
    end
    
    steps = [steps v];
    end
else
   error("Type setting is not valid") 
end

end

