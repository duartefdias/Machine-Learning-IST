function [  ] = show_digit( x,i)
digit=x(:,i);
digit=reshape(digit,[5 5]);
digit=imcomplement(rot90(fliplr(digit)));
imagesc(digit);axis off
colormap(gray);
end

