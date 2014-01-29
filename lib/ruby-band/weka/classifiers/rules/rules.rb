$:.unshift File.dirname(__FILE__)

require_relative '../class_builder'

#
# The Weka::Classifier::Rules module contains classifiers from the 'weka.classifiers.rules' package
# New weka classes can be defined by adding them to the build_classes method.
#
module Weka
  module Classifier
    module Rules
      include ClassBuilder::Classifiers

      build_classes :DTNB,
                    :DecisionTable,
                    :JRip,
                    :M5Rules,
                    :NNge,
                    :OneR,
                    :PART,
                    :Prism,
                    :Ridor,
                    :Rule,
                    :RuleStats,
                    :ZeroR
    end
  end
end