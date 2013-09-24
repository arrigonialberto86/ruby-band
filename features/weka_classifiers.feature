Feature: Using a Weka classifier
  In order to classify an instance data
  I want to use a Weka classifier

  Scenario: Understand options and usage
    Given the Weka "NaiveBayes" classifier
    Then I want to print a "description"
    And I want to print an options list

  Scenario: Use a classifier on a data instance
    Given the unsupervised Weka classifier "NaiveBayes"
    Then I want to set option "-K" for it
    And I want to set the dataset parsed from "weather.numeric.arff"
    And I want to print a summary for the dataset
    And I want to set the class index for attribute with index "0"
    And I want to instantiate the classifier for my use