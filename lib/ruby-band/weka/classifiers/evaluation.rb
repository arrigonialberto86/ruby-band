module Weka
  module Classifier
    java_import 'weka.classifiers.Evaluation'

    # Weka Evaluation class to be used with classfiers and clusterers
    class Evaluation
      def summary
        toSummaryString
      end
    end
    
  end
end