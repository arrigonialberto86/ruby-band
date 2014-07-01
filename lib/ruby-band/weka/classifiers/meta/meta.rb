require 'ruby-band/weka/classifiers/class_builder'

# The Weka::Classifiers::Meta module contains classifiers from the 'weka.classifiers.meta' package
# New weka classes can be defined by adding them to the build_classes method.
module Weka
  module Classifiers
    module Meta
      include ClassBuilder

      build_classes :AdaBoostM1,
                    :AdditiveRegression,
                    :AttributeSelectedClassifier,
                    :Bagging,
                    :ClassificationViaRegression,
                    :CostSensitiveClassifier,
                    :FilteredClassifier,
                    :LogitBoost,
                    :MultiClassClassifier,
                    :MultiClassClassifierUpdateable,
                    :MultiScheme,
                    :RandomCommittee,
                    :RandomSubSpace,
                    :RegressionByDiscretization,
                    :Stacking
    end
  end
end