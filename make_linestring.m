function linestring = make_linestring(vector)

% Dimiourgia Linsestrig tis morfhs ('1 00001 , 2 0002 ,..., 8 00008')
% Apo vector ('0001,0002,0003,...,0009')
str=[];
for i=1:length(vector)
str=[str,num2str(i),' ' ,num2str(vector(i)),','];
end
linestring=str(1:length(str)-1);


end

 