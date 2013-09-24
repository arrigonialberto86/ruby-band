require 'rest_client'
require 'uri'

address = 'http://localhost:4567/'

response_old = RestClient.post "#{address}create_dataset", { 'first' => { 'dataset' => File.new('first_dataset.csv'),'dataset_name' => 'dataset_1'}, 
                                                             #'second' => {'dataset' => File.new('second_dataset.csv'),'dataset_name' => 'dataset_2'}, 
															 'third' => {'dataset' => File.new('third_dataset.csv'),'dataset_name' => 'dataset_3'} }

puts 'List of the parsed datasets:'
response_list =  RestClient.get "#{address}datasets", :cookies => response_old.cookies
puts response_list

# use filter on the training dataset
RestClient.get "#{address}filter?filter_name=Filter::Unsupervised::Attribute::Discretize&&filter_options=-K_3&&dataset_in=dataset_1&&dataset_out=filtered_training_set",:cookies => response_old.cookies
                               
puts 'List of the datasets + the filtered training set'
response_list =  RestClient.get "#{address}datasets", :cookies => response_old.cookies
puts response_list

puts 'Print a single dataset:'
puts  RestClient.get "#{address}datasets/dataset_1", :cookies => response_old.cookies


puts 'Train a classifier on the dataset_1:'
puts RestClient.get "#{address}train_classifier?classifier_name=Classifier::Bayes::NaiveBayes&&classifier_options=-K&&dataset_in=dataset_1&&model_name=naive_classifier&&class_index=0",:cookies => response_old.cookies

puts 'List all the trained classifiers:'
puts  RestClient.get "#{address}classifiers", :cookies => response_old.cookies

puts 'Show classifier statistics:'
puts  RestClient.get "#{address}classifiers/naive_classifier", :cookies => response_old.cookies

puts 'Crossvalidate the classifier:'
puts  RestClient.get "#{address}crossvalidate_classifier?model_name=naive_classifier&&fold=5", :cookies => response_old.cookies
