clearvars;

root_dir='C:\Users\marqjace\glider_real_time_processed_data\';

years=[2005;2006;2007;2008;2009;2010;2011;2012;2013;2014;2015;2016;2017;2018;2019;2020;2021;2022;2023];
% years = [2024];

gliders=cell([{'SG686'};{'SG685'};{'SG680'};{'SG679'};{'SG646'};{'SG639'};{'SG608'};{'SG607'};{'SG206'};{'SG205'};{'SG158'};{'SG157'};{'SG130'};{'osu1138'};{'osu592'};{'osu551'};{'june'};{'john'};{'russ'};{'doug'};{'jane'};{'bob'}]);
% gliders=cell([{'SG686'}]);

total_days=0;
total_depl=0;
total_trans=0;
total_updn=0;
total_distance=0;

for y=1:length(years)
    year=years(y);
    eval(['n_days_' num2str(year) '=0;']);
    eval(['n_depl_' num2str(year) '=0;']);
    eval(['n_trans_' num2str(year) '=0;']);
    eval(['n_updn_' num2str(year) '=0;']);
    eval(['distance_' num2str(year) '=0;']);
end
% NH_only='ALL';

for g=1:length(gliders)
    glider=char(gliders(g));
    
    n_days_glider=0;
    n_depl_glider=0;
    n_trans_glider=0;
    n_updn_glider=0;
    distance_glider=0;

    for y=1:length(years)
        year=years(y);


     % select ALL slocum and Seagliders deployed anywere
        eval(['deployments=dir([''' root_dir num2str(year) '\*' glider '*.mat'']);']);
        disp([glider ' - ' num2str(year) ' *************************************************']);
        
        eval(['statistics.' glider '.y' num2str(year) ' = gliderstat_NOAA(root_dir, num2str(year), deployments);']);
        
        clear deployments;
        
        eval(['n_days_glider=n_days_glider+statistics.' glider '.y' num2str(year) '.n_days;']);
        eval(['n_depl_glider=n_depl_glider+statistics.' glider '.y' num2str(year) '.n_depl;']);
        eval(['n_trans_glider=n_trans_glider+statistics.' glider '.y' num2str(year) '.n_trans;']);
        eval(['n_updn_glider=n_updn_glider+statistics.' glider '.y' num2str(year) '.n_updn;']);
        eval(['distance_glider=distance_glider+statistics.' glider '.y' num2str(year) '.distance;']);
    
        eval(['n_days_' num2str(year) '=n_days_' num2str(year) '+statistics.' glider '.y' num2str(year) '.n_days;']);
        eval(['n_depl_' num2str(year) '=n_depl_' num2str(year) '+statistics.' glider '.y' num2str(year) '.n_depl;']);
        eval(['n_trans_' num2str(year) '=n_trans_' num2str(year) '+statistics.' glider '.y' num2str(year) '.n_trans;']);
        eval(['n_updn_' num2str(year) '=n_updn_' num2str(year) '+statistics.' glider '.y' num2str(year) '.n_updn;']);
        eval(['distance_' num2str(year) '=distance_' num2str(year) '+statistics.' glider '.y' num2str(year) '.distance;']);
    end
    
    eval(['statistics.' glider '.total.n_days = n_days_glider;']);
    eval(['statistics.' glider '.total.n_depl = n_depl_glider;']);
    eval(['statistics.' glider '.total.n_trans = n_trans_glider;']);
    eval(['statistics.' glider '.total.n_updn = n_updn_glider;']);
    eval(['statistics.' glider '.total.distance = distance_glider;']);
    
    eval(['total_days=total_days+statistics.' glider '.total.n_days;']);
    eval(['total_depl=total_depl+statistics.' glider '.total.n_depl;']);
    eval(['total_trans=total_trans+statistics.' glider '.total.n_trans;']);
    eval(['total_updn=total_updn+statistics.' glider '.total.n_updn;']);
    eval(['total_distance=total_distance+statistics.' glider '.total.distance;']);
end
    
%%
fprintf('All Gliders cumulative statistics: %d-%d\n', years(1), years(length(years)));
fprintf('        Days at sea : %.0f\n', total_days);
fprintf('        Number of deployments : %.0f\n', total_depl);
fprintf('        Number of crossections: %.0f\n', total_trans);
fprintf('        Number of profiles : %.0f\n', total_updn);
fprintf('        Distance traveled : %.0f km\n', total_distance);

fprintf('==========================================================================================================================================================================================================================\n');
fprintf('     |                        :  ');
for n=1:length(years), fprintf('%d  :  ', years(n)); end 
fprintf('TOTAL\n');
fprintf('==========================================================================================================================================================================================================================\n');


fprintf('     | Days at sea            : ');
for y=1:length(years)
    eval(['n_days = n_days_' num2str(years(y)) ';']);
    if(n_days>0), fprintf('%6.1f : ', n_days); else fprintf('       : '); end
end
fprintf('%.0f\n', total_days);

fprintf('     | Number of deployments  : ');
for y=1:length(years)
    eval(['n_depl = n_depl_' num2str(years(y)) ';']);
    if(n_depl>0), fprintf('%6.0f : ', n_depl); else fprintf('       : '); end
end
fprintf('%.0f\n', total_depl);

fprintf('  ALL| Number of crossections : ');
for y=1:length(years)
    eval(['n_trans = n_trans_' num2str(years(y)) ';']);
    if(n_trans>0), fprintf('%6.0f : ', n_trans); else fprintf('   -   : '); end
end
fprintf('%.0f\n', total_trans);

fprintf('     | Number of profiles     : ');
for y=1:length(years)
    eval(['n_updn = n_updn_' num2str(years(y)) ';']);
    if(n_updn>0), fprintf('%6.0f : ', n_updn); else fprintf('       : '); end
end
fprintf('%.0f\n', total_updn);

fprintf('     | Distance traveled (km) :');
for y=1:length(years)
    eval(['dist = distance_' num2str(years(y)) ';']);
    if(dist>0), fprintf('%7.1f :', dist); else fprintf('        :'); end
end
fprintf('%.0f\n', total_distance);
fprintf('==========================================================================================================================================================================================================================\n');

for g=1:length(gliders)
    fprintf('     | Days at sea            : ');
    for y=1:length(years)
        eval(['n_days = statistics.' char(gliders(g)) '.y' num2str(years(y)) '.n_days;']);
        if(n_days>0), fprintf('%6.1f : ', n_days); else fprintf('       : '); end
    end
    eval(['fprintf(''%6.1f\n'', statistics.' char(gliders(g)) '.total.n_days);']);

    fprintf('     | Number of deployments  : ');
    for y=1:length(years)
        eval(['n_depl = statistics.' char(gliders(g)) '.y' num2str(years(y)) '.n_depl;']);
        if(n_depl>0), fprintf('%6.0f : ', n_depl); else fprintf('       : '); end
    end
    eval(['fprintf(''%6.0f\n'', statistics.' char(gliders(g)) '.total.n_depl);']);

    fprintf('%5s| Number of crossections : ', upper(char(gliders(g))));
    for y=1:length(years)
        eval(['n_trans = statistics.' char(gliders(g)) '.y' num2str(years(y)) '.n_trans;']);
        if(n_trans>0), fprintf('%6.0f : ', n_trans); else fprintf('   -   : '); end
    end
    eval(['fprintf(''%6.0f\n'', statistics.' char(gliders(g)) '.total.n_trans);']);

    fprintf('     | Number of profiles     : ');
    for y=1:length(years)
        eval(['n_updn = statistics.' char(gliders(g)) '.y' num2str(years(y)) '.n_updn;']);
        if(n_updn>0), fprintf('%6.0f : ', n_updn); else fprintf('       : '); end
    end
    eval(['fprintf(''%6.0f\n'', statistics.' char(gliders(g)) '.total.n_updn);']);

    fprintf('     | Distance traveled (km) :');
    for y=1:length(years)
        eval(['dist = statistics.' char(gliders(g)) '.y' num2str(years(y)) '.distance;']);
        if(dist>0), fprintf('%7.1f :', dist); else fprintf('        :'); end
    end
    eval(['fprintf(''%7.1f\n'', statistics.' char(gliders(g)) '.total.distance);']);
    fprintf('==========================================================================================================================================================================================================================\n');
end
