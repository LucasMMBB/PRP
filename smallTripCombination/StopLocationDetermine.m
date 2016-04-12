clear;clc;
Input=xlsread('fuck you');
StopGPSlat=Input(:,1);
StopGPSlon=Input(:,2);
StopTime=Input(:,3);
lat=StopGPSlat;
lon=StopGPSlon;
plot(lon,lat,'.r','MarkerSize',10);
plot_google_map('MapType','roadmap');
