function retval = info_gain (left,right,current_uncertainity,labels)
  p = length(left{1})/(length(left{1})+length(right{1}));
  retval = current_uncertainity - p*gini(left,labels) - (1-p)*gini(right,labels);
endfunction
