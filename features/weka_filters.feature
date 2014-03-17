Feature: Filter a dataset (Weka Instances class)
	In order to manipulate a dataset
	I want to use the Weka Filter class on it

  Scenario: Use of the Unsupervised Attribute filter 'Add'
    Given the example ARFF file "weather.numeric.arff"
    And the Weka Unsupervised Attribute Add filter
    Then I want to parse the file in order to create an Instances class object
    And I want to print the available filter options and usage
    And I want to set the option String "-T NUM -N dummy"
    And I want to apply the filter on the dataset
    And I want to print a "summary" for the modified dataset

  Scenario: Use of the Supervised Attribute filter 'NominalToBinary'
    Given the example ARFF file "weather.numeric.arff"
    And the Weka Supervised Attribute NominalToBinary filter
    Then I want to parse the file in order to create an Instances class object
    And I want to print the available filter options and usage
    And I want to set the option String "-A"
    And I want to apply the filter on the dataset
    And I want to print a "summary" for the modified dataset

  Scenario: Use of the Unsupervised Instance filter 'RemoveWithValues'
    Given the example ARFF file "weather.numeric.arff"
    And the Weka Unsupervised Instance RemoveWithValues filter
    Then I want to parse the file in order to create an Instances class object
    And I want to print the available filter options and usage
    And I want to set the option String "-S 70"
    And I want to apply the filter on the dataset
    And I want to print a "summary" for the modified dataset

  Scenario: Use of the Supervised Instance filter 'SpreadSubsample'
    Given the example ARFF file "weather.numeric.arff"
    And the Weka Supervised Instance SpreadSubsample filter
    Then I want to parse the file in order to create an Instances class object
    And I want to print the available filter options and usage
    And I want to set the option String "-M 1"
    And I want to apply the filter on the dataset
    And I want to print a "summary" for the modified dataset