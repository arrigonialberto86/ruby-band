$:.unshift File.dirname(__FILE__)

require_relative '../class_builder'

#
# The Weka::Classifier::Trees module contains classifiers from the 'weka.classifiers.trees' package
# New weka classes can be defined by adding them to the build_classes method.
#
module Weka
	module Classifier
		module Trees
      include ClassBuilder::Classifiers

      build_classes :J48,
                    :FT,
                    :RandomForest,
                    :BFTree,
                    :J48graft,
                    :LADTree,
                    :LMT,
                    :M5P,
                    :RandomTree
		end
  end
end