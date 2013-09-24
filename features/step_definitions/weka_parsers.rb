Given /^the CSV file "(.*?)"$/ do |csv_file|
  @csv = File.join('resources',csv_file)
  @dataset_CSV = Core::Parser::parse_CSV(@csv)
end

Then /^I want to print to stdout the summary for the CSV parsed Instances object$/ do
  @dataset_CSV.summary
end

Given /^the ARFF file "(.*?)"$/ do |arff_file|
  @arff = File.join('resources',arff_file)
  puts @arff
  @dataset_ARFF = Core::Parser::parse_ARFF(@arff)
end

Then /^I want to print to stdout the summary for the ARFF parsed Instances object$/ do
  @dataset_ARFF.summary
end

Given(/^the database "(.*?)"$/) do |arg1|
  @db_connection = arg1
end

Given(/^a table named "(.*?)"$/) do |arg1|
  @target_table = arg1
end

Then(/^I want to extract data from that table$/) do
# INSERT HERE MySQL DB CREDENTIALS in order to test this parsing functionality
#  @dataset = Weka::Db.query_mysql(@db_connection,'root','',"select * from #{@target_table}")
end

Then(/^I want to print to stdout the summary for the parsed Instances object$/) do
#  @dataset.summary
end

Then(/^I want to convert the data into a bidimensional Ruby Array$/) do 
#  @dataset.to_a2d.should == [["sunny", 85.0, 85.0, "FALSE", "no"], ["sunny", 80.0, 90.0, "TRUE", "no"], ["overcast", 83.0, 86.0, "FALSE", "yes"],
#                           ["rainy", 70.0, 96.0, "FALSE", "yes"], ["rainy", 68.0, 80.0, "FALSE", "yes"], ["rainy", 65.0, 70.0, "TRUE", "no"], 
#                           ["overcast", 64.0, 65.0, "TRUE", "yes"], ["sunny", 72.0, 95.0, "FALSE", "no"], ["sunny", 69.0, 70.0, "FALSE", "yes"], 
#                           ["rainy", 75.0, 80.0, "FALSE", "yes"], ["sunny", 75.0, 70.0, "TRUE", "yes"], ["overcast", 72.0, 90.0, "TRUE", "yes"], 
#                           ["overcast", 81.0, 75.0, "FALSE", "yes"], ["rainy", 71.0, 91.0, "TRUE", "no"]]
end



