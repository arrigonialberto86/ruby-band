module Weka
  module Classifiers

    # This module is used by the classifiers to inherit the following methods (instance and class methods).
    module Utils
      java_import "weka.core.Utils"

      def init_classifier
        set_options(self.class.options) if self.class.options
        self.class.data.setClassIndex(self.class.class_index) if self.class.class_index
        buildClassifier(self.class.data)
      end

      # Instance methods list
      def self.included(base)
        base.extend(ClassMethods)
      end

      def init_instance_classifier(&block)
        self.instance_eval(&block)
        @dataset.setClassIndex(@class_index)
        build_classifier(@dataset)
      end

      # Set data for instance classifier
      # ARGV
      # data -> an Instances object
      def set_data(data)
        @dataset = data
      end

      # Set a class index for the input dataset
      def set_class_index(class_index)
        @class_index = class_index
      end

      # Set options for the selected classfier
      # ARGS:
      # options -> a String, i.e. "-K"
      def set_options(options)
        options_inst = Utils.splitOptions(options)
        setOptions(options_inst)
      end

      # List available options
      def list_options
        listOptions.map {|key| "#{key.synopsis} #{key.description}"}.join("\n")
      end

      # Returns a description from the Weka JavaDoc for the selected classifier
      def description
        puts globalInfo
      end

      # Performs cross validation on a trained classifier
      # ARGV:
      # fold -> 'int' value
      def cross_validate(fold)
        if self.class.data
          evaluation = Weka::Classifiers::Evaluation.new self.class.data
          evaluation.crossValidateModel(self.class.ancestors[2].new, self.class.data, fold.to_java(:int), Random.new(1))
          evaluation
        else
          evaluation = Weka::Classifiers::Evaluation.new @dataset
          evaluation.crossValidateModel(self.class.ancestors[1].new, @dataset, fold.to_java(:int), Random.new(1))
          evaluation
        end
      end

      # Class methods module
      module ClassMethods

        def self.classifier_attr_accessor(*args)
          args.each do |arg|
            # Here's the getter
            self.class_eval("def #{arg};@#{arg};end")
            # Here's the setter
            self.class_eval("def set_#{arg}(val);@#{arg}=val;end")
          end
        end

        classifier_attr_accessor :options,:data,:class_index

      end
    end
  end
end