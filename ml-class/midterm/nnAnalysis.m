% Machine Learning Class Midterm Project: Titanics
%
% Teacher: J Li
% Name: Rita Tan Shiqin
% DDL: Nov.25,2018 (this Sunday night)

%% Here, I will load and analysis the input csv data. And output the usable matrix X.

%% First, load all the data in the csv file,
%   see how the frequency of each feature related to Survival,
%   see how the features related with each other
%   NOT YET

%% Second, knowing the characteristic of distribution of each feature,
%   I will now load the actual necessary data and process them.

% I will load only 'Pclass','Name(change)','Sex(change)','Age','Sibsp','Parch'.
% Total 6 columns

fid = fopen('train.csv');
C = textscan(fid, '%*f %*f %f %q %s %f %f %f %*s %*f %*s %*s',...
    'HeaderLines',1,'Delimiter',',');
fclose(fid);

% Here is some useful value
numOfExs = size(C{1,1},1);

%% Now process the data('Name', 'Sex', 'Age','Sibsp','Parch') to keep them in strict categories / replace NaN
for i = 1:numOfExs

    %% First, change 'Name' into 'Title'
    % for each name, leave only the 'title part'(with the dot)
    n = char(C{1,2}(i));
    splitName1 = regexp(n, ',', 'split');
    splitName2 = regexp(splitName1{2}, '\s','split');
    title = splitName2{2};

    %change all titles into 'Mr.','Master.','Miss.','Mrs.' (total 4 categories)
    mrChangeList = {'Major.', 'Rev.', 'Col.', 'Capt.','Don.','Jonkheer.'};
    msChangeList = {'Ms', 'Mlle'};
    mrsChangeList = {'Mme', 'Countess'};
    if ismember(title, mrChangeList)
        title = 'Mr.';
    elseif ismember(title, msChangeList)
        title = 'Miss.';
    elseif ismember(title, mrsChangeList)
        title = 'Mrs.';
    elseif isequal(title, 'Dr.')
        if isequal(C{1,3}{i}, 'male')
            title = 'Mr.';
        else
            title = 'Mrs.';
        end
    end

    % change them into numerical values: Mr:1, Master:2, Miss:3, Mrs:4.
    titleType = 0;
    if isequal(title, 'Mr.')
        titleType = 1;
    elseif isequal(title, 'Master.')
        titleType = 2;
    elseif isequal(title, 'Miss.')
        titleType = 3;
    elseif isequal(title,'Mrs.')
        titleType = 4;
    end
    C{1,2}{i} = double(titleType);

    %% Second, change Gender into numerical values.
    % male=1, female=2.
    n = char(C{1,3}(i));
    genderType = 0;
    if isequal(n, 'male')
        genderType = 1;
    elseif isequal(n,'female')
        genderType = 2;
    end
    C{1,3}{i} = double(genderType);

    %% Third, replace Age NaN with average.
    % not yet depending on title.

    n = double(C{1,4}(i)); % I don't know why I should do 'double()'
    title = C{1,2}{i};
    if isnan(n)
        if title == 1
            C{1,4}(i) = 30; % median for Mr.
        elseif title == 2
            C{1,4}(i) = 4;  % mode for Master.
        elseif title == 3
            C{1,4}(i) = 21; % median for Miss.
        else
            C{1,4}(i) = 35; % median for Mrs.
        end
        % do use () not {} for i here, as I am not retrieving the value,
        % but rather copying modeAge into it
    end

    %% Fourth, replace 'Sibsp' and 'Parch' with 'FamilySize'
    % If the entire family is on the board, people will probably not want
    % to leave any of them when the ship sank.
    C{1,5}(i) = C{1,5}(i) + C{1,6}(i);


end

%% Now, turn C into a proper calculable matrix X
% make 'Names' and 'Genders' from cell into double value matrices
input2 = cell2mat(C{1,2});
C{1,2} = input2;
input3 = cell2mat(C{1,3});
C{1,3} = input3;
% delete 'Parch' from C
C{1,6} = [];


X = cell2mat(C); % every row is an example(input set), every column is a feature.
save('processedData','X');
