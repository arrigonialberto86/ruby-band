Feature: Weka dataset clustering 
	In order to group similar data vectors in my dataset 
	I want to use Weka clustering algorithms

	Scenario: use of Kmeans algorithm
		Given the ARFF dataset stored in the file "weather.numeric.arff"
    Given the SimpleKMeans algorithm implementation from Weka  
		Then I want to parse the data from the file
    And I want to list the options available for SimpleKMeans
    And I want to set K = "4" as K-means option
    And I want to perform clustering on the parsed dataset
    And I want to report result statistics 
    And I want to use Weka clustering cross-validation


