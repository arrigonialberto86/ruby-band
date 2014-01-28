$:.unshift File.dirname(__FILE__)

require_relative '../class_builder'

#
# The Weka::Classifier::Lazy module contains classifiers from the 'weka.classifiers.lazy' package
# New weka classes can be defined by adding them to the build_classes method.
#
module Weka
	module Classifier
		module Lazy
      include ClassBuilder::Classifiers

      build_classes :KStar,
                    :LWL,
                    :LBR,
                    :IB1,
                    :IBk
    end
  end
end