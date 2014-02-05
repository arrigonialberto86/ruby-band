require 'ruby-band/weka/filters/unsupervised/utils'

module Weka
  module Filters
  	module Unsupervised
  		module Instance
  			java_import "weka.filters.unsupervised.instance.Normalize"
  			java_import "weka.filters.unsupervised.instance.NonSparseToSparse"
  			java_import "weka.filters.unsupervised.instance.SparseToNonSparse"
  			java_import "weka.filters.unsupervised.instance.RemoveRange"
  			java_import "weka.filters.unsupervised.instance.SubsetByExpression"
        java_import "weka.filters.unsupervised.instance.RemoveWithValues"

  			class Normalize
          include Weka::Filters::Unsupervised::Utils
  			end

  			class NonSparseToSparse
          include Weka::Filters::Unsupervised::Utils
  			end

  			class RemoveRange
          include Weka::Filters::Unsupervised::Utils
  			end

        class RemoveWithValues
          include Weka::Filters::Unsupervised::Utils
        end

  			class SparseToNonSparse
          include Weka::Filters::Unsupervised::Utils
  			end

  			class SubsetByExpression
          include Weka::Filters::Unsupervised::Utils

          def description
            begin
              puts globalInfo.split("\n").each {|line| puts line}
            rescue NoMethodError
              puts "Sorry, no description available for this filter"
            end
  				end
  			end

  		end
  	end
  end
end