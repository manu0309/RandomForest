function retval = build_tree (rows,labels)
  
  bestsplit = find_best_split(rows,labels);
  %disp(bestsplit{1});
  
  if(bestsplit{1}(1)==0 )%best gain
    retval = struct('predictions',rows);
    return;
  endif
  
  true_branch = build_tree(bestsplit{2},labels);
  false_branch = build_tree(bestsplit{3},labels);
  retval = struct('question',bestsplit{1}(2:3),'tb',true_branch,'fb',false_branch);
endfunction
