Feature: Weka basic parsing capabilities
	In order to perform calculations on a dataset 
	I want to import data from .ARFF, .CSV files, and external databases

	Scenario: parsing a CSV file
		Given the CSV file "weather.csv"
		Then I want to print to stdout the summary for the CSV parsed Instances object 

	Scenario: parsing an ARFF file
		Given the ARFF file "weather.numeric.arff"
		Then I want to print to stdout the summary for the ARFF parsed Instances object 

	Scenario: parsing data from a mySQL table
		Given the database "jdbc:mysql://localhost:3306/Gene_classes"
		And a table named "test_weka"	
		Then I want to extract data from that table
		And I want to print to stdout the summary for the parsed Instances object
		And I want to convert the data into a bidimensional Ruby Array