function retval = print_tree (tree,spacing=".")
    
    if isfield(tree,'question')==0
      pred = {tree.predictions};
      a = intersect(pred{length(pred)},pred{length(pred)});
      fprintf(strcat(spacing,"Predict: %s\n"),a{1});
      return;      
    endif
      
    quest = tree.question;  
    fprintf(strcat(spacing,"feature %d >=%f\n"),quest(1),quest(2));
    
    fprintf(strcat(spacing, "-->True"));
    print_tree(tree.tb,strcat(spacing,"."));
    
    fprintf(strcat(spacing,"-->False"));
    print_tree(tree.fb,strcat(spacing,"."));
    
endfunction
