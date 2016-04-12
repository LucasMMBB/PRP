function  [origin,destination] = loadfile(numOfCompareLink,i,files)
 load(['C:\ONETT\PRP\programme\combination\data\' files(i).name]);
    [coRoute, TMCnames, linkList] = FinalClean(coRoute,TMCnames,linkList);
    [coRoute, TMCnames, linkList] = Clean_linkList_coRoute(coRoute,TMCnames,linkList);
    origin = cell2mat(linkList(1:numOfCompareLink,1));
    destination = cell2mat(linkList(end-numOfCompareLink+1:end,1));
end