Feature: Using a Weka classifier
  In order to classify an instance data
  I want to use a Weka classifier

  Scenario Outline: Understand options and usage
    Given the Weka "<classifier>" classifier
    Then I want to print a "description"
    And I want to print an options list

  Examples: Classifiers
    | classifier            |
    | Bayes::NaiveBayes     |
    | Lazy::KStar           |
    | Trees::RandomForest   |
    | Functions::RBFNetwork |
    | Rules::DecisionTable  |
    | Mi::CitationKNN       |


  Scenario Outline: Use a classifier on a data instance
    Given the unsupervised Weka classifier "<classifier>"
    Then I want to set options "<options>" for it
    And I want to set the dataset parsed from "<file>"
    And I want to print a summary for the dataset
    And I want to set the class index for attribute with index "<index>"
    And I want to instantiate the classifier for my use

  Examples: Classifiers
    | classifier            | options | index | file                 |
    | Bayes::NaiveBayes     | -K      | 0     | weather.numeric.arff |
    | Lazy::KStar           | -M d    | 0     | weather.numeric.arff |
    | Trees::RandomForest   | -I 10   | 0     | weather.numeric.arff |
    | Functions::RBFNetwork |         | 0     | weather.numeric.arff |
    | Rules::DecisionTable  |         | 0     | weather.numeric.arff |

  Scenario Outline: Use a classifier instanciated with a block on a data instance
    Given the unsupervised Weka classifier "<classifier>"
    And I want to instantiate it with the options "<options>"
    And I want to instantiate it with the class_index "<index>"
    And I want to instantiate it with a dataset parsed from "<file>"
    And I want to print a summary for the dataset
    Then I am able to instantiate the classifier with a block

  Examples: Classifiers
    | classifier            | options | index | file                    |
    | Bayes::NaiveBayes     | -K      | 0     | weather.numeric.arff    |
    | Lazy::KStar           | -M d    | 0     | weather.numeric.arff    |
    | Trees::RandomForest   | -I 10   | 0     | weather.numeric.arff    |
    | Functions::RBFNetwork |         | 0     | weather.numeric.arff    |
    | Rules::DecisionTable  |         | 0     | weather.numeric.arff    |