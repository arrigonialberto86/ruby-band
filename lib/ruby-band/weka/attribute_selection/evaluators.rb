require 'ruby-band/weka/attribute_selection/utils'

module Weka
  module AttributeSelection

    # This module contains evaluators from the 'weka.attributeSelection' packages
    module Evaluator
      java_import 'weka.attributeSelection.CfsSubsetEval'
      java_import 'weka.attributeSelection.CorrelationAttributeEval'
      java_import 'weka.attributeSelection.GainRatioAttributeEval'
      java_import 'weka.attributeSelection.InfoGainAttributeEval'
      java_import 'weka.attributeSelection.OneRAttributeEval'
      java_import 'weka.attributeSelection.ReliefFAttributeEval'
      java_import 'weka.attributeSelection.SymmetricalUncertAttributeEval'
      java_import 'weka.attributeSelection.WrapperSubsetEval'

      class CfsSubsetEval
        include Utils
      #  java_alias :use_options , :setOptions, [Java::Java.lang.String[]]
      end

      class CorrelationAttributeEval
        include Utils
      end      

      class GainRatioAttributeEval
        include Utils
      end

      class InfoGainAttributeEval
        include Utils
      end

      class OneRAttributeEval
        include Utils
      end

      class ReliefFAttributeEval
        include Utils
      end

      class SymmetricalUncertAttributeEval
        include Utils
      end

      class WrapperSubsetEval
        include Utils
      end

    end 
  end
end