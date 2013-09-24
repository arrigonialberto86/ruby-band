$:.unshift File.dirname(__FILE__)
require 'trees_utils'

module Weka
	module Classifier
    #This module contains classifiers from the 'weka.classifiers.trees' package
		module Trees
      java_import 'weka.classifiers.trees.J48'
      java_import 'weka.classifiers.trees.FT'
      java_import 'weka.classifiers.trees.RandomForest'
      java_import 'weka.classifiers.trees.BFTree'
      java_import 'weka.classifiers.trees.J48graft'
      java_import 'weka.classifiers.trees.LADTree'
      java_import 'weka.classifiers.trees.LMT'
      java_import 'weka.classifiers.trees.M5P'
      java_import 'weka.classifiers.trees.RandomTree'

      class ADTree
        include Trees_utils
        class Base < ADTree
          def initialize
            super
            init_tree
          end
        end
      end

      class BFTree
        include Trees_utils
        class Base < BFTree
          def initialize
            super
            init_tree
          end
        end
      end

      class FT
        include Trees_utils
        class Base < FT
          def initialize
            super
            init_tree
          end
        end
      end

      class J48
        include Trees_utils
        class Base < J48
          def initialize
            super
            init_tree
          end
        end
      end

      class J48graft
        include Trees_utils
        class Base < J48graft
          def initialize
            super
            init_tree
          end
        end
      end

      class LMT
        include Trees_utils
        class Base < LMT
          def initialize
            super
            init_tree
          end
        end
      end

      class M5P
        include Trees_utils
        class Base < M5P
          def initialize
            super
            init_tree
          end
        end
      end

      class RandomForest
        include Trees_utils
        class Base < RandomForest
          def initialize
            super
            init_tree
          end
        end
      end

      class RandomTree
        include Trees_utils
        class Base < RandomTree
          def initialize
            super
            init_tree
          end
        end
      end

		end
  end
end