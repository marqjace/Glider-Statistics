clearvars
cd C:\Users\marqjace\glider_real_time_processed_data\tmp\2023

date_base = datenum(1970, 1, 1, 0, 0, 0); % 1970-01-01 00:00:00

% Set the Date/Time where to split the mat file
DT = '2023-12-01 00:00:00';

TMsec=(datenum(DT)-date_base)*24*3600;

Matfile='NH_202305241821_osu592';

d=load([Matfile '.mat']);
%%
ind=find( d.Timeinsec < TMsec);

disp([num2str(ind(1)) ':' num2str(ind(end))]);
%%
Timeinsec                =   d.Timeinsec(ind(1):ind(end));
Julday                   =   d.Julday(ind(1):ind(end));
Lat                      =   d.Lat(ind(1):ind(end));
Lon                      =   d.Lon(ind(1):ind(end));
Press                    =   d.Press(ind(1):ind(end));
Depth                    =   d.Depth(ind(1):ind(end));
Temp                     =   d.Temp(ind(1):ind(end));
BackScatter              =   d.BackScatter(ind(1):ind(end));
Chlor                    =   d.Chlor(ind(1):ind(end));
Cdom                     =   d.Cdom(ind(1):ind(end));
Oxygen                   =   d.Oxygen(ind(1):ind(end));
Roll                     =   d.Roll(ind(1):ind(end));
Pitch                    =   d.Pitch(ind(1):ind(end));
Bottom_depth             =   d.Bottom_depth(ind(1):ind(end));
Altitude                 =   d.Altitude(ind(1):ind(end));
Battery                  =   d.Battery(ind(1):ind(end));
Battpos                  =   d.Battpos(ind(1):ind(end));
Conduct                  =   d.Conduct(ind(1):ind(end));
Leak_voltage             =   d.Leak_voltage(ind(1):ind(end));
Leak_voltage_forward     =   d.Leak_voltage_forward(ind(1):ind(end));
Vacuum                   =   d.Vacuum(ind(1):ind(end));

Cur_Time = datevec(datestr(Timeinsec/3600/24+date_base));

mfile_a = [Matfile '_a.mat'];

eval(['save ' mfile_a ' Timeinsec Julday Lat Lon Press Depth Temp BackScatter Chlor Cdom Oxygen Roll Pitch ' ...
    'Bottom_depth Altitude Battery Battpos Conduct Leak_voltage Leak_voltage_forward Vacuum Cur_Time;']);

clear ind Timeinsec Julday Lat Lon Press Depth Temp BackScatter Chlor Cdom Oxygen Roll Pitch Bottom_depth Altitude Battery Battpos Conduct Leak_voltage Leak_voltage_forward Vacuum Cur_Time
%%
ind=find( d.Timeinsec >= TMsec);

disp([num2str(ind(1)) ':' num2str(ind(end))]);
%%
Timeinsec                =   d.Timeinsec(ind(1):ind(end));
Julday                   =   d.Julday(ind(1):ind(end));
Lat                      =   d.Lat(ind(1):ind(end));
Lon                      =   d.Lon(ind(1):ind(end));
Press                    =   d.Press(ind(1):ind(end));
Depth                    =   d.Depth(ind(1):ind(end));
Temp                     =   d.Temp(ind(1):ind(end));
BackScatter              =   d.BackScatter(ind(1):ind(end));
Chlor                    =   d.Chlor(ind(1):ind(end));
Cdom                     =   d.Cdom(ind(1):ind(end));
Oxygen                   =   d.Oxygen(ind(1):ind(end));
Roll                     =   d.Roll(ind(1):ind(end));
Pitch                    =   d.Pitch(ind(1):ind(end));
Bottom_depth             =   d.Bottom_depth(ind(1):ind(end));
Altitude                 =   d.Altitude(ind(1):ind(end));
Battery                  =   d.Battery(ind(1):ind(end));
Battpos                  =   d.Battpos(ind(1):ind(end));
Conduct                  =   d.Conduct(ind(1):ind(end));
Leak_voltage             =   d.Leak_voltage(ind(1):ind(end));
Leak_voltage_forward     =   d.Leak_voltage_forward(ind(1):ind(end));
Vacuum                   =   d.Vacuum(ind(1):ind(end));

Cur_Time = datevec(datestr(Timeinsec/3600/24+date_base));

mfile_b = [Matfile '_b.mat'];

eval(['save ' mfile_b ' Timeinsec Julday Lat Lon Press Depth Temp BackScatter Chlor Cdom Oxygen Roll Pitch ' ...
    'Bottom_depth Altitude Battery Battpos Conduct Leak_voltage Leak_voltage_forward Vacuum Cur_Time;']);

