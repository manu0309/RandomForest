global predVal;
filename = 'sonar.test-data.csv';
fid = fopen(filename,'r');
num = 61;
A = textscan(fid,[repmat('%f',1,num),'%s'],'delimiter',',');
A = A(2:end);
D = {};
for k=1:length(A{1})
  countR = 0;
  countM = 0;
  fprintf('For sample %d\n',k);
  for i=1:num
    D{i} = A{i}(k);
    %E{i} = C{i}(k);
  endfor  
  for j=1:25
    classify(D,tree{j});
    if strcmp(predVal,'M')
      countM  = countM+1;
    else
      countR = countR+1;
    endif
    %classify(E,tree(j));  
  endfor
  if countM>countR
    fprintf('\tPredicted Value: M with count %d\n',countM);
    fprintf('\tActual value is: %s\n',D{num}{});
  else
    fprintf('\tPredicted Value: R with count %d\n',countR);
    fprintf('\tActual value is: %s\n',D{num}{});
  endif
endfor
