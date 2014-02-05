require 'ruby-band/weka/filters/supervised/utils'

module Weka
  module Filters
  	module Supervised
  		module Attribute
        java_import "weka.filters.supervised.attribute.AddClassification"
        java_import "weka.filters.supervised.attribute.ClassOrder"
   			java_import "weka.filters.supervised.attribute.AttributeSelection"
        java_import "weka.filters.supervised.attribute.NominalToBinary"
        java_import "weka.filters.supervised.attribute.PLSFilter"
        java_import "weka.filters.supervised.attribute.Discretize"

        class AddClassification
          include Weka::Filters::Supervised::Utils
        end

   			class AttributeSelection
          include Weka::Filters::Supervised::Utils

          java_alias :evaluator, :setEvaluator, [Java::Weka.attributeSelection.ASEvaluation]
          java_alias :search, :setSearch, [Java::Weka.attributeSelection.ASSearch]
  			end

        class ClassOrder
          include Weka::Filters::Supervised::Utils
        end

        class Discretize  
          include Weka::Filters::Supervised::Utils
        end

        class NominalToBinary  
          include Weka::Filters::Supervised::Utils
        end

        class PLSFilter  
          include Weka::Filters::Supervised::Utils
        end

        Weka::Filters::Supervised::Attribute::AttributeSelection.__persistent__ = true
        Weka::Filters::Supervised::Attribute::Discretize.__persistent__ = true
        Weka::Filters::Supervised::Attribute::AddClassification.__persistent__ = true
        Weka::Filters::Supervised::Attribute::ClassOrder.__persistent__ = true
        Weka::Filters::Supervised::Attribute::NominalToBinary.__persistent__ = true
        Weka::Filters::Supervised::Attribute::PLSFilter.__persistent__ = true
  		end
  	end
  end
end