$:.unshift File.dirname(__FILE__)

require_relative '../class_builder'

#
# The Weka::Classifier::Mi module contains classifiers from the 'weka.classifiers.mi' package
# New weka classes can be defined by adding them to the build_classes method.
#
module Weka
	module Classifier
		module Mi
      include ClassBuilder::Classifiers

      build_classes :CitationKNN,
                    :MDD,
                    :MIBoost,
                    :MIDD,
                    :MIEMDD,
                    :MILR,
                    :MINND,
                    :MIOptimalBall,
                    :MISMO,
                    :MISVM,
                    :MIWrapper,
                    :SimpleMI
		end
  end
end