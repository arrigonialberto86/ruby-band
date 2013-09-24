$:.unshift(File.expand_path(File.join(File.dirname(__FILE__),"../")))
require 'java'
require 'supervised_utils'

module Weka
  module Filter
  	module Supervised
  		module Attribute
  			java_import "weka.core.Utils"
  			java_import "weka.filters.Filter"

        java_import "weka.filters.supervised.attribute.AddClassification"
        java_import "weka.filters.supervised.attribute.ClassOrder"
   			java_import "weka.filters.supervised.attribute.AttributeSelection"
        java_import "weka.filters.supervised.attribute.NominalToBinary"
        java_import "weka.filters.supervised.attribute.PLSFilter"
        java_import "weka.filters.supervised.attribute.Discretize"

        class AddClassification  
          include Supervised_Util
        end

   			class AttributeSelection
          include Supervised_Util
          java_alias :evaluator, :setEvaluator, [Java::Weka.attributeSelection.ASEvaluation]
          java_alias :search, :setSearch, [Java::Weka.attributeSelection.ASSearch]
  			end

        class ClassOrder
          include Supervised_Util
        end

        class Discretize  
          include Supervised_Util
        end

        class NominalToBinary  
          include Supervised_Util
        end

        class PLSFilter  
          include Supervised_Util
        end

        Weka::Filter::Supervised::Attribute::AttributeSelection.__persistent__ = true
        Weka::Filter::Supervised::Attribute::Discretize.__persistent__ = true
        Weka::Filter::Supervised::Attribute::AddClassification.__persistent__ = true
        Weka::Filter::Supervised::Attribute::ClassOrder.__persistent__ = true
        Weka::Filter::Supervised::Attribute::NominalToBinary.__persistent__ = true
        Weka::Filter::Supervised::Attribute::PLSFilter.__persistent__ = true
  			
  		end
  	end
  end
end