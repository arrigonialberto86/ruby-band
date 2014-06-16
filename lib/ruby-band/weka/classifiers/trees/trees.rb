require 'ruby-band/weka/classifiers/class_builder'

# The Weka::Classifiers::Trees module contains classifiers from the 'weka.classifiers.trees' package
# New weka classes can be defined by adding them to the build_classes method.
module Weka
  module Classifiers
    module Trees
      include ClassBuilder

      build_classes :DecisionStump,
                    :HoeffdingTree,
                    :J48,
                    :LMT,
                    :M5P,
                    :RandomForest,
                    :RandomTree,
                    :REPTree
    end
  end
end