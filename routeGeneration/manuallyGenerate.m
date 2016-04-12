%%
% cursor infomation variable: cursor_info
len = length(cursor_info);
pointsVector = [];
for i=1:len
    pointsVector = [pointsVector;cursor_info(len-i+1).Position];
end
pointsVector = [pointsVector(1,:);pointsVector(end,:);pointsVector(2:end-1,:)];
pointsVector = [pointsVector(:,2),pointsVector(:,1)];
tempFlag=callADASRP(pointsVector);
desktopPath=['C:\Users\Xipeng1990\Desktop\'];
[coRoute, TMCnames, linkList] = routeXMLparser([desktopPath 'route.xml']);
%%
log = trip.Location.Longitude;
lat = trip.Location.Latitude;
kmlGen('route', coRoute);
rdType = ones(size(log));
speed = zeros(size(log));
tripRoute = [log,lat,speed,rdType];
kmlGen('trip',tripRoute);
%%
h=figure;
%%
hold on;
plot(coRoute(:,1),coRoute(:,2),'*r');
plot(tripRoute(:,1),tripRoute(:,2));
legend('CoRoute','Recorded Trip');
xlabel('longitude');
ylabel('latitude');
plot_google_map;

save(['./saveData/' filename '.mat'],'coRoute','linkList','TMCnames','trip');
saveas(h,['./saveData/' filename]);