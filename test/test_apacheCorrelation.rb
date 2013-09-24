require 'helper'

class TestApacheCorrelation < Test::Unit::TestCase

  context "Apache correlation methods" do
    should "calculate covariance having as input two Ruby arrays" do
      result = Apache::Stat::Correlation.covariance([1,2,3,4],[6,5,2,0])
      assert_equal -3.5, result
    end

    should "calculate Pearson correlation having as input two Ruby arrays" do
      result = Apache::Stat::Correlation.pearson_correlation([1,2,3,4],[1,2,3,4])
      assert_equal 1, result
    end

    should "calculate Spearman correlation having as input two Ruby arrays" do
      result = Apache::Stat::Correlation.spearman_correlation([1,2,3,4],[4,3,2,1])
      assert_equal -1, result
    end

  end
end