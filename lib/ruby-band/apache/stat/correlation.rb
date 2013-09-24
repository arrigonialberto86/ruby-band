require 'java'

module Apache
  module Stat
  	module Correlation

      java_import "org.apache.commons.math3.stat.correlation.Covariance"
      java_import "org.apache.commons.math3.stat.correlation.PearsonsCorrelation"
      java_import "org.apache.commons.math3.stat.correlation.SpearmansCorrelation"

      # Calculate covariance between two Numeric arrays
      # * *Args*    :
      #   - +Array1+ -> must be a RubyArray.
      #   - +Array2+ -> must be a RubyArray.
      def self.covariance(array_1,array_2)
        obj = Covariance.new
        result = obj.covariance(array_1.to_java(:double),array_2.to_java(:double))
        result
      end

      # Calculate Pearson correlation between two Numeric arrays
      # * *Args*    :
      #   - +Array1+ -> must be a RubyArray.
      #   - +Array2+ -> must be a RubyArray.
      def self.pearson_correlation(array_1,array_2)
        obj = PearsonsCorrelation.new
        result = obj.correlation(array_1.to_java(:double),array_2.to_java(:double))
        result
      end

      # Calculate Spearman correlation between two Numeric arrays
      # * *Args*    :
      #   - +Array1+ -> must be a RubyArray.
      #   - +Array2+ -> must be a RubyArray.
      def self.spearman_correlation(array_1,array_2)
        obj = SpearmansCorrelation.new
        result = obj.correlation(array_1.to_java(:double),array_2.to_java(:double))
        result
      end
  	end
  end
end