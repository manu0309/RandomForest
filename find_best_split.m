function retval = find_best_split (rows,labels)
  best_gain = 0;
  best_featue=NaN;
  best_value=NaN;
  t_r={};
  f_r={};
  current_uncertainity = gini(rows,labels);
  n_features = length(rows)-1;
  for i=1:n_features
    col = rows{i};
    values = intersect(col,col);
    for j=1:length(values)
      true_rows = {};
      false_rows = {};
      
      for k=1:length(rows)
        colk = rows{k};
        temp1 = {colk(col>=col(j))};
        temp2 = {colk(col<col(j))};
        true_rows = {true_rows{},temp1{1}};
        false_rows ={false_rows{},temp2{1}};
      endfor
      
      if length(true_rows)==0 || length(false_rows)==0
        continue;
      endif
     
      gain = info_gain(true_rows,false_rows,current_uncertainity,labels);
      
      if gain>=best_gain
        best_gain = gain;
        best_feature = i;
        best_value = col(j);
        t_r = true_rows;
        f_r = false_rows;
      endif 
    endfor
  endfor
  retval = {[best_gain best_feature best_value] t_r f_r};
endfunction
