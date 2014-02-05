require 'ruby-band/weka/attribute_selection/utils'

module Weka
  module AttributeSelection

    # This module contains search algorithms from the 'weka.attributeSelection' packages
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
        include Utils
      end

      class Ranker
        include Utils
      end

      class RankSearch
        include Utils
      end

      class ExhaustiveSearch
        include Utils
      end

      class GeneticSearch
        include Utils
      end

      class RaceSearch
        include Utils
      end

      class RandomSearch
        include Utils
      end

      class ScatterSearchV1
        include Utils
      end

    end 
  end
end