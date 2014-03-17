require 'ruby-band/weka/attribute_selection/utils'

module Weka
  module AttributeSelection

    # This module contains search algorithms from the 'weka.attributeSelection' packages
    module Search
      java_import 'weka.attributeSelection.GreedyStepwise'
      java_import 'weka.attributeSelection.Ranker'
      java_import 'weka.attributeSelection.BestFirst'

      class GreedyStepwise
        include Utils
      end

      class Ranker
        include Utils
      end

      class BestFirst
        include Utils
      end

    end 
  end
end