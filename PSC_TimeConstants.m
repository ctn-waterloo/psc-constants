function PSC_tau_figure()

home

cols = 14;
fid = fopen('data.txt');
header = textscan(fid, '%s', cols, 'delimiter','\t');
data = textscan(fid, '%s %f %f %f %f %f %f %f %f %f %d %s %s %d', 'delimiter','\t');
fclose(fid);
rows = length(data{1});
RECEPTOR = 1;
T_RISE = 2; STDEV_T_RISE = 3; IF_10_TO_90 = 4;
W_FAST = 5; TAU_FAST = 6; STDEV_TAU_FAST = 7;
W_SLOW = 8; TAU_SLOW = 9; STDEV_TAU_SLOW = 10; TAU_IS_RANGE = 11;
NOTES = 12; AUTHOR = 13; YEAR = 14;

rec_i = ones(rows,1);
src_i = ones(rows,1);
for i = 1:rows
    if i>1 && ~strcmp(data{RECEPTOR}{[i-1, i]})
        rec_i(i) = max(rec_i)+1;
    else
        rec_i(i) = max(rec_i);
    end
    if i>1 && (~strcmp(data{AUTHOR}{[i-1, i]}) || data{YEAR}(i-1)~=data{YEAR}(i))
        src_i(i) = max(src_i)+1;
        src_i(i) = src_i(find(strcmp(data{AUTHOR}{i},data{AUTHOR}) & data{YEAR}(i)==data{YEAR},1,'first'));
    else
        src_i(i) = max(src_i);
    end
end
ReceptorNames = cell(max(rec_i),1);
for i = 1:max(rec_i)
    ReceptorNames{i} = data{RECEPTOR}{find(rec_i==i,1)};
end
for i = length(ReceptorNames):-1:1
    first_instance = find(strcmp(ReceptorNames,ReceptorNames{i}),1,'first');
    if i ~= first_instance
        ReceptorNames(i) = [];
        rec_i(rec_i==i) = first_instance;
    end
end
column_labels = {
    'Rise<br/>(20-80% t<sub>rise</sub> (ms) unless noted)'
    'Decay<br/>(&tau; (ms) unless noted)'
    'Neuron details'
    'Source'};
fid = fopen('table.txt','w');
fprintf(fid,'<table><thead>\n');
fprintf(fid,'<tr>');
for i = 1:length(column_labels)
    if i==2
        fprintf(fid,'<th style="width: 12em;">%s</th>',column_labels{i});
    else
        fprintf(fid,'<th>%s</th>',column_labels{i});
    end
end
fprintf(fid,'\n</thead>\n');
for i = 1:max(rec_i)
    fprintf(fid,'<tbody>\n');
    fprintf(fid,'<tr><th colspan="4">%s</th></tr>\n',ReceptorNames{i});    

    for k = 1:max(src_i)
        print_source_cell = true;
        for j = find(rec_i==i & src_i==k)'
            % Rise time cell
            if isnan(data{T_RISE}(j)) || isnan(data{STDEV_T_RISE}(j))
                rise = '';
            elseif data{IF_10_TO_90}(j)==1
                rise = sprintf('%g &plusmn; %g <a href="#rise_time_note">*</a>',data{T_RISE}(j),data{STDEV_T_RISE}(j));
            else
                rise = sprintf('%g &plusmn; %g',data{T_RISE}(j),data{STDEV_T_RISE}(j));
            end
            % Decay cell
            if isnan(data{STDEV_TAU_FAST}(j))
                fast = sprintf('%g',data{TAU_FAST}(j));
            else
                fast = sprintf('%g &plusmn; %g',data{TAU_FAST}(j),data{STDEV_TAU_FAST}(j));
            end
            if isnan(data{STDEV_TAU_SLOW}(j))
                slow = sprintf('%g',data{TAU_SLOW}(j));
            else
                slow = sprintf('%g &plusmn; %g',data{TAU_SLOW}(j),data{STDEV_TAU_SLOW}(j));
            end
            if data{TAU_IS_RANGE}(j)==1
                decay = sprintf('%s to %s',fast,slow);
            elseif isnan(data{TAU_SLOW}(j))
                decay = fast;
            else
                decay = sprintf('(%g) %s<br/>(%g) %s',data{W_FAST}(j),fast,data{W_SLOW}(j),slow);
            end
            % Notes cell
            notes = data{NOTES}{j};
            if notes(1)=='"'; notes(1)=[]; end
            if notes(end)=='"'; notes(end)=[]; end
            % Source cell
            if print_source_cell
                source = sprintf('<td rowspan="%d"><a href="#%s%d">%s et al., %d</a></td>',numel(find(rec_i==i & src_i==k)),data{AUTHOR}{j},data{YEAR}(j),data{AUTHOR}{j},data{YEAR}(j));
                print_source_cell = false;
            else
                source = '';
            end
            fprintf(fid,'\t<tr><td>%s</td> <td>%s</td> <td>%s</td> %s</tr>\n', ...
                rise, ...
                decay, ...
                notes, ...
                source);
        end
    end
    fprintf(fid,'</tbody>\n');
end
fprintf(fid,'</table>\n');
fprintf(fid,'<span id="rise_time_note">* 10-90%% rise time</span>');
fclose(fid);

for i = 1:rows
    if data{TAU_IS_RANGE}(i)
        tau_min(i) = data{TAU_FAST}(i);
        tau_max(i) = data{TAU_SLOW}(i);
        tau(i) = mean([tau_min(i),tau_max(i)]);
    else
        if isnan(data{TAU_SLOW}(j))
            tau(i) = data{TAU_FAST}(i);
            tau_stdev(i) = data{STDEV_TAU_FAST}(i);
        else
            tau(i) = data{TAU_FAST}(i)^data{W_FAST}(i)*data{TAU_SLOW}(i)^data{W_SLOW}(i);
            tau_stdev(i) = data{STDEV_TAU_FAST}(i)^data{W_FAST}(i)*data{STDEV_TAU_SLOW}(i)^data{W_SLOW}(i);
        end
        tau_min(i) = tau(i)-tau_stdev(i);
        tau_max(i) = tau(i)+tau_stdev(i);
    end
end

figure(1)
plot(tau_min,rec_i,'<','MarkerEdgeColor',[.4 .5 .8],'MarkerFaceColor',[.4 .5 .8])
hold on
plot(tau_max,rec_i,'>','MarkerEdgeColor',[.4 .5 .8],'MarkerFaceColor',[.4 .5 .8])
plot(tau,rec_i,'.','MarkerSize',18,'MarkerEdgeColor',[0 0 .5],'MarkerFaceColor',[0 0 .5])

title('Decay time constants of PSCs')

set(gca,'YTick',1:max(rec_i),'YTickLabel',ReceptorNames,'YLim',[min(rec_i)-1 max(rec_i)+1],'YGrid','on')

set(gca,'XScale','log','XGrid','on','XMinorGrid','on')
xlabel('\tau_{decay} (ms)')

set(gcf,'PaperUnits','inches','PaperPositionMode','manual','PaperPosition',[0 0 7 3])
print('-f1', '-dpng','-r100','decay.png')

figure(2)
plot(data{T_RISE}-data{STDEV_T_RISE},rec_i,'<','MarkerEdgeColor',[.4 .5 .8],'MarkerFaceColor',[.4 .5 .8])
hold on
plot(data{T_RISE}+data{STDEV_T_RISE},rec_i,'>','MarkerEdgeColor',[.4 .5 .8],'MarkerFaceColor',[.4 .5 .8])
plot(data{T_RISE},rec_i,'.','MarkerSize',18,'MarkerEdgeColor',[0 0 .5],'MarkerFaceColor',[0 0 .5])

title('Rise times of PSCs')

set(gca,'YTick',1:max(rec_i),'YTickLabel',ReceptorNames,'YLim',[min(rec_i)-1 max(rec_i)+1],'YGrid','on')

set(gca,'XScale','log','XGrid','on','XMinorGrid','on')
xLabel('t_{rise} (ms)')

set(gcf,'PaperUnits','inches','PaperPositionMode','manual','PaperPosition',[0 0 7 3])
print('-f2', '-dpng','-r100','rise.png')