function [ labels, NeighborPts ] = growCluster( D, labels, P, NeighborPts, C, eps, MinPts )

%     Grow a new cluster with label `C` from the point `P`.
%     This function searches through the dataset to find all points that belong
%     to this new cluster. When this function returns, cluster `C` is complete.
%     
%     Parameters:
%       `D`      - The dataset (a list of vectors)
%       `labels` - List storing the cluster labels for all dataset points
%       `P`      - Index of the seed point for this new cluster
%       `NeighborPts` - All of the neighbors of `P`
%       `C`      - The label for this new cluster.  
%       `eps`    - Threshold distance
%       `MinPts` - Minimum required number of neighbors
%     
labels(P) = C;
i = 1;
while i <= length(NeighborPts)
    % Get the next point from the queue.        
    Pn = NeighborPts(i);
       
    % If Pn was labelled NOISE during the seed search, then we
    % know it's not an outlier, so
    % make it a new element of cluster C and move on.
        if labels(Pn) == -1
           labels(Pn) = C;
        
    % Otherwise, if Pn isn't already assigned, assign it as part of C.
        elseif labels(Pn) == 0
    	% Add Pn to cluster C (Assign cluster label C).
            labels(Pn) = C; 
            % Uncomment these following lines to see the growing cluster animation
%             gscatter(D(:,1),D(:,2),labels);
%             drawnow;
            
        % Find all the neighbors of Pn
            PnNeighborPts = regionQuery(D, Pn, eps);
            
        % If Pn has at least MinPts neighbors, it's a branch point!
        % Add all of its neighbors to the FIFO queue to be searched. 
        
            if length(PnNeighborPts) >= MinPts
                for j = 1 : length(PnNeighborPts)
                    flag = false;
                    for k = 1 : length(NeighborPts)
                        if PnNeighborPts(j) == NeighborPts(k)
                            flag = true;
                            break
                        end
                    end
                    if flag == false
                        NeighborPts = [NeighborPts;  PnNeighborPts(j)];
                        break;
                    end
                end
        % If Pn *doesn't* have enough neighbors, then it's an outlier          
            end
        end
    % Advance to the next point in the FIFO queue.
        i = i + 1;      
    
    % We've finished growing cluster C!
end

end

