Feature: Classification pipeline
	In order to perform text-mining on a dataset
	I want to parse the data, filter it and then classify it using a Bayesian classifier

	Scenario: Use of Naive Bayes on a filtered data set
		Given a file containing the training set data "ReutersGrain-train.arff"
		Given a file containing the test set data "ReutersGrain-test.arff"
		Then I want to parse them
		And I want to filter them using the unsupervised filter "StringToWordVector"
		And I want to build a "NaiveBayes" classifier using training set data
		And I want to evaluate the performance of the classifier on the test set
		And I want want to print to stdout a summary of the evaluation

		