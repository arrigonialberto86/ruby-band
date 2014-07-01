require 'ruby-band/weka/filters/supervised/class_builder'

module Weka
  module Filters
  	module Supervised
  		module Attribute
        include ClassBuilder

        build_classes :AddClassification,
                      :AttributeSelection,
                      :ClassOrder,
                      :Discretize,
                      :MergeNominalValues,
                      :NominalToBinary,
                      :PartitionMembership

   			class AttributeSelection
          java_alias :evaluator, :setEvaluator, [Java::Weka.attributeSelection.ASEvaluation]
          java_alias :search, :setSearch, [Java::Weka.attributeSelection.ASSearch]
  			end

  		end
  	end
  end
end