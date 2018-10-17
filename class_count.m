function retval = class_count (rows,class)
   counts=zeros(1,length(class));
   %disp(length(rows));
   for i=1:length(class)
     counts(i) = sum(strcmp(class(i),rows{length(rows)}));
   endfor
   retval = counts;
endfunction
