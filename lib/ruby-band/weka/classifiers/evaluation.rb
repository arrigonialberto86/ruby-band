module Weka
  module Classifiers
    java_import 'weka.classifiers.Evaluation'

    # Weka Evaluation class to be used with classfiers
    class Evaluation

      alias_method :summary, :toSummaryString
      alias_method :class_details, :toClassDetailsString
      alias_method :cumulative_margin_distribution, :toCumulativeMarginDistributionString

      # use both nomenclatures f_measure and fmeasure for consistency due to jruby's auto method generation
      # of 'fMeasure' to 'f_measure' and 'weightedFMeasure' to 'weighted_fmeasure'
      alias_method :weighted_f_measure, :weighted_fmeasure
      alias_method :fmeasure, :f_measure

      alias_method :instance_count, :num_instances
      alias_method :correct_count, :correct
      alias_method :incorrect_count, :incorrect
      alias_method :unclassified_count, :unclassified
      alias_method :correct_percentage, :pct_correct
      alias_method :incorrect_percentage, :pct_incorrect
      alias_method :unclassified_percentage, :pct_unclassified

      alias_method :true_negative_count, :num_true_negatives
      alias_method :false_negative_count, :num_false_negatives
      alias_method :true_positive_count, :num_true_positives
      alias_method :false_positive_count, :num_false_positives

      alias_method :average_cost, :avg_cost
    end

  end
end