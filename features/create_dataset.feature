Feature: Creation of an in-memory dataset
	In order to perform calculations on a dataset
	I want to easily build it and store it in memory

	Scenario: creation of a dataset
		Given a nominal attribute, named "assertion", with values "yes,no" 
		Given one numeric attribute, named "temperature"
		Given another numeric attribute, names "days"
		Given two data rows: "yes,100,30","no,100,0"
		Then I want to build en empty dataset for my use
		And I want to populate the dataset by row
		And I want to print my dataset as a bidimensional Ruby Array
