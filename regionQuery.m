function [ neighbors ] = regionQuery( D, p, eps )

%     Find all points in dataset `D` within distance `eps` of point `P`.
%     This function calculates the distance between a point P and every other 
%     point in the dataset, and then returns only those points which are within a
%     threshold distance `eps`.

neighbors = zeros(0);

for i=1:length(D)
    dist = sqrt((D(p,1) - D(i,1))^2 + (D(p,2) - D(i,2))^2); % Euclidean Distance
    if abs(dist)<eps % If the element is nearest than eps
        neighbors = [neighbors; i]; % add the element to the neighbors vector
    end

end


