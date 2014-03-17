require 'ruby-band/weka/classifiers/class_builder'

# The Weka::Classifiers::Lazy module contains classifiers from the 'weka.classifiers.lazy' package
# New weka classes can be defined by adding them to the build_classes method.
#
module Weka
  module Classifiers
    module Lazy
      include ClassBuilder

      build_classes :IBk,
                    :KStar,
                    :LWL
    end
  end
end