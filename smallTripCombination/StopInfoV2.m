%Description: This program is used for calculating the stop time and stop
%places.You need to put this program where you small trips are
%Author:
%Contact:
%Version:1
%Copyright: University of Michigan Dearborn
%Date: 8/24/2015
%#############################################################################################
clear;clc;
files=dir ('*.mat*'); % 2011 is the mark of files we want to show.
fprintf(['processing : ','\n'])
for a=1:length(files)
fprintf([files(a).name,'\n'])
end
StopTime=[];
StopGPS=[];
STOPtimes=length(files)-1;
for i=1:length(files)-1
    F2=load(files(i+1).name);
    F1=load(files(i).name);
    StopTimeIndex=F2.trip.Location.GPS_Official_Time(1)-F1.trip.Location.GPS_Official_Time(end);
    StopTime(i)=StopTimeIndex*60; % the result unit is minute
    StopGPS_lat=F1.trip.Location.Latitude(end);
    StopGPS_lon=F1.trip.Location.Longitude(end);
    StopGPS(i,1)=StopGPS_lat;
    StopGPS(i,2)=StopGPS_lon;
end
T=table(StopGPS,StopTime')
