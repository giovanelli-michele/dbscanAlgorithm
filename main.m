%% This is an example of data generation and DB-Scan output plot

% Parameters for data generation
N = 100;  % Size of each cluster
r1 = 0.5; % Radius of first circle
r2 = 5;   % Radius of second circle
theta = linspace(0,4*pi,N)';

X1 = r1*[cos(theta),sin(theta)]+ rand(N,2); % first cluster
X2 = r2*[cos(theta),sin(theta)]+ rand(N,2); % second cluster
X = [X1;X2]; % Noisy 2-D circular data set
scatter(X(:,1),X(:,2)) % plotting dataset
title('DBSCAN Using Euclidean Distance Metric')
figure();
drawnow;
idx = dbscan(X,3,5); % calling dbscan algorithm

% idx contains the cluster assignment

gscatter(X(:,1),X(:,2),idx); % plotting clustering assignment
title('DBSCAN Using Euclidean Distance Metric')