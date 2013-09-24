require 'helper'

class TestApacheInference < Test::Unit::TestCase

  context "Apache inference module" do
    should "Perform Wilcoxon signed rank test" do
      val,p_val = Apache::Stat::Inference.wilcoxon_test([1,2,3,4],[6,5,2,0])
      assert_equal 6,val
      assert_equal 0.875,p_val
    end

    should "Computes the Chi-Square statistic comparing observed and expected frequency counts" do
      val,p_val = Apache::Stat::Inference.chi_square([1,2,3,4,5],[1,2,3,4,5])
      assert_equal 0,val
      assert_equal 1,p_val
      val,p_val = Apache::Stat::Inference.chi_square [[1,2,3,4,5],[1,2,3,4,5]]
      assert_equal 0,val
      assert_equal 1,p_val
    end

    should "Perform the Mann-Whitney U test on two input datasets" do
      val,p_val = Apache::Stat::Inference.mann_whitney_u([1,2,3,4,5],[1,2,3,4,5])
      assert_equal 12.5,val
      assert_equal 1,p_val
    end

    should "Perform a homoscedastic T test on two input datasets" do
      val,p_val = Apache::Stat::Inference.t_test([1,2,3,4,5],[10,11,12,13,14],homoscedastic=true)
      assert_equal -9,val
      assert_equal 1.853118429643006e-05,p_val
    end

    should "Perform a paired T test on two input datasets" do
      val,p_val = Apache::Stat::Inference.t_test([1,2,3,4,5],[10,11,12,13,14])
      assert_equal -9,val
      assert_equal 1.853118429643006e-05,p_val
    end

    should "Calculate one-way ANOVA (analysis of variance) statistics on input data" do
      val,p_val = Apache::Stat::Inference.one_way_anova [[1,2,3,4,5],[10,11,12,13,14]]
      assert_equal 81,val
      assert_equal 1.8531184296399772e-05,p_val
    end

  end
end