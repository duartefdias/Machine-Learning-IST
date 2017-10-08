function out = feature_map( x, P )
%FEATURE_MAP 
    
    %Fills first column with 1's
    out = ones(size(x(:,1)));
    
    %Fills consecutive columns with x power to an increasing degree
    for i = 1:P
        out(:,i+1) = x.^i;
    end
end

