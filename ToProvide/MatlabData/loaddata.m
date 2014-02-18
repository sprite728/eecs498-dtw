close all;
clear;

type = cell(5,1);
type{1} = 'hnr';
type{2} = 'pitch';
type{3} = 'intensity';
type{4} = 'mfcc';
type{5} = 'mfb';

digit = cell(10,1);
digit{1} = 'one';
digit{2} = 'two';
digit{3} = 'three';
digit{4} = 'four';
digit{5} = 'five';
digit{6} = 'six';
digit{7} = 'seven';
digit{8} = 'eight';
digit{9} = 'nine';
digit{10} = 'ten';

% hnr first
hnr = cell(60,1);
pitch = cell(60,1);
mfb = cell(60,1);
mfcc = cell(60,1);
intensity = cell(60,1);
count = 0;

for j = 1 : 10
    for k = 1 : 6
        count = count + 1;
        if k == 6
            hnr{count} = load (['../Features/testing/' digit{j} num2str(k) '.hnr']);
            pitch{count} = load (['../Features/testing/' digit{j} num2str(k) '.pitch']);
            intensity{count} = load (['../Features/testing/' digit{j} num2str(k) '.intensity']);
            mfb{count} = load (['../Features/testing/' digit{j} num2str(k) '.mfb']);
            mfcc{count} = load (['../Features/testing/' digit{j} num2str(k) '.mfcc']);
            label{count} = digit{j};
        else
            hnr{count} = load (['../Features/training/' digit{j} num2str(k) '.hnr']);
            pitch{count} = load (['../Features/training/' digit{j} num2str(k) '.pitch']);
            intensity{count} = load (['../Features/training/' digit{j} num2str(k) '.intensity']);
            mfb{count} = load (['../Features/training/' digit{j} num2str(k) '.mfb']);
            mfcc{count} = load (['../Features/training/' digit{j} num2str(k) '.mfcc']);
            label{count} = digit{j};
        end
    end
end

% for j = 1 : 10
%    for k = 1 : 5
%        count = count + 1;
%        hnr{count} = load (['../Features/testing/' digit{j} num2str(k) '.hnr']);
%        pitch{count} = load (['../Features/testing/' digit{j} num2str(k) '.pitch']);
%        intensity{count} = load (['../Features/testing/' digit{j} num2str(k) '.intensity']);
%        mfb{count} = load (['../Features/testing/' digit{j} num2str(k) '.mfb']);
%        mfcc{count} = load (['../Features/testing/' digit{j} num2str(k) '.mfcc']);
%        label{count} = digit{j};
%    end
% end

inds = 6 : 6 : 60; % index of testing data
testing = struct();
training = struct();

testing.hnr = hnr(inds);
training.hnr = hnr(setdiff(1:60, inds));

testing.pitch = pitch(inds);
training.pitch = pitch(setdiff(1:60, inds));

testing.intensity = intensity(inds);
training.intensity = intensity(setdiff(1:60, inds));

testing.mfb = mfb(inds);
training.mfb = mfb(setdiff(1:60, inds));

testing.mfcc = mfcc(inds);
training.mfcc = mfcc(setdiff(1:60, inds));

testing.label = label(inds);
training.label = label(setdiff(1:60, inds));

save('data.mat', 'training', 'testing');



