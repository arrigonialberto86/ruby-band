require 'ruby-band/weka/classifiers/class_builder'

# The Weka::Classifiers::Bayes module contains classifiers from the 'weka.classifiers.bayes' package
# New weka classes can be defined by adding them to the build_classes method.
module Weka
  module Classifiers
    module Bayes
      include ClassBuilder

      build_classes :BayesNet,
                    :NaiveBayes,
                    :NaiveBayesMultinomial,
                    :NaiveBayesMultinomialText,
                    :NaiveBayesMultinomialUpdateable,
                    :NaiveBayesUpdateable
    end
  end
end