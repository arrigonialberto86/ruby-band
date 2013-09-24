Given(/^the example ARFF file "(.*?)"$/) do |arff_file|
  @arff = File.join('resources',arff_file)
end

Given(/^the Weka Attribute Add filter$/) do
  @filter = Weka::Filter::Unsupervised::Attribute::Add.new
end

Then(/^I want to parse the file in order to create an Instances class object$/) do
  $dataset_ARFF = Core::Parser::parse_ARFF(@arff)
  puts $dataset_ARFF.summary
end

Then(/^I want to print the available filter options and usage$/) do
  @filter.options_list
end

Then(/^I want to set the option String "(.*?)"$/) do |arg1|
  $arg1 =  arg1
  @filter.set do 
    filter_options $arg1
    data $dataset_ARFF
  end
end

Then(/^I want to add an attribute \(a column\) to the dataset using the Weka filter Add$/) do
  @new_inst = @filter.use
end

Then(/^I want to print a "(.*?)" for the modified dataset$/) do |arg1|
  @new_inst.send arg1.to_sym
end