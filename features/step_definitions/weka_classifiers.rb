Given(/^the Weka "(.*?)" classifier$/) do |arg1|
  @classifier = "Weka::Classifier::#{arg1}".constantize.new
end

Then(/^I want to print a "(.*?)"$/) do |arg1|
  @classifier.send arg1.to_sym
end

Then(/^I want to print an options list$/) do
  @classifier.list_options
end

Given(/^the unsupervised Weka classifier "(.*?)"$/) do |class_name|
  class_name = "Weka::Classifier::#{class_name}::Base".constantize
  @classifier_class = Class.new class_name
end

Given(/^I want to instantiate it with the (.*?) "(.*?)"$/) do |name, value|
  instance_variable_set :"@#{name}", value
end

Given(/^I want to instantiate it with a dataset parsed from "(.*?)"$/) do |file|
  @arff = File.join('resources',file)
  @dataset_ARFF = Core::Parser.parse_ARFF(@arff)
end

Then(/^I want to set options "(.*?)" for it$/) do |arg1|
  @classifier_class.set_options(arg1)
end

Then(/^I want to set the dataset parsed from "(.*?)"$/) do |arg1|
  @arff = File.join('resources',arg1)
  @dataset_ARFF = Core::Parser.parse_ARFF(@arff)
  @classifier_class.set_data(@dataset_ARFF)
end

Then(/^I want to print a summary for the dataset$/) do
  @dataset_ARFF.summary
end

Then(/^I want to set the class index for attribute with index "(.*?)"$/) do |arg1|
  @classifier_class.set_class_index(arg1.to_i)
end

Then(/^I want to instantiate the classifier for my use$/) do
  @classifier_instance = @classifier_class.new
end

Then(/^I am able to instantiate the classifier with a block$/) do
  dataset = @dataset_ARFF
  class_index = @class_index.to_i
  options = @options

  @classifier_class.new do
    set_options options
    set_data dataset
    set_class_index class_index
  end
end

Then(/^I want to cross validate the classifier$/) do
  @evaluation = @classifier_instance.cross_validate(2)
  @evaluation.should be_a Weka::Classifier::Evaluation
end

And(/^I want to get the (.*?) of the evaluation\s?(.*?)$/) do |info, with_class_index|
  method_name = info.downcase.strip.gsub(/[ -]/, '_').to_sym
  @evaluation.should respond_to method_name

  information = @evaluation.send(method_name) if with_class_index.blank?
  information = @evaluation.send(method_name, @class_index.to_i) unless with_class_index.blank?
  information.should_not be_blank
end