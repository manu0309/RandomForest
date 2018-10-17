function retval = classify (rows,tree)
   global predVal;
   if isfield(tree,'question')==0
    pred = {tree.predictions};
    a = intersect(pred{length(pred)},pred{length(pred)});
    predVal = a{1};
   elseif rows{tree.question(1)}>=tree.question(2)
    classify(rows,tree.tb);
   else
    classify(rows,tree.fb);
   endif
endfunction
