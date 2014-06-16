require 'ruby-band/weka/classifiers/class_builder'

# The Weka::Classifiers::Rules module contains classifiers from the 'weka.classifiers.rules' package
# New weka classes can be defined by adding them to the build_classes method.
module Weka
  module Classifiers
    module Rules
      include ClassBuilder

      build_classes :DecisionTable,
                    :DecisionTableHashKey,
                    :JRip,
                    :M5Rules,
                    :OneR,
                    :PART,
                    :Rule,
                    :RuleStats,
                    :ZeroR
    end
  end
end