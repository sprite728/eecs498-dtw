%Question 8
%Author: Chuan-Che Huang

% loaddata and dtw.m first
% source('loaddata.m');
% source('dtw.m');

source('cell2csv.m');


mResultDis = struct()

for i = 1:10
    mResultDis.(digit(i)) = cell(50, 2);
end
% fieldnames
% numel: return the number of elements in the object A

for l = 1:10 %reference
    result_dis = cell(50,2); % label, intensity
    count = 0

    for i = 1:10
        for j = 1:5
            dis = struct();
            count = count + 1;
            % fprintf('(%d,%d,%d)...\n', i, j, count);
            
            dis.label = training.label{count};

            
            % dis.intensity = dtw(training.intensity{count}, testing.intensity{l);
            % dis.pitch = dtw(training.pitch{count}, testing.pitch{l});
            % dis.mfb = dtw(training.mfb{count}, testing.mfb{l});
            % dis.hnr = dtw(training.hnr{count}, testing.hnr{l});
            dis.mfcc = dtw(training.mfcc{count}, testing.mfcc{l});

            % dis.sum = dis.pitch + dis.intensity + dis.mfb + dis.hnr + dis.mfcc;
            dis.sum = dis.mfcc;

            % fprintf('%s%d, pitch=%f, intensity=%f, mfb=%f, hnr=%f, mfcc=%f\n', dis.label, j, 
            %     dis.pitch, dis.intensity, dis.mfb, dis.hnr, dis.mfcc);
            result_dis{count,1} = strcat(dis.label, num2str(j));
            result_dis{count,2} = dis.sum;
            % temp_res{j} = dis

        end

        

        % minArray = zeros(4,1)
        % for k = 1: 4
        %     minArray(k) = temp_res{k}.sum
                
        % [m, index] = min(minArray)
        % result_dis_by_digit{i}

        % Debug
        % if i == 1
        %     break;
        % end
    end

    % mResultDis.(digit(l)) = 
    vector2sort = cell2mat(result_dis(:,2));
    [~, idx] = sort(vector2sort);
    mResultDis.(digit(l)) = result_dis(idx, :);

    cell2csv(strcat('q8-output/', digit(l), '.csv'), mResultDis.(digit(l)), ',');
    % Debug
    % if l == 1
    %     break
    % end
end
