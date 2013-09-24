require 'java'

module Apache
  module Stat
    module Regression
      java_import "org.apache.commons.math3.stat.regression.SimpleRegression"

      # Create a simple regression model on the input data 
      # * *Args*    :
      #   - +vector+ -> must be a multidimensional array
      def self.simple_regression(vector)
        data = Core::Utils.bidimensional_to_double vector
        obj = SimpleRegression.new
        obj.addData(data)
        return obj
        # add Jruby methods for regression analysis
      end


    end
  end
end