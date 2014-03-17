require 'ruby-band/weka/classifiers/class_builder'

# The Weka::Classifiers::Functions module contains classifiers from the 'weka.classifiers.functions' package
# New weka classes can be defined by adding them to the build_classes method.
module Weka
  module Classifiers
    module Functions
      include ClassBuilder

      build_classes :GaussianProcesses,
                    :LinearRegression,
                    :Logistic,
                    :MultilayerPerceptron,
                    :SGD,
                    :SGDText,
                    :SimpleLinearRegression,
                    :SimpleLogistic,
                    :SMO,
                    :SMOreg,
                    :VotedPerceptron
    end
  end
end