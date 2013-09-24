$:.unshift(File.expand_path(File.join(File.dirname(__FILE__),"../")))
require 'java'
require 'unsupervised_utils'

module Weka
  module Filter
  	module Unsupervised
  		module Attribute

  			java_import "weka.filters.unsupervised.attribute.Add"
        java_import "weka.filters.unsupervised.attribute.AddCluster"
  			java_import "weka.filters.unsupervised.attribute.Center"
        java_import "weka.filters.unsupervised.attribute.ClusterMembership"
  			java_import "weka.filters.unsupervised.attribute.Discretize"
  			java_import "weka.filters.unsupervised.attribute.NominalToString"
  			java_import "weka.filters.unsupervised.attribute.Normalize"
  			java_import "weka.filters.unsupervised.attribute.Remove"
  			java_import "weka.filters.unsupervised.attribute.Standardize"
  			java_import "weka.filters.unsupervised.attribute.PrincipalComponents"
        java_import "weka.filters.unsupervised.attribute.StringToWordVector"
  			java_import "weka.core.Utils"
  			java_import "weka.filters.Filter"

  			class Add
          include Unsupervised_Util
  			end

        class AddCluster
          include Unsupervised_Util
          alias_method :clusterer, :set_clusterer
          def set_clusterer(index)
            set_clusterer(index)
          end
        end

  			class Center
          include Unsupervised_Util
  			end

        class ClusterMembership
          include Unsupervised_Util
        end

  			class Discretize
          include Unsupervised_Util
  			end

  			class NominalToString
          include Unsupervised_Util
  			end

  			class Normalize
          include Unsupervised_Util
  			end

  			class PrincipalComponents
          include Unsupervised_Util
  			end
      
  			class Remove
          alias_method :attribute_indices, :setAttributeIndices
          def setAttributeIndices(index)
            setAttributeIndices(index)
          end
          include Unsupervised_Util
  			end

  			class Standardize
          include Unsupervised_Util
  			end

        class StringToWordVector
          include Unsupervised_Util
        end

        Weka::Filter::Unsupervised::Attribute::PrincipalComponents.__persistent__ = true
        Weka::Filter::Unsupervised::Attribute::Add.__persistent__ = true
        Weka::Filter::Unsupervised::Attribute::AddCluster.__persistent__ = true
        Weka::Filter::Unsupervised::Attribute::ClusterMembership.__persistent__ = true
        Weka::Filter::Unsupervised::Attribute::Standardize.__persistent__ = true
        Weka::Filter::Unsupervised::Attribute::Remove.__persistent__ = true
        Weka::Filter::Unsupervised::Attribute::Normalize.__persistent__ = true
        Weka::Filter::Unsupervised::Attribute::Discretize.__persistent__ = true
        Weka::Filter::Unsupervised::Attribute::Center.__persistent__ = true
        Weka::Filter::Unsupervised::Attribute::NominalToString.__persistent__ = true
        Weka::Filter::Unsupervised::Attribute::StringToWordVector.__persistent__ = true
  		end
  	end
  end
end
