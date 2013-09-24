$:.unshift File.dirname(__FILE__)
require 'attribute_selection_utils'

module Weka
  module Attribute_selection
    module Evaluator
      #This module contains evaluators from the 'weka.attributeSelection' packages
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
        include Attribute_selection_Utils 
      #  java_alias :use_options , :setOptions, [Java::Java.lang.String[]]
      end

      class ChiSquaredAttributeEval
        include Attribute_selection_Utils  
      end

      class ClassifierSubsetEval
        include Attribute_selection_Utils  
      end

      class ConsistencySubsetEval
        include Attribute_selection_Utils  
      end

      class CostSensitiveSubsetEval
        include Attribute_selection_Utils  
      end

      class FilteredAttributeEval
        include Attribute_selection_Utils  
      end      

      class FilteredSubsetEval
        include Attribute_selection_Utils  
      end

      class GainRatioAttributeEval
        include Attribute_selection_Utils  
      end

      class SVMAttributeEval
        include Attribute_selection_Utils  
      end

    end 
  end
end