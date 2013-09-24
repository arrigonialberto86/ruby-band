Given(/^the Weka "(.*?)" classifier$/) do |arg1|
  @classifier = Weka::Classifier::Bayes::NaiveBayes.new
end

Then(/^I want to print a "(.*?)"$/) do |arg1|
  @classifier.send arg1.to_sym
end

Then(/^I want to print an options list$/) do
  @classifier.list_options
end

Given(/^the unsupervised Weka classifier "(.*?)"$/) do |arg1|
  class My_classifier < Weka::Classifier::Bayes::NaiveBayes::Base
  end
end

Then(/^I want to set option "(.*?)" for it$/) do |arg1|
  My_classifier.set_options(arg1)
end

Then(/^I want to set the dataset parsed from "(.*?)"$/) do |arg1|
  @arff = File.join('resources',arg1)
  @dataset_ARFF = Core::Parser::parse_ARFF(@arff)
  My_classifier.set_data(@dataset_ARFF)
end

Then(/^I want to print a summary for the dataset$/) do
  @dataset_ARFF.summary
end

Then(/^I want to set the class index for attribute with index "(.*?)"$/) do |arg1|
  My_classifier.set_class_index(arg1.to_i)
end

Then(/^I want to instantiate the classifier for my use$/) do
  classifier = My_classifier.new
  classifier.cross_validate(2)
end




