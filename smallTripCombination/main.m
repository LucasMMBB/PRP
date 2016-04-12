%Description: This program is used for combine/group small trips
%Input: link based trips; Location Pool
%Author: Junru Di
%Contact:
%Version:1
%Copyright: University of Michigan Dearborn
%Date: 8/18/2015
%#############################################################################################
%%
clc;
clear all;
close all;

numOfCompareLink = 5; %change here
source = ['C:\ONETT\PRP\programme\combination\data'];
files = dir(source);
load('JKlinkPool&Hotlinks');
len = length(files);
%%
% only consider home to work(O1D2) or work to home(O2D1)
O = 2;
D = 1;
i=3;
flag_O=0;
flag_D=0;
%%
while i<len
    [origin,destination] = loadfile(numOfCompareLink,i,files);
    % if input origin==1
    check_o = intersect(origin,linkPoolcell{O});
    % if input destination==2
    check_d = intersect(destination,linkPoolcell{D});
    if ~isempty(check_o)&&isempty(check_d)      % o=1,d~=2
        flag_O=i;
    elseif isempty(check_o)&&~isempty(check_d)  % o~=1,d=2
        flag_D=i;
    elseif ~isempty(check_o)&&~isempty(check_d) % o=1,d=2
        flag_O=0;
        flag_D=0;
    end
    i=i+1;
    if flag_O>0&&flag_D>flag_O
        day1=files(flag_O).name(14:24);
        day2=files(flag_D).name(14:24);
        if strncmp(day1,day2,11);
            groupfile(flag_O,flag_D,files,source);
        end
        flag_O=0;
        flag_D=0;
    end
end