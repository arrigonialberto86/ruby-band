$:.unshift File.dirname(__FILE__)
require 'attribute_selection_utils'

module Weka
  module Attribute_selection
    #This module contains search algorithms from the 'weka.attributeSelection' packages
    module Search
      
      java_import 'weka.attributeSelection.GreedyStepwise'
      java_import 'weka.attributeSelection.RankSearch'
      java_import 'weka.attributeSelection.Ranker'
      java_import 'weka.attributeSelection.ExhaustiveSearch'
      java_import 'weka.attributeSelection.GeneticSearch'
      java_import 'weka.attributeSelection.RaceSearch'
      java_import 'weka.attributeSelection.RandomSearch'
      java_import 'weka.attributeSelection.ScatterSearchV1'

      class GreedyStepwise
        include Attribute_selection_Utils 
      end

      class Ranker
        include Attribute_selection_Utils 
      end

      class RankSearch
        include Attribute_selection_Utils 
      end

      class ExhaustiveSearch
        include Attribute_selection_Utils 
      end

      class GeneticSearch
        include Attribute_selection_Utils 
      end

      class RaceSearch
        include Attribute_selection_Utils 
      end

      class RandomSearch
        include Attribute_selection_Utils 
      end

      class ScatterSearchV1
        include Attribute_selection_Utils 
      end

    end 
  end
end