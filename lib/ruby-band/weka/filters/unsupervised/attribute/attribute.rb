require 'ruby-band/weka/filters/unsupervised/utils'

module Weka
  module Filters
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

  			class Add
          include Weka::Filters::Unsupervised::Utils
  			end

        class AddCluster
          include Weka::Filters::Unsupervised::Utils

          alias_method :clusterer, :set_clusterer

          def set_clusterer(index)
            set_clusterer(index)
          end
        end

  			class Center
          include Weka::Filters::Unsupervised::Utils
  			end

        class ClusterMembership
          include Weka::Filters::Unsupervised::Utils
        end

  			class Discretize
          include Weka::Filters::Unsupervised::Utils
  			end

  			class NominalToString
          include Weka::Filters::Unsupervised::Utils
  			end

  			class Normalize
          include Weka::Filters::Unsupervised::Utils
  			end

  			class PrincipalComponents
          include Weka::Filters::Unsupervised::Utils
  			end
      
  			class Remove
          include Weka::Filters::Unsupervised::Utils

          alias_method :attribute_indices, :setAttributeIndices

          def setAttributeIndices(index)
            setAttributeIndices(index)
          end
  			end

  			class Standardize
          include Weka::Filters::Unsupervised::Utils
  			end

        class StringToWordVector
          include Weka::Filters::Unsupervised::Utils
        end

        Weka::Filters::Unsupervised::Attribute::PrincipalComponents.__persistent__ = true
        Weka::Filters::Unsupervised::Attribute::Add.__persistent__ = true
        Weka::Filters::Unsupervised::Attribute::AddCluster.__persistent__ = true
        Weka::Filters::Unsupervised::Attribute::ClusterMembership.__persistent__ = true
        Weka::Filters::Unsupervised::Attribute::Standardize.__persistent__ = true
        Weka::Filters::Unsupervised::Attribute::Remove.__persistent__ = true
        Weka::Filters::Unsupervised::Attribute::Normalize.__persistent__ = true
        Weka::Filters::Unsupervised::Attribute::Discretize.__persistent__ = true
        Weka::Filters::Unsupervised::Attribute::Center.__persistent__ = true
        Weka::Filters::Unsupervised::Attribute::NominalToString.__persistent__ = true
        Weka::Filters::Unsupervised::Attribute::StringToWordVector.__persistent__ = true
  		end
  	end
  end
end
