filename = 'sonar.all-data.csv';
fid = fopen(filename,'r');
num = 61;
B = textscan(fid,[repmat('%f',1,num),'%s'],'delimiter',',');
numForest = 25;
numData = length(B{1});
D = {};
tree={}; 
for i=1:numForest
  index = randperm(numData,10);
  binMat = logical(sum((B{1}==index)'));
  B_split = {};
  for j=2:num+1
    colf = B{j};
    temp = {colf(binMat)};
    B_split = {B_split{},temp{1}}; 
  endfor
  D{i} = B_split;  
  labels = intersect(D{i}{num},D{i}{num});  
  fprintf('Iteration for tree %d\n',i);  
  tree = {tree{} build_tree(D{i},labels)};
endfor
fclose(fid);

