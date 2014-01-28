$:.unshift File.dirname(__FILE__)

require_relative '../class_builder'

#
# The Weka::Classifier::Functions module contains classifiers from the 'weka.classifiers.functions' package
# New weka classes can be defined by adding them to the build_classes method.
#
module Weka
	module Classifier
		module Functions
      include ClassBuilder::Classifiers

      build_classes :LinearRegression,
                    :PLSClassifier,
                    :RBFNetwork,
                    :GaussianProcesses,
                    :LeastMedSq,
                    :LibSVM,
                    :SMO,
                    :SMOreg,
                    :SPegasos,
                    :VotedPerceptron,
                    :Winnow
    end
  end
end