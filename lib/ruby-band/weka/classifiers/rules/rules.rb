$:.unshift File.dirname(__FILE__)
require 'rules_utils'

module Weka
  module Classifier
    module Rules
      java_import "weka.classifiers.rules.DecisionTable" 
      java_import "weka.classifiers.rules.DTNB"
      java_import "weka.classifiers.rules.JRip"
      java_import "weka.classifiers.rules.M5Rules"
      java_import "weka.classifiers.rules.NNge"
      java_import "weka.classifiers.rules.OneR"
      java_import "weka.classifiers.rules.PART"
      java_import "weka.classifiers.rules.Prism"
      java_import "weka.classifiers.rules.Ridor"
      java_import "weka.classifiers.rules.Rule"
      java_import "weka.classifiers.rules.RuleStats"
      java_import "weka.classifiers.rules.ZeroR"

      class DecisionTable
        include Rules_utils
        class Base < DecisionTable
          def initialize(&block)
            super
            if block_given?
              init_instance_classifier(&block)
            else
              init_classifier  
            end
          end
        end
      end

      class DTNB
        include Rules_utils
        class Base < DTNB
          def initialize(&block)
            super
            if block_given?
              init_instance_classifier(&block)
            else
              init_classifier  
            end
          end
        end
      end

      class JRip
        include Rules_utils
        class Base < JRip
          def initialize(&block)
            super
            if block_given?
              init_instance_classifier(&block)
            else
              init_classifier  
            end
          end
        end
      end

      class M5Rules
        include Rules_utils
        class Base < M5Rules
          def initialize(&block)
            super
            if block_given?
              init_instance_classifier(&block)
            else
              init_classifier  
            end
          end
        end
      end

      class NNge
        include Rules_utils
        class Base < NNge
          def initialize(&block)
            super
            if block_given?
              init_instance_classifier(&block)
            else
              init_classifier  
            end
          end
        end
      end

      class OneR
        include Rules_utils
        class Base < OneR
          def initialize(&block)
            super
            if block_given?
              init_instance_classifier(&block)
            else
              init_classifier  
            end
          end
        end
      end

      class PART
        include Rules_utils
        class Base < PART
          def initialize(&block)
            super
            if block_given?
              init_instance_classifier(&block)
            else
              init_classifier  
            end
          end
        end
      end

      class Prism
        include Rules_utils
        class Base < Prism
          def initialize(&block)
            super
            if block_given?
              init_instance_classifier(&block)
            else
              init_classifier  
            end
          end
        end
      end

      class Ridor
        include Rules_utils
        class Base < Ridor
          def initialize(&block)
            super
            if block_given?
              init_instance_classifier(&block)
            else
              init_classifier  
            end
          end
        end
      end

      class Rule
        include Rules_utils
        class Base < Rule
          def initialize(&block)
            super
            if block_given?
              init_instance_classifier(&block)
            else
              init_classifier  
            end
          end
        end
      end

      class RuleStats
        include Rules_utils
        class Base < RuleStats
          def initialize(&block)
            super
            if block_given?
              init_instance_classifier(&block)
            else
              init_classifier  
            end
          end
        end
      end

      class ZeroR
        include Rules_utils
        class Base < ZeroR
          def initialize(&block)
            super
            if block_given?
              init_instance_classifier(&block)
            else
              init_classifier  
            end
          end
        end
      end

    end
  end
end