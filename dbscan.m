function [ labels ] = dbscan( Set, Eps, MinPts)
%     DBSCAN Algorithm
%     
%     Parameters:
%       `Set`    - The dataset (a list of vectors)
%       `Eps`    - Maximum distance
%       `MinPts` - Neighbors treshold

    % dataset length
    l=length(Set);
    % vector label initializated
    labels = zeros(l,1);
    % Cluster count
    C = 0;
    
    % For each point in dataset
    for i=1:l
       if labels(i)==0 % if no cluster assigned
          neighborPts = regionQuery(Set, i, Eps); % count his neighbors
          
          if length(neighborPts) < MinPts % not sufficient
            labels(i) = -1; % noisy point
          
          
        %   Otherwise, if there are at least MinPts nearby, use this point to generate a new cluster.    
          else 
            C = C + 1; % add a new cluster
            [labels neighborPts] = growCluster(Set, labels, i, neighborPts, C, Eps, MinPts); % add points to cluster
          end
       else
           % cluster already assigned
           continue
       end
    end
    

end


