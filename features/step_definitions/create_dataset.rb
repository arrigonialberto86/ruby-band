Given(/^a nominal attribute, named "(.*?)", with values "(.*?)"$/) do |arg1, arg2|
  $first_att = arg1.to_sym
  $values = arg2.split(',')
end

Given(/^one numeric attribute, named "(.*?)"$/) do |arg1|
  $second_att = arg1.to_sym
end

Given(/^another numeric attribute, names "(.*?)"$/) do |arg1|
  $third_att = arg1.to_sym
end

Given(/^two data rows: "(.*?)","(.*?)"$/) do |arg1, arg2|
  $first_row = arg1.split(',')
  $second_row = arg2.split(',')
  $first_row[1] = $first_row[1].to_f
  $first_row[2] = $first_row[2].to_f
  $second_row[1] = $second_row[1].to_f
  $second_row[2] = $second_row[2].to_f
end

Then(/^I want to build en empty dataset for my use$/) do
  $my_instance = Core::Type::Instances::Base.new do
    nominal $first_att, $values
    numeric $second_att
    string $third_att
  end
  $my_instance.summary
end

Then(/^I want to populate the dataset by row$/) do
  $my_instance.populate_by_row([$first_row,$second_row])
  $my_instance.summary
end

Then(/^I want to print my dataset as a bidimensional Ruby Array$/) do
  puts $my_instance.to_a2d.inspect
end