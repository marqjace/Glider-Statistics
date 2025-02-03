%jltime = [1.00000  60.46869213 320.89725694];
%yr=5;
%Jtime = [1.00000  60.46869213 320.89725694];
%TT=numbtotm ( Jtime, 4 );
%/***************************************************************************************/
function Time = numbtotm ( jltime, yr )
%/***************************************************************************************/
    days(1:13)=[0.,31.,59.,90.,120.,151.,181.,212.,243.,273.,304.,334.,365.];
    days1 = days+1;
    leap = 0;
    Time=[];

    %double xjday, xjtime, work;
    % int i, month, day, hour, min, sec, leap=0, Len;

    xjday  = floor( jltime );
    xjtime = jltime - xjday;

    %*********** TIME *****************
    work = xjtime * 24.;
    hour = floor( work );
    work = (work - hour) * 60.;
    min  = floor( work );
    work = (work - min) * 60.;
    sec  = floor( work );
    work = work - sec;
    if(work >= 0.5) 
        sec=sec+1;
    end
    if(sec == 60 ) 
        sec = 0; min = min + 1;
    end
    if(min == 60 ) 
        min = 0; hour = hour + 1;
    end

    %/*********** DATE *****************/
     if( mod( yr , 4. ) == 0 )
         leap = 1;
     end

     if(  leap == 1 )
         for k=1:length(xjday)
            if( xjday(k) > days(2))
                month(k) = max(find(xjday(k) > days+1 ));
            else
                month(k) = max(find(xjday(k) > days ));
            end
         end
     else
         for k=1:length(xjday)
             month(k) = max(find(xjday(k) > days ));
         end
     end

%     Time=cell(length(xjday),1);
     Time(1:length(xjday),1:6)=NaN;
     for k=1:length(xjday)
       if( (leap == 1) && (month(k) > 2) )
          day(k) = (xjday(k) - (days(month(k)) + 1.));
       else
          day(k) = (xjday(k) - days(month(k)));
       end
%       dt = sprintf('%02d%02d%02d%02d%02d%02d', yr, month(k), day(k), hour(k), min(k), sec(k));
%       Time(k)= cellstr(dt);
       Time(k,1)= yr; Time(k,2)=month(k); Time(k,3)=day(k); Time(k,4)=hour(k); Time(k,5)=min(k); Time(k,6)=sec(k);
     end
end
