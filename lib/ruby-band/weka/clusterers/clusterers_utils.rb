#This module is used by the classes from the Clusterer module 
#to inherit the following methods (instance and class methods)
module Clusterer_utils
  java_import "weka.core.Utils"
  java_import "weka.clusterers.ClusterEvaluation"

  def init_clusterer
    set_options(self.class.options) if self.class.options 
    buildClusterer(self.class.data)
  end

  def init_instance_clusterer(&block)
    self.instance_eval(&block)
    #@dataset.setClassIndex(@class_index)
    buildClusterer(@dataset)
  end

  #Instance methods list
  def self.included(base)
    base.extend(ClassMethods)
  end

  #set instance data for the clusterer
  def set_data(data)
    @dataset = data 
  end

  #set options for the clusterer
  def set_options(options)
    options_inst = Utils.splitOptions(options)
    setOptions(options_inst)
  end

  def list_options
    listOptions.map {|key| "#{key.synopsis} #{key.description}"}.join("\n")
  end

  #the description provided by the Weka Documentation
  def description
    globalInfo
  end

  #list cluster centroids with coordinates
  def get_centroids 
    getClusterCentroids
  end

  #list cluster's capabilities with attributes (i.e Numeric, Nominal...)
  def list_capabilities
    get_capabilities.to_s
  end

  # Validate clusterer. If the evaluation needs to be performed on a different dataset this function accepts 
  # an optional parameter (an Instances class object)
  def evaluate(*args)
    eval = ClusterEvaluation.new
    eval.setClusterer(self)
    if not args[0]
      if self.class.data
        eval.evaluateClusterer(self.class.data) 
      else
        eval.evaluateClusterer(@dataset)
      end
    else
      eval.evaluateClusterer(args[0])
    end
    puts 'performing evaluation'
    eval.clusterResultsToString
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

    classifier_attr_accessor :options,:data

  end
end
