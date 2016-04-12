function groupfile(flag_O,flag_D,files,source)
parent_dir = ['C:\ONETT\PRP\programme\combination\results'];
new_dir = files(flag_O).name;
[dummy1,dummy2,dummy3] = mkdir(parent_dir,new_dir);
for i=flag_O:1:flag_D
    current= strcat([source,'\',files(i).name]);
    name_path = strcat([parent_dir,'\',new_dir]);
    copyfile(current,name_path);
end
end