$:.unshift(File.expand_path(File.join(File.dirname(__FILE__),"../")))
require 'java'
require 'unsupervised_utils'

module Weka
  module Filter
  	module Unsupervised
  		module Instance
  			java_import "weka.core.Utils"
  			java_import "weka.filters.Filter"
  			java_import "weka.filters.unsupervised.instance.Normalize"
  			java_import "weka.filters.unsupervised.instance.NonSparseToSparse"
  			java_import "weka.filters.unsupervised.instance.SparseToNonSparse"
  			java_import "weka.filters.unsupervised.instance.RemoveRange"
  			java_import "weka.filters.unsupervised.instance.SubsetByExpression"
        java_import "weka.filters.unsupervised.instance.RemoveWithValues"

  			class Normalize
          include Unsupervised_Util
  			end

  			class NonSparseToSparse
          include Unsupervised_Util
  			end

  			class RemoveRange
          include Unsupervised_Util
  			end

        class RemoveWithValues
          include Unsupervised_Util
        end

  			class SparseToNonSparse
          include Unsupervised_Util
  			end

  			class SubsetByExpression
          include Unsupervised_Util
  				def description
            begin; puts globalInfo.split("\n").each {|line| puts line}; rescue; NoMethodError; puts "Sorry, no description available for this filter"; end
  				end
  			end

  		end
  	end
  end
end