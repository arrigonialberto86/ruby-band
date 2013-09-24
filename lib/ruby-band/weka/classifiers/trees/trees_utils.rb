# This module is used by the 'trees' classifiers from 'trees.rb' 
# to inherit the following methods (instance and class methods)
module Trees_utils
  java_import "weka.core.Utils"

  def init_tree
    set_options(self.class.options) if self.class.options 
    self.class.data.setClassIndex(self.class.class_index) if self.class.class_index
    buildClassifier(self.class.data)
  end

  #Instance methods list
  def self.included(base)
    base.extend(ClassMethods)
  end

  def init_instance_classifier(&block)
    self.instance_eval(&block)
    @dataset.setClassIndex(@class_index)
    build_classifier(@dataset)
  end

  #Set input data for the selected classifier
  #ARGV:
  #data -> an Instances class object
  def set_data(data)
    @dataset = data 
  end

  #Set the class index for the input dataset
  def set_class_index(class_index)
    @class_index = class_index 
  end

  #Set options for the instance classifier
  #ARGS:
  #options -> A String object, i.e. "-K 3"
  def set_options(options)
    options_inst = Utils.splitOptions(options)
    setOptions(options_inst)
  end

  def list_options
    listOptions.each {|key| puts "#{key.synopsis} #{key.description}"}
  end

  #Return a short description for the selected classifier
  def description
    puts globalInfo
  end

  # perform crossvalidation on a trained classifier
  #ARGV:
  #fold -> 'int' value
  def cross_validate(fold)
    if self.class.data
      eval = Weka::Classifier::Evaluation.new self.class.data
      eval.crossValidateModel(self.class.ancestors[2].new, self.class.data, fold.to_java(:int), Random.new(1))
      eval.summary 
    else
      eval = Weka::Classifier::Evaluation.new @dataset
      eval.crossValidateModel(self.class.ancestors[1].new, @dataset, fold.to_java(:int), Random.new(1))
      eval.summary
    end
  end

  #Class methods module
  module ClassMethods
    
    def self.classifier_attr_accessor(*args)
      args.each do |arg|
        #Here's the getter
        self.class_eval("def #{arg};@#{arg};end")
        #Here's the setter
        self.class_eval("def set_#{arg}(val);@#{arg}=val;end")
      end
    end

    classifier_attr_accessor :options,:data,:class_index

  end
end



