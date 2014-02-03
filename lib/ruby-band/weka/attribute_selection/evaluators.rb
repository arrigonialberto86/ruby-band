require 'ruby-band/weka/attribute_selection/utils'

module Weka
  module AttributeSelection

    # This module contains evaluators from the 'weka.attributeSelection' packages
    module Evaluator
      java_import 'weka.attributeSelection.CfsSubsetEval'
      java_import 'weka.attributeSelection.ChiSquaredAttributeEval'
      java_import 'weka.attributeSelection.ClassifierSubsetEval'
      java_import 'weka.attributeSelection.ConsistencySubsetEval'
      java_import 'weka.attributeSelection.CostSensitiveAttributeEval'
      java_import 'weka.attributeSelection.CostSensitiveSubsetEval'
      java_import 'weka.attributeSelection.FilteredAttributeEval'
      java_import 'weka.attributeSelection.FilteredSubsetEval'
      java_import 'weka.attributeSelection.GainRatioAttributeEval'
      java_import 'weka.attributeSelection.SVMAttributeEval'

      class CfsSubsetEval
        include Utils
      #  java_alias :use_options , :setOptions, [Java::Java.lang.String[]]
      end

      class ChiSquaredAttributeEval
        include Utils
      end

      class ClassifierSubsetEval
        include Utils
      end

      class ConsistencySubsetEval
        include Utils
      end

      class CostSensitiveSubsetEval
        include Utils
      end

      class FilteredAttributeEval
        include Utils
      end      

      class FilteredSubsetEval
        include Utils
      end

      class GainRatioAttributeEval
        include Utils
      end

      class SVMAttributeEval
        include Utils
      end

    end 
  end
end