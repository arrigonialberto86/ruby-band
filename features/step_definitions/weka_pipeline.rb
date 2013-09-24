Given(/^a file containing the training set data "(.*?)"$/) do |arg1|
  @training_file = File.join('resources',arg1)
end

Given(/^a file containing the test set data "(.*?)"$/) do |arg1|
  @test_file = File.join('resources',arg1)
end

Then(/^I want to parse them$/) do
  $training_set = Core::Parser::parse_ARFF(@training_file)
  $test_set = Core::Parser::parse_ARFF(@test_file)
end

Then(/^I want to filter them using the unsupervised filter "(.*?)"$/) do |arg1|
  filter = Weka::Filter::Unsupervised::Attribute::StringToWordVector.new
  filter.set do
    data $training_set
  end
  $filtered_training_set = filter.use

  $filtered_test_set = filter.use $test_set
  $filtered_test_set.set_class_index 0
end

Then(/^I want to build a "(.*?)" classifier using training set data$/) do |arg1|
  $bayes = Weka::Classifier::Bayes::ComplementNaiveBayes::Base.new do
    set_data $filtered_training_set
    set_class_index 0
  end

end

Then(/^I want to evaluate the performance of the classifier on the test set$/) do
  @evaluator = Weka::Classifier::Evaluation.new $filtered_training_set
  @evaluator.evaluate_model($bayes,$filtered_test_set)
end

Then(/^I want want to print to stdout a summary of the evaluation$/) do
  puts @evaluator.summary
end

