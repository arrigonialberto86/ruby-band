# ruby-band

[![Build Status](https://travis-ci.org/arrigonialberto86/ruby-band.png?branch=master)](https://travis-ci.org/arrigonialberto86/ruby-band)

Data mining and machine learning algorithms for Ruby

## Installation

Install the  'jbundle' gem and 'bundle' for JRuby before trying to install the
'ruby-band' gem. Maven is also required for .jars automatic download and
installation. On Ubuntu/Debian Maven should already be installed and on OSX
system you can get it from Brew

If you want to use 'ruby-band' APIs without installing the gem you need to run
command 'rake -T' once before requiring the gem in your script (this is
necessary for jbundler to download the '.jar' files and subsequently set the
Java classpath). Otherwise use:

    gem install ruby-band

## Usage

### Dataset parsing
One central datatype of ruby-band is derived from the Weka counterpart (the class Weka.core.Instances). By instantiating this class, we obtain a matrix-like structure for storing an entire dataset. Ad-hoc methods were created to guarantee that 'Instances' class objects can be converted to other datatypes (e.g. Apache matrix) and back.
There are currently many ways to import data into ruby-band. 
### Parsing data from ARFF/CSV files
You can simply parse an external Weka ARFF/CSV file by doing:
```ruby
require 'ruby-band'
dataset = Core::Parser.parse_ARFF(my_file.arff)
dataset = Core::Parser.parse_CSV(my_file.csv)
```
### In-memory dataset creation
Since the dataset type used by ruby-band is derived from Weka Instances class, we must define the domain of the data we want to insert into it. The attribute types supported by ruby-band are 'numeric', 'nominal', 'string' and 'date'. For this reason, each column in the dataset can contain only one data type to be valid.
If you want to build an in-memory dataset you can create an empty scaffold at first, then you populate it with your data, like this:
```ruby
require 'ruby-band'
# we create a dataset containing three columns (attributes)
dataset = Core::Type::Instances::Base.new do
  nominal :first_attribute, ['yes','no']
  nominal :second_attribute, ['maybe','perhaps']
  numeric :third_attribute
end
```
we can populate 'by row' our matrix-like dataset using a bidimensional array:
```ruby
dataset.populate_by_row([['yes','maybe',6],['no','perhaps',21]])
```
Every row in the dataset above must meet this construction criteria: [a_nominal_value,b_nominal_value,c_numeric value], in order to match the structure assigned during dataset initialization.

### How to operate on a dataset

The ruby-band `Core::Type::Instances` class offers a wide range of operations to easily access and modify a dataset. Some of the are very intuitive:
```ruby
require 'ruby-band'
dataset = Core::Parser.parse_ARFF(my_file.arff)
# we can now access the dataset

dataset.summary
dataset.n_col/.n_row/.dim # R-like functions
dataset.each_row/each_column {|row/column| function}
```
or we can modify it by doing:
```ruby
# to add a row
dataset.add_instance ['yes','maybe',21]

# to add a column
dataset.add_numeric_attribute 'my_numeric_attribute'
dataset.add_nominal_attribute 'my_nominal_attribute', ['ruby','is','fun']
```
In addition to these methods, ruby-band offers a wide range of filters to operate on the structure and the content of the Instances datasets.

### How to export a dataset
It is fairly easy to export a dataset to a CSV/ARFF file or to a Mysql table (with reference to the example above):
```ruby
dataset.to_ARFF my_output_file.arff
dataset.to_CSV my_output_file.csv
dataset.save_to_mysql 'jdbc:mysql://localhost:3306/DB_name', user_name, password, table_name
```
## Weka filters
In WEKA, filters are used to preprocess the data.
Each filter falls into one of the following two categories:
+ supervised – The filter requires a class attribute to be set.
+ unsupervised – A class attribute is not required to be present.

And into one of the two sub-categories:
+ attribute-based – Columns are processed, e.g., added or removed.
+ instance-based – Rows are processed, e.g., added or deleted.

As to the namespaces used for the filters available, they can be found here:
```ruby
Weka::Filter::Supervised::Attribute::my_filter.new
Weka::Filter::Supervised::Instance::my_filter.new 
Weka::Filter::Unsupervised::Attribute::my_filter.new
Weka::Filter::Unsupervised::Instance::my_filter.new
```

These categories should make it clear, what the difference between the two Discretize (Weka::Filter::Supervised:: || Unsupervised::Attribute::Discretize) filters in WEKA is. The supervised one takes the class attribute and its distribution over the dataset into account, in order to determine the optimal number and size of bins, whereas the unsupervised one relies on a user-specified number of bins.

If you want to return a brief description with the required options for a selected filter class you only need to do this:
```ruby
filter = Weka::Filter::Unsupervised::Instance::my_filter.new
puts filter.description
puts filter.options_list
```


To apply a filter on a dataset we can use a very simple approach:
```ruby
dataset = Core::Parser::parse_ARFF('example_file.arff')

# filter instantiation 
filter = Weka::Filter::Supervised::Attribute::my_filter.new

# input/options handling
filter.set do 
  data dataset
  filter_options '-W'
end

# return a filtered dataset
filtered_dataset = filter.use
```
to list the available options for a given filter you can use the method `filter.options_list`

## Weka attribute selection

Preparing one’s data properly is a very important step for getting the best results. Reducing the number of attributes can not only help speeding up runtime with algorithms, but also help avoid “burying” the algorithm in a mass of attributes, when only a few are essential for building a good model. 

There are three different types of evaluators in Weka at the moment: single attribute evaluators, attribute subset evaluators, attribute set evaluators. Most of the attribute selection schemes currently implemented are supervised, i.e., they require a dataset with a class attribute, but the usage (and the capabilities!) of each evaluator can be accessed by calling the method 'list_options' on an Evaluator (or Search) class object.

```ruby
# let's instantiate an evaluator
eval = Weka::Attribute_selection::Evaluator::CfsSubsetEval.new

puts eval.options_list

### -M   Treat missing values as a separate value.
### -L 	Don't include locally predictive attributes.

puts eval.select_options '-M'
```
If we do not need to set any particular option for the evaluator and the search algorithm we can simply instantiate both classes:

```ruby
require 'ruby-band'
 
# Evaluator
eval = Weka::Attribute_selection::Evaluator::CfsSubsetEval.new
 
# Search algorithm
search = Weka::Attribute_selection::Search::GreedyStepwise.new
 
dataset = Core::Parser::parse_ARFF('weather.numeric.arff')
```

And then we filter our dataset using a supervised filter:
```ruby
filter = Weka::Filter::Supervised::Attribute::AttributeSelection.new
 
filter.set do
  evaluator eval
  search search
  data dataset
end
 
filtered_dataset = filter.use
```
The returned Instances class object stores the results of the analysis we performed on the initial data.

##Classifiers

Classification and regression algorithms in WEKA are called “classifiers” and are located below the Weka::Classifier:: module. Currently, ruby-band only supports batch-trainable classifiers: this means they get trained on the whole dataset at once.

If you want to return a brief description with the required options for a selected classifier class you only need to do this:
```ruby
classifier = Weka::Classifier::Lazy::my_classifier.new
puts classifier.description
puts classifier.list_options
```

It is fairly easy to build a classifier using the ruby-band APIs:
```ruby
classifier = Weka::Classifier::Lazy::KStar::Base.new do
  set_options '-M d'
  set_data dataset
  set_class_index 4
end
```
we can then evaluate the trained classifier using cross-validation: 
```ruby
classifier.cross_validate(3) # ARG is 'folds' used by cross-validation 
```
Alternatively, a test set can be for evaluation used by doing:
```ruby
test_set = Core::Parser::parse_ARFF 'some/where/file.arff'
test_set.set_class_index(0)

evaluator = Weka::Classifier::Evaluation.new $filtered_dataset
puts evaluator.evaluate_model(classifier,test_data)
```

###Classifying instances
In case you have an unlabeled dataset that you want to classify with your newly trained classifier, you can use the following code snippet.
```ruby
# 'unlabeled' is a dataset with class index set, but no class value
unlabeled.each_row_with_index do |instance,id|
  label = classifier.classify_instance instance
  unlabeled.instance(id).set_class_value label
end

unlabeled.to_ARF/to_CSV 'my_file.arff' # save dataset with inserted class values
```

##Clusterers

Clustering is an unsupervised Machine Learning technique of finding patterns in the data, i.e., these algorithms work without class attributes. Classifiers, on the other hand, are supervised and need a class attribute. This section, similar to the one about classifiers, covers the following topics:
* Building a clusterer - batch (incremental must still be implemented) learning. 
* Evaluating a clusterer - how to evaluate a built clusterer. 
* Clustering instances -  determining what clusters unknown instances belong to.

Clusterers, just like classifiers, are by design batch-trainable as well. They all can be built on data that is completely stored in memory. But a small subset of the cluster algorithms can also update the internal representation incrementally (this functionality must still be implemented, along with the ‘incremental’ mode for classifiers).

If you want to return a brief description and the options list for a selected clusterer class you only need to do this:
```ruby
clusterer = Weka::Clusterer::my_clusterer.new
puts clusterer.description
puts clusterer.list_options
```

This is an example of the usage for SimpleKMeans class:
```ruby
# load dataset
data_instance = Core::Parser::parse_ARFF 'some/where/file.arff'
kmeans = Weka::Clusterer::SimpleKMeans::Base.new do
  set_data data_instance
  set_options "-N 10 -c last"
end
# access description and available options
kmeans.list_options
kmeans.description
```
### Evaluating a clusterer
The evaluation on a built clusterer can be performed like this:
```ruby
puts kmeans.evaluate
# or, if you want to evaluate the model on a different dataset
puts clusterer.evaluate(dataset)
```
### Adding a 'cluster' attribute to a dataset
After performing clustering on a training set, we can use the clusterer to assign a 'cluster label' to a new dataset. In order to do this, we add a new 'cluster' attribute to the dataset, and we subsequently fill it with cluster assignments.
```ruby
# remember the 'data_instance' dataset from the previous example
filter = Weka::Filter::Unsupervised::Attribute::AddCluster.new
filter.set do
  data data_instance
  clusterer kmeans
end
# now fill the attribute with values
data_instance.each_row do |inst|
  puts "Inst: #{inst.to_string}\t\t Cluster assignment #{kmeans.cluster_instance(inst)}"
end
```

## Classes to clusters
Datasets for supervised algorithms, like classifiers, can be used to evaluate a clusterer as well. This evaluation is called classes-to-clusters, as the clusters are mapped back onto the classes.

In this mode Weka first ignores the class attribute and generates the clustering. Then during the test phase it assigns classes to the clusters, based on the majority value of the class attribute within each cluster. Then it computes the classification error, based on this assignment.
```ruby
# parse dataset
dataset = Core::Parser::parse_CSV some_data.csv
 
# eliminate class values
filter = Weka::Unsupervised::Attribute::Remove.new
filter.set do
  attribute_indices "#{dataset.class_index+1}"
  data dataset
end
unlabeled_dataset = filter.use
 
# instantiate the clusterer
clusterer = Weka::Clusterer::EM.new { set_data unlabeled_dataset}
 
# evaluate the clusterer
puts clusterer.evaluate(dataset)
```

## Developers

To use the library 

    require 'ruby-band'

The API doc is online. For more code examples see also the test files in the
source tree.

## Project home page

Information on the source tree, documentation, issues and how to contribute,
see

http://github.com/arrigonialberto86/ruby-band

The BioRuby community is on IRC server: irc.freenode.org, channel: #bioruby.

## Cite

If you use this software, please cite one of

*   [BioRuby: bioinformatics software for the Ruby programming
    language](http://dx.doi.org/10.1093/bioinformatics/btq475)
*   [Biogem: an effective tool-based approach for scaling up open source
    software development in
    bioinformatics](http://dx.doi.org/10.1093/bioinformatics/bts080)


## Copyright

Copyright (c) 2013 arrigonialberto86. See LICENSE.txt for further details.
