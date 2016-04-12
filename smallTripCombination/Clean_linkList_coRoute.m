function [t_coRoute, t_TMCnames, t_linkList] = Clean_linkList_coRoute(coRoute,TMCnames,linkList)
% O_coRoute, O_TMCnames, O_linkList
temp_links = cell2mat(linkList(:,1));
temp_coRoute = (coRoute(:,9));
[common,~,~] = intersect(temp_links,temp_coRoute,'stable');
t_coRoute = [];
t_TMCnames = [];
t_linkList = [];
for i =1:1:length(common)
    idx_links = find(temp_links==common(i));
    idx_coRoute = find(temp_coRoute==common(i));
    t_coRoute = [t_coRoute;coRoute( idx_coRoute,:)];
     t_TMCnames = [t_TMCnames;TMCnames(idx_links ,:)];
   t_linkList = [t_linkList;linkList(idx_links,:)];
end