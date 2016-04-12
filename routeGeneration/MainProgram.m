%#########################################################################
%Description: This program is used to generate route information from a
%             recorded trip. Route information includes link and shape 
%             point info
%Author: Xipeng Wang
%Contact: xipengw1990@gmail.com
%Version: 6
%Copyright: University of Michigan Dearborn
%Date: 8/20/2014
%#########################################################################

%% Initial parameters
clear;clc;
folderPath='./tempData';        % The folder path where you store the temp data
DirF = dir(folderPath);         % List all the files and folders (structure)
len=length(DirF);               % Calcluate how many files/folders are there in total

%% Traverse all files in the folder and process each trip file
%When you try more than 1 trip, you need to uncommand 'for loop'.Otherwise,
%i=3 because we need to ignore'./' and '../';
for i=3:len                     % ignore './' and '../';
    %try
    %[filename, pathname, filterindex] = uigetfile('*.mat', 'Pick a MATLAB code file');
    filename = DirF(i).name;
    fprintf(['Processing file:' filename '\n']);
    load([folderPath '\' DirF(i).name]);            % load .mat trip data (structure only contains 'trip')
    log = trip.Location.Longitude;                  % get a list of points' lognitude
    lat = trip.Location.Latitude;                   % get a list of points' latitude
    if(length(log)~=length(lat))                    % ignore the trip data where the size of lognitude is not equal to that of latitude
        continue;
    end
    %%
    desktopPath='C:\Users\pdeng\Desktop\';% Please notify the '\'in the program.
    [coRoute,linkList,TMCnames,indicator,viaPoints] = findRoute(trip,'C:\Users\pdeng\Desktop\');
    %%
    log = trip.Location.Longitude;
    lat = trip.Location.Latitude;
    kmlGen('route', coRoute);
    rdType = ones(size(log));
    speed = zeros(size(log));
    rdType = ones(size(log));
    %speed = double(trip.Movement.GPSSpeed);
    %rdType(speed>45) = 3;
    %rdType(speed<=45) =1;
    tripRoute = [log,lat,speed,rdType];
    kmlGen('trip',tripRoute);
    %%
    h=figure(i);
    %%
    hold on;
    plot(coRoute(:,1),coRoute(:,2),'*r');
    
    plot(tripRoute(:,1),tripRoute(:,2));
    plot(tripRoute(1,1),tripRoute(1,2),'ok');
    plot(viaPoints(:,2),viaPoints(:,1),'*g');
    legend('CoRoute','Recorded Trip');
    xlabel('longitude');
    ylabel('latitude');
    plot_google_map;
    %%
    save(['./saveData/' filename '.mat'],'coRoute','linkList','TMCnames','trip');
    saveas(h,['./saveData/' filename '.fig']);
    %catch me
    %   fprintf([filename 'running occurs problem']);
    %end
    %%
end