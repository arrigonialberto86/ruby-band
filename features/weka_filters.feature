Feature: Filter a dataset (Weka Instances class)
	In order to manipulate a dataset
	I want to use the Weka Filter class on it

	Scenario: Use of the Unsupervised Attribute filter 'Add'
		Given the example ARFF file "weather.numeric.arff"
		Given the Weka Attribute Add filter
		Then I want to parse the file in order to create an Instances class object
		And I want to print the available filter options and usage
		And I want to set the option String "-T NUM -N dummy"
		And I want to add an attribute (a column) to the dataset using the Weka filter Add
		And I want to print a "summary" for the modified dataset