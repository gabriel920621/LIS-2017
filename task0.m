train=csvread('train.csv',1,1);
test=csvread('test.csv',1,1);
sample=csvread('sample.csv',1,0);

X = train(:,2:end);
y = train(:,1);

w = inv(X'*X)*X'*y;
RMSE = sqrt(mean((y-X*w).^2))

X_test = test;
y_pred = X_test*w;

y_pred = [sample(:,1) y_pred];
y_pred = [111 111; y_pred];
% fid = fopen('prediction.csv', 'w');
% fprintf(fid, '%d, %f\n', y_pred');
% fclose(fid);
%  dlmwrite('prediction.csv', y_pred, '-append') ;

csvwrite('prediction3.csv',y_pred)

%% Mean

RMSE = sqrt(mean((y-mean(X,2)).^2))
y_pred2 = [sample(:,1) mean(X_test,2)];
y_pred2 = [111 111; y_pred2];

csvwrite('prediction4.csv',y_pred2)

% header = {'Id' 'y'}; 
% xlswrite('prediction4.csv', header, 'sheetname') % by defualt starts from A1
% xlswrite('prediction4.csv', y_pred2, 'sheetname','A2') % array under the header.
%%
w = inv(train'*train)*train'*y;

