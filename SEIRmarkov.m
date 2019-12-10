function [outputArg1,outputArg2] = SEIRmarkov(state,tran,steps)
%SEIRMARKOV Summary of this function goes here
%   Detailed explanation goes here
ten = zeros(4,10);

mat = tran*state;
s=sum(mat);
for i=1:4
    mat(i)= mat(i)/s;    
    ten(i,1) = mat(i); 
end

for i= 2:steps
 mat=tran*mat;
 s=sum(mat);
   for j=1:4
       mat(j)= mat(j)/s;   
       if i<11
          ten(j,i) = mat(j); 
       end
   end

end
outputArg1 = mat;
outputArg2 = ten;
end

