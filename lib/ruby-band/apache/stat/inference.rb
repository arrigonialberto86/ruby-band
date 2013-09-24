require 'java'

module Apache
  module Stat
    module Inference

      java_import 'org.apache.commons.math3.stat.inference.ChiSquareTest'
      java_import 'org.apache.commons.math3.stat.inference.MannWhitneyUTest'
      java_import 'org.apache.commons.math3.stat.inference.OneWayAnova'
      java_import 'org.apache.commons.math3.stat.inference.TTest'
      java_import 'org.apache.commons.math3.stat.inference.WilcoxonSignedRankTest'
      java_import 'org.apache.commons.math3.stat.StatUtils'
      java_import 'java.util.ArrayList'
      
      # An implementation of the Wilcoxon signed-rank test
      # * *Args*    :
      #   - +Array1+ -> must be a RubyArray.
      #   - +Array2+ -> must be a RubyArray.
      def self.wilcoxon_test(array_1,array_2)
        obj = WilcoxonSignedRankTest.new
        first = Core::Utils::double_to_a(array_1)
        second = Core::Utils::double_to_a(array_2)
        val = obj.wilcoxonSignedRank first, second
        p_val = obj.wilcoxonSignedRankTest first, second, true.to_java(:boolean) 
        return val,p_val
      end

      # Utility class called by 'chi_square' method in this same package
      class Chi_square
        def self.chi_square_2d(array_2d)
          obj = ChiSquareTest.new
          val = obj.chi_square(array_2d.to_java(Java::long[]))
          p_value =  obj.chi_square_test(array_2d.to_java(Java::long[]))
          return val,p_value
        end
        
        def self.chi_square_two_arrays(expected,observed)
          obj = ChiSquareTest.new
          val = obj.chi_square(expected.to_java(:double),observed.to_java(:long))
          p_value = obj.chi_square_test(expected.to_java(:double),observed.to_java(:long))
          return val,p_value
        end
      end

      # 1) Computes the Chi-Square statistic comparing observed and expected frequency counts.
      # * *Args*    :
      #   - +Array+ -> must be a bidimensional RubyArray.
      # 2) Computes the Chi-Square statistic associated with a chi-square test of independence
      #   based on the input counts array, viewed as a two-way table.
      # * *Args*    :
      #   - +Array1+ -> must be a RubyArray.
      #   - +Array2+ -> must be a RubyArray.
      def self.chi_square(*args)
        if args.length == 2
          Chi_square.chi_square_two_arrays(*args)
        elsif args.length == 1
          raise ArgumentError,"RubyArray must be bidimensional" unless args[0].is_2d?
          Chi_square.chi_square_2d(*args)
        else
          raise ArgumentError, 'Function *args should be two RubyArrays or a bidimensional RubyArray'
        end
      end    

      # Compare two datasets stored in Ruby Arrays
      def self.chi_square_dataset_compare(observed1,observed2)
        obj = ChiSquareTest.new
        val = obj.chiSquareDataSetsComparison(observed1.to_java(:long),observed2.to_java(:long)) 
        p_value = obj.chiSquareTestDataSetsComparison(observed1.to_java(:long),observed2.to_java(:long))
        return val,p_value          
      end

      # An implementation of the Mann-Whitney U test 
      # (also called Wilcoxon rank-sum test)
      # * *Args*    :
      #   - +Array1+ -> must be a RubyArray.
      #   - +Array2+ -> must be a RubyArray.
      def self.mann_whitney_u(array1,array2)
        obj = MannWhitneyUTest.new
        first = array1.to_java :double
        second = array2.to_java :double 
        value = obj.mannWhitneyU first,second
        p_value = obj.mannWhitneyUTest first,second
        return value,p_value
      end

      #Utility class called by 't_test' method in this same package
      class T_test
  
        def self.homoscedastic(array_1,array_2)
          obj = TTest.new
          first = array_1.to_java :double
          second = array_2.to_java :double
          value = obj.homoscedasticT(first,second)
          p_value = obj.homoscedasticTTest(first,second)
          return value, p_value
        end
  
        def self.paired(array_1,array_2)
          obj = TTest.new
          first = array_1.to_java :double
          second =array_2.to_java :double
          value = obj.pairedT(first,second)
          p_value = obj.pairedTTest(first,second)
          return value,p_value
        end

        def self.t(array_1,array_2)
          obj = TTest.new
          first = array_1.to_java :double
          second =array_2.to_java :double
          value = obj.t(first,second)
          p_value =obj.tTest(first,second)
          return value,p_value
        end
      end

      # An implementation for Student's t-tests
      # * *Args*    :
      #   - +sample_1+ -> an array of numeric values representing a sample
      #   - +sample_2+ -> an array of numeric values representing a sample
      #   - +homoscedastic+ -> set to true for equal variance assumption
      #   - +paired+ -> set to true if you want to perform a 'paired' t test
      def self.t_test(sample_1,sample_2,homoscedastic=false,paired=false)
        if homoscedastic == true
          T_test.homoscedastic(sample_1,sample_2)
        elsif paired == true
          T_test.paired(sample_1,sample_2)
        else
          T_test.t(sample_1,sample_2)
        end 
      end

      # Implements one-way ANOVA (analysis of variance) statistics.
      # Tests for differences between two or more categories of univariate data (for example,
      # the body mass index of accountants, lawyers, doctors and computer programmers). When 
      # two categories are given, this is equivalent to the TTest.
      # * *Args*    :
      #   - +bidimensional_array+ -> a 2d RubyArray
      def self.one_way_anova(bidimensional_array)
        collection = ArrayList.new 
        bidimensional_array.each do |array|
          collection.add(array.to_java :double)
        end
        obj = OneWayAnova.new
        f_value = obj.anovaFValue(collection)
        p_value = obj.anovaPValue(collection)
        return f_value,p_value
      end
    end
  end
end