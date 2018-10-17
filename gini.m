function retval = gini (rows,labels)
  counts = class_count(rows,labels);
  %disp(counts);
  impurity = 1;
  for i=1:length(counts)
    if(length(rows{1})==0)
      prob = 0;
    else
      prob = counts(i)/length(rows{1});
    endif
    impurity = impurity - prob^2;
  endfor
    retval = impurity;
endfunction
