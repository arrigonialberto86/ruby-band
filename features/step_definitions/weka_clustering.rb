Given(/^the ARFF dataset stored in the file "(.*?)"$/) do |arg1|
  @arff = File.join('resources',arg1)
end

Given(/^the SimpleKMeans algorithm implementation from Weka$/) do
  @clusterer = Weka::Clusterer::SimpleKMeans.new
end

Then(/^I want to parse the data from the file$/) do
  @dataset_ARFF = Core::Parser::parse_ARFF(@arff)
end

Then(/^I want to list the options available for SimpleKMeans$/) do
  puts @clusterer.list_options
end

Then(/^I want to set K = "(.*?)" as K\-means option$/) do |arg1|
  class Clustering < Weka::Clusterer::SimpleKMeans::Base
  end
  Clustering.set_options "-N #{arg1}"
end

Then(/^I want to perform clustering on the parsed dataset$/) do
  Clustering.set_data(@dataset_ARFF)
  @clustered = Clustering.new
end

Then(/^I want to report result statistics$/) do
  puts @clustered
end

Then(/^I want to use Weka clustering cross\-validation$/) do
  puts @clustered.evaluate
end
