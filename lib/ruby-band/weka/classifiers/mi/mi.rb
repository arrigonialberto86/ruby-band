$:.unshift File.dirname(__FILE__)
require 'mi_utils'

module Weka
	module Classifier
		module Mi
      #This module contains classifiers from the 'weka.classifiers.mi' package
      java_import 'weka.classifiers.mi.CitationKNN'
      java_import 'weka.classifiers.mi.MDD'
      java_import 'weka.classifiers.mi.MIBoost'
      java_import 'weka.classifiers.mi.MIDD'
      java_import 'weka.classifiers.mi.MIEMDD'
      java_import 'weka.classifiers.mi.MILR'
      java_import 'weka.classifiers.mi.MINND'
      java_import 'weka.classifiers.mi.MIOptimalBall'
      java_import 'weka.classifiers.mi.MISMO'
      java_import 'weka.classifiers.mi.MISVM'
      java_import 'weka.classifiers.mi.MIWrapper'
      java_import 'weka.classifiers.mi.SimpleMI'

      class CitationKNN
        include Mi_utils
        class Base < CitationKNN
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

      class MIEMDD
        include Mi_utils
        class Base < MIEMDD
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

      class MILR
        include Mi_utils
        class Base < MILR
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

      class MINND
        include Mi_utils
        class Base < MINND
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

      class MIOptimalBall
        include Mi_utils
        class Base < MIOptimalBall
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

      class MISMO
        include Mi_utils
        class Base < MISMO
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

      class MISVM
        include Mi_utils
        class Base < MISVM
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

      class MIWrapper
        include Mi_utils
        class Base < MIWrapper
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

      class MDD
        include Mi_utils
        class Base < MDD
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

      class MIBoost
        include Mi_utils
        class Base < MIBoost
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

      class MIDD
        include Mi_utils
        class Base < MIDD
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

      class SimpleMI
        include Mi_utils
        class Base < SimpleMI
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