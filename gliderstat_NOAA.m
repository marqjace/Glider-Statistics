% Calculates statistics for particular glider for all
% deployments in a given year
function stat=gliderstat_NOAA(root_dir, year, deployments)

%lon_tol=0.1;
lon_tol=0.4;
pres_tol=5;

n_depl=0;
n_trans=0;
n_days=0;
n_updn=0;
dist=0;

for k=1:length(deployments)
    load([root_dir './' num2str(year) '/' deployments(k).name]);
    if(strcmp(num2str(year),'2005') > 0)
        Lat=Lat_raw;
        Lon=Lon_raw;
        Depth=Press_glider;
    end
    ind= ~isnan(Lon);
    mima=get_min_max(Lon(ind),lon_tol);

    disp(deployments(k).name);
    % # of transects
    n_trans=n_trans+length(mima)-1;

    date_base = datenum(1970, 1, 1, 0, 0, 0);
    if(~exist('Timeinsec','var'))
        Timeinsec=(datenum(numbtotm(Julday,str2num(year)))-date_base)*24*3600;
        disp('***************** Timeinsec is calculated ******************');
    end
    cur_time=datevec(Timeinsec/24/3600+date_base);
    disp([num2str(cur_time(1,2)) '/' ...
        num2str(cur_time(1,3)) '/' ...
        num2str(cur_time(1,1)) ' ' ...
        num2str(cur_time(1,4)) ':' ...
        num2str(cur_time(1,5)) ':' ...
        num2str(cur_time(1,6)) ' - ' ...
        num2str(cur_time(length(Timeinsec),2)) '/' ...
        num2str(cur_time(length(Timeinsec),3)) '/' ...
        num2str(cur_time(length(Timeinsec),1)) ' ' ...
        num2str(cur_time(length(Timeinsec),4)) ':' ...
        num2str(cur_time(length(Timeinsec),5)) ':' ...
        num2str(cur_time(length(Timeinsec),6))]);
    %             Julday = tmtonumb_d(cur_time(:,1), cur_time(:,2), cur_time(:,3), cur_time(:,4), cur_time(:,5), cur_time(:,6) );
    % # of days
    n_days=n_days+(Timeinsec(length(Timeinsec))-Timeinsec(1))/24/3600;
    %         else
    %             % # of days
    %             n_days=n_days+(Julday(length(Julday))-Julday(1));
    %             disp([num2str(Julday(1)) '-' num2str(Julday(length(Julday)))]);
    %         end

    % # of profiles
    ip= ~isnan(Depth);
    updn=get_min_max(Depth(ip),pres_tol);
    n_updn=n_updn+(length(updn)-1);

    % distance traveled
    igps=find(~isnan(Lat) & ~isnan(Lon));
    LA=Lat(igps);
    LO=Lon(igps);
    n=length(LA);
    for j=1:n-1
        dist=dist+distance_m([LA(j) LA(j+1)], [LO(j) LO(j+1)])/1000;
    end
    n_depl=n_depl+1;

    clear cur_time Lat Lon Timeinsec Depth ip updn LA LO n mima;
end
stat.n_depl=n_depl;
stat.n_trans=n_trans;
stat.n_days=n_days;
stat.n_updn=n_updn;
stat.distance=dist;
