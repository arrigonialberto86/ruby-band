require 'ruby-band/core/type/instances'

module Weka
  module Classifiers
    class Evaluation
      java_import "weka.classifiers.evaluation.ThresholdCurve"

      class ThresholdCurve

        def curve(predictions, class_index = nil)
          if class_index
            @instances = getCurve(predictions, class_index)
          else
            @instances = getCurve(predictions)
          end

          Core::Type::Instances.new(@instances)
        end
      end
    end
  end
end