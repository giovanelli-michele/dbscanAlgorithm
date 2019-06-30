# dbscanAlgorithm
Density-based clustering for discovering clusters in large datasets with noise


This repository contains an implementation of the DB-Scan Algorithm with Euclidean Distance Function.


It consists of:


	- dbscan.m containing the core structure of the algorithm. It has three parameters: 
	
	
		- Set is the dataset, 
		
		
		- Eps is the maximum distance,
		
		
		- MinPts is the minimum number of neighbors		
		
		
	- regionQuery.m that discovers all the points of dataset that are near enough to the considered point
	
	
	- growCluster.m that adds points to each cluster
	
	
	- main.m that contains a test of the algorithm using a simulated dataset with a deterministic shape

