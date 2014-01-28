$:.unshift File.dirname(__FILE__)

require_relative '../class_builder'

#
# The Weka::Classifier::Bayes module contains classifiers from the 'weka.classifiers.bayes' package
# New weka classes can be defined by adding them to the build_classes method.
#
module Weka
  module Classifier
    module Bayes
      include ClassBuilder::Classifiers

      build_classes :NaiveBayes,
                    :BayesianLogisticRegression,
                    :AODE,
                    :ComplementNaiveBayes,
                    :WAODE
    end
  end
end