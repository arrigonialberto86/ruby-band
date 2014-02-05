require 'ruby-band/weka/classifiers/class_builder'

# The Weka::Classifiers::Mi module contains classifiers from the 'weka.classifiers.mi' package
# New weka classes can be defined by adding them to the build_classes method.
#
module Weka
  module Classifiers
    module Mi
      include ClassBuilder

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