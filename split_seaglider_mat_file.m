clearvars
cd C:\Users\marqjace\glider_real_time_processed_data\tmp\2024

date_base = datenum(1970, 1, 1, 0, 0, 0); % 1970-01-01 00:00:00

% Set the Date/Time where to split the mat file
DT = '2024-7-1 00:00:00'; % 2023-12-01 00:00:00

TMsec=(datenum(DT)-date_base)*24*3600;

Matfile='SG686_20240412182611';

d=load([Matfile '.mat']);
%%
ind=find( d.Timeinsec < TMsec);
ind_dive=find( d.Timeinsec_dive < TMsec);

disp([num2str(ind(1)) ':' num2str(ind(end))]);
disp([num2str(ind_dive(1)) ':' num2str(ind_dive(end))]);
%%
Timeinsec	=	 d.Timeinsec(ind(1):ind(end));
Lat         =    d.Lat(ind(1):ind(end));
Lon         =    d.Lon(ind(1):ind(end));
Press       =    d.Press(ind(1):ind(end));
Depth       =    d.Depth(ind(1):ind(end));
Temp        =    d.Temp(ind(1):ind(end));
Salt        =    d.Salt(ind(1):ind(end));
SigT        =    d.SigT(ind(1):ind(end));
BackScat	=	 d.BackScat(ind(1):ind(end));
Chlor       =    d.Chlor(ind(1):ind(end));
Cdom        =    d.Cdom(ind(1):ind(end));
Oxygen_opt	=	 d.Oxygen_opt(ind(1):ind(end));
Heading     =    d.Heading(ind(1):ind(end));
Roll        =    d.Roll(ind(1):ind(end));
Pitch       =    d.Pitch(ind(1):ind(end));

Bottom_depth	=	  d.Bottom_depth(ind_dive(1):ind_dive(end));
TM_Bottom_depth	=	  d.TM_Bottom_depth(ind_dive(1):ind_dive(end));
U_aver_dive     =	  d.U_aver_dive(ind_dive(1):ind_dive(end));
U_dir_dive      =	  d.U_dir_dive(ind_dive(1):ind_dive(end));
Lat_dive        =	  d.Lat_dive(ind_dive(1):ind_dive(end));
Lon_dive        =	  d.Lon_dive(ind_dive(1):ind_dive(end));
Timeinsec_dive	=	  d.Timeinsec_dive(ind_dive(1):ind_dive(end));
Humid_dive      =	  d.Humid_dive(ind_dive(1):ind_dive(end));
Int_pres_dive	=	  d.Int_pres_dive(ind_dive(1):ind_dive(end));
High_V_dive     =	  d.High_V_dive(ind_dive(1):ind_dive(end));
Low_V_dive      =	  d.Low_V_dive(ind_dive(1):ind_dive(end));
Dive_No         =     d.Dive_No(ind_dive(1):ind_dive(end));

mfile_a = [Matfile '_a.mat'];

eval(['save ' mfile_a ' Timeinsec Lat Lon Press Depth Temp Salt SigT BackScat Chlor Cdom Oxygen_opt Heading Roll Pitch' ...
    ' Bottom_depth TM_Bottom_depth U_aver_dive U_dir_dive Lat_dive Lon_dive Timeinsec_dive Humid_dive' ...
    ' Int_pres_dive High_V_dive Low_V_dive Dive_No;']);

clear ind ind_dive Timeinsec Lat Lon Press Depth Temp Salt SigT BackScat Chlor Cdom Oxygen_opt Heading Roll Pitch Bottom_depth TM_Bottom_depth U_aver_dive U_dir_dive Lat_dive Lon_dive Timeinsec_dive Humid_dive Int_pres_dive High_V_dive Low_V_dive Dive_No
%%
ind=find( d.Timeinsec >= TMsec);
ind_dive=find( d.Timeinsec_dive >= TMsec);

disp([num2str(ind(1)) ':' num2str(ind(end))]);
disp([num2str(ind_dive(1)) ':' num2str(ind_dive(end))]);
%%
Timeinsec	=	 d.Timeinsec(ind(1):ind(end));
Lat         =    d.Lat(ind(1):ind(end));
Lon         =    d.Lon(ind(1):ind(end));
Press       =    d.Press(ind(1):ind(end));
Depth       =    d.Depth(ind(1):ind(end));
Temp        =    d.Temp(ind(1):ind(end));
Salt        =    d.Salt(ind(1):ind(end));
SigT        =    d.SigT(ind(1):ind(end));
BackScat	=	 d.BackScat(ind(1):ind(end));
Chlor       =    d.Chlor(ind(1):ind(end));
Cdom        =    d.Cdom(ind(1):ind(end));
Oxygen_opt	=	 d.Oxygen_opt(ind(1):ind(end));
Heading     =    d.Heading(ind(1):ind(end));
Roll        =    d.Roll(ind(1):ind(end));
Pitch       =    d.Pitch(ind(1):ind(end));

Bottom_depth	=	  d.Bottom_depth(ind_dive(1):ind_dive(end));
TM_Bottom_depth	=	  d.TM_Bottom_depth(ind_dive(1):ind_dive(end));
U_aver_dive     =	  d.U_aver_dive(ind_dive(1):ind_dive(end));
U_dir_dive      =	  d.U_dir_dive(ind_dive(1):ind_dive(end));
Lat_dive        =	  d.Lat_dive(ind_dive(1):ind_dive(end));
Lon_dive        =	  d.Lon_dive(ind_dive(1):ind_dive(end));
Timeinsec_dive	=	  d.Timeinsec_dive(ind_dive(1):ind_dive(end));
Humid_dive      =	  d.Humid_dive(ind_dive(1):ind_dive(end));
Int_pres_dive	=	  d.Int_pres_dive(ind_dive(1):ind_dive(end));
High_V_dive     =	  d.High_V_dive(ind_dive(1):ind_dive(end));
Low_V_dive      =	  d.Low_V_dive(ind_dive(1):ind_dive(end));
Dive_No         =     d.Dive_No(ind_dive(1):ind_dive(end));

mfile_b = [Matfile '_b.mat'];

eval(['save ' mfile_b ' Timeinsec Lat Lon Press Depth Temp Salt SigT BackScat Chlor Cdom Oxygen_opt Heading Roll Pitch' ...
    ' Bottom_depth TM_Bottom_depth U_aver_dive U_dir_dive Lat_dive Lon_dive Timeinsec_dive Humid_dive' ...
    ' Int_pres_dive High_V_dive Low_V_dive Dive_No;']);
