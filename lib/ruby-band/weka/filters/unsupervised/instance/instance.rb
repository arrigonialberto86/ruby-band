require 'ruby-band/weka/filters/unsupervised/class_builder'

module Weka
  module Filters
  	module Unsupervised
      module Instance
        include ClassBuilder

        build_classes :NonSparseToSparse,
                      :Randomize,
                      :RemoveFolds,
                      :RemoveFrequentValues,
                      :RemoveMisclassified,
                      :RemovePercentage,
                      :RemoveRange,
                      :RemoveWithValues,
                      :Resample,
                      :ReservoirSample,
                      :SparseToNonSparse,
                      :SubsetByExpression

        class SubsetByExpression
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