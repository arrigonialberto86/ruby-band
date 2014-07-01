Feature: Evaluating a Weka classifier
  In order to get information about the preformance of a classifier
  I want to evaluate it

  Scenario Outline: Use a classifier on a data instance and evaluate it
    Given the unsupervised Weka classifier "<classifier>"
    Then I want to set options "<options>" for it
    And I want to set the dataset parsed from "<file>"
    And I want to print a summary for the dataset
    And I want to set the class index for attribute with index "<index>"
    And I want to instantiate the classifier for my use
    And I want to cross validate the classifier
    And I want to get the summary of the evaluation
    And I want to get the class details of the evaluation
    And I want to get the cumulative margin distribution of the evaluation
    And I want to get the precision of the evaluation with the class index
    And I want to get the recall of the evaluation with the class index
    And I want to get the weighted precision of the evaluation
    And I want to get the weighted recall of the evaluation
    And I want to get the true negative rate of the evaluation with the class index
    And I want to get the true positive rate of the evaluation with the class index
    And I want to get the false positive rate of the evaluation with the class index
    And I want to get the false negative rate of the evaluation with the class index
    And I want to get the weighted true negative rate of the evaluation
    And I want to get the weighted true positive rate of the evaluation
    And I want to get the weighted false positive rate of the evaluation
    And I want to get the weighted false negative rate of the evaluation
    And I want to get the true negative count of the evaluation with the class index
    And I want to get the true positive count of the evaluation with the class index
    And I want to get the false negative count of the evaluation with the class index
    And I want to get the false positive count of the evaluation with the class index
    And I want to get the Fmeasure of the evaluation with the class index
    And I want to get the F-measure of the evaluation with the class index
    And I want to get the weighted Fmeasure of the evaluation
    And I want to get the weighted F-measure of the evaluation
    And I want to get the area under ROC of the evaluation with the class index
    And I want to get the weighted area under ROC of the evaluation
    And I want to get the area under PRC of the evaluation with the class index
    And I want to get the weighted area under PRC of the evaluation
    And I want to get the error rate of the evaluation
    And I want to get the instance count of the evaluation
    And I want to get the correct count of the evaluation
    And I want to get the incorrect count of the evaluation
    And I want to get the unclassified count of the evaluation
    And I want to get the correct percentage of the evaluation
    And I want to get the incorrect percentage of the evaluation
    And I want to get the unclassified percentage of the evaluation
    And I want to get the SF entropy gain of the evaluation
    And I want to get the KB mean information of the evaluation
    And I want to get the confusion matrix of the evaluation
    And I want to get the total cost of the evaluation
    And I want to get the average cost of the evaluation

  Examples: Classifiers
    | classifier           | options | index | file                 |
    | Bayes::NaiveBayes    | -K      | 0     | weather.numeric.arff |
    | Lazy::KStar          | -M d    | 0     | weather.numeric.arff |
    | Trees::RandomForest  | -I 10   | 0     | weather.numeric.arff |
    | Functions::Logistic  |         | 0     | weather.numeric.arff |
    | Rules::DecisionTable |         | 0     | weather.numeric.arff |
    | Meta::LogitBoost     |         | 0     | weather.numeric.arff |

  Scenario: Receiving performance curve data of a classifier
    Given the unsupervised Weka classifier "Trees::RandomForest"
    And I want to set the dataset parsed from "weather.numeric.arff"
    And I want to set the class index for attribute with index "0"
    And I want to instantiate the classifier for my use
    And I want to cross validate the classifier
    And I want to get the performance curves of the classifier